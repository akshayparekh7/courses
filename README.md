*Requisite* 

    *Ruby version -> 3.1.2 *

    *Rails version 7.0.3.1*
    
----------------------

Endpoint for POST course will be ->>>>>>> http://localhost:3000/api/courses

Endpoint to GET the list of courses along with tutor will be ->>>>> http://localhost:3000/api/courses

Sample request for the post request

----------------------


{
    "course": {
        "name": "Akshay",
        "tutors_attributes": [
            {
                "name": "Test new",
                "email": "ak1@gmail.com"
            },
            {
                "name": "Test 2",
                "email": "ak2@gmail.com"
            },
            {
                "name": "Test 3",
                "email": "ak3@gmail.com"
            }
        ]
    }
}


-----------------------

Run rspecs locally to generate the Coverage report.
