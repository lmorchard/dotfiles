I want to try to organize thoughts around my discrete development sessions.

Each development sessions could be aimed at building a specific complete feature, or just a part of a feature built in phases.

Documentation and artifacts for a session should live in a directory called `docs/dev-sessions/$(date +"%Y-%m-%d-%H%M")-{slug}` where {slug} is a short description of the session - if possible, derive this from the name of the current git branch, otherwise ask me to provide a short description.

In this directory will live files like the following:

- `spec.md` - the spec for the session
- `plan.md` - the plan for the session
- `todo.md` - the todo list for the session
- `notes.md` - the notes for the session, including a final summary of the session before committing to git

Other files may live in this directory as appropriate to the session. 
