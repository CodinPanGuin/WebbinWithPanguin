---
layout: post
title: "Joke Selector"
title2: "Joke Selector"
loc: blog
latex: false
date: 2025-04-13
---
<style>
input[type="number"] {
    background-color: #233e32;
    color: white;
    border-radius: 5px;
    padding: 10px;
    width: 20%;
    padding-left:20%;
    margin: 10px auto;
    display: block;
    border-radius: 5px;
    border: 1px solid #ccc;
}
button {
    background-color: #233e32;
    border-radius: 5px;
    color: white;
    display: block;
    width: 20%;
    margin:auto 40% auto;
}
</style>
<h1 style="text-align: center;">Jokes Selector 🤡</h1>

<input type="number" id="jokeCount" min="1" max="20" value="3" />

<br>
<button onclick="goToJokes()">Get Jokes</button>

<script>
jokeCount.addEventListener("keydown", function(e) {
    e.preventDefault();
    if (e.key === "Enter") {
        goToJokes();
    }
    else if (e.key === "ArrowUp") {
        this.value = parseInt(this.value) + 1;
        if (this.value >= 10) {
            this.value = 10;
        }
        else if (this.value <= 1) {
            this.value = 1;
        }
    }
    else if (e.key === "ArrowDown") {
        this.value = parseInt(this.value) - 1;
        if (this.value >= 10) {
            this.value = 10;
        }
        else if (this.value <= 1) {
            this.value = 1;
        }
    }
});
function goToJokes() {
    const amount = document.getElementById("jokeCount").value;
    window.location.href = `/blog/JokesPrinter?amount=${amount}`;
}
</script>