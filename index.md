---
layout: page
title: Home
nav_order: 1
description: A week-to-week description of the content covered in the course.
---

# Inferential Statistics
{: .mb-2 }
McGill University, Fall 2020
{: .mb-0 .fs-6 .text-grey-dk-000 }

<div>

{% assign instructors = site.staffers | where: 'role', 'Instructor' %}
<div class="role">
  {% for staffer in instructors %}
  {{ staffer }}
  {% endfor %}

</div>

<p>Welcome to the course website for <a href="https://www.mcgill.ca/study/2020-2021/courses/epib-607">EPIB 607 FALL 2020: Inferential Statistics</a> at McGill University.</p>


<ul>
<li>Pre-recorded lecture videos will be made available here and on <a href="https://mycourses2.mcgill.ca/">myCourses</a>. Make sure you are enrolled and active there. The recordings of the live lectures will only be available on myCourses.</li>
<li>The <a href="{{ site.baseurl }}/syllabus">Syllabus</a> contains a detailed explanation of how each course component will work this fall, given that the course is being taught entirely online.</li>
<li>The scheduling of all weekly events is in the <a href="{{ site.baseurl }}/calendar">Calendar</a>.</li>
</ul>

<br><br>

{% for module in site.modules %}
{{ module }}
{% endfor %}
