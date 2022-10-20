# README

Event calendar

Things you may want to cover:

* Ruby version
3.0.1

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* API endpoints
  GET    /api/v1/jobs/:id/jobs_by_plumber_and_period(.:format)
  GET    http://localhost:3000/api/v1/plumbers/{1}/jobs_by_plumber_and_period?start_time={2022-10-17 18:00:00}&end_time={2022-10-19 18:00:00}

  PUT    /api/v1/jobs/:id/mark_job_as_completed(.:format)
  PUT    http://localhost:3000/api/v1/jobs/{1}/mark_job_as_completed
