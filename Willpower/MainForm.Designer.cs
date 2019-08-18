namespace Willpower
{
    partial class MainForm
    {
        /// <summary>
        /// Обязательная переменная конструктора.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Освободить все используемые ресурсы.
        /// </summary>
        /// <param name="disposing">истинно, если управляемый ресурс должен быть удален; иначе ложно.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Код, автоматически созданный конструктором форм Windows

        /// <summary>
        /// Требуемый метод для поддержки конструктора — не изменяйте 
        /// содержимое этого метода с помощью редактора кода.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainForm));
            this.LabelStartstop = new System.Windows.Forms.Label();
            this.LabelSaveload = new System.Windows.Forms.Label();
            this.SaveslotChooser = new System.Windows.Forms.ComboBox();
            this.NewslotTextbox = new System.Windows.Forms.TextBox();
            this.NewslotBtn = new System.Windows.Forms.Button();
            this.StartstopBtn = new System.Windows.Forms.Button();
            this.Stopwatch = new System.Windows.Forms.Timer(this.components);
            this.DelayList = new System.Windows.Forms.ListBox();
            this.DeleteslotBtn = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // LabelStartstop
            // 
            this.LabelStartstop.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.LabelStartstop.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.LabelStartstop.ForeColor = System.Drawing.Color.DodgerBlue;
            this.LabelStartstop.Location = new System.Drawing.Point(12, 84);
            this.LabelStartstop.Name = "LabelStartstop";
            this.LabelStartstop.Size = new System.Drawing.Size(600, 30);
            this.LabelStartstop.TabIndex = 0;
            this.LabelStartstop.Text = "Start/Stop";
            this.LabelStartstop.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // LabelSaveload
            // 
            this.LabelSaveload.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.LabelSaveload.ForeColor = System.Drawing.Color.DodgerBlue;
            this.LabelSaveload.Location = new System.Drawing.Point(12, 9);
            this.LabelSaveload.Name = "LabelSaveload";
            this.LabelSaveload.Size = new System.Drawing.Size(600, 30);
            this.LabelSaveload.TabIndex = 1;
            this.LabelSaveload.Text = "Save/Load";
            this.LabelSaveload.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // SaveslotChooser
            // 
            this.SaveslotChooser.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.SaveslotChooser.BackColor = System.Drawing.Color.Black;
            this.SaveslotChooser.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.SaveslotChooser.ForeColor = System.Drawing.Color.DodgerBlue;
            this.SaveslotChooser.FormattingEnabled = true;
            this.SaveslotChooser.Location = new System.Drawing.Point(12, 45);
            this.SaveslotChooser.Name = "SaveslotChooser";
            this.SaveslotChooser.Size = new System.Drawing.Size(238, 35);
            this.SaveslotChooser.TabIndex = 2;
            this.SaveslotChooser.Text = "Default";
            this.SaveslotChooser.SelectedIndexChanged += new System.EventHandler(this.SaveslotChooser_SelectedIndexChanged);
            // 
            // NewslotTextbox
            // 
            this.NewslotTextbox.BackColor = System.Drawing.Color.Black;
            this.NewslotTextbox.ForeColor = System.Drawing.Color.White;
            this.NewslotTextbox.Location = new System.Drawing.Point(346, 45);
            this.NewslotTextbox.Name = "NewslotTextbox";
            this.NewslotTextbox.Size = new System.Drawing.Size(196, 32);
            this.NewslotTextbox.TabIndex = 4;
            // 
            // NewslotBtn
            // 
            this.NewslotBtn.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.NewslotBtn.ForeColor = System.Drawing.Color.DodgerBlue;
            this.NewslotBtn.Location = new System.Drawing.Point(548, 41);
            this.NewslotBtn.Name = "NewslotBtn";
            this.NewslotBtn.Size = new System.Drawing.Size(64, 40);
            this.NewslotBtn.TabIndex = 5;
            this.NewslotBtn.Text = "New";
            this.NewslotBtn.UseVisualStyleBackColor = true;
            this.NewslotBtn.Click += new System.EventHandler(this.NewslotBtn_Click);
            // 
            // StartstopBtn
            // 
            this.StartstopBtn.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.StartstopBtn.ForeColor = System.Drawing.Color.Lime;
            this.StartstopBtn.Location = new System.Drawing.Point(12, 118);
            this.StartstopBtn.Name = "StartstopBtn";
            this.StartstopBtn.Size = new System.Drawing.Size(600, 40);
            this.StartstopBtn.TabIndex = 6;
            this.StartstopBtn.Text = "Start";
            this.StartstopBtn.UseVisualStyleBackColor = true;
            this.StartstopBtn.Click += new System.EventHandler(this.StartstopBtn_Click);
            // 
            // Stopwatch
            // 
            this.Stopwatch.Interval = 1000;
            this.Stopwatch.Tick += new System.EventHandler(this.Stopwatch_Tick);
            // 
            // DelayList
            // 
            this.DelayList.BackColor = System.Drawing.Color.Black;
            this.DelayList.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.DelayList.ForeColor = System.Drawing.Color.White;
            this.DelayList.FormattingEnabled = true;
            this.DelayList.ItemHeight = 27;
            this.DelayList.Items.AddRange(new object[] {
            ""});
            this.DelayList.Location = new System.Drawing.Point(12, 164);
            this.DelayList.Name = "DelayList";
            this.DelayList.Size = new System.Drawing.Size(600, 486);
            this.DelayList.TabIndex = 7;
            // 
            // DeleteslotBtn
            // 
            this.DeleteslotBtn.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.DeleteslotBtn.ForeColor = System.Drawing.Color.DodgerBlue;
            this.DeleteslotBtn.Location = new System.Drawing.Point(256, 41);
            this.DeleteslotBtn.Name = "DeleteslotBtn";
            this.DeleteslotBtn.Size = new System.Drawing.Size(84, 40);
            this.DeleteslotBtn.TabIndex = 8;
            this.DeleteslotBtn.Text = "Delete";
            this.DeleteslotBtn.UseVisualStyleBackColor = true;
            this.DeleteslotBtn.Click += new System.EventHandler(this.DeleteslotBtn_Click);
            // 
            // MainForm
            // 
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.None;
            this.BackColor = System.Drawing.Color.Black;
            this.ClientSize = new System.Drawing.Size(624, 663);
            this.Controls.Add(this.DeleteslotBtn);
            this.Controls.Add(this.DelayList);
            this.Controls.Add(this.StartstopBtn);
            this.Controls.Add(this.NewslotBtn);
            this.Controls.Add(this.NewslotTextbox);
            this.Controls.Add(this.SaveslotChooser);
            this.Controls.Add(this.LabelSaveload);
            this.Controls.Add(this.LabelStartstop);
            this.Font = new System.Drawing.Font("Trebuchet MS", 15.75F);
            this.ForeColor = System.Drawing.Color.White;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Margin = new System.Windows.Forms.Padding(6);
            this.Name = "MainForm";
            this.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Willpower v1.0.0";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label LabelStartstop;
        private System.Windows.Forms.Label LabelSaveload;
        private System.Windows.Forms.ComboBox SaveslotChooser;
        private System.Windows.Forms.TextBox NewslotTextbox;
        private System.Windows.Forms.Button NewslotBtn;
        private System.Windows.Forms.Button StartstopBtn;
        private System.Windows.Forms.Timer Stopwatch;
        private System.Windows.Forms.ListBox DelayList;
        private System.Windows.Forms.Button DeleteslotBtn;
    }
}

