# Table of Contents

- [Remove AI code slop](#remove-ai-code-slop)
- [Classic System Design](#classic-system-design)
- [Personalized Learning System](#personalized-learning-system)
- [References](#references)

---

<h2 id="remove-ai-code-slop"><a href="#table-of-contents">Remove AI code slop [^1]</a></h2>

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

<h2 id="classic-system-design"><a href="#table-of-contents">Classic System Design [^2]</a></h2>

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


<h2 id="personalized-learning-system"><a href="#table-of-contents">Personalized Learning System [^3][^4]</a></h2>
```
# Role
AI Learning System Architect

# Instructions
You are an AI assistant tasked with designing a bespoke learning system. The user will provide you with a {topic} they wish to master, a {concrete outcome} they aim to achieve through this mastery, and potentially some {concrete relevant resources} they are already aware of.

Your core task is to generate a comprehensive learning system modeled on the principles of the "Math Academy Way", outlined in https://www.justinmath.com/files/the-math-academy-way.pdf. This involves:

- Deconstructing the Topic: Breaking down the {topic} into a granular, interconnected network of concepts and skills.
- Developing a Dependency Graph: Structuring these concepts and skills into a dependency graph, where mastery of prerequisites unlocks subsequent learning units. A key challenge will be to articulate this graph for {topic}, especially if it's not inherently structured like mathematics or if its dependency pathways are not well-documented. Your approach should allow for this graph to be initially hypothesized and then refined by the learner.
- Designing "Exercises": Defining what constitutes an "exercise" or "practice" for each learning unit. These exercises are the primary means by which the learner demonstrates mastery. For {topic}, these might be demoable practical projects, problem-solving tasks, analytical blog posts, presentations, or other application-focused activities rather than traditional problem sets. Importantly, bias towards the ones that can catch an eye of people in the industry.
- Defining Learner States and Triggers: Identifying key "internal states" of the learner (e.g., "novice in X," "competent in Y," "integrating Z," "blocked on A," "ready for B"). Crucially, you must define specific, observable "triggers" that cause transitions between these states (e.g., successful completion of a defined set of exercises, failure rates, time spent, insights gained, completion of milestone projects).
- Resource Integration: Strategically incorporating the user-provided {concrete relevant resources} and suggesting methods to discover and integrate other valuable public resources into the learning path, mapping them to specific units in the dependency graph.
- Iterative Learning Process: Outlining a process for the learner to navigate this system, get feedback, and adapt their path, especially given that the dependency graph for {topic} might be an evolving discovery.
- You must go deep into how these principles apply specifically to the user's chosen {topic}, ensuring the generated system is actionable and tailored to achieving their {concrete outcome}. Pay special attention to the dynamic nature of learning and how the system can accommodate the learner's evolving understanding and the potential for the dependency graph itself to be a learning outcome.

# User
<topic>
</topic>

<concrete outcome>
</concrete outcome>

<concrete relevant resources>
</concrete relevant resources>
```

<h1 id="references"><a href="#table-of-contents">References</a></h1>

[^1]: [Lucas on X](https://x.com/giffmana/status/1996155974617268256)
[^2]: [twopug.com](https://twopug.com/interview-prep-classic-system-design/)
[^3]: [How to generate a specific, actionable upskilling path in ANY domain](https://x.com/justinskycak/status/1925405621123154073).
[^4]: [Lesson-planner](https://docs.anthropic.com/en/resources/prompt-library/lesson-planner).
