# AGENTS.md

## Mission

This is a project-local instruction file for AI agents. Use GitHub Spec Kit's Spec-Driven Development approach: specifications are the source of truth and code is their implementation.

## Instruction precedence

Follow, in order: latest user request, `.specify/memory/` constitution, approved `specs/<feature>/` artifacts, this file/`CLAUDE.md`, then existing code/reference examples. Mark ambiguity as `[NEEDS CLARIFICATION: question]`; do not guess.

## SDD artifacts and workflow

For each feature, use `specs/<number>-<short-name>/`:

```text
spec.md          # user value, user stories, requirements, acceptance scenarios
plan.md          # technical decisions and requirement traceability
research.md      # only when research is needed
data-model.md    # entities/schema when needed
contracts/       # contracts when needed
quickstart.md    # validation scenarios when needed
tasks.md         # ordered implementation checklist
```

Workflow: constitution → specify → plan → tasks → implement → converge. Review each artifact before moving to the next stage. Specifications describe what and why; plans describe how. Do not add speculative features. Keep detailed algorithms/code out of `spec.md`. If the Spec Kit CLI is available, use its equivalent commands; otherwise maintain these artifacts manually.

## Repository boundary

Only modify `D:/Fall2026/de1_nguyenthingoclinh_HE181043/`. The sample `D:/Fall2026/PRM393/Example-PRM393/` is read-only. Never create a second repository, nested Flutter app, duplicate `lib/`, or code outside the project boundary.

## Architecture constitution

The app must remain Flutter + MVVM. The current assignment brief specifies one SQLite table:

```text
Views/Widgets → ViewModels → Repositories → Models/SQLite
```

Use the sample layout:

```text
lib/data/models/
lib/data/reposistories/
lib/generated/
lib/UI/<Feature>/ViewModels/
lib/UI/<Feature>/Views/Screen/
lib/UI/<Feature>/Views/Widget/
lib/UI/Screens/
lib/UI/Widgets/
```

Repositories own SQLite access. Models map rows to Dart objects. ViewModels own presentation state. Screens/widgets render state and send actions to ViewModels. For the current assignment, the UI must display and edit/update the specified SQLite table. This table count is a feature/specification requirement, not a permanent prohibition on future schema changes; any later schema change must be captured in the approved spec, data model, and plan first. SharedPreferences is only for small authentication/session or mode/theme/background settings, never the main table data.

## Riverpod setup and generation rule

Riverpod is part of the project's normal state-management setup. An agent may create a provider/ViewModel when the approved feature needs it, but must use the existing setup and generator workflow rather than writing ad-hoc or generated Riverpod files by hand.

- Inspect existing providers, annotations, and ViewModels first and reuse them where appropriate.
- New feature provider/ViewModel source belongs in that feature's `ViewModels/` folder.
- Use the project's existing Riverpod annotations/dependencies and setup command or `build_runner` when generated code is needed.
- Never hand-write or manually edit generated `*.g.dart` files. Generate them with the project command, for example `dart run build_runner build --delete-conflicting-outputs` when appropriate.
- Do not silently add unrelated providers, duplicate provider hierarchies, or a second Riverpod architecture.
- Do not migrate or upgrade Riverpod dependencies unless required by the feature and recorded in the plan.

## File and verification rules

- New models: `lib/data/models/`.
- New repositories/SQLite code: `lib/data/reposistories/`.
- New feature ViewModels: `lib/UI/<Feature>/ViewModels/`.
- New feature screens/widgets: `lib/UI/<Feature>/Views/Screen/` and `Views/Widget/`.
- Shared UI only in `lib/UI/Screens/` or `lib/UI/Widgets/`.
- New Dart files use `lower_snake_case.dart`; preserve existing legacy filenames when editing.
- Before coding, inspect the relevant current files and the approved spec/plan.
- After coding, inspect the diff, format changed Dart files, run targeted analyzer/tests, and check acceptance scenarios.
- Do not rewrite unrelated files or regenerate the whole project without approval.

## Stop and ask

Stop for user confirmation if a request needs a second repository, code outside this repository, a new Riverpod architecture or dependency migration, a different architecture, or generated changes outside the requested scope. A feature-scoped provider created through the existing setup is allowed when required by the approved specification. A schema change requires an updated approved specification and plan before coding.
