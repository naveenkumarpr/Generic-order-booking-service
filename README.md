# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
placed -> processing or cancelled
processing -> delivered
delivered -> returned

cancelled or returned -> status changes not allowed
payload of "status_update" API
{
  order_number: "XYZ",
  status: "processing"
}
response: {
  order_number: "XYZ",
  updated_status: "processing" or nil if not updated,
  message: "status update successful",
  success: true or false
}


 def validate_email
    if self.email =~/\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
      return
    else
      errors.add(:email,"Invalid Email")
    end
  end
end
