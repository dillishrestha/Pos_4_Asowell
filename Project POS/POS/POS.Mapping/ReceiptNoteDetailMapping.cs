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

    // ReceiptNoteDetails
    [System.CodeDom.Compiler.GeneratedCode("EF.Reverse.POCO.Generator", "2.33.0.0")]
    public partial class ReceiptNoteDetailMapping : System.Data.Entity.ModelConfiguration.EntityTypeConfiguration<ReceiptNoteDetail>
    {
        public ReceiptNoteDetailMapping()
            : this("dbo")
        {
        }

        public ReceiptNoteDetailMapping(string schema)
        {
            ToTable("ReceiptNoteDetails", schema);
            HasKey(x => new { x.RnId, x.IgdId });

            Property(x => x.RnId).HasColumnName(@"rn_id").HasColumnType("varchar").IsRequired().IsUnicode(false).HasMaxLength(10).HasDatabaseGeneratedOption(System.ComponentModel.DataAnnotations.Schema.DatabaseGeneratedOption.None);
            Property(x => x.IgdId).HasColumnName(@"igd_id").HasColumnType("varchar").IsRequired().IsUnicode(false).HasMaxLength(10).HasDatabaseGeneratedOption(System.ComponentModel.DataAnnotations.Schema.DatabaseGeneratedOption.None);
            Property(x => x.Quan).HasColumnName(@"quan").HasColumnType("float").IsRequired();
            Property(x => x.ItemPrice).HasColumnName(@"item_price").HasColumnType("money").IsRequired().HasPrecision(19,4);
            Property(x => x.Note).HasColumnName(@"note").HasColumnType("varchar").IsOptional().IsUnicode(false).HasMaxLength(500);

            // Foreign keys
            HasRequired(a => a.Ingredient).WithMany(b => b.ReceiptNoteDetails).HasForeignKey(c => c.IgdId).WillCascadeOnDelete(false); // FK_dbo.ReceiptNoteDetails_dbo.Ingredient_igd_id
            HasRequired(a => a.ReceiptNote).WithMany(b => b.ReceiptNoteDetails).HasForeignKey(c => c.RnId).WillCascadeOnDelete(false); // FK_dbo.ReceiptNoteDetails_dbo.ReceiptNote_rn_id
            InitializePartial();
        }
        partial void InitializePartial();
    }

}
// </auto-generated>
