﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace GiaoDichChungKhoan
{
    public partial class Main : DevExpress.XtraEditors.XtraForm
    {
        public Main()
        {
            InitializeComponent();
        }

        private void lENHDATBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.bdsLENHDAT.EndEdit();
            this.tableAdapterManager.UpdateAll(this.GDCHUNGKHOANDataSet);

        }

        private void Main_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'gDCHUNGKHOANDataSet.LENHDAT' table. You can move, or remove it, as needed.
            this.tableAdapterLENHDAT.Fill(this.GDCHUNGKHOANDataSet.LENHDAT);

        }
    }
}