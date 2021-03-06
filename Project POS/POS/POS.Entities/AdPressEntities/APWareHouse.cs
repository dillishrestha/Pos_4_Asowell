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

    // WareHouse
    [System.CodeDom.Compiler.GeneratedCode("EF.Reverse.POCO.Generator", "2.33.0.0")]
    public partial class APWareHouse
    {
        public string APWarehouseId { get; set; } // apwarehouse_id (Primary key) (length: 10)
        public string Name { get; set; }    // name (length: 500)
        public double? Contain { get; set; } // contain
        public double StandardContain { get; set; }

        // Reverse navigation

        public virtual System.Collections.Generic.ICollection<Stock> Stocks { get; set; }

        public APWareHouse()
        {
            Stocks = new System.Collections.Generic.List<Stock>();
            InitializePartial();
        }

        partial void InitializePartial();
    }

}
// </auto-generated>
