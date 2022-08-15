/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

/* global fetch, moment */

function delProduct(endpoint, id) {
    let d = document.getElementById("load" + id);
    d.style.display = "block";
    fetch(endpoint, {
        method: "delete"
    }).then(function(res) {
        if (res.status === 204)
            location.reload();
    }).catch(function(err) {
        console.error(err);
    });
}

function loadAdminProducts(endpoint) {
    fetch(endpoint).then(function(res) {
        return res.json();
    }).then(function(data) {
        let msg = "";
        for (let i = 0; i < data.length; i++) {
            msg += `
            <tr>
                <td><img src="${data[i].image}" width='120' /></td>
                <td>${data[i].name}</td>
                <td>${data[i].price} VND</td>
                <td>
                    <div class="spinner-border text-secondary" style="display:none" id="load${data[i].id}"></div>
                    <button class='btn btn-danger' onclick="delProduct('${endpoint+ "/" + data[i].id}', ${data[i].id})">Xoa</button>
                </td>
            </tr>
            `;
        }
        
        let d = document.getElementById("adminProd");
        d.innerHTML = msg;
        
        let d2 = document.getElementById("myLoading");
        d2.style.display = "none";
    })
}

function loadComments(endpoint) {
    fetch(endpoint).then(function(res) {
        return res.json();
    }).then(function(data) {
        let c = document.getElementById("comments");
        let h = '';
        for (let d of data) 
            h += `
                <li class="list-group-item"><em>${d.content}</em> duoc binh luan boi <strong>${d.user.username}</strong> vao luc <strong>${moment(d.createdDate).locale("vi").fromNow()}</strong></li>
            `;
        c.innerHTML = h;
    });
} 

function addComment(endpoint, proId) {
    fetch(endpoint, {
        method: "post",
        body: JSON.stringify({
            "content": document.getElementById("contentId").value,
            "productId": proId
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(function(res) {
        return res.json();
    }).then(function(data) {
        let d = document.querySelector("#comments li:first-child");
        let h = `
                <li class="list-group-item"><em>${data.content}</em> duoc binh luan boi <strong>${data.user.username}</strong> vao luc <strong>${moment(data.createdDate).locale("vi").fromNow()}</strong></li>
            `;
        d.insertAdjacentHTML("beforebegin", h);
    });
}