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

  return(
    <div>
      <h1>Cursos</h1>
      <div className="grid grid-cols-3 gap-4">
        {courses.map((course) => 
          <div className="card mb-3"key={`course_${course.id}`}>
            <div className="row g-0">
              <div className="col-md-8">
                <div className="card-body">
                  <h5 className="card-title">{course.name}</h5>
                  <p className="card-text">{course.description}</p>
                  <p className="card-text"><small className="text-body-secondary">{course.registration_code}</small></p>
                </div>
              </div>
            </div>
          </div>
        )}
      </div>
    </div>
  )
};