﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace POS.Entities
{
    public partial class Employee
    {
        public int? EmpCode { get; set; }    //emp_code
        public string DecryptedPass { get; set; }
    }
}
