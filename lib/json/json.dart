{
  "batches": {
    "batch1": {
      "name": "Batch 1",
      "department": "Computer Science",
      "faculty": "faculty1",
      "students": {
        "student1": true,
        "student2": true,
        "student3": true
      },
      "classroom": "classroom1"
    },
    "batch2": {
      "name": "Batch 2",
      "department": "Electronics",
      "faculty": "faculty2",
      "students": {
        "student4": true,
        "student5": true,
        "student6": true
      },
      "classroom": "classroom2"
    }
    // more batches can be added here
  },
  "students": {
    "student1": {
      "name": "John Doe",
      "email": "john.doe@example.com",
      "batch": "batch1"
    },
    "student2": {
      "name": "Jane Doe",
      "email": "jane.doe@example.com",
      "batch": "batch1"
    },
    "student3": {
      "name": "Bob Smith",
      "email": "bob.smith@example.com",
      "batch": "batch1"
    },
    "student4": {
      "name": "Alice Brown",
      "email": "alice.brown@example.com",
      "batch": "batch2"
    },
    "student5": {
      "name": "David Lee",
      "email": "david.lee@example.com",
      "batch": "batch2"
    },
    "student6": {
      "name": "Sarah Chen",
      "email": "sarah.chen@example.com",
      "batch": "batch2"
    }
    // more students can be added here
  },
  "faculties": {
    "faculty1": {
      "name": "Faculty 1",
      "email": "faculty1@example.com",
      "department": "Computer Science"
    },
    "faculty2": {
      "name": "Faculty 2",
      "email": "faculty2@example.com",
      "department": "Electronics"
    }
    // more faculties can be added here
  },
  "departments": {
    "Computer Science": {
      "name": "Computer Science",
      "faculties": {
        "faculty1": true
      }
    },
    "Electronics": {
      "name": "Electronics",
      "faculties": {
        "faculty2": true
      }
    }
    // more departments can be added here
  },
  "classrooms": {
    "classroom1": {
      "name": "Classroom 1",
      "capacity": 30
    },
    "classroom2": {
      "name": "Classroom 2",
      "capacity": 40
    }
    // more classrooms can be added here
  },
  "attendance": {
    "batch1": {
      "2023-03-01": {
        "classroom": "classroom1",
        "faculty": "faculty1",
        "students": {
          "student1": "present",
          "student2": "absent",
          "student3": "present"
        }
      },
      "2023-03-02": {
        "classroom": "classroom1",
        "faculty": "faculty1",
        "students": {
          "student1": "present",
          "student2": "present",
          "student3": "present"
        }
      }
      // more attendance records can be added here
    },
    "batch2": {
    "2023-03-01": {
        "classroom": "classroom2",
        "faculty": "faculty2",
        "students": {
        "student4": "present",
        "student5": "present",
        "student6": "absent"
    }
    },
        "2023-03-02": {
        "classroom": "classroom2",
        "faculty": "faculty2",
        "students": {
        "student4": "present",
        "student5": "present",
        "student6": "present"
    }
    }
    // more attendance records can be added here
    }
},
"leaveRequests": {
"student1": {
"2023-03-03": {
"reason": "sick leave",
"status": "approved",
"approvedBy": "faculty1"
},
"2023-03-04": {
"reason": "family emergency",
"status": "rejected",
"approvedBy": ""
}
// more leave requests can be added here
},
"student2": {
"2023-03-03": {
"reason": "attending workshop",
"status": "approved",
"approvedBy": "faculty1"
},
"2023-03-04": {
"reason": "attending conference",
"status": "pending",
"approvedBy": ""
}
// more leave requests can be added here
}
// more students can be added here
}
}


// In this structure, the top-level collections are `batches`, `students`, `faculties`, `departments`, `classrooms`, `attendance`, and `leaveRequests`. Each of these collections contains documents representing their respective entities. 

// Each `batch` document has a name, a department it belongs to, a faculty who is responsible for it, a list of `students` who are part of it, and a `classroom` where the classes for this batch are held.

// Each `student` document has a name, an email, and the `batch` they belong to.

// Each `faculty` document has a name, an email, and the `department` they belong to.

// Each `department` document has a name and a list of `faculties` who are part of it.

// Each `classroom` document has a name and a `capacity`.

// The `attendance` collection contains documents for each `batch` on each day, with information about the `classroom`, the `faculty` who took the attendance, and a map of `students` and their attendance status (either "present", "absent", or "late", for example).

// The `leaveRequests` collection contains documents for each `student` on each day they requested leave, with information about the `reason` for the request, the `status` (either "approved", "rejected", or "pending"), and the `faculty` who approved or rejected the request.
