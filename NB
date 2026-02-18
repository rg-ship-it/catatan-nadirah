<!doctype html>
<html lang="id">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Doc Parfum — Gold + Petals</title>

  <style>
    :root{
      --blue1:#0b4aa2;
      --blue2:#0e63d3;

      /* GOLD METALLIC */
      --gold1:#D4AF37;
      --gold2:#F6E27A;
      --gold3:#B58A00;
      --gold4:#FFF3B0;

      --glass: rgba(255,255,255,.10);
      --line: rgba(255,255,255,.25);

      --ink:#0e0e0e;
      --muted: rgba(255,255,255,.78);

      /* status colors */
      --inA:#0d7a4e;   /* green */
      --inB:#37ffb2;
      --outA:#7a0d0d;  /* red */
      --outB:#ff5a5a;
    }

    /* ===== GLOBAL SUPER BOLD + CLEAR ===== */
    *{box-sizing:border-box; font-weight: 900 !important;}
    body{
      margin:0;
      font-family: ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Arial;
      color:#fff;
      min-height:100vh;
      padding:24px;
      background:
        radial-gradient(1200px 700px at 15% 10%, rgba(255,255,255,.16), transparent 55%),
        radial-gradient(900px 600px at 85% 0%, rgba(0,0,0,.18), transparent 60%),
        linear-gradient(135deg, var(--blue1), var(--blue2));
      overflow-x:hidden;
      -webkit-font-smoothing: antialiased;
      text-rendering: optimizeLegibility;
      text-shadow: 0 1px 1px rgba(0,0,0,0.25);
    }

    /* ===== Falling petals layer ===== */
    .petal-layer{
      position:fixed;
      inset:0;
      pointer-events:none;
      overflow:hidden;
      z-index:0;
    }
    .petal{
      position:absolute;
      top:-10vh;
      width:16px;
      height:16px;
      background: radial-gradient(circle at 30% 30%, #ffb3b3, #ff2d2d 55%, #b30000);
      border-radius: 60% 40% 60% 40%;
      opacity:.75;
      filter: blur(.2px) drop-shadow(0 4px 6px rgba(0,0,0,.25));
      transform: rotate(0deg);
      animation:
        fall var(--dur) linear infinite,
        sway var(--sway) ease-in-out infinite,
        spin var(--spin) linear infinite;
    }
    .petal::after{
      content:"";
      position:absolute;
      inset:-1px;
      border-radius: inherit;
      background: radial-gradient(circle at 70% 30%, rgba(255,255,255,.55), transparent 45%);
      opacity:.5;
      mix-blend-mode: screen;
    }
    @keyframes fall{
      to{ transform: translateY(115vh) rotate(0deg); }
    }
    @keyframes sway{
      0%,100%{ margin-left: 0px; }
      50%{ margin-left: var(--mx); }
    }
    @keyframes spin{
      to{ rotate: 360deg; }
    }

    /* ===== Layout ===== */
    .wrap{max-width:1100px;margin:0 auto;position:relative;z-index:1;display:grid;gap:16px}

    header{
      display:flex;
      align-items:center;
      justify-content:space-between;
      gap:16px;
      padding:16px 18px;
      border-radius:18px;
      border:1px solid var(--line);
      background: linear-gradient(145deg, rgba(212,175,55,.85), rgba(246,226,122,.85), rgba(181,138,0,.85));
      color: var(--ink);
      backdrop-filter: blur(10px);
    }
    .brand{display:flex;align-items:center;gap:12px}
    .brand img{
      width:56px;height:56px;border-radius:14px;object-fit:cover;
      border:2px solid rgba(0,0,0,.15);
      background: linear-gradient(145deg, var(--gold2), var(--gold1));
    }
    .brand h1{
      margin:0;
      font-size:16px;
      letter-spacing:.5px;
      font-weight: 900 !important;
    }
    .brand p{margin:4px 0 0;font-size:12px;color:rgba(0,0,0,.75);font-weight:900 !important}

    .actions{display:flex;gap:10px;flex-wrap:wrap;justify-content:flex-end}
    button{
      border: 1px solid rgba(0,0,0,.2);
      background: linear-gradient(145deg, var(--gold2), var(--gold1));
      color: #000;
      padding: 10px 12px;
      border-radius: 12px;
      cursor:pointer;
      font-weight:900 !important;
      letter-spacing:.2px;
      transition: transform .06s ease, filter .2s ease;
    }
    button:hover{ filter: brightness(1.05); }
    button:active{ transform: translateY(1px); }
    button.danger{
      background: linear-gradient(145deg, #ff6a6a, #b30000);
      color:#fff;
      border-color: rgba(255,255,255,.2);
    }

    .grid{
      display:grid;
      grid-template-columns: 360px 1fr;
      gap:16px;
    }
    @media (max-width: 980px){ .grid{ grid-template-columns: 1fr; } }

    .card{
      border:1px solid var(--line);
      border-radius:18px;
      background: rgba(255,255,255,.10);
      backdrop-filter: blur(10px);
      padding:16px;
    }
    .card h2{margin:0 0 10px;font-size:15px;font-weight:900 !important}
    .small{font-size:12px;color:var(--muted);margin:0 0 14px;font-weight:900 !important}

    label{display:block;font-size:12px;color:rgba(255,255,255,.88);margin:10px 0 6px;font-weight:900 !important}
    input, select, textarea{
      width:100%;
      padding: 11px 12px;
      border-radius: 12px;
      border: 1px solid rgba(255,255,255,.28);
      background: rgba(0,0,0,.22);
      color: #fff;
      outline:none;
      font-weight:900 !important;
    }
    textarea{min-height:72px;resize:vertical}
    input::placeholder, textarea::placeholder{color:rgba(255,255,255,.60); font-weight:900 !important}
    .row{display:grid;grid-template-columns: 1fr 1fr;gap:10px}

    /* ===== Summary ===== */
    .summary{
      display:grid;
      grid-template-columns: 1fr 1fr 1fr;
      gap:10px;
      margin-top:12px;
    }
    @media (max-width: 620px){ .summary{ grid-template-columns: 1fr; } }

    .box{
      border-radius:16px;
      border: 1px solid rgba(255,255,255,.22);
      padding: 12px;
      background: linear-gradient(145deg, rgba(255,243,176,.25), rgba(212,175,55,.15));
    }
    .box .k{ font-size:12px; color: rgba(255,255,255,.86); margin:0; font-weight:900 !important}
    .box .v{ margin:6px 0 0; font-size:18px; font-weight:900 !important; letter-spacing:.2px; }

    .box.in{
      background: linear-gradient(145deg, rgba(55,255,178,.20), rgba(13,122,78,.20));
      border-color: rgba(55,255,178,.35);
    }
    .box.out{
      background: linear-gradient(145deg, rgba(255,90,90,.20), rgba(122,13,13,.20));
      border-color: rgba(255,90,90,.35);
    }
    .box.net{
      background: linear-gradient(145deg, rgba(255,243,176,.25), rgba(212,175,55,.20), rgba(181,138,0,.18));
      border-color: rgba(246,226,122,.40);
    }
    .net.positive{ color: #eafff5; text-shadow: 0 0 10px rgba(55,255,178,.15); }
    .net.negative{ color: #fff0f0; text-shadow: 0 0 10px rgba(255,90,90,.12); }

    /* ===== Table ===== */
    .tableWrap{
      overflow:auto;
      border-radius: 16px;
      border: 1px solid rgba(255,255,255,.22);
      background: rgba(255,255,255,.06);
    }
    table{
      width:100%;
      border-collapse: collapse;
      min-width: 780px;
      background: linear-gradient(145deg, rgba(255,243,176,.95), rgba(246,226,122,.95));
      color: #000;
      font-size: 14px;
    }
    thead th{
      background: linear-gradient(145deg, #000, #222);
      color:#fff;
      text-align:left;
      padding: 12px 10px;
      position: sticky;
      top: 0;
      z-index: 1;
      font-weight: 900 !important;
      letter-spacing: .4px;
    }
    tbody td{
      padding: 11px 10px;
      border-top: 1px solid rgba(0,0,0,.18);
      vertical-align: top;
      font-weight: 900 !important;
    }
    tbody tr:nth-child(even) td{
      background: rgba(255,255,255,.35);
    }
    tr.tint-in td{
      background: linear-gradient(145deg, rgba(55,255,178,.20), rgba(255,255,255,.20));
    }
    tr.tint-out td{
      background: linear-gradient(145deg, rgba(255,90,90,.20), rgba(255,255,255,.20));
    }

    .tag{
      display:inline-block;
      padding: 4px 8px;
      border-radius: 999px;
      font-weight: 900 !important;
      font-size: 12px;
      border: 1px solid #000;
      background: linear-gradient(145deg, var(--gold2), var(--gold1));
      color:#000;
    }
    .tag.in{
      border-color: rgba(13,122,78,.85);
      background: linear-gradient(145deg, rgba(55,255,178,.95), rgba(13,122,78,.75));
      color:#001b10;
    }
    .tag.out{
      border-color: rgba(122,13,13,.85);
      background: linear-gradient(145deg, rgba(255,90,90,.95), rgba(122,13,13,.75));
      color:#210000;
    }

    .money{
      font-variant-numeric: tabular-nums;
      font-weight: 900 !important;
      font-size: 14px;
    }

    .ops{display:flex;gap:6px;flex-wrap:wrap}
    .ops button{
      padding: 7px 9px;
      border-radius: 10px;
      border: 1px solid #000;
      background: linear-gradient(145deg, var(--gold2), var(--gold1));
      color:#000;
      font-weight:900 !important;
    }
    .ops button.danger{
      background: linear-gradient(145deg, #ff6a6a, #b30000);
      color:#fff;
      border-color:#000;
    }

    .searchRow{
      display:flex;gap:10px;flex-wrap:wrap;
      align-items:center;justify-content:space-between;margin-bottom: 10px;
    }
    .searchRow .left{display:flex;gap:10px;flex-wrap:wrap;align-items:center}
    .searchRow input, .searchRow select{
      width: 220px; max-width: 100%;
      background: rgba(0,0,0,.22);
      font-weight:900 !important;
    }
    .countInfo{
      font-weight:900 !important;
      border:1px solid rgba(255,255,255,.25);
      padding: 7px 10px;
      border-radius: 999px;
      background: rgba(0,0,0,.14);
    }
  </style>
</head>

<body>
  <!-- Petals Background -->
  <div class="petal-layer" id="petalLayer" aria-hidden="true"></div>

  <div class="wrap">
    <header>
      <div class="brand">
        <img alt="Doraemon" src="https://upload.wikimedia.org/wikipedia/en/b/bd/Doraemon_character.png" />
        <div>
          <h1>CATATAN PARFUM NADIRA</h1>
          <p>Finance tracker — gold theme</p>
        </div>
      </div>
      <div class="actions">
        <button class="danger" id="btnReset">Reset Semua</button>
      </div>
    </header>

    <div class="grid">
      <!-- Form -->
      <section class="card">
        <h2>Input Transaksi</h2>
        <p class="small">Tambah transaksi → tabel & total langsung update otomatis.</p>

        <div class="row">
          <div>
            <label>Tanggal</label>
            <input id="date" type="date" />
          </div>
          <div>
            <label>Jenis</label>
            <select id="type">
              <option value="in">Pemasukan</option>
              <option value="out">Pengeluaran</option>
            </select>
          </div>
        </div>

        <label>Kategori</label>
        <input id="category" placeholder="Contoh: Parfum, Botol, Ongkir, Promosi" />

        <label>Deskripsi</label>
        <textarea id="desc" placeholder="Contoh: Jual parfum 2 botol / beli bibit parfum"></textarea>

        <label>Nominal (Rp)</label>
        <input id="amount" type="number" inputmode="numeric" min="0" placeholder="Contoh: 150000" />

        <div style="margin-top:12px; display:flex; gap:10px; flex-wrap:wrap;">
          <button id="btnAdd" style="flex:1;">Tambah</button>
          <button id="btnQuickIn" title="Tambah pemasukan cepat">+ Pemasukan</button>
          <button id="btnQuickOut" title="Tambah pengeluaran cepat">+ Pengeluaran</button>
        </div>

        <div class="summary" aria-label="Ringkasan">
          <div class="box in">
            <p class="k">Total Pemasukan</p>
            <p class="v" id="sumIn">Rp 0</p>
          </div>
          <div class="box out">
            <p class="k">Total Pengeluaran</p>
            <p class="v" id="sumOut">Rp 0</p>
          </div>
          <div class="box net">
            <p class="k">Total Bersih</p>
            <p class="v net positive" id="sumNet">Rp 0</p>
          </div>
        </div>
      </section>

      <!-- Table -->
      <section class="card">
        <div class="searchRow">
          <div class="left">
            <input id="q" placeholder="Cari kategori / deskripsi..." />
            <select id="filterType">
              <option value="all">Semua</option>
              <option value="in">Pemasukan</option>
              <option value="out">Pengeluaran</option>
            </select>
          </div>
          <div class="countInfo" id="countInfo">0 transaksi</div>
        </div>

        <div class="tableWrap">
          <table>
            <thead>
              <tr>
                <th style="width:120px;">Tanggal</th>
                <th style="width:130px;">Jenis</th>
                <th style="width:160px;">Kategori</th>
                <th>Deskripsi</th>
                <th style="width:140px;">Nominal</th>
                <th style="width:160px;">Aksi</th>
              </tr>
            </thead>
            <tbody id="rows"></tbody>
          </table>
        </div>
      </section>
    </div>
  </div>

  <input id="filePick" type="file" accept="application/json" hidden />

  <script>
    // ========= Petals (bunga merah jatuh) =========
    const layer = document.getElementById("petalLayer");

    function spawnPetal(){
      const p = document.createElement("div");
      p.className = "petal";
      const left = Math.random() * 100;                 // vw
      const size = 10 + Math.random() * 18;             // px
      const dur = 7 + Math.random() * 10;               // s
      const sway = 2.2 + Math.random() * 3.5;           // s
      const spin = 2.8 + Math.random() * 5.0;           // s
      const mx = (-40 + Math.random() * 80) + "px";     // sway distance

      p.style.left = left + "vw";
      p.style.width = size + "px";
      p.style.height = size + "px";
      p.style.setProperty("--dur", dur + "s");
      p.style.setProperty("--sway", sway + "s");
      p.style.setProperty("--spin", spin + "s");
      p.style.setProperty("--mx", mx);

      p.style.opacity = (0.45 + Math.random() * 0.45).toFixed(2);
      layer.appendChild(p);
      setTimeout(() => p.remove(), (dur + 2) * 1000);
    }

    const PETAL_RATE_MS = 260; // makin kecil makin rame
    setInterval(spawnPetal, PETAL_RATE_MS);

    // ========= Finance Doc =========
    const KEY = "doc_parfum_tx_v2_gold_petals";
    let tx = load();

    const elDate = document.getElementById("date");
    const elType = document.getElementById("type");
    const elCat  = document.getElementById("category");
    const elDesc = document.getElementById("desc");
    const elAmt  = document.getElementById("amount");

    const elRows = document.getElementById("rows");
    const elSumIn = document.getElementById("sumIn");
    const elSumOut = document.getElementById("sumOut");
    const elSumNet = document.getElementById("sumNet");
    const elCountInfo = document.getElementById("countInfo");

    const elQ = document.getElementById("q");
    const elFilterType = document.getElementById("filterType");

    const filePick = document.getElementById("filePick");

    initDefaults();
    render();

    document.getElementById("btnAdd").addEventListener("click", addFromForm);
    document.getElementById("btnQuickIn").addEventListener("click", () => quickAdd("in"));
    document.getElementById("btnQuickOut").addEventListener("click", () => quickAdd("out"));

    document.getElementById("btnReset").addEventListener("click", () => {
      if(confirm("Yakin reset semua data? Ini tidak bisa dibatalkan.")){
        tx = [];
        save();
        render();
      }
    });

    elQ.addEventListener("input", render);
    elFilterType.addEventListener("change", render);

    document.addEventListener("keydown", (e) => {
      if (e.ctrlKey && e.key === "Enter") addFromForm();
    });

    function initDefaults(){
      elDate.value = toDateInputValue(new Date());
    }

    function toDateInputValue(date){
      const pad = n => String(n).padStart(2,"0");
      return `${date.getFullYear()}-${pad(date.getMonth()+1)}-${pad(date.getDate())}`;
    }

    function formatRupiah(n){
      const num = Number(n || 0);
      return "Rp " + num.toLocaleString("id-ID");
    }

    function normalize(s){ return (s || "").toString().trim(); }

    function uid(){
      return Math.random().toString(16).slice(2) + Date.now().toString(16);
    }

    function load(){
      try{
        const raw = localStorage.getItem(KEY);
        if(!raw) return [];
        const parsed = JSON.parse(raw);
        return Array.isArray(parsed) ? parsed : [];
      }catch{ return []; }
    }

    function save(){
      localStorage.setItem(KEY, JSON.stringify(tx));
    }

    function addFromForm(){
      const date = elDate.value || toDateInputValue(new Date());
      const type = elType.value;
      const category = normalize(elCat.value);
      const desc = normalize(elDesc.value);
      const amount = Number(elAmt.value);

      if(!category){
        alert("Kategori wajib diisi.");
        elCat.focus(); return;
      }
      if(!amount || amount <= 0){
        alert("Nominal harus lebih dari 0.");
        elAmt.focus(); return;
      }

      tx.unshift({ id: uid(), date, type, category, desc, amount, createdAt: Date.now() });
      save();
      elAmt.value = "";
      elDesc.value = "";
      elCat.focus();
      render();
    }

    function quickAdd(type){
      elType.value = type;
      elAmt.focus();
    }

    function removeTx(id){
      if(!confirm("Hapus transaksi ini?")) return;
      tx = tx.filter(t => t.id !== id);
      save();
      render();
    }

    function editTx(id){
      const t = tx.find(x => x.id === id);
      if(!t) return;

      const newDate = prompt("Tanggal (YYYY-MM-DD):", t.date) ?? t.date;
      const newType = prompt("Jenis (in/out):", t.type) ?? t.type;
      const newCat  = prompt("Kategori:", t.category) ?? t.category;
      const newDesc = prompt("Deskripsi:", t.desc) ?? t.desc;
      const newAmt  = prompt("Nominal (angka):", String(t.amount)) ?? String(t.amount);

      const amtNum = Number(newAmt);
      if(!newCat.trim()){ alert("Kategori tidak boleh kosong."); return; }
      if(!(newType === "in" || newType === "out")){ alert("Jenis harus 'in' atau 'out'."); return; }
      if(!amtNum || amtNum <= 0){ alert("Nominal harus lebih dari 0."); return; }

      t.date = newDate.trim();
      t.type = newType;
      t.category = newCat.trim();
      t.desc = newDesc.trim();
      t.amount = amtNum;

      save();
      render();
    }

    function filtered(){
      const q = normalize(elQ.value).toLowerCase();
      const ft = elFilterType.value;

      return tx.filter(t => {
        if(ft !== "all" && t.type !== ft) return false;
        if(!q) return true;
        const hay = `${t.category} ${t.desc} ${t.date}`.toLowerCase();
        return hay.includes(q);
      });
    }

    function compute(list){
      let sumIn = 0, sumOut = 0;
      for(const t of list){
        if(t.type === "in") sumIn += Number(t.amount || 0);
        else sumOut += Number(t.amount || 0);
      }
      return { sumIn, sumOut, net: sumIn - sumOut };
    }

    function render(){
      const list = filtered();
      const { sumIn, sumOut, net } = compute(list);

      elSumIn.textContent = formatRupiah(sumIn);
      elSumOut.textContent = formatRupiah(sumOut);
      elSumNet.textContent = formatRupiah(net);

      elSumNet.classList.toggle("positive", net >= 0);
      elSumNet.classList.toggle("negative", net < 0);

      elCountInfo.textContent = `${list.length} transaksi`;
      elRows.innerHTML = "";

      if(list.length === 0){
        const tr = document.createElement("tr");
        tr.innerHTML = `<td colspan="6" style="padding:16px 10px; color:#111;">
          Belum ada data. Tambahkan transaksi di panel kiri.
        </td>`;
        elRows.appendChild(tr);
        return;
      }

      for(const t of list){
        const tr = document.createElement("tr");
        tr.className = t.type === "in" ? "tint-in" : "tint-out";

        tr.innerHTML = `
          <td>${escapeHtml(t.date)}</td>
          <td><span class="tag ${t.type}">${t.type === "in" ? "PEMASUKAN" : "PENGELUARAN"}</span></td>
          <td>${escapeHtml(t.category)}</td>
          <td>${escapeHtml(t.desc || "-")}</td>
          <td class="money">${formatRupiah(t.amount)}</td>
          <td>
            <div class="ops">
              <button onclick="editTx('${t.id}')">Edit</button>
              <button class="danger" onclick="removeTx('${t.id}')">Hapus</button>
            </div>
          </td>
        `;
        elRows.appendChild(tr);
      }
    }

    function escapeHtml(str){
      return String(str ?? "")
        .replaceAll("&","&amp;")
        .replaceAll("<","&lt;")
        .replaceAll(">","&gt;")
        .replaceAll('"',"&quot;")
        .replaceAll("'","&#039;");
    }

    window.removeTx = removeTx;
    window.editTx = editTx;
  </script>
</body>
</html>
