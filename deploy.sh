if [ ! -d "venv" ]; then
    python -m venv venv
fi

source venv/bin/activate
pip install -r requirements.txt
mkdocs gh-deploy -d site -b gh-pages
