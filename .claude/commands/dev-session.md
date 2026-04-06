Unified dev session skill. Dispatch based on the first argument:

- `/dev-session start` — start or resume a dev session
- `/dev-session brainstorm` — brainstorm a spec interactively
- `/dev-session brainstorm <github-issue-url>` — brainstorm from a GitHub issue
- `/dev-session plan` — write an implementation plan from the spec
- `/dev-session execute` — execute the plan
- `/dev-session pr` — squash, push, open PR, run Copilot review
- `/dev-session retro` — end session with retrospective
- `/dev-session express <github-issue-url>` — full express flow (brainstorm → autonomous execution → PR)

**Parse the arguments below and follow ONLY the matching section. Ignore all other sections.**

---

## Shared conventions

Session docs live in `docs/dev-sessions/$(date +"%Y-%m-%d-%H%M")-{slug}/` with `spec.md`, `plan.md`, and `notes.md`. Derive the slug from the current git branch name if possible, otherwise ask for a short description.

Always fetch and rebase from origin/main before creating new branches.

---

## start

Start or resume a dev session.

1. Check the current git branch. If on main, ask for a branch name or derive from context (e.g., from a GitHub issue URL if provided as an extra argument).
2. If a GitHub issue URL is provided, fetch it for context and use it to derive the branch name.
3. Fetch and rebase from origin/main, then create the feature branch.
4. Check if a session directory already exists for this branch. If yes, read the docs for context and report status.
5. If no session dir exists, create it with empty `spec.md`, `plan.md`, and `notes.md`.
6. Report the session directory path. This is the current dev session until we start another or finish this one.

---

## brainstorm

Brainstorm a spec for the current dev session.

If a GitHub issue URL is provided as an additional argument, fetch and read it as the starting point.

1. Read `spec.md` for any preexisting context.
2. Ask one question at a time to develop a thorough spec. Each question should build on previous answers. Propose your best judgment and ask to confirm or adjust — don't ask open-ended questions when you have a clear recommendation.
3. **Keep proportional to complexity.** For small, well-defined issues, 2-4 questions covering key design decisions is enough. For larger or ambiguous issues, go deeper. If the design is obvious after a couple questions, say so and offer to move to the spec.
4. Once done, save the spec to `spec.md`.
5. **Self-review pass**: re-read the spec and flag any critical gaps, missing error handling, unstated assumptions, or architectural concerns. Ask if gaps should be addressed before moving to planning.

---

## plan

Write an implementation plan from the spec.

1. Read `spec.md` and confirm it's ready for implementation. If not, ask for more details.
2. Read the relevant source files to understand the current codebase.
3. Break the spec into small, iterative implementation steps that build on each other. Iterate until steps are right-sized — small enough to be safe, big enough to move forward. **For simple features, keep the plan brief — don't over-formalize what's obvious.**
4. Write concrete prompts for each step. Prioritize incremental progress with no orphaned code.
5. Store in `plan.md`.

---

## execute

Execute the plan for the current dev session.

1. Read `plan.md` and `spec.md`. Confirm the plan is detailed and ready. If not, ask for more details.
2. For each step in the plan:
   - Implement the changes
   - Run `make lint` (fix any issues)
   - Run `make test` (fix any failures)
   - Run `make check` if available (typecheck, etc.)
   - Commit with a descriptive message
3. Do not push to remote — the user will review changes in git when done.

---

## pr

Squash, push, open a PR, and run Copilot review.

1. Squash all commits on the branch into one with a comprehensive message.
2. Push the branch to remote.
3. Open a PR with summary, test plan, and `Closes #N` references.
4. Request a review from GitHub Copilot: `gh pr edit <number> --add-reviewer copilot-pull-request-reviewer`
5. Poll for new review comments. Use `gh api repos/{owner}/{repo}/pulls/{number}/comments --jq 'length'` to check, retrying a few times with short waits. Give up after 10 minutes.
6. Assess each Copilot comment:
   - **Fix**: real bugs, valid edge cases, missing error handling, doc/code mismatches, missing test coverage
   - **Skip**: over-engineering, theoretical concerns without real risk, style nitpicks
7. Fix worthwhile comments. Lint, test, commit.
8. Squash again and force-push.
9. Report the PR URL, what was fixed, and what was skipped.

---

## retro

End the current dev session with a retrospective.

1. Think carefully about the session and write notes to `notes.md` in the session directory. Include:
   - Brief recap of key actions
   - Anything that diverged from the original plan
   - Key insights or lessons learned
   - Total cost of the session
   - Efficiency insights
   - Possible process improvements
   - Total number of conversation turns
   - Any other interesting observations
2. Ask any questions about the session worth recording.

---

## express

Full express dev session — brainstorm (interactive) then autonomous execution through PR with Copilot review.

### Phase 0: Complexity check

Fetch the GitHub issue (URL provided as argument). Assess whether it's a good fit for express:
- **Good fit**: focused features, bug fixes, straightforward additions, well-defined scope (XS/S/M)
- **Bad fit**: architectural changes, many interaction effects, ambiguous requirements, large scope (L/XL), touching multiple subsystems in non-obvious ways

If too complex, **push back** — recommend a full interactive session (`/dev-session start` then `/dev-session brainstorm`, etc.) instead, and explain why. Don't proceed just because express was requested.

### Phase 1: Setup (autonomous)

1. Fetch and read the GitHub issue thoroughly.
2. Check the project board if configured (see CLAUDE.md). Note priority/size if set.
3. Fetch and rebase from origin/main before creating a branch.
4. Create a feature branch from origin/main. Derive branch name from the issue title.
5. Create the session directory with `spec.md`, `plan.md`, `notes.md`.

### Phase 2: Brainstorm (interactive)

Read the GitHub issue as the starting point. Read `spec.md` for preexisting context.

Ask one question at a time. Propose best judgment, ask to confirm or adjust. **Keep proportional to complexity** — for small/well-defined issues, 2-4 questions is enough. If the design is obvious after a couple questions, say so and offer to move to the spec.

When done, save `spec.md`.

### Phase 3: Autonomous execution

**Once brainstorming is complete and the spec is saved, tell the user you're starting autonomous execution. Then proceed through ALL steps without stopping for input, unless hitting a genuinely unresolvable blocker.**

Print a brief status line at each phase transition.

#### 3a. Spec self-review
Re-read the spec. Fix any critical gaps, missing error handling, unstated assumptions. If a gap needs a design decision not covered in brainstorm, make a reasonable choice and document it — don't stop to ask.

#### 3b. Write plan
Read relevant source files. Break spec into small iterative steps with concrete prompts. Store in `plan.md`. **For simple features, keep the plan brief.**

#### 3c. Plan self-review
Check plan against spec for missing steps, orphaned code, incorrect ordering. Fix any issues.

#### 3d. Execute
For each step: implement → `make lint` → `make test` → `make check` → commit.

#### 3e. Branch self-review
Review `git diff origin/main..HEAD` for bugs, unused imports, missing tests, doc gaps, typecheck issues. Fix anything found.

#### 3f. Squash and PR
Squash all commits into one. Push branch. Open PR with summary, test plan, `Closes #N`. Report PR URL.

#### 3g. Copilot review cycle
**Always do this step — do not wait for user confirmation.**

1. Request review: `gh pr edit <number> --add-reviewer copilot-pull-request-reviewer`
2. Poll for new review comments. Use `gh api repos/{owner}/{repo}/pulls/{number}/comments --jq 'length'` to check, retrying a few times with short waits. Give up after 10 minutes if none arrive.
3. Assess each comment:
   - **Fix**: real bugs, valid edge cases, missing error handling, doc/code mismatches, missing test coverage
   - **Skip**: over-engineering, theoretical concerns without real risk, style nitpicks
4. Fix worthwhile comments. Lint, test, commit.
5. Squash again and force-push.
6. Report what was fixed and what was skipped (with brief reasoning).

---

ARGUMENTS:
