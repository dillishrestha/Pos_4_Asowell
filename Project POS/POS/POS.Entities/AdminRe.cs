// <auto-generated>
// ReSharper disable ConvertPropertyToExpressionBody
// ReSharper disable DoNotCallOverridableMethodsInConstructor
// ReSharper disable EmptyNamespace
// ReSharper disable InconsistentNaming
// ReSharper disable PartialMethodWithSinglePart
// ReSharper disable PartialTypeWithSinglePart
// ReSharper disable RedundantNameQualifier
// ReSharper disable RedundantOverridenMember
// ReSharper disable UseNameofExpression
// TargetFrameworkVersion = 4.6
#pragma warning disable 1591    //  Ignore "Missing XML Comment" warning


namespace POS.Entities
{

    // AdminRe
    [System.CodeDom.Compiler.GeneratedCode("EF.Reverse.POCO.Generator", "2.33.0.0")]
    public partial class AdminRe
    {
        public string AdId { get; set; } // ad_id (Primary key) (length: 10)
        public string Username { get; set; } // username (length: 50)
        public string Pass { get; set; } // pass (length: max)
        public string Name { get; set; } // name (length: 50)

        // Reverse navigation

        /// <summary>
        /// Child Employees where [Employee].[manager] point to this entity (FK_dbo.Employee_dbo.AdminRes_manager)
        /// </summary>
        public virtual System.Collections.Generic.ICollection<Employee> Employees { get; set; } // Employee.FK_dbo.Employee_dbo.AdminRes_manager

        public virtual System.Collections.Generic.ICollection<StockIn> StockIns { get; set; }

        public virtual System.Collections.Generic.ICollection<StockOut> StockOuts { get; set; }

        public AdminRe()
        {
            Employees = new System.Collections.Generic.List<Employee>();
            StockIns = new System.Collections.Generic.List<StockIn>();
            StockOuts = new System.Collections.Generic.List<StockOut>();
            InitializePartial();
        }

        partial void InitializePartial();
    }

}
// </auto-generated>
