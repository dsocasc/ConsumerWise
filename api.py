from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import csv
from datetime import datetime, date

app = FastAPI()

class ConsumoHora(BaseModel):
    hora: str
    consumo: float

@app.post("/consumo-diario/")
async def obtener_consumo_diario(fecha_consulta: date):
    try:
        with open('electrodatos.csv', newline='') as csvfile:
            reader = csv.DictReader(csvfile)
            consumo_dia = []
            for row in reader:
                fecha_hora = datetime.strptime(row['datetime'], '%Y-%m-%d %H:%M:%S')
                if fecha_hora.date() == fecha_consulta:
                    consumo_hora = ConsumoHora(hora=row['Hora'], consumo=float(row['Consumo']))
                    consumo_dia.append(consumo_hora)
            if not consumo_dia:
                raise HTTPException(status_code=404, detail="No se encontraron datos de consumo para la fecha especificada")
            return consumo_dia
    except FileNotFoundError:
        raise HTTPException(status_code=500, detail="El archivo de datos de consumo no fue encontrado")
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
