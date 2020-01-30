from django.shortcuts import render

def hello(request):
    return render(request, 'hello_app/hello.html')
