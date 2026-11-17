import express from 'express';
import dotenv from 'dotenv';
import db from './db.js';

dotenv.config()

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());

app.get('/api/jatekok', async (req,res) =>{
    try{
        const [rows] = await db.query('SELECT * FROM jatekok WHERE raktaron = TRUE');
        res.status(200).json(rows);
    }
    catch(error){
        console.log(error);
        res.status(500).json({error: "Database Error!"});
    }
});

app.get('/api/jatekok/szures', async (req,res) =>{
    const mufaj = req.query.mufaj;
    if(typeof mufaj !== 'string' || mufaj.trim() === ''){
        res.status(400).json({ error: 'Bad Request' });
    }
    else{
        try{
            const [rows] = await db.query('SELECT * FROM jatekok WHERE mufaj = ?', [mufaj.trim()]);
            res.status(200).json(rows);
        } catch (error) {
            console.error('Error filtering games:', error);
            res.status(500).json({ error: 'Internal Server Error' });
        }
    }
});

app.get('/api/jatekok/kereses', async (req,res) =>{
    const { cim, maxAr } = req.query;
    const conditions = [];
    const values = [];

    if(cim !== undefined){
        if(typeof cim !== 'string' || cim.trim() === ''){
            res.status(400).json({ error: 'Bad Request' });
            return;
        }
        conditions.push('cim LIKE ?');
        values.push(`%${cim.trim()}%`);
    }

    if(maxAr !== undefined){
        const priceLimit = Number(maxAr);
        if(typeof maxAr !== 'string' || maxAr.trim() === '' || !Number.isFinite(priceLimit) || priceLimit < 0){
            res.status(400).json({ error: 'Bad Request' });
            return;
        }
        conditions.push('ar <= ?');
        values.push(priceLimit);
    }

    if(conditions.length === 0){
        res.status(400).json({ error: 'Bad Request' });
        return;
    }

    try{
        const [rows] = await db.query(`SELECT * FROM jatekok WHERE ${conditions.join(' AND ')}`, values);
        res.status(200).json(rows);
    } catch (error) {
        console.error('Error searching games:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

app.get('/api/jatekok/:id', async (req,res) =>{
    try{
        const [rows] = await db.query('SELECT * FROM jatekok WHERE id = ?', [req.params.id]);
        if (rows.length === 0) {
            return res.status(404).json({ error: 'Game not found' });
        }
        res.status(200).json(rows[0]);
    } catch (error) {
        console.error('Error fetching game:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

app.get('/api/statisztika', async (req,res) => {
    try{
        const [rows] = await db.query('SELECT mufaj, COUNT(*) AS "darabszam", ROUND(AVG(ar),0) AS "atlag_ar" FROM jatekok GROUP BY mufaj ORDER BY COUNT(*) DESC');
        res.status(200).json(rows);
    }
    catch(error){
        console.log(error);
        res.status(500).json({error: "Database Error!"});
    }
})

app.listen(PORT, () => {
    console.log(`Server is running on https://localhost:${PORT}`)
})