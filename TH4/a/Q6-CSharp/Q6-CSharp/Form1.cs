using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Q6_CSharp
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            // Create the MATLAB instance 


        }


        private void BtnPredict_Click(object sender, EventArgs e)
        {
            MLApp.MLApp matlab = new MLApp.MLApp();
            txtPredictionCorrection.Text = "";
            txtLabel.Text = "";
            txtPredictedLabel.Text = "";

            // Change to the directory where the function is located 
            matlab.Execute(@"cd F:\Mathlab\source\C\TH4");

            // Call the MATLAB function myfunc
            matlab.Feval("PredictFace", 3, out object result, int.Parse(txtTestImage.Text));

            // Display result 
            object[] res = result as object[];
            var image = res[0] as byte[,];
            string label = res[1].ToString();
            string predictedLabel = res[2].ToString();
            txtPredictionCorrection.Text = label == predictedLabel ? "Đúng" : "Sai";
            txtLabel.Text = label;
            txtPredictedLabel.Text = predictedLabel;
            int width = image.GetLength(1);
            int height = image.GetLength(0);
            var bitmap = new Bitmap(width, height);
            for (var i = 0; i <height; ++i)
            {
                for (int j = 0; j < width; ++j)
                {

                    int value = image[i, j];
                    bitmap.SetPixel(j, i, Color.FromArgb(value, value, value));
                }
            }
            //bitmap = new Bitmap(bitmap, new Size(140, 140));
            pBImage.Image = bitmap;
        }
    }
}
