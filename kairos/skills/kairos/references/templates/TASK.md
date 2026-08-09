---
Partition: "{#}"
Nature: one-off | tracking | hygiene | maintenance | attention | worksite
Frequency: "{if rhythm — weekly, monthly, quarterly, annual}"
Project: "{optional — project name}"
Created: "{date}"
---

> [!info] Optional structure.
> The filename is enough for simple tasks. This content is useful for worksites and rhythms that need context.

---

{notes, context}

## Sub-tasks

> [!tip] For worksites only.
> The guardian presents relevant sub-tasks in the allocation.

### Linear

> [!info] Queue of similar elements. Counted.

- [ ] sub-task 1
- [ ] sub-task 2
- [ ] sub-task 3

### Graph

> [!info] Different steps with dependencies. Milestoned.

```mermaid
graph TD
    A[sub-task 1] --> B[sub-task 2]
    A --> C[sub-task 3]
    B --> D[deliverable]
    C --> D
```
