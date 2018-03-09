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

using System;
using System.Collections.ObjectModel;
using System.ComponentModel;

#pragma warning disable 1591    //  Ignore "Missing XML Comment" warning


namespace POS.Entities
{

    // OrderNoteDetails
    [Serializable]
    [System.CodeDom.Compiler.GeneratedCode("EF.Reverse.POCO.Generator", "2.33.0.0")]
    public partial class StockOutDetails :  INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;

        
        private string _stockoutId { get; set; } // stockout_id (Primary key) (length: 10)
        private string _stockId { get; set; } // stock_id (Primary key) (length: 10)
        private int _quan { get; set; } // quan
        public decimal ItemPrice { get; set; } // item_price
        public int Discount { get; set; } // discount
        

        public string StockoutId
        {
            get
            {
                return _stockoutId;
            }
            set
            {
                _stockoutId = value;
                OnPropertyChanged("_stockoutId");
            }
        }
        public string StockId
        {
            get
            {
                return _stockId;
            }
            set
            {
                _stockId = value;
                OnPropertyChanged("_stockId");
            }
        }
        
        public int Quan
        {
            get
            {
                return _quan;
            }
            set
            {
                _quan = value;
                OnPropertyChanged("Quan");
                //System.Windows.MessageBox.Show("New Quan setting");
            }
        }


        // Foreign keys
        
        public virtual StockOut StockOut { get; set; }
        
        public virtual Stock Stock { get; set; }

        public StockOutDetails()
        {
            InitializePartial();
        }

        partial void InitializePartial();

        public void OnPropertyChanged(string propertyName)
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
        }
    }

}
// </auto-generated>