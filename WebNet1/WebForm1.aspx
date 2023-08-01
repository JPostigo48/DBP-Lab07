<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebNet1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<style>
    html {
        width: 100%;
        height: 100%;
    }
    body {
        width: 100%;
        height: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .form {
        width: 100%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        flex-wrap: wrap;
    }
    .form-label {
        margin: 2px 5px 0 5px;
        font-size: 20px;
    }
    .radiobuttonlist {
        width: 100%;
    }
    .radiobuttonlist tbody {
        display: flex;
        justify-content: space-evenly;
    }
    .col-8 {
        display: flex;
        justify-content: center;
    }
    .col-md-4 {
        display: flex;
        justify-content: center;
        margin: 10px 10px;
    }
</style>
<script type="text/javascript">
    function validar() {
        var nombre = document.getElementById("name_textbox").value;
        var nombreV = /^[a-z]+$/i;
        if (!nombreV.test(nombre)) {
            alert("El nombre solo puede contener letras.");
            nombreInput.focus();
            return false;
        }

        var apellido = document.getElementById("surnames_textbox").value;

        var apellidoV = /^[A-Za-zÁÉÍÓÚáéíóúÑñ]+\s[A-Za-zÁÉÍÓÚáéíóúÑñ]+\s?[A-Za-zÁÉÍÓÚáéíóúÑñ]*$/;

        if (!apellidoV.test(apellido)) {
            alert("El apellido debe tener un formato válido (dos apellidos separados por espacio).");
            apellidoInput.focus();
            return false;
        }

        var genderM = document.getElementById("genre_radiobuttonlist_0").checked;
        var genderF = document.getElementById("genre_radiobuttonlist_1").checked;
        if (genderM && genderF) {
            alert("Debe seleccionar una opción de género.");
            return false;
        }

        document.getElementById("genre_radiobuttonlist_0").checked = false;
        document.getElementById("genre_radiobuttonlist_1").checked = false;

        var email = document.getElementById("email_textbox").value;
        var emailV = /^[A-Za-z0-9._%+-]+@unsa\.edu\.pe$/;

        if (!emailV.test(email)) {
            alert("El correo electrónico debe terminar '@unsa.edu.pe'.");
            emailInput.focus();
            return false;
        }

        var ciudad = document.getElementById("city_dropdownlist").value;
        if (ciudad === "0") {
            alert("Debe seleccionar una ciudad válida.");
            return false;
        }
        var currentDate = new Date().toLocaleString();
        alert("El formulario ha sido enviado exitosamente. Fecha y hora: " + currentDate);

        return true;
    }
</script>
    <title>DBP-LAB</title>
</head>
<body>
    <form id="form1" class="form grid text-center" runat="server">
        <div class="col-8">
            <h1>Registro de Alumno</h1>
        </div>
        <div class="col-md-4">
            <asp:Label ID="name_label" class="form-label" runat="server" Text="Nombre:"></asp:Label>
            <asp:TextBox ID="name_textbox" class="form-control" required="True" runat="server"></asp:TextBox>
            <div class="invalid-feedback">
              Ingresa tu nombre.
            </div>
        </div>
        <div class="col-md-4">
            <asp:Label ID="surnames_label" class="form-label" runat="server" Text="Apellidos:"></asp:Label>
            <asp:TextBox ID="surnames_textbox" class="form-control" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-4">
            <asp:Label ID="genre_label" class="form-label" runat="server" Text="Sexo:"></asp:Label>
            <asp:RadioButtonList ID="genre_radiobuttonlist" runat="server">
                <asp:ListItem ID="genre_radiobuttonlist_0" Value="M">Masculino</asp:ListItem>
                <asp:ListItem ID="genre_radiobuttonlist_1" Value="F">Femenino</asp:ListItem>
            </asp:RadioButtonList>
        </div>
        <div class="col-md-4">
            <asp:Label ID="email_label" class="form-label" runat="server" Text="Correo:"></asp:Label>
            <asp:TextBox ID="email_textbox" class="form-control" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-4">
            <asp:Label ID="address_label" class="form-label" runat="server" Text="Dirección:"></asp:Label>
            <asp:TextBox ID="address_textbox" class="form-control" runat="server"></asp:TextBox>
            <asp:Label ID="city_label" class="form-label" runat="server" Text="Ciudad:"></asp:Label>
            <asp:DropDownList ID="city_dropdownlist" class="form-control" runat="server">
                <asp:ListItem Selected="True" Disabled="True" Value="0" Text="Seleccione"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="col-md-4">
            <asp:Label ID="requirment_label" class="form-label" runat="server" Text="Requerimiento:"></asp:Label>
            <asp:TextBox ID="requirment_textarea" class="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
        </div>
        <div>
            <input id="clean_button" class="btn btn-secondary" type="reset" value="Limpiar" />
            <asp:Button ID="button_submit" class="btn btn-primary" runat="server" OnClientClick="return validar();" OnClick="Submit" Text="Enviar" />
        </div>
    </form>
</body>
</html>
