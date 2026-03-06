# 🌴 HolidayPlanner

![Python](https://img.shields.io/badge/Python-3.10%2B-blue)
![Flask](https://img.shields.io/badge/Flask-3.x-green)
![SQLAlchemy](https://img.shields.io/badge/SQLAlchemy-2.x-orange)
![Platform](https://img.shields.io/badge/Platform-macOS%20%7C%20Windows%20%7C%20Linux-lightgrey)

A **full-stack holiday booking web app** built with **Python**, **Flask**, and **SQLAlchemy**.  
Users can sign up, log in, browse and filter holiday packages, add them to a cart, and complete checkout.  
Admins can create, edit, and delete packages. The app uses **SQLite**, **Jinja2** templates, and **Flask-SocketIO** for real-time support.

---

## ✨ What it does

- **Authentication** — Sign up and log in with username/password; role-based access (user vs admin)
- **Browse & filter** — View holiday packages and filter by category, price range, and duration
- **Booking cart** — Add packages and adjust the number of nights
- **Checkout** — Enter shipping and payment details to complete a booking
- **Admin CRUD** — Create, edit, and delete packages (admin role only)
- **Real-time** — Flask-SocketIO integrated for potential live updates (e.g. cart)
- **Server** — Runs at **http://localhost:1204** (fixed port)

---

## ✅ Requirements

| Component | Version |
|-----------|---------|
| **Python** | **3.10+** (3.13 recommended) |
| **pip** | Any recent (used inside project venv) |

All other dependencies (Flask, Flask-SocketIO, SQLAlchemy) are installed automatically via `requirements.txt` when you run the setup script. The project uses a **virtual environment** (`venv`), so you do not need to install packages globally.

---

## 📁 Project structure

```
Holiday-booking-system/
├── app.py                  # Main Flask app, routes, REST endpoints, server entry
├── db.py                   # Database layer: SQLAlchemy engine, session, CRUD
├── models.py               # SQLAlchemy models: User, Package
├── socket_routes.py        # Flask-SocketIO event handlers
│
├── requirements.txt        # Dependencies (Flask, Flask-SocketIO, SQLAlchemy)
├── setup.sh                # One-time setup (macOS/Linux)
├── setup.bat               # One-time setup (Windows)
├── run.sh                  # Run app (macOS/Linux)
├── run.bat                 # Run app (Windows)
│
├── templates/              # Jinja2 HTML templates
│   ├── login.jinja
│   ├── signup.jinja
│   ├── home.jinja
│   ├── booking_cart.jinja
│   └── checkout.jinja
├── static/                 # Static assets (CSS, JS, images)
├── libs/                   # Third-party JS (e.g. js.cookie)
├── database/               # SQLite DB (created on first run)
│
├── .vscode/
│   ├── settings.json       # Python interpreter → project venv
│   └── launch.json        # "Run HolidayPlanner" (F5)
├── .gitignore
└── README.md
```

> `venv/`, `__pycache__/`, and `database/` are generated or local and are not committed.

---

## 🚀 How to run

All commands below are run from the **project root** (the folder containing `app.py` and `setup.sh`).

### 1. One-time setup

Run **once per machine** (or after cloning) to create the virtual environment and install dependencies.

**Option A — macOS / Linux**

```bash
./setup.sh
```

If you see `Permission denied`:

```bash
chmod +x setup.sh run.sh
./setup.sh
```

**Option B — Windows (Command Prompt)**

```bat
setup.bat
```

**Option C — Manual (any OS)**

```bash
python3 -m venv venv
source venv/bin/activate   # Windows: venv\Scripts\activate
pip install -r requirements.txt
```

### 2. Start the app

**macOS / Linux:**

```bash
./run.sh
```

**Windows:**

```bat
run.bat
```

**Or** with venv already activated: `python app.py`  
**Or** in Cursor/VS Code: press **F5** (Run → Start Debugging) — uses the project venv if selected.

### 3. Open in browser

Go to **http://localhost:1204**. You should see the login page.

- **Sign up** or **log in** as a normal user.
- To try **admin** features (create/edit/delete packages), log in with **Admin** / **password** (seeded on first run).

To stop the server: **Ctrl+C** in the terminal. Stopping also clears the cart for the next session.

---

## 🧪 Tests

No automated test suite is included in this project. Manual testing: sign up, log in, browse, add to cart, checkout, and (as admin) create/edit/delete packages.

---

## 📌 Quick fixes

| Issue | Fix |
|-------|-----|
| **`pip: command not found`** | Use `./setup.sh` or `setup.bat` so the project creates its own `venv`; then use `./run.sh` or `run.bat` (they use the venv’s Python). |
| **`ModuleNotFoundError: sqlalchemy`** (or flask) | Run setup again: `./setup.sh` or `setup.bat`. Or with venv activated: `pip install -r requirements.txt`. |
| **`Permission denied`** on `./setup.sh` | Run `chmod +x setup.sh run.sh` then `./setup.sh`. |
| **Port 1204 already in use** | Stop the other process (Ctrl+C in its terminal), or kill it: `lsof -i :1204` then `kill <PID>` (macOS/Linux); on Windows use `netstat -ano` and `findstr :1204`, then `taskkill /PID <PID> /F`. |
| **No `venv` after clone** | Normal — `venv` is in `.gitignore`. Run `./setup.sh` or `setup.bat` to create it and install deps. |
| **F5 uses wrong Python** | Run setup first. In Cursor/VS Code: Command Palette → "Python: Select Interpreter" → choose `./venv/bin/python` (or `venv\Scripts\python.exe` on Windows). |
| **Database / "no such table"** | Run the app from the **project root**. If needed, delete the `database/` folder and run again; the app recreates the DB and seeds admin + sample packages. |
| **Windows: `setup.bat` fails** | Open Command Prompt, `cd` to the project root, run `setup.bat`. If Python is not on PATH, try `py -m venv venv` then `venv\Scripts\pip install -r requirements.txt` and `venv\Scripts\python app.py`. |

---

## 👩‍💻 Author

**Bhakthi Salimath**  
Graduate application portfolio project.

For questions about this project or the application, please reach out.
