# Anselm Joseph's Resume

### Setup (for Mac)
1. Install `macTeX` or `basicTeX`
2. Install `pdflatex` if required

#### Further setup For basicTeX
Update the tlmgr using the following command:
```bash
sudo tlmgr update --self
```
Install the following packages using `tlmgr` (sudo might be required):
- `latexindent`
- `latexmk`
- `preprint`
- `fullpage`
- `collection-fontsextra`
- `fullpage`
- `titlesec`
- `marvosym`
- `enumitem`
- `noto`
- `fontaxes`
- `inter`
- `greek-fontenc`
- `babel-greek`
- `cbfonts`

### Generating PDF
```bash
chmod +x build.sh
./build.sh
```

### Preview
![Resume](resume.png)

### Plain Text
Here's what the resume looks like for an ATS system:
```
ANSELM JOSEPH
FULL STACK DEVELOPER
+1 (872) 258-5803 • ajoseph17@hawk.iit.edu • linkedin.com/in/anselmj • an23lm.github.io
Full Stack Developer with 5+ years of experience in backend, web, and mobile applications. Master’s in Computer
Engineering with focus on Machine Learning. Experienced with React, React Native, Java, Node.js, MySQL, and MongoDB.
PROFESSIONAL EXPERIENCE
- MOLEX BANGALORE, INDIA
SOFTWARE ENGINEER DEC 2019 – AUG 2022
- Owned Identity and Access Management (IAM) microservice built using Java, Spring Boot, and MongoDB, streamlined
user authentication and authorization processes, reducing API development time by 10% and enhancing security.
- Developed middleware to aggregate real-time data using Python, Kafka, AWS; improving ingestion rate by 17%.
- Improved digitization pipeline’s eﬃciency by 70% for terabytes of blueprints built on GCP, Python, Pillow, and Solr.
- CBREX TECHNOLOGIES BANGALORE, INDIA
PRODUCT ENGINEER 1 AUG 2017 – DEC 2019
- Refactored website to use React and Bootstrap to provide excellent UX, improving user engagement by 33%.
- Created 2 JavaScript libraries, reducing redundant code by 20% and improving UX and customer satisfaction.
- Communicated technical subjects to stakeholders and created actionable tasks, reducing delivery time of features.
- Contributed to adoption of Agile Methodologies and CI/CD, utilizing Jira and Jenkins, improving productivity by 30%.
- Optimized MySQL queries and implemented API caching using Redis with Spring Boot, reducing load times by 44%.
EDUCATION
- ILLINOIS INSTITUTE OF TECHNOLOGY CHICAGO, IL
MASTERS IN COMPUTER ENGINEERING, 3.9 GPA EXPECTED MAY 2024
- Focus: Probability & Statistics in CS, Machine Learning, and Artiﬁcial Intelligence.
- NEW HORIZON COLLEGE OF ENGINEERING BANGALORE, INDIA
BACHELORS IN COMPUTER SCIENCE AND ENGINEERING AUGUST 2013 – MAY 2017
- Focus: Advanced Data Structures and Algorithms.
ENTREPRENEURIAL EXPERIENCE
- DOG LEADS – React.js, Next.js, Typescript, AWS, Machine Learning
- Created a platform to generate leads for businesses using Artiﬁcial Intelligence.
- Implemented a recommendation system using collaborative ﬁltering, increasing user engagement by 40%.
- EARTHEN SHADE – React.js, Next.js, Vercel, Firebase, GCP, Typescript, Tailwind CSS
- Designed and developed an e-commerce platform, ﬁnding balance between technical robustness and business impact,
iterating with feedback from stakeholders and customers.
- Implemented a real-time chat feature using WebSocket and Socket.io, enhancing user engagement and reducing
response time by 20%.
- NOBIAS INVESTING – React Native, Typescript, Swift, Java, GitLab CI/CD
- Balanced between UX and performance on information-rich screens through a process of continuous improvement.
- Widespread device compatibility was prioritized and ensured reliability and responsiveness on low-end networks.
SKILLS
Languages: JavaScript, TypeScript, Python, Java, Swift, Kotlin, Go.
Frontend Technologies: React, React Native, Angular, SwiftUI, HTML, CSS, Tailwind CSS, Bootstrap.
Backend Technologies: Google Cloud, Firebase, AWS Cloud, Node.js, Next.js, Spring Boot, Flask, MongoDB, Firestore,
MySQL, Redis, Kafka, Docker.
Concepts: Operating System, Object Oriented Programming, Functional Programming, Caching, Encryption, Decryption,
Artiﬁcial Intelligence, Machine Learning, Neural Networks, REST API, SOAP API, Database Normalization, Agile
Methodology, Cloud Computing, Payment Systems, Containerization, CI/CD, Sockets, Networking, Security.
```

### Feedback
I'm not an expert at LaTeX, this is my first work with LaTeX. Feedback is always welcome. If you have any to give, [create an issue on GitHub](https://github.com/an23lm/resume/issues).

#### Known Issues
- Some words in plain text use special characters which is not expected. Example: `Artiﬁcial Intelligence` should be `Artificial Intelligence` - [GitHub Issue #1](https://github.com/an23lm/resume/issues/1)

### Inspiration
Before this I used Pages to create my resume. I noticed that it was not ATS friendly. So I decided to create a LaTeX resume which is ATS friendly and looks professional.

This resume was inspired by [Jake's Resume](https://www.overleaf.com/latex/templates/jakes-resume-anonymous/cstpnrbkhndn) on Overleaf.
https://www.overleaf.com/latex/templates/jakes-resume-anonymous/cstpnrbkhndn

### License
Unlicense