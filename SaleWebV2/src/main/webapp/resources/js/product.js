/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function deletePro(endpoint, id, obj) {
    let d = document.getElementById("load" + id)
    d.style.display = "block";
    obj.style.display = "none";
    
    fetch(endpoint, {
        method: "delete"
    }).then(function(res) {
        if (res.status === 204)
        {
            let r = document.getElementById("row" + id);
            r.style.display = "none";
        }
        
    }).catch(function(err) {
        console.error(err);
    })
}

function loadAdminProduct(endpoint) {
    fetch(endpoint).then(function(res) {
        return res.json();
    }).then(function(data) {
        console.info(data);
        let msg = "";
        for (let i = 0; i < data.length; i++)
            msg += `
                <tr id="row${data[i].id}">
                    <td><img src="${data[i].image}" width='120' /></td>
                    <td>${data[i].name}</td>
                    <td>${data[i].price} VND</td>
                    <td>
                        <div class="spinner-border text-success" style="display:none" id="load${data[i].id}"></div>
                        <button class="btn btn-danger" onclick="deletePro('${endpoint+'/'+data[i].id}', ${data[i].id}, this)">Xoa</button>
                    </td>
                </tr>
        `
        
        let d = document.getElementById("mainId");
        d.innerHTML = msg;
        
        let d2 = document.getElementById("myLoading")
        d2.style.display = "none"
    })
}

function loadComments(endpoint) {
    fetch(endpoint).then(function(res) {
        return res.json();
    }).then(function(data) {
        let c = document.getElementById("comments");
        
        let h = ''
        for (let d of data)
           h += `<li>${d.content} - binh luan boi ${d.user.username} - ${moment(d.createdData).locale("vi").fromNow()}</li>`;
       c.innerHTML = h;
    });
}

function addComment(endpoint, productId) {
    fetch(endpoint, {
        method: 'post',
        body: JSON.stringify({
            'content': document.getElementById("content").value,
            'productId': productId
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(function(res) {
        return res.json();
    }).then(function(data) {
        let d = document.querySelector("#comments li:first-child");
        let h = `<li>${data.content} - binh luan boi ${data.user.username} - ${moment(data.createdData).locale("vi").fromNow()}</li>`;
        d.insertAdjacentHTML("beforebegin", h);
    })
}

