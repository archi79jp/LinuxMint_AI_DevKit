import typer
from ai_dev.installers import claude, codex, gemini

app = typer.Typer()

@app.callback()
def install():
    """Install AI tools"""
    pass


@app.command()
def claude_tool():
    claude.install()


@app.command()
def codex_tool():
    codex.install()


@app.command()
def gemini_tool():
    gemini.install()
    