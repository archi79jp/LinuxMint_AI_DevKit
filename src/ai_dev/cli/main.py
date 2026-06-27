import typer
from ai_dev.commands import install

app = typer.Typer()
app.add_typer(install.app, name="install")

@app.command()
def doctor():
    print("OK")

@app.command()
def version():
    print("v0.1.0")

def main():
    app()