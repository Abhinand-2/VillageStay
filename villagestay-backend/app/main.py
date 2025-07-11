from fastapi import FastAPI
from app.routes import users
from app.db import supabase

app = FastAPI()

@app.get("/")
def read_root():
    response = supabase.table("users").select("*").limit(1).execute()
    return {
        "message": "Backend connected",
        "users_sample": response.data
    }

app.include_router(users.router)
