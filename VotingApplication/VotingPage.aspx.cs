using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace VotingApplication
{
    public partial class VotingPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvImages_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string emailid = this.email.Text;
            if(emailid == String.Empty)
            {
                Response.Write("<script>alert('Please enter an email id!')</script>");
                return;
            }
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = gvImages.Rows[index];
            String name = row.Cells[0].Text.Trim();
            SqlConnection sqlConnection1 = new SqlConnection("Data Source =.; Initial Catalog = VotingApp; Integrated Security = True");
            SqlCommand cmd = new SqlCommand("SELECT voteremail from VoteCount", sqlConnection1);
            List<string> voters = new List<string>();
            using (cmd)
            {
                sqlConnection1.Open();
                var reader = cmd.ExecuteReader();
                while(reader.Read())
                {
                    voters.Add(reader.GetString(0));
                }
                sqlConnection1.Close();
            }
            if(!voters.Contains(emailid))
            {
                int serial = voters.Count + 1;
                SqlCommand insertCommand = new SqlCommand("INSERT INTO VoteCount VALUES (@param1, @param2, @param3)", sqlConnection1);
                using (insertCommand)
                {
                    sqlConnection1.Open();
                    insertCommand.Parameters.Add("@param1", SqlDbType.Int).Value = serial;
                    insertCommand.Parameters.Add("@param2", SqlDbType.NVarChar).Value = emailid;
                    insertCommand.Parameters.Add("@param3", SqlDbType.NChar).Value = name;
                    insertCommand.CommandType = CommandType.Text;
                    insertCommand.ExecuteNonQuery();
                    sqlConnection1.Close();
                }
                Response.Write("<script>alert('Thank you for voting!')</script>");
            }
            else
            {
                Response.Write("<script>alert('You've already voted, sorry!')</script>");
            }
        }
    }
}