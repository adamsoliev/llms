### Table of Contents

- [LLM as code reviewer](#llm-as-code-reviewer)
- [LLM as debugger](#llm-as-debugger)
- [LLM as editor](#llm-as-editor)
- [Remove AI code slop](#remove-ai-code-slop)
- [Classic System Design](#classic-system-design)
- [Personalized Learning System](#personalized-learning-system)
- [References](#references)

---

### <a id="llm-as-code-reviewer" href="#table-of-contents">LLM as code reviewer</a>

```
Review this diff as a senior engineer on the team.

Focus on:
- Bugs or performance issues
- Edge cases and error handling gaps
- Abstractions that will age poorly or leak
- Tests that don't actually test the interesting behavior

Skip: style nitpicks, naming bikesheds, suggestions that are "nice to have." If the code is fine, say so briefly.
```


### <a id="llm-as-debugger" href="#table-of-contents">LLM as debugger</a>

```
Help me debug this issue. Don't guess at solutions immediately.

Process:
1. Ask clarifying questions until you understand the expected vs actual behavior
2. Help me form hypotheses ranked by likelihood
3. Suggest the smallest diagnostic step that would rule out or confirm each hypothesis
4. Only after we've localized the problem, discuss fixes

I'll share code, logs, and observations as we go. Treat this as a conversation, not a one-shot answer.
```

### <a id="llm-as-editor" href="#table-of-contents">LLM as editor</a>

```
Review this piece for final polish. The structure and argument are set.

Focus on:
- Awkward phrasing or sentences that require re-reading
- Word-level precision: vague words, repeated words in close proximity, hedging that weakens claims
- Tonal inconsistencies or shifts in register
- Transitions that feel abrupt or mechanical
- Cutting anything that doesn't earn its place

Do not restructure, reframe the argument, or add content. Preserve my voice.

Make edits inline with brief marginal notes only where the change isn't self-explanatory.
```

### <a id="remove-ai-code-slop" href="#table-of-contents">Remove AI code slop [^1]</a>

```
Check the diff against main, and remove all AI generated slop introduced in this branch.

This includes:
- Extra comments that a human wouldn't add or is inconsistent with the rest of the file
- Extra defensive checks or try/catch blocks that are abnormal for that area of the codebase (especially if called by trusted / validated codepaths)
- Casts to any to get around type issues
- Variables that are only used a single time right after declaration, prefer inlining the rhs.
- Any other style that is inconsistent with the file

Report at the end with only a 1-3 sentence summary of what you changed
```

### <a id="classic-system-design" href="#table-of-contents">Classic System Design [^2]</a>

```
**System Design Mock Interview Format**

Let's run a system design mock interview in a realistic way:

* You'll ask me to design a system without giving unnecessary details.
* I will ask only the clarifying questions I need.
* You may ask follow-up or leading questions based on my answers.
* I will verbalize my reasoning process as we go, and we'll iterate.
* A large part of a real system design interview is the candidate asking questions, so please don't overshare, let me extract the requirements.

Below is a question we will use as a reference. Assume I haven't read it; use it as a guide, not a script.

COPY-PASTE here the entire question & solution from the sources above (bytebytego/neetcode/etc)
```


### <a id="personalized-learning-system" href="#table-of-contents">Personalized Learning System [^3] [^4]</a>

```
Design a bespoke learning system using the "Math Academy Way" (https://www.justinmath.com/files/the-math-academy-way.pdf).

Core Components:
- Break down {topic} into granular concepts with dependencies
- Build a dependency graph where prerequisites unlock new learning units
- Define practical exercises (projects, blog posts, presentations) that demonstrate mastery
- Map learner states (novice, competent, blocked, ready) with observable transition triggers
- Integrate provided resources and discover new ones mapped to graph units
- Create an iterative navigation process that adapts as understanding evolves

Inputs:
<topic></topic>
<concrete outcome></concrete outcome>
<concrete relevant resources></concrete relevant resources>

Focus on industry-relevant, demonstrable outcomes tailored to the specific topic and goal.
```

### <a id="references" href="#table-of-contents">References</a>

[^1]: [Lucas on X](https://x.com/giffmana/status/1996155974617268256)
[^2]: [twopug.com](https://twopug.com/interview-prep-classic-system-design/)
[^3]: [How to generate a specific, actionable upskilling path in ANY domain](https://x.com/justinskycak/status/1925405621123154073).
[^4]: [Lesson-planner](https://docs.anthropic.com/en/resources/prompt-library/lesson-planner).
