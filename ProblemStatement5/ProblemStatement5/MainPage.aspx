<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="PrakashTest.MainPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Page</title>
 <script type="text/javascript">
     function isNumberKey(evt) {
         var charCode = (evt.which) ? evt.which : evt.keyCode;
         if (charCode > 31 && (charCode < 48 || charCode > 57))
             return false;
         return true;
     }
    function validate()    
    {    
        var stuid = document.getElementById("txtStudentId").value;    
        var stuname = document.getElementById("txtStudentName").value;    
        var age = document.getElementById("txtAge").value;    
        var gender = document.getElementById("txtGender").value;    
        if (stuid == "" || stuname == "" || age == "" || gender=="")    
        {    
            alert("Fill All the Fields");    
            return false;    
        }    
        else    
        {    
            return true;    
        }    
    }    
</script> 
    <style type="text/css">
        .auto-style1 {
            height: 210px;
            width: 601px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="background-color:darkgrey" >
        <div align="center" style="height: 800px">    
            <br />
            <h3 style="color:darkred;font-size: 30px;">STUDENT MANAGEMENT SYSTEM</h3>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <table class="auto-style1" style="margin-left:200px">    
        <tr>    
            <td><b>Student Id</b></td>    
            <td>    
                <asp:TextBox ID="txtStudentId" runat="server" Width="211px" />    
            </td>    
        </tr>    
         
        <tr>    
            <td><b>Student Name</b></td>    
            <td>    
                <asp:TextBox ID="txtStudentName" runat="server" Width="210px" />    
            </td>    
        </tr>    
        <tr>    
            <td><b>Age</b></td>    
            <td>    
                <asp:TextBox ID="txtAge" onkeypress="return isNumberKey(event)" runat="server"  Width="211px" />    
            </td>    
        </tr> 
        <tr>    
            <td><b>Gender</b></td>    
            <td>    
                <asp:TextBox ID="txtGender" runat="server" Width="212px" />    
            </td>    
        </tr> 
    </table>    
    <br />    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Button ID="btnInsert" runat="server" Text="Insert" Height="30px" Width="115px" OnClick="btnInsert_Click" OnClientClick="return validate();" style="margin-left: 0px" />    
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
                    
            <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;    
    <asp:TextBox ID="txtSearch" runat="server" Width="212px" Height="24px" />
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Button ID="btnSearch" runat="server" Text="Search" Height="30px" Width="111px" OnClick="btnSearch_Click"  style="margin-left: 0px" />    
                    
    <br /><br />    
    <asp:GridView ID="GridView1"   HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" runat="server" AutoGenerateColumns="false" OnRowEditing="GridView1_RowEditing" style="margin-left: 0px" Width="1100px" Height="150px" BackColor="#ffccff">    
        <Columns>    
            <asp:BoundField   DataField="StudentId" HeaderText="Student Id" ReadOnly="true" />    
            <asp:BoundField DataField="StudentName" HeaderText="Student Name" />    
            <asp:BoundField DataField="Age" HeaderText="Age" />    
            <asp:BoundField DataField="Gender" HeaderText="Gender" />    
            <asp:TemplateField HeaderText="Actions" ItemStyle-HorizontalAlign="Center" >    
                <ItemTemplate>    
                    <asp:LinkButton Text="Edit" runat="server" CommandName="Edit" />    
                    <asp:LinkButton Text="Delete" runat="server" OnClick="OnDelete" />    
                </ItemTemplate>    
                <EditItemTemplate>    
                    <asp:LinkButton Text="Update" runat="server" OnClick="OnUpdate" />    
                    <asp:LinkButton Text="Cancel" runat="server" OnClick="OnCancel" />    
                </EditItemTemplate>    
            </asp:TemplateField>    
        </Columns>    
    </asp:GridView>    
</div>     
    </form>
</body>
</html>
