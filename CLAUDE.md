# CLAUDE.md

This file is the project-local operating contract for AI coding agents. It combines GitHub Spec Kit's Spec-Driven Development (SDD) workflow with the assignment's Flutter architecture rules.

## Source of truth and precedence

1. The user's latest request and approved acceptance criteria.
2. Project constitution/rules in `.specify/memory/` when present.
3. Feature artifacts under `specs/<feature>/` when present.
4. This file and `AGENTS.md`.
5. Existing code and the sample project are implementation references, not permission to invent requirements.

When requirements are ambiguous, write `[NEEDS CLARIFICATION: ...]` in the relevant specification and ask the user. Do not silently guess.

## Spec-Driven Development workflow

For a new feature, follow this order and review each artifact before implementation:

1. Constitution: establish or update project principles in `.specify/memory/constitution.md`.
2. Specify: create `specs/<number>-<short-name>/spec.md` with problem, users, user stories, functional/non-functional requirements, edge cases, and measurable acceptance scenarios. Focus on what/why, not implementation details.
3. Plan: create `plan.md`, and when needed `research.md`, `data-model.md`, `contracts/`, and `quickstart.md`. Record technical decisions and trace them to requirements.
4. Tasks: create `tasks.md` as an executable ordered checklist. Mark independent tasks `[P]` only when safe to parallelize.
5. Implement: implement only tasks supported by the approved spec and plan. Tests and contracts precede source changes where practical.
6. Converge: run analyzer/tests, reconcile code with the spec, and continue until the result is actually converged.

Do not create speculative features. Keep specs high-level; put detailed implementation material in the appropriate plan/supporting artifact. Update the specification and plan when requirements change; do not let code become the only source of truth.

If Spec Kit is installed, use its equivalent constitution/specify/plan/tasks/implement/converge commands. If it is not installed, maintain the same artifact workflow manually; do not install tools or modify global configuration without approval.

## Repository boundary

- The only repository in scope is `D:/Fall2026/de1_nguyenthingoclinh_HE181043/`.
- Write code and project artifacts only there.
- `D:/Fall2026/PRM393/Example-PRM393/` is read-only reference material. Never modify it or create another repository.
- Do not create a nested Flutter app, duplicate `lib/` tree, or unrelated project files.

## Current assignment context

- Flutter application using MVVM.
- The current assignment brief asks for one SQLite data table.
- For the current assignment specification, the UI displays and edits/updates records from that table.
- Treat the SQLite table count as a requirement of the approved feature specification, not as a permanent repository-wide prohibition. If a later approved specification changes the schema, follow that specification and update the plan/data model first.
- SharedPreferences is for lightweight authentication/session state and/or mode/theme/background preference; SQLite remains the source for table records.
- Keep code simple and directly traceable to approved requirements.

## Required Flutter structure

Follow the structure of `Example-PRM393`:

```text
lib/
├── main.dart
├── data/
│   ├── models/
│   └── reposistories/
├── generated/
└── UI/
    ├── <Feature>/
    │   ├── ViewModels/
    │   └── Views/
    │       ├── Screen/
    │       └── Widget/
    ├── Screens/
    └── Widgets/
```

- Models go in `lib/data/models/`.
- SQLite/database and repository code go in `lib/data/reposistories/` (preserve the sample's spelling).
- Riverpod-backed presentation logic goes in `lib/UI/<Feature>/ViewModels/`.
- Feature screens/widgets go in `Views/Screen/` and `Views/Widget/`.
- Keep raw SQL, repository calls, and SharedPreferences out of widgets.
- Do not put UI in models/repositories or persistence logic in ViewModels/widgets.
- New Dart filenames use `lower_snake_case.dart`; preserve existing legacy names when editing them.

## Riverpod setup and generation rule

Riverpod is a normal part of the project's state-management setup. The agent may create a provider/ViewModel when the approved feature requires it, but must follow the project's setup and generator workflow instead of inventing ad-hoc Riverpod files.

- Inspect the existing Riverpod setup, providers, annotations, and ViewModels first; reuse them when appropriate.
- Create provider/ViewModel source files only when they are required by the approved feature/specification and place them in the feature's `ViewModels/` folder.
- Use the existing Riverpod annotations/dependencies and the project's setup command or `build_runner` generation command when generated code is needed.
- Never hand-write or manually edit generated Riverpod `*.g.dart` files. Generated files must come from the generator, for example `dart run build_runner build --delete-conflicting-outputs` when appropriate for this project.
- Do not silently add unrelated providers, a duplicate provider hierarchy, or a second Riverpod architecture.
- Do not add, remove, or upgrade Riverpod dependencies unless the feature setup requires it and the change is recorded in the plan.

## Quality gates

Before implementation: no unresolved clarification in the approved scope, requirements are testable, and the plan passes simplicity/anti-abstraction checks.

After implementation: inspect the diff, format changed Dart files, run the narrowest relevant analyzer/tests, and verify each acceptance scenario. Do not run commands that rewrite unrelated files without approval.

## Hard stop conditions

Ask the user before proceeding if the task requires a second repository, code outside the boundary, a new Riverpod architecture or dependency migration, architecture changes, or generated-file regeneration affecting unrelated files. Creating a feature-scoped provider through the existing setup is allowed when supported by the approved specification. A schema change must be documented in the approved specification and plan before implementation.
