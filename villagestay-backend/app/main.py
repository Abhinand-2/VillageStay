from fastapi import FastAPI
from app.db import supabase

app = FastAPI()

@app.get("/")
def read_root():
    # Just test if user table returns
    data = supabase.table("users").select("*").limit(1).execute()
    return {"message": "Backend connected", "users_sample": data.data}
