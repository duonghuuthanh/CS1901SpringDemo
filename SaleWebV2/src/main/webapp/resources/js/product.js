/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function loadAdminProduct(endpoint) {
    fetch(endpoint).then(function(res) {
        return res.json();
    }).then(function(data) {
        console.info(data);
        let msg = "";
        for (let i = 0; i < data.length; i++)
            msg += `
                <tr>
                    <td><img src="${data[i].image}" width='120' /></td>
                    <td>${data[i].name}</td>
                    <td>${data[i].price} VND</td>
                    <td><button class="btn btn-danger">Xoa</button></td>
                </tr>
        `
        
        let d = document.getElementById("mainId");
        d.innerHTML = msg;
        
        let d2 = document.getElementById("myLoading")
        d2.style.display = "none"
    })
}

