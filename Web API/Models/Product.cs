//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Web_API.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Product
    {
        
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public string Categoery { get; set; }
        public decimal Price { get; set; }
        public string Short_Description { get; set; }
        public string Small_Image { get; set; }
        public int Quantity { get; set; }
    }
}
