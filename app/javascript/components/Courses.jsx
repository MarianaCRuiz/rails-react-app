import React, { useState, useEffect } from "react";
import { Link, useNavigate } from "react-router-dom";

export default function Courses() {
  const navigate = useNavigate();
  const [courses, setCourses] = useState([]);

  useEffect(() => {
    const url = "/api/v1/courses";
    fetch(url)
      .then((res) => {
        if (res.ok) {
          return res.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((res) => setCourses(res))
      .catch(() => navigate("/"));
  }, []);
console.log(courses)
  return(
    <div>
      <h1>Cursos</h1>
      {courses.map((course) => 
        <React.Fragment key={`course_${course.id}`}>
          <p>{course.name}</p>
          <p>{course.registration_code}</p>
          <p>{course.description}</p>
          <br></br>
        </React.Fragment>
      )}
    </div>
  )
};