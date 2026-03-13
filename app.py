import streamlit as st
import pandas as pd
import plotly.express as px
import plotly.graph_objects as go
from utils.database import execute_query, get_connection
import sqlite3

# Configuración de página
st.set_page_config(
    page_title="Dashboard Sector Minero Energético",
    page_icon="⚡",
    layout="wide",
    initial_sidebar_state="expanded"
)

# Estilos CSS personalizados
st.markdown("""
<style>
    .main-header {
        font-size: 3rem;
        font-weight: bold;
        color: #1f77b4;
        text-align: center;
        padding: 2rem 0;
    }
    .kpi-card {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        padding: 2rem;
        border-radius: 15px;
        color: white;
        text-align: center;
    }
    .metric-value {
        font-size: 2.5rem;
        font-weight: bold;
    }
    .metric-label {
        font-size: 1rem;
        opacity: 0.9;
    }
    div.stButton > button:first-child {
        background-color: #1f77b4;
        color: white;
        border-radius: 10px;
        padding: 0.5rem 2rem;
    }
    .sidebar-section {
        background-color: #f0f2f6;
        padding: 1rem;
        border-radius: 10px;
        margin-bottom: 1rem;
    }
</style>
""", unsafe_allow_html=True)

# Header principal
st.markdown('<h1 class="main-header">⚡ Dashboard Sector Minero Energético Colombia</h1>', 
            unsafe_allow_html=True)

st.markdown("---")

# Conexión a base de datos
@st.cache_data
def load_data():
    conn = sqlite3.connect('data/SectorMineroEnergeticoColombia.db')
    
    datos = {}
    datos['eficiencia'] = pd.read_sql_query("SELECT * FROM eficiencia_energetica", conn)
    datos['proyectos'] = pd.read_sql_query("SELECT * FROM proyectos", conn)
    datos['inversiones'] = pd.read_sql_query("SELECT * FROM inversiones", conn)
    datos['investigadores'] = pd.read_sql_query("SELECT * FROM investigadores", conn)
    datos['minerales'] = pd.read_sql_query("SELECT * FROM minerales", conn)
    datos['empresas'] = pd.read_sql_query("SELECT * FROM empresas", conn)
    datos['comunidades'] = pd.read_sql_query("SELECT * FROM comunidades_energeticas", conn)
    datos['tipos_energia'] = pd.read_sql_query("SELECT * FROM tipos_energia", conn)
    
    conn.close()
    return datos

datos = load_data()

# Sidebar
with st.sidebar:
    st.image("https://img.icons8.com/color/96/colombia.png", width=80)
    st.markdown("### 🇨🇴 Sector Minero Energético")
    st.markdown("---")
    
    st.markdown("#### 📊 Navegación")
    st.page_link("app.py", label="🏠 Inicio", icon="🏠")
    st.page_link("pages/1_📊_Eficiencia_Energética.py", label="📊 Eficiencia Energética", icon="📊")
    st.page_link("pages/2_🏭_Proyectos.py", label="🏭 Proyectos", icon="🏭")
    st.page_link("pages/3_💰_Inversiones.py", label="💰 Inversiones", icon="💰")
    st.page_link("pages/4_👥_Equipos.py", label="👥 Equipos", icon="👥")
    st.page_link("pages/5_⛏️_Minerales.py", label="⛏️ Minerales", icon="⛏️")
    
    st.markdown("---")
    st.markdown("#### ℹ️ Información")
    st.info("Dashboard desarrollado con Streamlit para análisis del sector minero-energético colombiano")

# KPIs Principales
st.markdown("### 📈 Indicadores Clave de Rendimiento")

col1, col2, col3, col4, col5 = st.columns(5)

with col1:
    total_proyectos = len(datos['proyectos'])
    st.markdown(f"""
    <div class="kpi-card">
        <div class="metric-value">{total_proyectos}</div>
        <div class="metric-label">Proyectos Activos</div>
    </div>
    """, unsafe_allow_html=True)

with col2:
    total_inversion = datos['inversiones']['monto'].sum()
    st.markdown(f"""
    <div class="kpi-card">
        <div class="metric-value">${total_inversion:,.0f}</div>
        <div class="metric-label">Inversión Total (Miles)</div>
    </div>
    """, unsafe_allow_html=True)

with col3:
    total_energia = datos['eficiencia']['kw_h_generado'].sum()
    st.markdown(f"""
    <div class="kpi-card">
        <div class="metric-value">{total_energia:,.0f}</div>
        <div class="metric-label">kWh Generados</div>
    </div>
    """, unsafe_allow_html=True)

with col4:
    total_investigadores = len(datos['investigadores'])
    st.markdown(f"""
    <div class="kpi-card">
        <div class="metric-value">{total_investigadores}</div>
        <div class="metric-label">Investigadores</div>
    </div>
    """, unsafe_allow_html=True)

with col5:
    total_comunidades = len(datos['comunidades'])
    st.markdown(f"""
    <div class="kpi-card">
        <div class="metric-value">{total_comunidades}</div>
        <div class="metric-label">Comunidades</div>
    </div>
    """, unsafe_allow_html=True)

st.markdown("---")

# Gráficos Principales
col1, col2 = st.columns(2)

with col1:
    st.markdown("### 📊 Producción de Energía por Tipo")
    
    # Merge con tipos de energía
    eficiencia_tipos = datos['eficiencia'].merge(
        datos['tipos_energia'], 
        left_on='tipo_energia_id', 
        right_on='id_tipo'
    )
    
    energia_por_tipo = eficiencia_tipos.groupby('tipo')['kw_h_generado'].sum().reset_index()
    
    fig_pie = px.pie(
        energia_por_tipo, 
        values='kw_h_generado', 
        names='tipo',
        title='Distribución de Energía por Tipo',
        color_discrete_sequence=px.colors.qualitative.Set3
    )
    fig_pie.update_traces(textposition='inside', textinfo='percent+label')
    fig_pie.update_layout(height=400)
    st.plotly_chart(fig_pie, use_container_width=True)

with col2:
    st.markdown("### 📈 Producción Energética por Proyecto")
    
    proyectos_energia = datos['eficiencia'].merge(
        datos['proyectos'], 
        left_on='proyecto_id', 
        right_on='id_proyecto'
    )
    
    energia_por_proyecto = proyectos_energia.groupby('nombre_x')['kw_h_generado'].sum().reset_index()
    energia_por_proyecto.columns = ['Proyecto', 'kWh Generados']
    
    fig_bar = px.bar(
        energia_por_proyecto, 
        x='Proyecto', 
        y='kWh Generados',
        title='Producción por Proyecto',
        color='kWh Generados',
        color_continuous_scale='Viridis'
    )
    fig_bar.update_layout(height=400, xaxis_tickangle=-45)
    st.plotly_chart(fig_bar, use_container_width=True)

# Tabla de Datos Recientes
st.markdown("### 📋 Últimos Registros de Eficiencia Energética")

with st.expander("Ver datos completos de eficiencia energética"):
    st.dataframe(
        datos['eficiencia'].head(20),
        use_container_width=True,
        height=400
    )

# Mapa de Ubicaciones
st.markdown("### 🗺️ Ubicaciones de Proyectos")

ubicaciones = datos['proyectos'][['nombre', 'ubicacion', 'tipo_energia']].copy()
ubicaciones_map = ubicaciones.merge(
    datos['tipos_energia'], 
    left_on='tipo_energia', 
    right_on='id_tipo'
)

st.dataframe(
    ubicaciones_map[['nombre', 'ubicacion', 'tipo']],
    use_container_width=True,
    height=300
)

# Footer
st.markdown("---")
st.markdown("""
<div style="text-align: center; padding: 2rem;">
    <p>🇨🇴 <strong>Dashboard Sector Minero Energético Colombia</strong></p>
    <p>Desarrollado con Streamlit | Datos: SQLite</p>
    <p>© 2024 - Todos los derechos reservados</p>
</div>
""", unsafe_allow_html=True)