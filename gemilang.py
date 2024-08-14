# -*- coding: utf-8 -*-
import google.generativeai as genai
import time
import os
import platform

def clear_screen():
    system = platform.system()

    if system == "Windows":
        os.system('cls')
    else:
        os.system('clear')

API = "YOUR GEMINI API"
genai.configure(api_key=API)

model = genai.GenerativeModel("gemini-pro")

chat = model.start_chat(history=[])

print("press Ctrl+C to stop the program")
fname = input("File > ")
inter = int(input("Is interpreted (1 - interpreted, 0 or other - compiled)? > "))
langname = input("Your lang name > ")
# is in portuguese but the gemini can translate to english if you put english things in your code
if inter == 1:
    chat.send_message("todo conteudo de arquivo que eu mandar você interpreta como de uma linguagem de programação, ela se chama {} e executa mostrando o output desse jeito:\noutput:\n```\n<output>\n```\n\nexit code: <codigo de saida>".format(langname))
else:
    compname = input("Compiles to the language > ")
    chat.send_message("todo conteudo de arquivo que eu mandar você interpreta como de uma linguagem de programação, ela se chama {} e executa mostrando o output desse jeito:\noutput:\n```\n<output>\n```\n\nexit code: <codigo de saida>\na linguagem compila para '{}' e o output mostra o codigo compilado.".format(langname, compname))
while True:
    input("Press any key to execute...")
    with open(fname, "r") as f:
        code = f.read()
    clear_screen()
    response = chat.send_message(code)
    print(response.text, "\n")
