from flask import Flask, render_template
from mirrsearch.internalLogic import InternalLogic


def create_app():
    app = Flask(__name__)
    
    @app.route("/")
    def home():
        return render_template('index.html')

    
    def hello_world():
        return "<p>Hello, World!</p>"
    	
    @app.route("/search")
    def search():
        return ["Test", "Dummy"]


    @app.route("/search")
    def search():
        logic = InternalLogic("sample_database")
        return logic.search("example_query")
    
    return app


if __name__ == '__main__':
    app = create_app()
    app.run(port=8000, debug=True)