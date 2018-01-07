namespace Q6_CSharp
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.BtnPredict = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.txtPredictedLabel = new System.Windows.Forms.TextBox();
            this.txtLabel = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.txtPredictionCorrection = new System.Windows.Forms.TextBox();
            this.txtTestImage = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.pBImage = new System.Windows.Forms.PictureBox();
            ((System.ComponentModel.ISupportInitialize)(this.pBImage)).BeginInit();
            this.SuspendLayout();
            // 
            // BtnPredict
            // 
            this.BtnPredict.Location = new System.Drawing.Point(356, 12);
            this.BtnPredict.Name = "BtnPredict";
            this.BtnPredict.Size = new System.Drawing.Size(114, 40);
            this.BtnPredict.TabIndex = 0;
            this.BtnPredict.Text = "Nhận diện";
            this.BtnPredict.UseVisualStyleBackColor = true;
            this.BtnPredict.Click += new System.EventHandler(this.BtnPredict_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 262);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(42, 17);
            this.label1.TabIndex = 1;
            this.label1.Text = "Nhãn";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(136, 264);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(62, 17);
            this.label2.TabIndex = 1;
            this.label2.Text = "Dự đoán";
            // 
            // txtPredictedLabel
            // 
            this.txtPredictedLabel.Enabled = false;
            this.txtPredictedLabel.Location = new System.Drawing.Point(204, 259);
            this.txtPredictedLabel.Name = "txtPredictedLabel";
            this.txtPredictedLabel.Size = new System.Drawing.Size(61, 22);
            this.txtPredictedLabel.TabIndex = 2;
            // 
            // txtLabel
            // 
            this.txtLabel.Enabled = false;
            this.txtLabel.Location = new System.Drawing.Point(60, 259);
            this.txtLabel.Name = "txtLabel";
            this.txtLabel.Size = new System.Drawing.Size(61, 22);
            this.txtLabel.TabIndex = 2;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(285, 264);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(113, 17);
            this.label3.TabIndex = 1;
            this.label3.Text = "Kết quả dự đoán";
            // 
            // txtPredictionCorrection
            // 
            this.txtPredictionCorrection.Enabled = false;
            this.txtPredictionCorrection.Location = new System.Drawing.Point(409, 259);
            this.txtPredictionCorrection.Name = "txtPredictionCorrection";
            this.txtPredictionCorrection.Size = new System.Drawing.Size(61, 22);
            this.txtPredictionCorrection.TabIndex = 2;
            // 
            // txtTestImage
            // 
            this.txtTestImage.Location = new System.Drawing.Point(130, 21);
            this.txtTestImage.Name = "txtTestImage";
            this.txtTestImage.Size = new System.Drawing.Size(135, 22);
            this.txtTestImage.TabIndex = 3;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(34, 26);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(60, 17);
            this.label4.TabIndex = 1;
            this.label4.Text = "Ảnh test";
            // 
            // pBImage
            // 
            this.pBImage.Location = new System.Drawing.Point(104, 79);
            this.pBImage.Name = "pBImage";
            this.pBImage.Size = new System.Drawing.Size(192, 128);
            this.pBImage.TabIndex = 4;
            this.pBImage.TabStop = false;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(495, 307);
            this.Controls.Add(this.pBImage);
            this.Controls.Add(this.txtTestImage);
            this.Controls.Add(this.txtLabel);
            this.Controls.Add(this.txtPredictionCorrection);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txtPredictedLabel);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.BtnPredict);
            this.Name = "Form1";
            this.Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)(this.pBImage)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button BtnPredict;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtPredictedLabel;
        private System.Windows.Forms.TextBox txtLabel;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtPredictionCorrection;
        private System.Windows.Forms.TextBox txtTestImage;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.PictureBox pBImage;
    }
}

