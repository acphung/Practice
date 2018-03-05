<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Home</title>

        <link href="css/main.css" rel="stylesheet" />
    </head>
    <body>
        <header>
            <h1>cmps183: Homework 3</h1>
            <nav>
                <a id="navIndex">Home</a>
                <a id="navList">ToDo List</a>
                <a id="navNewTask">New Task Form</a>
            </nav>
            %allchecked  = "checked" if filter=="all" else ""
            %donechecked = "checked" if filter=="done" else ""
            %tbdchecked  = "checked" if filter=="tbd" else ""
            %noneselected = "selected" if sort=="none" else ""
            %ipdselected = "selected" if sort=="inc-post-date" else ""
            %dpdselected = "selected" if sort=="dec-post-date" else ""
            %iddselected = "selected" if sort=="inc-due-date" else ""
            %dddselected = "selected" if sort=="dec-due-date" else ""
            %iudselected = "selected" if sort=="inc-update-date" else ""
            %dudselected = "selected" if sort=="dec-update-date" else ""
            <form id="filnsort" action="" method="POST" hidden>
                <input type="radio" id="showAll" name="filter" value="all" {{allchecked}} />
                <input type="radio" id="showTodo" name="filter" value="tbd" {{tbdchecked}} />
                <input type="radio" id="showDone" name="filter" value="done" {{donechecked}} />
                <select name="sort" size="1">
                    <option value="none" {{noneselected}} >Default: None</option>
                    <option value="inc-post-date" {{ipdselected}} >Sort by Increasing Post Date</option>
                    <option value="dec-post-date" {{dpdselected}} >Sort by Decreasing Post Date</option>
                    <option value="inc-due-date" {{iddselected}} >Sort by Increasing Due Date</option>
                    <option value="dec-due-date" {{dddselected}} >Sort by Decreasing Due Date</option>
                    <option value="inc-update-date" {{iudselected}} >Sort by Increasing Modified Date</option>
                    <option value="dec-update-date" {{dudselected}} >Sort by Decreasing Modified Date</option>
                </select>
                <input id="filnsortBtn" type="submit" value="Filter and Sort">
            </form>
        </header>

        <article>
            <h1>Profile</h1>
            <section>

                <img id="profile_img" src="images/profile_pic.jpg" />
                <p class="name">
                    <b>Name:</b> Ray Cruz
                </p>
                <p class="place">
                    <b>Place:</b> Los Angeles
                </p>
                <p class="birthdate">
                    <b>Date of Birth:</b> June 21, 1997
                </p>
                <h4>Extra Info:</h4>
                <p>
                    My name is Ray Cruz and I was born in Los Angeles, California. However, I only lived there for a short amount of time.
                    Due to my parents work, I never lived in single place for more than a year. Because of this, I understood just how important
                    a friend is. That is why I treasure every single moment with my friends and keep in touch with them even after moving.
                </p>
                <p>
                    Although it still hurts leaving behind my friends after a short time, I found many hobbies to lessen the pain. The hobbies I
                    enjoy the most is drawing and listening to music. I also like to play video games occasionally. I haven't tried it but I do
                    have an interest in learning to play an instrument and maybe even learn how to dance. These are but a few of the many things I
                    have an interest in doing and make up who I am as a person.
                </p>
            </section>
            <section id="courses">
                <h2>Courses for this Academic School Year (2017-2018)</h2>

                <div class="qtr">
                    <h3>Fall 2017</h3>
                    <ul>
                        <li>
                            <h3>CMPS 130</h3>
                            <ul>
                                <li><b>Course Title:</b> Computational Models</li>
                                <li><b>Course #:</b> 21328</li>
                                <li><b>Department:</b> Computer Science</li>
                                <li><b>Quarter:</b> Fall 2017</li>
                            </ul>
                        </li>
                        <li>
                            <h3>CMPS 111</h3>
                            <ul>
                                <li><b>Course Title:</b> Intro Operating Systems</li>
                                <li><b>Course #:</b> 21311</li>
                                <li><b>Department:</b> Computer Science</li>
                                <li><b>Quarter:</b> Fall 2017</li>
                            </ul>
                        </li>
                        <li>
                            <h3>CMPM 25</h3>
                            <ul>
                                <li><b>Course Title:</b> 3D Modeling</li>
                                <li><b>Course #:</b> 23077</li>
                                <li><b>Department:</b> Computational Media</li>
                                <li><b>Quarter:</b> Fall 2017</li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="qtr">
                    <h3>Winter 2018</h3>
                    <ul>
                        <li>
                            <h3>CMPS 183</h3>
                            <ul>
                                <li><b>Course Title:</b> Web Applications</li>
                                <li><b>Course #:</b> 41142</li>
                                <li><b>Department:</b> Computer Science</li>
                                <li><b>Quarter:</b> Winter 2018</li>
                            </ul>
                        </li>
                        <li>
                            <h3>CMPS 115</h3>
                            <ul>
                                <li><b>Course Title:</b> Intro Software Eng</li>
                                <li><b>Course #:</b> 41125</li>
                                <li><b>Department:</b> Computer Science</li>
                                <li><b>Quarter:</b> Winter 2018</li>
                            </ul>
                        </li>
                        <li>
                            <h3>CMPS 112</h3>
                            <ul>
                                <li><b>Course Title:</b> Comparative Programming Language</li>
                                <li><b>Course #:</b> 41117</li>
                                <li><b>Department:</b> Computer Science</li>
                                <li><b>Quarter:</b> Winter 2018</li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="qtr">
                    <h3>Spring 2018</h3>
                    <ul>
                        <li>
                            <h3>CMPS 109</h3>
                            <ul>
                                <li><b>Course Title:</b> Advance Programming</li>
                                <li><b>Course #:</b> Currently N/A</li>
                                <li><b>Department:</b> Computer Science</li>
                                <li><b>Quarter:</b> Spring 2018</li>
                            </ul>
                        </li>
                        <li>
                            <h3>CMPS 104A</h3>
                            <ul>
                                <li><b>Course Title:</b> Fundamental Compiler Design 1</li>
                                <li><b>Course #:</b> Currently N/A</li>
                                <li><b>Department:</b> Computer Science</li>
                                <li><b>Quarter:</b> Spring 2018</li>
                            </ul>
                        </li>
                        <li>
                            <h3>CMPS 180</h3>
                            <ul>
                                <li><b>Course Title:</b> Database Systems 1</li>
                                <li><b>Course #:</b> Currently N/A</li>
                                <li><b>Department:</b> Computer Science</li>
                                <li><b>Quarter:</b> Spring 2018</li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </section>
        </article>

        <aside>
            <h1>Notes or Comments</h1>
            <p>
                Same page as in hw1 and hw2.
            </p>
        </aside>

        <footer>
            <a href="#">About Us</a>
            <a href="#">Contact</a>
            <a href="#">Privacy</a>
            <a href="#">Credits</a>
        </footer>
        <script src="scripts/nav.js"></script>
    </body>
</html>
