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


namespace POS.Mapping
{
    using POS.Entities;

    // OrderTemp
    [System.CodeDom.Compiler.GeneratedCode("EF.Reverse.POCO.Generator", "2.33.0.0")]
    public partial class OrderTempMapping : System.Data.Entity.ModelConfiguration.EntityTypeConfiguration<OrderTemp>
    {
        public OrderTempMapping()
            : this("dbo")
        {
        }

        public OrderTempMapping(string schema)
        {
            ToTable("OrderTemp", schema);
            HasKey(x => x.OrdertempId);

            Property(x => x.OrdertempId).HasColumnName(@"ordertemp_id").HasColumnType("varchar").IsRequired().IsUnicode(false).HasMaxLength(10).HasDatabaseGeneratedOption(System.ComponentModel.DataAnnotations.Schema.DatabaseGeneratedOption.None);
            Property(x => x.CusId).HasColumnName(@"cus_id").HasColumnType("varchar").IsOptional().IsUnicode(false).HasMaxLength(10);
            Property(x => x.EmpId).HasColumnName(@"emp_id").HasColumnType("varchar").IsOptional().IsUnicode(false).HasMaxLength(10);
            Property(x => x.TableOwned).HasColumnName(@"table_owned").HasColumnType("varchar").IsOptional().IsUnicode(false).HasMaxLength(10);
            Property(x => x.Ordertime).HasColumnName(@"ordertime").HasColumnType("datetime").IsRequired();
            Property(x => x.TotalPrice).HasColumnName(@"total_price").HasColumnType("money").IsRequired().HasPrecision(19,4);
            Property(x => x.CustomerPay).HasColumnName(@"customer_pay").HasColumnType("money").IsRequired().HasPrecision(19,4);
            Property(x => x.PayBack).HasColumnName(@"pay_back").HasColumnType("money").IsRequired().HasPrecision(19,4);

            // Foreign keys
            HasOptional(a => a.Table).WithMany(b => b.OrderTemps).HasForeignKey(c => c.TableOwned).WillCascadeOnDelete(false); // fk_table_owned_order
            HasOptional(a => a.Customer).WithMany(b => b.OrderTemps).HasForeignKey(c => c.CusId).WillCascadeOnDelete(false);
            HasOptional(a => a.Employee).WithMany(b => b.OrderTemps).HasForeignKey(c => c.EmpId).WillCascadeOnDelete(false);
            InitializePartial();
        }
        partial void InitializePartial();
    }

}
// </auto-generated>
