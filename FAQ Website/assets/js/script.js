"use strict";

async function fetchData() {
    const response = fetch('fetch_data.php'); // Fetch data from PHP script
    const data = await response.json();
    const table = document.getElementById('data-table');
    data.forEach(item => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${item.id}</td>
            <td>${item.name}</td>
            <td>${item.email}</td>
        `;
        table.appendChild(row);
    });
}
window.onload = fetchData; // Fetch data when the page loads