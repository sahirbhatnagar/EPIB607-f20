---
layout: page
title: Home
nav_order: 1
description: A week-to-week description of the content covered in the course.
---

# Principles and Techniques of Data Science
{: .mb-2 }
UC Berkeley, Fall 2020
{: .mb-0 .fs-6 .text-grey-dk-000 }

<div>

{% assign instructors = site.staffers | where: 'role', 'Instructor' %}
<div class="role">
  {% for staffer in instructors %}
  {{ staffer }}
  {% endfor %}

</div>

<b>This entire website is a work in progress, and all information is subject to change!</b>

<ul>
<li>All announcements are on <a href="http://piazza.com/berkeley/fall2020/data100">Piazza</a>. Make sure you are enrolled and active there.</li>
<li>The <a href="{{ site.baseurl }}/syllabus">Syllabus</a> contains a detailed explanation of how each course component will work this fall, given that the course is being taught entirely online.</li>
<li>The scheduling of all weekly events is in the <a href="{{ site.baseurl }}/calendar">Calendar</a>.</li>
</ul>

<br><br>

{% for module in site.modules %}
{{ module }}
{% endfor %}