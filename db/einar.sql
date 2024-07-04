--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.9
-- Dumped by pg_dump version 15.1

-- Started on 2024-07-04 05:53:06

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 9 (class 2615 OID 848791)
-- Name: empresa; Type: SCHEMA; Schema: -; Owner: root
--

CREATE SCHEMA empresa;


ALTER SCHEMA empresa OWNER TO root;

--
-- TOC entry 10 (class 2615 OID 848794)
-- Name: files; Type: SCHEMA; Schema: -; Owner: root
--

CREATE SCHEMA files;


ALTER SCHEMA files OWNER TO root;

--
-- TOC entry 11 (class 2615 OID 848796)
-- Name: logic; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA logic;


ALTER SCHEMA logic OWNER TO postgres;

--
-- TOC entry 12 (class 2615 OID 848797)
-- Name: personas; Type: SCHEMA; Schema: -; Owner: root
--

CREATE SCHEMA personas;


ALTER SCHEMA personas OWNER TO root;

--
-- TOC entry 7 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 13 (class 2615 OID 848798)
-- Name: security; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA security;


ALTER SCHEMA security OWNER TO postgres;

--
-- TOC entry 14 (class 2615 OID 848799)
-- Name: transaction; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA transaction;


ALTER SCHEMA transaction OWNER TO postgres;

--
-- TOC entry 2 (class 3079 OID 848800)
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- TOC entry 4721 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET default_tablespace = '';

--
-- TOC entry 207 (class 1259 OID 850323)
-- Name: credencial; Type: TABLE; Schema: empresa; Owner: root
--

CREATE TABLE empresa.credencial (
    credencial_id bigint NOT NULL,
    filedata bigint,
    description character varying(256),
    register timestamp without time zone,
    activo boolean,
    principal bigint
);


ALTER TABLE empresa.credencial OWNER TO root;

--
-- TOC entry 208 (class 1259 OID 850326)
-- Name: moneda; Type: TABLE; Schema: empresa; Owner: root
--

CREATE TABLE empresa.moneda (
    moneda_id bigint NOT NULL,
    descripcion character varying(255),
    abr character varying(128),
    cambio double precision
);


ALTER TABLE empresa.moneda OWNER TO root;

--
-- TOC entry 209 (class 1259 OID 850329)
-- Name: principal; Type: TABLE; Schema: empresa; Owner: root
--

CREATE TABLE empresa.principal (
    principal_id bigint NOT NULL,
    nombre character varying(255),
    apellido character varying(255),
    email character varying(255),
    registro timestamp without time zone,
    razon_social character varying(255),
    nit character varying(128),
    direccion character varying(255),
    telefono character varying(128),
    estado character varying(2),
    celular character varying(128),
    pin character varying(8),
    ciudad character varying(255),
    whatsapp character varying(256),
    facebook character varying(256),
    empresa character varying(512),
    filedata bigint,
    credential bigint,
    idgital character varying(16),
    descripcion character varying(512),
    apiserver character varying(512)
);


ALTER TABLE empresa.principal OWNER TO root;

--
-- TOC entry 210 (class 1259 OID 850335)
-- Name: usuario; Type: TABLE; Schema: empresa; Owner: root
--

CREATE TABLE empresa.usuario (
    usuario_id bigint NOT NULL,
    username character varying(128),
    passkey character varying(128),
    activo boolean,
    register timestamp without time zone,
    fullname character varying(256),
    principal bigint
);


ALTER TABLE empresa.usuario OWNER TO root;

--
-- TOC entry 211 (class 1259 OID 850356)
-- Name: filedata; Type: TABLE; Schema: files; Owner: root
--

CREATE TABLE files.filedata (
    filedata_id bigint NOT NULL,
    contenttype character varying(255),
    originalfilename character varying(255),
    serverfilename character varying(255),
    serverpath character varying(255),
    size bigint,
    registro timestamp without time zone
);


ALTER TABLE files.filedata OWNER TO root;

--
-- TOC entry 212 (class 1259 OID 850374)
-- Name: menu; Type: TABLE; Schema: logic; Owner: root
--

CREATE TABLE logic.menu (
    menu_id character varying(2) NOT NULL,
    descripcion character varying(255),
    url character varying(1000),
    activo boolean
);


ALTER TABLE logic.menu OWNER TO root;

--
-- TOC entry 213 (class 1259 OID 850380)
-- Name: param; Type: TABLE; Schema: logic; Owner: postgres
--

CREATE TABLE logic.param (
    param_id bigint NOT NULL,
    key character varying(256),
    value character varying(1028),
    description text
);


ALTER TABLE logic.param OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 850386)
-- Name: sqlcommand; Type: TABLE; Schema: logic; Owner: root
--

CREATE TABLE logic.sqlcommand (
    id bigint NOT NULL,
    createon timestamp without time zone,
    description character varying(255),
    jsonparams text,
    locked boolean NOT NULL,
    name character varying(255),
    sqlcommand text,
    modifiedon timestamp without time zone
);


ALTER TABLE logic.sqlcommand OWNER TO root;

--
-- TOC entry 215 (class 1259 OID 850392)
-- Name: sqlcommand_id_seq; Type: SEQUENCE; Schema: logic; Owner: root
--

CREATE SEQUENCE logic.sqlcommand_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE logic.sqlcommand_id_seq OWNER TO root;

--
-- TOC entry 4722 (class 0 OID 0)
-- Dependencies: 215
-- Name: sqlcommand_id_seq; Type: SEQUENCE OWNED BY; Schema: logic; Owner: root
--

ALTER SEQUENCE logic.sqlcommand_id_seq OWNED BY logic.sqlcommand.id;


--
-- TOC entry 216 (class 1259 OID 850394)
-- Name: persona; Type: TABLE; Schema: personas; Owner: root
--

CREATE TABLE personas.persona (
    persona_id bigint NOT NULL,
    paterno character varying(256),
    materno character varying(256),
    nombres character varying(256),
    documento character varying(16),
    fecha_nacimiento date,
    email character varying(256),
    celular character varying(16),
    direccion character varying(512),
    razon_social character varying(16),
    nit character varying(16),
    register timestamp without time zone,
    activo boolean,
    filedata bigint,
    genero character varying(1),
    webpage character varying(256),
    facebook character varying(256),
    twitter character varying(256),
    telefono character varying(16),
    nacionalidad character varying(256),
    profesion character varying(256),
    about character varying(512)
);


ALTER TABLE personas.persona OWNER TO root;

--
-- TOC entry 217 (class 1259 OID 850400)
-- Name: acude; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.acude (
    idorganizacionr integer,
    idbeneficiario integer
);


ALTER TABLE public.acude OWNER TO root;

--
-- TOC entry 218 (class 1259 OID 850403)
-- Name: administrador; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.administrador (
    idadministrador integer NOT NULL
);


ALTER TABLE public.administrador OWNER TO root;

--
-- TOC entry 219 (class 1259 OID 850406)
-- Name: beneficiario; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.beneficiario (
    beneficiario_id bigint NOT NULL,
    tipo character varying(10),
    nombre character varying(256),
    apellidos character varying(256),
    email character varying(256),
    direccion character varying(512),
    telefono character varying(20),
    celular character varying(20),
    documento character varying(20),
    registro timestamp without time zone
);


ALTER TABLE public.beneficiario OWNER TO root;

--
-- TOC entry 220 (class 1259 OID 850412)
-- Name: categoria; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.categoria (
    categoria_id bigint NOT NULL,
    descripcion character varying(100)
);


ALTER TABLE public.categoria OWNER TO root;

--
-- TOC entry 221 (class 1259 OID 850415)
-- Name: comentario; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.comentario (
    idcomentario integer NOT NULL,
    fecha date,
    idbeneficiario integer
);


ALTER TABLE public.comentario OWNER TO root;

--
-- TOC entry 222 (class 1259 OID 850418)
-- Name: device; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.device (
    device_id bigint NOT NULL,
    client_address character varying(256),
    client_os character varying(256),
    client_browser character varying(256),
    user_agent character varying(256),
    register timestamp without time zone,
    device character varying(128),
    level integer,
    brand character varying(255),
    last_login timestamp without time zone
);


ALTER TABLE public.device OWNER TO root;

--
-- TOC entry 223 (class 1259 OID 850424)
-- Name: donacion; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.donacion (
    donacion_id bigint NOT NULL,
    fecha date,
    estado character varying(100),
    responsable character varying(100),
    persona bigint,
    ubicacion character varying(512),
    ciudad character varying(255),
    registro timestamp without time zone
);


ALTER TABLE public.donacion OWNER TO root;

--
-- TOC entry 224 (class 1259 OID 850430)
-- Name: donacion_detalle; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.donacion_detalle (
    donacion_detalle_id bigint NOT NULL,
    categoria bigint,
    cantidad double precision,
    detalle character varying(255),
    donacion bigint
);


ALTER TABLE public.donacion_detalle OWNER TO root;

--
-- TOC entry 225 (class 1259 OID 850433)
-- Name: donacion_voluntario; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.donacion_voluntario (
    donacion_voluntario_id bigint NOT NULL,
    donacion bigint,
    voluntario bigint,
    responsable boolean
);


ALTER TABLE public.donacion_voluntario OWNER TO root;

--
-- TOC entry 226 (class 1259 OID 850436)
-- Name: donante; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.donante (
    donante_id bigint NOT NULL,
    tipo character varying(10),
    nombre character varying(256),
    apellidos character varying(256),
    email character varying(256),
    direccion character varying(512),
    telefono character varying(20),
    celular character varying(20),
    documento character varying(20),
    registro timestamp without time zone
);


ALTER TABLE public.donante OWNER TO root;

--
-- TOC entry 227 (class 1259 OID 850442)
-- Name: evento; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.evento (
    evento_id bigint NOT NULL,
    descripcion character varying(150),
    fecha date,
    ubicacion character varying(100),
    ciudad character varying(100),
    registro timestamp without time zone,
    responsable character varying(256),
    observacion character varying(512)
);


ALTER TABLE public.evento OWNER TO root;

--
-- TOC entry 228 (class 1259 OID 850448)
-- Name: item_tarea_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.item_tarea_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.item_tarea_id_seq OWNER TO root;

--
-- TOC entry 229 (class 1259 OID 850450)
-- Name: norma; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.norma (
    norma_id bigint NOT NULL,
    descripcion character varying(100),
    filedata bigint,
    registro timestamp without time zone
);


ALTER TABLE public.norma OWNER TO root;

--
-- TOC entry 230 (class 1259 OID 850453)
-- Name: normaqueaplica; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.normaqueaplica (
    idnorma integer,
    iddonacion integer
);


ALTER TABLE public.normaqueaplica OWNER TO root;

--
-- TOC entry 231 (class 1259 OID 850456)
-- Name: organizacionresponsable; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.organizacionresponsable (
    idorganizacionr integer NOT NULL,
    nombre character varying(50),
    idadministrador integer
);


ALTER TABLE public.organizacionresponsable OWNER TO root;

--
-- TOC entry 232 (class 1259 OID 850459)
-- Name: organizae; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.organizae (
    idadministrador integer,
    idevento integer
);


ALTER TABLE public.organizae OWNER TO root;

--
-- TOC entry 233 (class 1259 OID 850462)
-- Name: perfil; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.perfil (
    idperfil integer NOT NULL,
    idusuario integer
);


ALTER TABLE public.perfil OWNER TO root;

--
-- TOC entry 234 (class 1259 OID 850465)
-- Name: persona; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.persona (
    persona_id bigint NOT NULL,
    nombre character varying(50),
    apellido character varying(50),
    direccion character varying(100),
    celular character varying(10),
    tipo character varying(8),
    email character varying(255),
    fec_nacimiento date,
    sexo character varying(4),
    responsable character varying(255),
    ci character varying(16),
    nit character varying(16),
    usr character varying(8),
    pin character varying(8),
    registro timestamp without time zone
);


ALTER TABLE public.persona OWNER TO root;

--
-- TOC entry 235 (class 1259 OID 850471)
-- Name: producto; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.producto (
    producto_id bigint NOT NULL,
    descripcion character varying(100),
    fechavencimiento date,
    categoria bigint,
    unidad character varying(50),
    codigo character varying(255)
);


ALTER TABLE public.producto OWNER TO root;

--
-- TOC entry 236 (class 1259 OID 850474)
-- Name: recolectadonacion; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.recolectadonacion (
    idevento integer,
    iddonacion integer
);


ALTER TABLE public.recolectadonacion OWNER TO root;

--
-- TOC entry 237 (class 1259 OID 850477)
-- Name: recursoseducativos; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.recursoseducativos (
    recursoseducativos_id bigint NOT NULL,
    tipo character varying(100),
    administrador bigint,
    enlace character varying(512),
    registro timestamp without time zone,
    descripcion character varying(512)
);


ALTER TABLE public.recursoseducativos OWNER TO root;

--
-- TOC entry 238 (class 1259 OID 850483)
-- Name: registra; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.registra (
    idadministrador integer,
    iddonacion integer
);


ALTER TABLE public.registra OWNER TO root;

--
-- TOC entry 239 (class 1259 OID 850486)
-- Name: sesion; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.sesion (
    idsesion integer NOT NULL,
    fecha date,
    hora character varying
);


ALTER TABLE public.sesion OWNER TO root;

--
-- TOC entry 240 (class 1259 OID 850492)
-- Name: solicitud; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.solicitud (
    solicitud_id bigint NOT NULL,
    fecha date,
    estado character varying(100),
    responsable character varying(100),
    persona bigint,
    ubicacion character varying(512),
    ciudad character varying(255),
    registro timestamp without time zone
);


ALTER TABLE public.solicitud OWNER TO root;

--
-- TOC entry 241 (class 1259 OID 850498)
-- Name: solicitud_detalle; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.solicitud_detalle (
    solicitud_detalle_id bigint NOT NULL,
    categoria bigint,
    cantidad double precision,
    detalle character varying(255),
    solicitud bigint
);


ALTER TABLE public.solicitud_detalle OWNER TO root;

--
-- TOC entry 242 (class 1259 OID 850501)
-- Name: solicitud_voluntario; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.solicitud_voluntario (
    solicitud_voluntario_id bigint NOT NULL,
    solicitud bigint,
    voluntario bigint,
    responsable boolean
);


ALTER TABLE public.solicitud_voluntario OWNER TO root;

--
-- TOC entry 243 (class 1259 OID 850504)
-- Name: temp_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.temp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.temp_id_seq OWNER TO root;

--
-- TOC entry 244 (class 1259 OID 850506)
-- Name: usuario; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.usuario (
    idusuario integer NOT NULL,
    rol character varying(50),
    correo character varying(50),
    clave character varying(512),
    idpersona integer
);


ALTER TABLE public.usuario OWNER TO root;

--
-- TOC entry 245 (class 1259 OID 850512)
-- Name: voluntario; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.voluntario (
    voluntario_id bigint NOT NULL,
    nombre character varying(256),
    apellido character varying(256),
    email character varying(256),
    direccion character varying(512),
    celular character varying(20),
    documento character varying(20),
    registro timestamp without time zone
);


ALTER TABLE public.voluntario OWNER TO root;

--
-- TOC entry 246 (class 1259 OID 850518)
-- Name: vrecoge; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.vrecoge (
    iddonacion integer,
    idvoluntario integer
);


ALTER TABLE public.vrecoge OWNER TO root;

--
-- TOC entry 247 (class 1259 OID 850521)
-- Name: vrecoged; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.vrecoged (
    iddonacion integer,
    idvoluntario integer
);


ALTER TABLE public.vrecoged OWNER TO root;

--
-- TOC entry 248 (class 1259 OID 850524)
-- Name: accesslog; Type: TABLE; Schema: security; Owner: root
--

CREATE TABLE security.accesslog (
    accesslog_id bigint NOT NULL,
    referer character varying(256),
    url character varying(256),
    client_address character varying(256),
    client_os character varying(256),
    client_browser character varying(256),
    user_agent character varying(256),
    body text,
    register timestamp without time zone
);


ALTER TABLE security.accesslog OWNER TO root;

--
-- TOC entry 249 (class 1259 OID 850530)
-- Name: usuario; Type: TABLE; Schema: security; Owner: root
--

CREATE TABLE security.usuario (
    usuario_id bigint NOT NULL,
    activo boolean,
    nombre character varying(255),
    apellido character varying(255),
    cargo character varying(255),
    direccion character varying(255),
    email character varying(255),
    rol character varying(255),
    usuario character varying(255),
    clave character varying(255),
    principal bigint
);


ALTER TABLE security.usuario OWNER TO root;

--
-- TOC entry 250 (class 1259 OID 850536)
-- Name: jornal_audit; Type: TABLE; Schema: transaction; Owner: postgres
--

CREATE TABLE transaction.jornal_audit (
    jornal_audit_id bigint NOT NULL,
    usuario character varying(100),
    http character varying(100),
    esquema character varying(50),
    tabla character varying,
    id_row bigint,
    accion character varying(20),
    fecha_accion timestamp without time zone
);


ALTER TABLE transaction.jornal_audit OWNER TO postgres;

--
-- TOC entry 3573 (class 2604 OID 850542)
-- Name: sqlcommand id; Type: DEFAULT; Schema: logic; Owner: root
--

ALTER TABLE ONLY logic.sqlcommand ALTER COLUMN id SET DEFAULT nextval('logic.sqlcommand_id_seq'::regclass);


--
-- TOC entry 3823 (class 2613 OID 107629)
-- Name: 107629; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('107629');


ALTER LARGE OBJECT 107629 OWNER TO root;

--
-- TOC entry 3824 (class 2613 OID 120785)
-- Name: 120785; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('120785');


ALTER LARGE OBJECT 120785 OWNER TO root;

--
-- TOC entry 3825 (class 2613 OID 120786)
-- Name: 120786; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('120786');


ALTER LARGE OBJECT 120786 OWNER TO root;

--
-- TOC entry 3826 (class 2613 OID 123158)
-- Name: 123158; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('123158');


ALTER LARGE OBJECT 123158 OWNER TO root;

--
-- TOC entry 3827 (class 2613 OID 123159)
-- Name: 123159; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('123159');


ALTER LARGE OBJECT 123159 OWNER TO root;

--
-- TOC entry 3828 (class 2613 OID 123160)
-- Name: 123160; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('123160');


ALTER LARGE OBJECT 123160 OWNER TO root;

--
-- TOC entry 3829 (class 2613 OID 123161)
-- Name: 123161; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('123161');


ALTER LARGE OBJECT 123161 OWNER TO root;

--
-- TOC entry 3830 (class 2613 OID 123162)
-- Name: 123162; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('123162');


ALTER LARGE OBJECT 123162 OWNER TO root;

--
-- TOC entry 3831 (class 2613 OID 123163)
-- Name: 123163; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('123163');


ALTER LARGE OBJECT 123163 OWNER TO root;

--
-- TOC entry 3832 (class 2613 OID 131828)
-- Name: 131828; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('131828');


ALTER LARGE OBJECT 131828 OWNER TO root;

--
-- TOC entry 3833 (class 2613 OID 131829)
-- Name: 131829; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('131829');


ALTER LARGE OBJECT 131829 OWNER TO root;

--
-- TOC entry 3834 (class 2613 OID 131830)
-- Name: 131830; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('131830');


ALTER LARGE OBJECT 131830 OWNER TO root;

--
-- TOC entry 3835 (class 2613 OID 134207)
-- Name: 134207; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('134207');


ALTER LARGE OBJECT 134207 OWNER TO root;

--
-- TOC entry 3836 (class 2613 OID 134208)
-- Name: 134208; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('134208');


ALTER LARGE OBJECT 134208 OWNER TO root;

--
-- TOC entry 3837 (class 2613 OID 134209)
-- Name: 134209; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('134209');


ALTER LARGE OBJECT 134209 OWNER TO root;

--
-- TOC entry 3838 (class 2613 OID 134210)
-- Name: 134210; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('134210');


ALTER LARGE OBJECT 134210 OWNER TO root;

--
-- TOC entry 3839 (class 2613 OID 134211)
-- Name: 134211; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('134211');


ALTER LARGE OBJECT 134211 OWNER TO root;

--
-- TOC entry 3840 (class 2613 OID 134212)
-- Name: 134212; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('134212');


ALTER LARGE OBJECT 134212 OWNER TO root;

--
-- TOC entry 3841 (class 2613 OID 134213)
-- Name: 134213; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('134213');


ALTER LARGE OBJECT 134213 OWNER TO root;

--
-- TOC entry 3842 (class 2613 OID 134214)
-- Name: 134214; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('134214');


ALTER LARGE OBJECT 134214 OWNER TO root;

--
-- TOC entry 3843 (class 2613 OID 134215)
-- Name: 134215; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('134215');


ALTER LARGE OBJECT 134215 OWNER TO root;

--
-- TOC entry 3844 (class 2613 OID 134216)
-- Name: 134216; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('134216');


ALTER LARGE OBJECT 134216 OWNER TO root;

--
-- TOC entry 3845 (class 2613 OID 134222)
-- Name: 134222; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('134222');


ALTER LARGE OBJECT 134222 OWNER TO root;

--
-- TOC entry 3846 (class 2613 OID 134223)
-- Name: 134223; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('134223');


ALTER LARGE OBJECT 134223 OWNER TO root;

--
-- TOC entry 3847 (class 2613 OID 134224)
-- Name: 134224; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('134224');


ALTER LARGE OBJECT 134224 OWNER TO root;

--
-- TOC entry 3848 (class 2613 OID 134225)
-- Name: 134225; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('134225');


ALTER LARGE OBJECT 134225 OWNER TO root;

--
-- TOC entry 3849 (class 2613 OID 134226)
-- Name: 134226; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('134226');


ALTER LARGE OBJECT 134226 OWNER TO root;

--
-- TOC entry 3850 (class 2613 OID 134227)
-- Name: 134227; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('134227');


ALTER LARGE OBJECT 134227 OWNER TO root;

--
-- TOC entry 3851 (class 2613 OID 158534)
-- Name: 158534; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('158534');


ALTER LARGE OBJECT 158534 OWNER TO root;

--
-- TOC entry 3852 (class 2613 OID 158535)
-- Name: 158535; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('158535');


ALTER LARGE OBJECT 158535 OWNER TO root;

--
-- TOC entry 3853 (class 2613 OID 158536)
-- Name: 158536; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('158536');


ALTER LARGE OBJECT 158536 OWNER TO root;

--
-- TOC entry 3854 (class 2613 OID 158537)
-- Name: 158537; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('158537');


ALTER LARGE OBJECT 158537 OWNER TO root;

--
-- TOC entry 3855 (class 2613 OID 158538)
-- Name: 158538; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('158538');


ALTER LARGE OBJECT 158538 OWNER TO root;

--
-- TOC entry 3856 (class 2613 OID 158539)
-- Name: 158539; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('158539');


ALTER LARGE OBJECT 158539 OWNER TO root;

--
-- TOC entry 3857 (class 2613 OID 158540)
-- Name: 158540; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('158540');


ALTER LARGE OBJECT 158540 OWNER TO root;

--
-- TOC entry 3858 (class 2613 OID 158541)
-- Name: 158541; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('158541');


ALTER LARGE OBJECT 158541 OWNER TO root;

--
-- TOC entry 3859 (class 2613 OID 158542)
-- Name: 158542; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('158542');


ALTER LARGE OBJECT 158542 OWNER TO root;

--
-- TOC entry 3860 (class 2613 OID 158543)
-- Name: 158543; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('158543');


ALTER LARGE OBJECT 158543 OWNER TO root;

--
-- TOC entry 3861 (class 2613 OID 158759)
-- Name: 158759; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('158759');


ALTER LARGE OBJECT 158759 OWNER TO root;

--
-- TOC entry 3862 (class 2613 OID 158760)
-- Name: 158760; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('158760');


ALTER LARGE OBJECT 158760 OWNER TO root;

--
-- TOC entry 3863 (class 2613 OID 158761)
-- Name: 158761; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('158761');


ALTER LARGE OBJECT 158761 OWNER TO root;

--
-- TOC entry 3864 (class 2613 OID 158762)
-- Name: 158762; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('158762');


ALTER LARGE OBJECT 158762 OWNER TO root;

--
-- TOC entry 3865 (class 2613 OID 20739)
-- Name: 20739; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('20739');


ALTER LARGE OBJECT 20739 OWNER TO root;

--
-- TOC entry 3866 (class 2613 OID 20740)
-- Name: 20740; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('20740');


ALTER LARGE OBJECT 20740 OWNER TO root;

--
-- TOC entry 3867 (class 2613 OID 20741)
-- Name: 20741; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('20741');


ALTER LARGE OBJECT 20741 OWNER TO root;

--
-- TOC entry 3868 (class 2613 OID 217929)
-- Name: 217929; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('217929');


ALTER LARGE OBJECT 217929 OWNER TO root;

--
-- TOC entry 3869 (class 2613 OID 217930)
-- Name: 217930; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('217930');


ALTER LARGE OBJECT 217930 OWNER TO root;

--
-- TOC entry 3870 (class 2613 OID 217931)
-- Name: 217931; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('217931');


ALTER LARGE OBJECT 217931 OWNER TO root;

--
-- TOC entry 3871 (class 2613 OID 229226)
-- Name: 229226; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('229226');


ALTER LARGE OBJECT 229226 OWNER TO root;

--
-- TOC entry 3872 (class 2613 OID 229227)
-- Name: 229227; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('229227');


ALTER LARGE OBJECT 229227 OWNER TO root;

--
-- TOC entry 3873 (class 2613 OID 229228)
-- Name: 229228; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('229228');


ALTER LARGE OBJECT 229228 OWNER TO root;

--
-- TOC entry 3874 (class 2613 OID 229229)
-- Name: 229229; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('229229');


ALTER LARGE OBJECT 229229 OWNER TO root;

--
-- TOC entry 3875 (class 2613 OID 229230)
-- Name: 229230; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('229230');


ALTER LARGE OBJECT 229230 OWNER TO root;

--
-- TOC entry 3876 (class 2613 OID 229231)
-- Name: 229231; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('229231');


ALTER LARGE OBJECT 229231 OWNER TO root;

--
-- TOC entry 3877 (class 2613 OID 229232)
-- Name: 229232; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('229232');


ALTER LARGE OBJECT 229232 OWNER TO root;

--
-- TOC entry 3878 (class 2613 OID 229233)
-- Name: 229233; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('229233');


ALTER LARGE OBJECT 229233 OWNER TO root;

--
-- TOC entry 3879 (class 2613 OID 229234)
-- Name: 229234; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('229234');


ALTER LARGE OBJECT 229234 OWNER TO root;

--
-- TOC entry 3880 (class 2613 OID 229235)
-- Name: 229235; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('229235');


ALTER LARGE OBJECT 229235 OWNER TO root;

--
-- TOC entry 3881 (class 2613 OID 229236)
-- Name: 229236; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('229236');


ALTER LARGE OBJECT 229236 OWNER TO root;

--
-- TOC entry 3882 (class 2613 OID 229237)
-- Name: 229237; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('229237');


ALTER LARGE OBJECT 229237 OWNER TO root;

--
-- TOC entry 3883 (class 2613 OID 229238)
-- Name: 229238; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('229238');


ALTER LARGE OBJECT 229238 OWNER TO root;

--
-- TOC entry 3884 (class 2613 OID 229249)
-- Name: 229249; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('229249');


ALTER LARGE OBJECT 229249 OWNER TO root;

--
-- TOC entry 3885 (class 2613 OID 229250)
-- Name: 229250; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('229250');


ALTER LARGE OBJECT 229250 OWNER TO root;

--
-- TOC entry 3886 (class 2613 OID 229251)
-- Name: 229251; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('229251');


ALTER LARGE OBJECT 229251 OWNER TO root;

--
-- TOC entry 3887 (class 2613 OID 229252)
-- Name: 229252; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('229252');


ALTER LARGE OBJECT 229252 OWNER TO root;

--
-- TOC entry 3888 (class 2613 OID 229253)
-- Name: 229253; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('229253');


ALTER LARGE OBJECT 229253 OWNER TO root;

--
-- TOC entry 3889 (class 2613 OID 229254)
-- Name: 229254; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('229254');


ALTER LARGE OBJECT 229254 OWNER TO root;

--
-- TOC entry 3890 (class 2613 OID 229255)
-- Name: 229255; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('229255');


ALTER LARGE OBJECT 229255 OWNER TO root;

--
-- TOC entry 3891 (class 2613 OID 229256)
-- Name: 229256; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('229256');


ALTER LARGE OBJECT 229256 OWNER TO root;

--
-- TOC entry 3892 (class 2613 OID 229257)
-- Name: 229257; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('229257');


ALTER LARGE OBJECT 229257 OWNER TO root;

--
-- TOC entry 3893 (class 2613 OID 229258)
-- Name: 229258; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('229258');


ALTER LARGE OBJECT 229258 OWNER TO root;

--
-- TOC entry 3894 (class 2613 OID 229259)
-- Name: 229259; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('229259');


ALTER LARGE OBJECT 229259 OWNER TO root;

--
-- TOC entry 3895 (class 2613 OID 237360)
-- Name: 237360; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('237360');


ALTER LARGE OBJECT 237360 OWNER TO root;

--
-- TOC entry 3896 (class 2613 OID 237361)
-- Name: 237361; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('237361');


ALTER LARGE OBJECT 237361 OWNER TO root;

--
-- TOC entry 3897 (class 2613 OID 237362)
-- Name: 237362; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('237362');


ALTER LARGE OBJECT 237362 OWNER TO root;

--
-- TOC entry 3898 (class 2613 OID 237363)
-- Name: 237363; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('237363');


ALTER LARGE OBJECT 237363 OWNER TO root;

--
-- TOC entry 3899 (class 2613 OID 237364)
-- Name: 237364; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('237364');


ALTER LARGE OBJECT 237364 OWNER TO root;

--
-- TOC entry 3900 (class 2613 OID 237365)
-- Name: 237365; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('237365');


ALTER LARGE OBJECT 237365 OWNER TO root;

--
-- TOC entry 3901 (class 2613 OID 237366)
-- Name: 237366; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('237366');


ALTER LARGE OBJECT 237366 OWNER TO root;

--
-- TOC entry 3902 (class 2613 OID 237367)
-- Name: 237367; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('237367');


ALTER LARGE OBJECT 237367 OWNER TO root;

--
-- TOC entry 3903 (class 2613 OID 237368)
-- Name: 237368; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('237368');


ALTER LARGE OBJECT 237368 OWNER TO root;

--
-- TOC entry 3904 (class 2613 OID 237369)
-- Name: 237369; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('237369');


ALTER LARGE OBJECT 237369 OWNER TO root;

--
-- TOC entry 3905 (class 2613 OID 237370)
-- Name: 237370; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('237370');


ALTER LARGE OBJECT 237370 OWNER TO root;

--
-- TOC entry 3906 (class 2613 OID 279974)
-- Name: 279974; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('279974');


ALTER LARGE OBJECT 279974 OWNER TO root;

--
-- TOC entry 3907 (class 2613 OID 279975)
-- Name: 279975; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('279975');


ALTER LARGE OBJECT 279975 OWNER TO root;

--
-- TOC entry 3908 (class 2613 OID 279976)
-- Name: 279976; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('279976');


ALTER LARGE OBJECT 279976 OWNER TO root;

--
-- TOC entry 3909 (class 2613 OID 279977)
-- Name: 279977; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('279977');


ALTER LARGE OBJECT 279977 OWNER TO root;

--
-- TOC entry 3910 (class 2613 OID 279978)
-- Name: 279978; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('279978');


ALTER LARGE OBJECT 279978 OWNER TO root;

--
-- TOC entry 3911 (class 2613 OID 279979)
-- Name: 279979; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('279979');


ALTER LARGE OBJECT 279979 OWNER TO root;

--
-- TOC entry 3912 (class 2613 OID 279980)
-- Name: 279980; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('279980');


ALTER LARGE OBJECT 279980 OWNER TO root;

--
-- TOC entry 3913 (class 2613 OID 279981)
-- Name: 279981; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('279981');


ALTER LARGE OBJECT 279981 OWNER TO root;

--
-- TOC entry 3914 (class 2613 OID 279982)
-- Name: 279982; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('279982');


ALTER LARGE OBJECT 279982 OWNER TO root;

--
-- TOC entry 3915 (class 2613 OID 279983)
-- Name: 279983; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('279983');


ALTER LARGE OBJECT 279983 OWNER TO root;

--
-- TOC entry 3916 (class 2613 OID 279984)
-- Name: 279984; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('279984');


ALTER LARGE OBJECT 279984 OWNER TO root;

--
-- TOC entry 3917 (class 2613 OID 279985)
-- Name: 279985; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('279985');


ALTER LARGE OBJECT 279985 OWNER TO root;

--
-- TOC entry 3918 (class 2613 OID 285607)
-- Name: 285607; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('285607');


ALTER LARGE OBJECT 285607 OWNER TO root;

--
-- TOC entry 3919 (class 2613 OID 285608)
-- Name: 285608; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('285608');


ALTER LARGE OBJECT 285608 OWNER TO root;

--
-- TOC entry 3920 (class 2613 OID 285609)
-- Name: 285609; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('285609');


ALTER LARGE OBJECT 285609 OWNER TO root;

--
-- TOC entry 3921 (class 2613 OID 285610)
-- Name: 285610; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('285610');


ALTER LARGE OBJECT 285610 OWNER TO root;

--
-- TOC entry 3922 (class 2613 OID 285611)
-- Name: 285611; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('285611');


ALTER LARGE OBJECT 285611 OWNER TO root;

--
-- TOC entry 3923 (class 2613 OID 285612)
-- Name: 285612; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('285612');


ALTER LARGE OBJECT 285612 OWNER TO root;

--
-- TOC entry 3924 (class 2613 OID 285613)
-- Name: 285613; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('285613');


ALTER LARGE OBJECT 285613 OWNER TO root;

--
-- TOC entry 3925 (class 2613 OID 285614)
-- Name: 285614; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('285614');


ALTER LARGE OBJECT 285614 OWNER TO root;

--
-- TOC entry 3926 (class 2613 OID 285615)
-- Name: 285615; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('285615');


ALTER LARGE OBJECT 285615 OWNER TO root;

--
-- TOC entry 3927 (class 2613 OID 285616)
-- Name: 285616; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('285616');


ALTER LARGE OBJECT 285616 OWNER TO root;

--
-- TOC entry 3928 (class 2613 OID 285617)
-- Name: 285617; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('285617');


ALTER LARGE OBJECT 285617 OWNER TO root;

--
-- TOC entry 3929 (class 2613 OID 285618)
-- Name: 285618; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('285618');


ALTER LARGE OBJECT 285618 OWNER TO root;

--
-- TOC entry 3930 (class 2613 OID 292842)
-- Name: 292842; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('292842');


ALTER LARGE OBJECT 292842 OWNER TO root;

--
-- TOC entry 3931 (class 2613 OID 292843)
-- Name: 292843; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('292843');


ALTER LARGE OBJECT 292843 OWNER TO root;

--
-- TOC entry 3932 (class 2613 OID 292844)
-- Name: 292844; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('292844');


ALTER LARGE OBJECT 292844 OWNER TO root;

--
-- TOC entry 3933 (class 2613 OID 292845)
-- Name: 292845; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('292845');


ALTER LARGE OBJECT 292845 OWNER TO root;

--
-- TOC entry 3934 (class 2613 OID 292846)
-- Name: 292846; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('292846');


ALTER LARGE OBJECT 292846 OWNER TO root;

--
-- TOC entry 3935 (class 2613 OID 292847)
-- Name: 292847; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('292847');


ALTER LARGE OBJECT 292847 OWNER TO root;

--
-- TOC entry 3936 (class 2613 OID 292848)
-- Name: 292848; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('292848');


ALTER LARGE OBJECT 292848 OWNER TO root;

--
-- TOC entry 3937 (class 2613 OID 292849)
-- Name: 292849; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('292849');


ALTER LARGE OBJECT 292849 OWNER TO root;

--
-- TOC entry 3938 (class 2613 OID 292850)
-- Name: 292850; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('292850');


ALTER LARGE OBJECT 292850 OWNER TO root;

--
-- TOC entry 3939 (class 2613 OID 33964)
-- Name: 33964; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('33964');


ALTER LARGE OBJECT 33964 OWNER TO root;

--
-- TOC entry 3940 (class 2613 OID 33965)
-- Name: 33965; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('33965');


ALTER LARGE OBJECT 33965 OWNER TO root;

--
-- TOC entry 3941 (class 2613 OID 33966)
-- Name: 33966; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('33966');


ALTER LARGE OBJECT 33966 OWNER TO root;

--
-- TOC entry 3942 (class 2613 OID 33967)
-- Name: 33967; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('33967');


ALTER LARGE OBJECT 33967 OWNER TO root;

--
-- TOC entry 3943 (class 2613 OID 33968)
-- Name: 33968; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('33968');


ALTER LARGE OBJECT 33968 OWNER TO root;

--
-- TOC entry 3944 (class 2613 OID 33969)
-- Name: 33969; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('33969');


ALTER LARGE OBJECT 33969 OWNER TO root;

--
-- TOC entry 3945 (class 2613 OID 33970)
-- Name: 33970; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('33970');


ALTER LARGE OBJECT 33970 OWNER TO root;

--
-- TOC entry 3946 (class 2613 OID 33989)
-- Name: 33989; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('33989');


ALTER LARGE OBJECT 33989 OWNER TO root;

--
-- TOC entry 3947 (class 2613 OID 33990)
-- Name: 33990; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('33990');


ALTER LARGE OBJECT 33990 OWNER TO root;

--
-- TOC entry 3948 (class 2613 OID 33991)
-- Name: 33991; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('33991');


ALTER LARGE OBJECT 33991 OWNER TO root;

--
-- TOC entry 3949 (class 2613 OID 33992)
-- Name: 33992; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('33992');


ALTER LARGE OBJECT 33992 OWNER TO root;

--
-- TOC entry 3950 (class 2613 OID 33993)
-- Name: 33993; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('33993');


ALTER LARGE OBJECT 33993 OWNER TO root;

--
-- TOC entry 3951 (class 2613 OID 34007)
-- Name: 34007; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('34007');


ALTER LARGE OBJECT 34007 OWNER TO root;

--
-- TOC entry 3952 (class 2613 OID 34008)
-- Name: 34008; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('34008');


ALTER LARGE OBJECT 34008 OWNER TO root;

--
-- TOC entry 3953 (class 2613 OID 34009)
-- Name: 34009; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('34009');


ALTER LARGE OBJECT 34009 OWNER TO root;

--
-- TOC entry 3954 (class 2613 OID 34227)
-- Name: 34227; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('34227');


ALTER LARGE OBJECT 34227 OWNER TO root;

--
-- TOC entry 3955 (class 2613 OID 34228)
-- Name: 34228; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('34228');


ALTER LARGE OBJECT 34228 OWNER TO root;

--
-- TOC entry 3956 (class 2613 OID 34229)
-- Name: 34229; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('34229');


ALTER LARGE OBJECT 34229 OWNER TO root;

--
-- TOC entry 3957 (class 2613 OID 34230)
-- Name: 34230; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('34230');


ALTER LARGE OBJECT 34230 OWNER TO root;

--
-- TOC entry 3958 (class 2613 OID 34231)
-- Name: 34231; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('34231');


ALTER LARGE OBJECT 34231 OWNER TO root;

--
-- TOC entry 3959 (class 2613 OID 34232)
-- Name: 34232; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('34232');


ALTER LARGE OBJECT 34232 OWNER TO root;

--
-- TOC entry 3960 (class 2613 OID 34237)
-- Name: 34237; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('34237');


ALTER LARGE OBJECT 34237 OWNER TO root;

--
-- TOC entry 3961 (class 2613 OID 34238)
-- Name: 34238; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('34238');


ALTER LARGE OBJECT 34238 OWNER TO root;

--
-- TOC entry 3962 (class 2613 OID 34239)
-- Name: 34239; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('34239');


ALTER LARGE OBJECT 34239 OWNER TO root;

--
-- TOC entry 3963 (class 2613 OID 34240)
-- Name: 34240; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('34240');


ALTER LARGE OBJECT 34240 OWNER TO root;

--
-- TOC entry 3964 (class 2613 OID 34241)
-- Name: 34241; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('34241');


ALTER LARGE OBJECT 34241 OWNER TO root;

--
-- TOC entry 3965 (class 2613 OID 34242)
-- Name: 34242; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('34242');


ALTER LARGE OBJECT 34242 OWNER TO root;

--
-- TOC entry 3966 (class 2613 OID 34243)
-- Name: 34243; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('34243');


ALTER LARGE OBJECT 34243 OWNER TO root;

--
-- TOC entry 3967 (class 2613 OID 34244)
-- Name: 34244; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('34244');


ALTER LARGE OBJECT 34244 OWNER TO root;

--
-- TOC entry 3968 (class 2613 OID 34263)
-- Name: 34263; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('34263');


ALTER LARGE OBJECT 34263 OWNER TO root;

--
-- TOC entry 3969 (class 2613 OID 342782)
-- Name: 342782; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('342782');


ALTER LARGE OBJECT 342782 OWNER TO root;

--
-- TOC entry 3970 (class 2613 OID 342783)
-- Name: 342783; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('342783');


ALTER LARGE OBJECT 342783 OWNER TO root;

--
-- TOC entry 3971 (class 2613 OID 342784)
-- Name: 342784; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('342784');


ALTER LARGE OBJECT 342784 OWNER TO root;

--
-- TOC entry 3972 (class 2613 OID 342785)
-- Name: 342785; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('342785');


ALTER LARGE OBJECT 342785 OWNER TO root;

--
-- TOC entry 3973 (class 2613 OID 342786)
-- Name: 342786; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('342786');


ALTER LARGE OBJECT 342786 OWNER TO root;

--
-- TOC entry 3974 (class 2613 OID 342787)
-- Name: 342787; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('342787');


ALTER LARGE OBJECT 342787 OWNER TO root;

--
-- TOC entry 3975 (class 2613 OID 342788)
-- Name: 342788; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('342788');


ALTER LARGE OBJECT 342788 OWNER TO root;

--
-- TOC entry 3976 (class 2613 OID 342789)
-- Name: 342789; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('342789');


ALTER LARGE OBJECT 342789 OWNER TO root;

--
-- TOC entry 3977 (class 2613 OID 342790)
-- Name: 342790; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('342790');


ALTER LARGE OBJECT 342790 OWNER TO root;

--
-- TOC entry 3978 (class 2613 OID 342791)
-- Name: 342791; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('342791');


ALTER LARGE OBJECT 342791 OWNER TO root;

--
-- TOC entry 3979 (class 2613 OID 342792)
-- Name: 342792; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('342792');


ALTER LARGE OBJECT 342792 OWNER TO root;

--
-- TOC entry 3980 (class 2613 OID 342793)
-- Name: 342793; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('342793');


ALTER LARGE OBJECT 342793 OWNER TO root;

--
-- TOC entry 3981 (class 2613 OID 342794)
-- Name: 342794; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('342794');


ALTER LARGE OBJECT 342794 OWNER TO root;

--
-- TOC entry 3982 (class 2613 OID 342823)
-- Name: 342823; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('342823');


ALTER LARGE OBJECT 342823 OWNER TO root;

--
-- TOC entry 3983 (class 2613 OID 342824)
-- Name: 342824; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('342824');


ALTER LARGE OBJECT 342824 OWNER TO root;

--
-- TOC entry 3984 (class 2613 OID 342825)
-- Name: 342825; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('342825');


ALTER LARGE OBJECT 342825 OWNER TO root;

--
-- TOC entry 3985 (class 2613 OID 342826)
-- Name: 342826; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('342826');


ALTER LARGE OBJECT 342826 OWNER TO root;

--
-- TOC entry 3986 (class 2613 OID 342827)
-- Name: 342827; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('342827');


ALTER LARGE OBJECT 342827 OWNER TO root;

--
-- TOC entry 3987 (class 2613 OID 342841)
-- Name: 342841; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('342841');


ALTER LARGE OBJECT 342841 OWNER TO root;

--
-- TOC entry 3988 (class 2613 OID 342842)
-- Name: 342842; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('342842');


ALTER LARGE OBJECT 342842 OWNER TO root;

--
-- TOC entry 3989 (class 2613 OID 342843)
-- Name: 342843; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('342843');


ALTER LARGE OBJECT 342843 OWNER TO root;

--
-- TOC entry 3990 (class 2613 OID 342844)
-- Name: 342844; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('342844');


ALTER LARGE OBJECT 342844 OWNER TO root;

--
-- TOC entry 3991 (class 2613 OID 342845)
-- Name: 342845; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('342845');


ALTER LARGE OBJECT 342845 OWNER TO root;

--
-- TOC entry 3992 (class 2613 OID 342846)
-- Name: 342846; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('342846');


ALTER LARGE OBJECT 342846 OWNER TO root;

--
-- TOC entry 3993 (class 2613 OID 342847)
-- Name: 342847; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('342847');


ALTER LARGE OBJECT 342847 OWNER TO root;

--
-- TOC entry 3994 (class 2613 OID 342848)
-- Name: 342848; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('342848');


ALTER LARGE OBJECT 342848 OWNER TO root;

--
-- TOC entry 3995 (class 2613 OID 342849)
-- Name: 342849; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('342849');


ALTER LARGE OBJECT 342849 OWNER TO root;

--
-- TOC entry 3996 (class 2613 OID 342850)
-- Name: 342850; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('342850');


ALTER LARGE OBJECT 342850 OWNER TO root;

--
-- TOC entry 3997 (class 2613 OID 342851)
-- Name: 342851; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('342851');


ALTER LARGE OBJECT 342851 OWNER TO root;

--
-- TOC entry 3998 (class 2613 OID 342852)
-- Name: 342852; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('342852');


ALTER LARGE OBJECT 342852 OWNER TO root;

--
-- TOC entry 3999 (class 2613 OID 342853)
-- Name: 342853; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('342853');


ALTER LARGE OBJECT 342853 OWNER TO root;

--
-- TOC entry 4000 (class 2613 OID 342854)
-- Name: 342854; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('342854');


ALTER LARGE OBJECT 342854 OWNER TO root;

--
-- TOC entry 4001 (class 2613 OID 342868)
-- Name: 342868; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('342868');


ALTER LARGE OBJECT 342868 OWNER TO root;

--
-- TOC entry 4002 (class 2613 OID 342869)
-- Name: 342869; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('342869');


ALTER LARGE OBJECT 342869 OWNER TO root;

--
-- TOC entry 4003 (class 2613 OID 342870)
-- Name: 342870; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('342870');


ALTER LARGE OBJECT 342870 OWNER TO root;

--
-- TOC entry 4004 (class 2613 OID 342871)
-- Name: 342871; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('342871');


ALTER LARGE OBJECT 342871 OWNER TO root;

--
-- TOC entry 4005 (class 2613 OID 342872)
-- Name: 342872; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('342872');


ALTER LARGE OBJECT 342872 OWNER TO root;

--
-- TOC entry 4006 (class 2613 OID 350559)
-- Name: 350559; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('350559');


ALTER LARGE OBJECT 350559 OWNER TO root;

--
-- TOC entry 4007 (class 2613 OID 36428)
-- Name: 36428; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('36428');


ALTER LARGE OBJECT 36428 OWNER TO root;

--
-- TOC entry 4008 (class 2613 OID 36429)
-- Name: 36429; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('36429');


ALTER LARGE OBJECT 36429 OWNER TO root;

--
-- TOC entry 4009 (class 2613 OID 36751)
-- Name: 36751; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('36751');


ALTER LARGE OBJECT 36751 OWNER TO root;

--
-- TOC entry 4010 (class 2613 OID 36752)
-- Name: 36752; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('36752');


ALTER LARGE OBJECT 36752 OWNER TO root;

--
-- TOC entry 4011 (class 2613 OID 36753)
-- Name: 36753; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('36753');


ALTER LARGE OBJECT 36753 OWNER TO root;

--
-- TOC entry 4012 (class 2613 OID 36754)
-- Name: 36754; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('36754');


ALTER LARGE OBJECT 36754 OWNER TO root;

--
-- TOC entry 4013 (class 2613 OID 39260)
-- Name: 39260; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('39260');


ALTER LARGE OBJECT 39260 OWNER TO root;

--
-- TOC entry 4014 (class 2613 OID 39261)
-- Name: 39261; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('39261');


ALTER LARGE OBJECT 39261 OWNER TO root;

--
-- TOC entry 4015 (class 2613 OID 39262)
-- Name: 39262; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('39262');


ALTER LARGE OBJECT 39262 OWNER TO root;

--
-- TOC entry 4016 (class 2613 OID 39294)
-- Name: 39294; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('39294');


ALTER LARGE OBJECT 39294 OWNER TO root;

--
-- TOC entry 4017 (class 2613 OID 39295)
-- Name: 39295; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('39295');


ALTER LARGE OBJECT 39295 OWNER TO root;

--
-- TOC entry 4018 (class 2613 OID 39296)
-- Name: 39296; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('39296');


ALTER LARGE OBJECT 39296 OWNER TO root;

--
-- TOC entry 4019 (class 2613 OID 39297)
-- Name: 39297; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('39297');


ALTER LARGE OBJECT 39297 OWNER TO root;

--
-- TOC entry 4020 (class 2613 OID 461647)
-- Name: 461647; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461647');


ALTER LARGE OBJECT 461647 OWNER TO root;

--
-- TOC entry 4021 (class 2613 OID 461648)
-- Name: 461648; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461648');


ALTER LARGE OBJECT 461648 OWNER TO root;

--
-- TOC entry 4022 (class 2613 OID 461649)
-- Name: 461649; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461649');


ALTER LARGE OBJECT 461649 OWNER TO root;

--
-- TOC entry 4023 (class 2613 OID 461650)
-- Name: 461650; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461650');


ALTER LARGE OBJECT 461650 OWNER TO root;

--
-- TOC entry 4024 (class 2613 OID 461651)
-- Name: 461651; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461651');


ALTER LARGE OBJECT 461651 OWNER TO root;

--
-- TOC entry 4025 (class 2613 OID 461652)
-- Name: 461652; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461652');


ALTER LARGE OBJECT 461652 OWNER TO root;

--
-- TOC entry 4026 (class 2613 OID 461653)
-- Name: 461653; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461653');


ALTER LARGE OBJECT 461653 OWNER TO root;

--
-- TOC entry 4027 (class 2613 OID 461654)
-- Name: 461654; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461654');


ALTER LARGE OBJECT 461654 OWNER TO root;

--
-- TOC entry 4028 (class 2613 OID 461655)
-- Name: 461655; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461655');


ALTER LARGE OBJECT 461655 OWNER TO root;

--
-- TOC entry 4029 (class 2613 OID 461656)
-- Name: 461656; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461656');


ALTER LARGE OBJECT 461656 OWNER TO root;

--
-- TOC entry 4030 (class 2613 OID 461657)
-- Name: 461657; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461657');


ALTER LARGE OBJECT 461657 OWNER TO root;

--
-- TOC entry 4031 (class 2613 OID 461658)
-- Name: 461658; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461658');


ALTER LARGE OBJECT 461658 OWNER TO root;

--
-- TOC entry 4032 (class 2613 OID 461659)
-- Name: 461659; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461659');


ALTER LARGE OBJECT 461659 OWNER TO root;

--
-- TOC entry 4033 (class 2613 OID 461660)
-- Name: 461660; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461660');


ALTER LARGE OBJECT 461660 OWNER TO root;

--
-- TOC entry 4034 (class 2613 OID 461661)
-- Name: 461661; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461661');


ALTER LARGE OBJECT 461661 OWNER TO root;

--
-- TOC entry 4035 (class 2613 OID 461662)
-- Name: 461662; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461662');


ALTER LARGE OBJECT 461662 OWNER TO root;

--
-- TOC entry 4036 (class 2613 OID 461663)
-- Name: 461663; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461663');


ALTER LARGE OBJECT 461663 OWNER TO root;

--
-- TOC entry 4037 (class 2613 OID 461664)
-- Name: 461664; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461664');


ALTER LARGE OBJECT 461664 OWNER TO root;

--
-- TOC entry 4038 (class 2613 OID 461665)
-- Name: 461665; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461665');


ALTER LARGE OBJECT 461665 OWNER TO root;

--
-- TOC entry 4039 (class 2613 OID 461666)
-- Name: 461666; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461666');


ALTER LARGE OBJECT 461666 OWNER TO root;

--
-- TOC entry 4040 (class 2613 OID 461667)
-- Name: 461667; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461667');


ALTER LARGE OBJECT 461667 OWNER TO root;

--
-- TOC entry 4041 (class 2613 OID 461668)
-- Name: 461668; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461668');


ALTER LARGE OBJECT 461668 OWNER TO root;

--
-- TOC entry 4042 (class 2613 OID 461669)
-- Name: 461669; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461669');


ALTER LARGE OBJECT 461669 OWNER TO root;

--
-- TOC entry 4043 (class 2613 OID 461670)
-- Name: 461670; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461670');


ALTER LARGE OBJECT 461670 OWNER TO root;

--
-- TOC entry 4044 (class 2613 OID 461671)
-- Name: 461671; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461671');


ALTER LARGE OBJECT 461671 OWNER TO root;

--
-- TOC entry 4045 (class 2613 OID 461672)
-- Name: 461672; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461672');


ALTER LARGE OBJECT 461672 OWNER TO root;

--
-- TOC entry 4046 (class 2613 OID 461673)
-- Name: 461673; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461673');


ALTER LARGE OBJECT 461673 OWNER TO root;

--
-- TOC entry 4047 (class 2613 OID 461674)
-- Name: 461674; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461674');


ALTER LARGE OBJECT 461674 OWNER TO root;

--
-- TOC entry 4048 (class 2613 OID 461675)
-- Name: 461675; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461675');


ALTER LARGE OBJECT 461675 OWNER TO root;

--
-- TOC entry 4049 (class 2613 OID 461676)
-- Name: 461676; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461676');


ALTER LARGE OBJECT 461676 OWNER TO root;

--
-- TOC entry 4050 (class 2613 OID 461677)
-- Name: 461677; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461677');


ALTER LARGE OBJECT 461677 OWNER TO root;

--
-- TOC entry 4051 (class 2613 OID 461718)
-- Name: 461718; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461718');


ALTER LARGE OBJECT 461718 OWNER TO root;

--
-- TOC entry 4052 (class 2613 OID 461719)
-- Name: 461719; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461719');


ALTER LARGE OBJECT 461719 OWNER TO root;

--
-- TOC entry 4053 (class 2613 OID 461720)
-- Name: 461720; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461720');


ALTER LARGE OBJECT 461720 OWNER TO root;

--
-- TOC entry 4054 (class 2613 OID 461721)
-- Name: 461721; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461721');


ALTER LARGE OBJECT 461721 OWNER TO root;

--
-- TOC entry 4055 (class 2613 OID 461722)
-- Name: 461722; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461722');


ALTER LARGE OBJECT 461722 OWNER TO root;

--
-- TOC entry 4056 (class 2613 OID 461723)
-- Name: 461723; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461723');


ALTER LARGE OBJECT 461723 OWNER TO root;

--
-- TOC entry 4057 (class 2613 OID 461724)
-- Name: 461724; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461724');


ALTER LARGE OBJECT 461724 OWNER TO root;

--
-- TOC entry 4058 (class 2613 OID 461725)
-- Name: 461725; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461725');


ALTER LARGE OBJECT 461725 OWNER TO root;

--
-- TOC entry 4059 (class 2613 OID 461726)
-- Name: 461726; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('461726');


ALTER LARGE OBJECT 461726 OWNER TO root;

--
-- TOC entry 4060 (class 2613 OID 518042)
-- Name: 518042; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('518042');


ALTER LARGE OBJECT 518042 OWNER TO root;

--
-- TOC entry 4061 (class 2613 OID 518043)
-- Name: 518043; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('518043');


ALTER LARGE OBJECT 518043 OWNER TO root;

--
-- TOC entry 4062 (class 2613 OID 518046)
-- Name: 518046; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('518046');


ALTER LARGE OBJECT 518046 OWNER TO root;

--
-- TOC entry 4063 (class 2613 OID 518047)
-- Name: 518047; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('518047');


ALTER LARGE OBJECT 518047 OWNER TO root;

--
-- TOC entry 4064 (class 2613 OID 51946)
-- Name: 51946; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('51946');


ALTER LARGE OBJECT 51946 OWNER TO root;

--
-- TOC entry 4065 (class 2613 OID 51947)
-- Name: 51947; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('51947');


ALTER LARGE OBJECT 51947 OWNER TO root;

--
-- TOC entry 4066 (class 2613 OID 51948)
-- Name: 51948; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('51948');


ALTER LARGE OBJECT 51948 OWNER TO root;

--
-- TOC entry 4067 (class 2613 OID 545860)
-- Name: 545860; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('545860');


ALTER LARGE OBJECT 545860 OWNER TO root;

--
-- TOC entry 4068 (class 2613 OID 547932)
-- Name: 547932; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('547932');


ALTER LARGE OBJECT 547932 OWNER TO root;

--
-- TOC entry 4069 (class 2613 OID 547933)
-- Name: 547933; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('547933');


ALTER LARGE OBJECT 547933 OWNER TO root;

--
-- TOC entry 4070 (class 2613 OID 547934)
-- Name: 547934; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('547934');


ALTER LARGE OBJECT 547934 OWNER TO root;

--
-- TOC entry 4071 (class 2613 OID 547935)
-- Name: 547935; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('547935');


ALTER LARGE OBJECT 547935 OWNER TO root;

--
-- TOC entry 4072 (class 2613 OID 554293)
-- Name: 554293; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('554293');


ALTER LARGE OBJECT 554293 OWNER TO root;

--
-- TOC entry 4073 (class 2613 OID 554294)
-- Name: 554294; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('554294');


ALTER LARGE OBJECT 554294 OWNER TO root;

--
-- TOC entry 4074 (class 2613 OID 554295)
-- Name: 554295; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('554295');


ALTER LARGE OBJECT 554295 OWNER TO root;

--
-- TOC entry 4075 (class 2613 OID 554296)
-- Name: 554296; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('554296');


ALTER LARGE OBJECT 554296 OWNER TO root;

--
-- TOC entry 4076 (class 2613 OID 554297)
-- Name: 554297; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('554297');


ALTER LARGE OBJECT 554297 OWNER TO root;

--
-- TOC entry 4077 (class 2613 OID 554298)
-- Name: 554298; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('554298');


ALTER LARGE OBJECT 554298 OWNER TO root;

--
-- TOC entry 4078 (class 2613 OID 554299)
-- Name: 554299; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('554299');


ALTER LARGE OBJECT 554299 OWNER TO root;

--
-- TOC entry 4079 (class 2613 OID 554300)
-- Name: 554300; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('554300');


ALTER LARGE OBJECT 554300 OWNER TO root;

--
-- TOC entry 4080 (class 2613 OID 554301)
-- Name: 554301; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('554301');


ALTER LARGE OBJECT 554301 OWNER TO root;

--
-- TOC entry 4081 (class 2613 OID 554302)
-- Name: 554302; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('554302');


ALTER LARGE OBJECT 554302 OWNER TO root;

--
-- TOC entry 4082 (class 2613 OID 554773)
-- Name: 554773; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('554773');


ALTER LARGE OBJECT 554773 OWNER TO root;

--
-- TOC entry 4083 (class 2613 OID 554774)
-- Name: 554774; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('554774');


ALTER LARGE OBJECT 554774 OWNER TO root;

--
-- TOC entry 4084 (class 2613 OID 554775)
-- Name: 554775; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('554775');


ALTER LARGE OBJECT 554775 OWNER TO root;

--
-- TOC entry 4085 (class 2613 OID 554776)
-- Name: 554776; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('554776');


ALTER LARGE OBJECT 554776 OWNER TO root;

--
-- TOC entry 4086 (class 2613 OID 554777)
-- Name: 554777; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('554777');


ALTER LARGE OBJECT 554777 OWNER TO root;

--
-- TOC entry 4087 (class 2613 OID 554778)
-- Name: 554778; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('554778');


ALTER LARGE OBJECT 554778 OWNER TO root;

--
-- TOC entry 4088 (class 2613 OID 554779)
-- Name: 554779; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('554779');


ALTER LARGE OBJECT 554779 OWNER TO root;

--
-- TOC entry 4089 (class 2613 OID 554780)
-- Name: 554780; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('554780');


ALTER LARGE OBJECT 554780 OWNER TO root;

--
-- TOC entry 4090 (class 2613 OID 554781)
-- Name: 554781; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('554781');


ALTER LARGE OBJECT 554781 OWNER TO root;

--
-- TOC entry 4091 (class 2613 OID 554782)
-- Name: 554782; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('554782');


ALTER LARGE OBJECT 554782 OWNER TO root;

--
-- TOC entry 4092 (class 2613 OID 554792)
-- Name: 554792; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('554792');


ALTER LARGE OBJECT 554792 OWNER TO root;

--
-- TOC entry 4093 (class 2613 OID 554793)
-- Name: 554793; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('554793');


ALTER LARGE OBJECT 554793 OWNER TO root;

--
-- TOC entry 4094 (class 2613 OID 554794)
-- Name: 554794; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('554794');


ALTER LARGE OBJECT 554794 OWNER TO root;

--
-- TOC entry 4095 (class 2613 OID 554795)
-- Name: 554795; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('554795');


ALTER LARGE OBJECT 554795 OWNER TO root;

--
-- TOC entry 4096 (class 2613 OID 554796)
-- Name: 554796; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('554796');


ALTER LARGE OBJECT 554796 OWNER TO root;

--
-- TOC entry 4097 (class 2613 OID 554797)
-- Name: 554797; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('554797');


ALTER LARGE OBJECT 554797 OWNER TO root;

--
-- TOC entry 4098 (class 2613 OID 554849)
-- Name: 554849; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('554849');


ALTER LARGE OBJECT 554849 OWNER TO root;

--
-- TOC entry 4099 (class 2613 OID 554850)
-- Name: 554850; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('554850');


ALTER LARGE OBJECT 554850 OWNER TO root;

--
-- TOC entry 4100 (class 2613 OID 554851)
-- Name: 554851; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('554851');


ALTER LARGE OBJECT 554851 OWNER TO root;

--
-- TOC entry 4101 (class 2613 OID 554852)
-- Name: 554852; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('554852');


ALTER LARGE OBJECT 554852 OWNER TO root;

--
-- TOC entry 4102 (class 2613 OID 554853)
-- Name: 554853; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('554853');


ALTER LARGE OBJECT 554853 OWNER TO root;

--
-- TOC entry 4103 (class 2613 OID 554854)
-- Name: 554854; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('554854');


ALTER LARGE OBJECT 554854 OWNER TO root;

--
-- TOC entry 4104 (class 2613 OID 554855)
-- Name: 554855; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('554855');


ALTER LARGE OBJECT 554855 OWNER TO root;

--
-- TOC entry 4105 (class 2613 OID 554856)
-- Name: 554856; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('554856');


ALTER LARGE OBJECT 554856 OWNER TO root;

--
-- TOC entry 4106 (class 2613 OID 554857)
-- Name: 554857; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('554857');


ALTER LARGE OBJECT 554857 OWNER TO root;

--
-- TOC entry 4107 (class 2613 OID 562322)
-- Name: 562322; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('562322');


ALTER LARGE OBJECT 562322 OWNER TO root;

--
-- TOC entry 4108 (class 2613 OID 562323)
-- Name: 562323; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('562323');


ALTER LARGE OBJECT 562323 OWNER TO root;

--
-- TOC entry 4109 (class 2613 OID 562324)
-- Name: 562324; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('562324');


ALTER LARGE OBJECT 562324 OWNER TO root;

--
-- TOC entry 4110 (class 2613 OID 562325)
-- Name: 562325; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('562325');


ALTER LARGE OBJECT 562325 OWNER TO root;

--
-- TOC entry 4111 (class 2613 OID 562326)
-- Name: 562326; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('562326');


ALTER LARGE OBJECT 562326 OWNER TO root;

--
-- TOC entry 4112 (class 2613 OID 570548)
-- Name: 570548; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('570548');


ALTER LARGE OBJECT 570548 OWNER TO root;

--
-- TOC entry 4113 (class 2613 OID 570549)
-- Name: 570549; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('570549');


ALTER LARGE OBJECT 570549 OWNER TO root;

--
-- TOC entry 4114 (class 2613 OID 570550)
-- Name: 570550; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('570550');


ALTER LARGE OBJECT 570550 OWNER TO root;

--
-- TOC entry 4115 (class 2613 OID 570551)
-- Name: 570551; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('570551');


ALTER LARGE OBJECT 570551 OWNER TO root;

--
-- TOC entry 4116 (class 2613 OID 570552)
-- Name: 570552; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('570552');


ALTER LARGE OBJECT 570552 OWNER TO root;

--
-- TOC entry 4117 (class 2613 OID 570553)
-- Name: 570553; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('570553');


ALTER LARGE OBJECT 570553 OWNER TO root;

--
-- TOC entry 4118 (class 2613 OID 570554)
-- Name: 570554; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('570554');


ALTER LARGE OBJECT 570554 OWNER TO root;

--
-- TOC entry 4119 (class 2613 OID 570555)
-- Name: 570555; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('570555');


ALTER LARGE OBJECT 570555 OWNER TO root;

--
-- TOC entry 4120 (class 2613 OID 570556)
-- Name: 570556; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('570556');


ALTER LARGE OBJECT 570556 OWNER TO root;

--
-- TOC entry 4121 (class 2613 OID 570557)
-- Name: 570557; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('570557');


ALTER LARGE OBJECT 570557 OWNER TO root;

--
-- TOC entry 4122 (class 2613 OID 570558)
-- Name: 570558; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('570558');


ALTER LARGE OBJECT 570558 OWNER TO root;

--
-- TOC entry 4123 (class 2613 OID 570559)
-- Name: 570559; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('570559');


ALTER LARGE OBJECT 570559 OWNER TO root;

--
-- TOC entry 4124 (class 2613 OID 570560)
-- Name: 570560; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('570560');


ALTER LARGE OBJECT 570560 OWNER TO root;

--
-- TOC entry 4125 (class 2613 OID 570561)
-- Name: 570561; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('570561');


ALTER LARGE OBJECT 570561 OWNER TO root;

--
-- TOC entry 4126 (class 2613 OID 570562)
-- Name: 570562; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('570562');


ALTER LARGE OBJECT 570562 OWNER TO root;

--
-- TOC entry 4127 (class 2613 OID 570563)
-- Name: 570563; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('570563');


ALTER LARGE OBJECT 570563 OWNER TO root;

--
-- TOC entry 4128 (class 2613 OID 570564)
-- Name: 570564; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('570564');


ALTER LARGE OBJECT 570564 OWNER TO root;

--
-- TOC entry 4129 (class 2613 OID 570565)
-- Name: 570565; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('570565');


ALTER LARGE OBJECT 570565 OWNER TO root;

--
-- TOC entry 4130 (class 2613 OID 570566)
-- Name: 570566; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('570566');


ALTER LARGE OBJECT 570566 OWNER TO root;

--
-- TOC entry 4131 (class 2613 OID 570567)
-- Name: 570567; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('570567');


ALTER LARGE OBJECT 570567 OWNER TO root;

--
-- TOC entry 4132 (class 2613 OID 570568)
-- Name: 570568; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('570568');


ALTER LARGE OBJECT 570568 OWNER TO root;

--
-- TOC entry 4133 (class 2613 OID 570569)
-- Name: 570569; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('570569');


ALTER LARGE OBJECT 570569 OWNER TO root;

--
-- TOC entry 4134 (class 2613 OID 570570)
-- Name: 570570; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('570570');


ALTER LARGE OBJECT 570570 OWNER TO root;

--
-- TOC entry 4135 (class 2613 OID 570571)
-- Name: 570571; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('570571');


ALTER LARGE OBJECT 570571 OWNER TO root;

--
-- TOC entry 4136 (class 2613 OID 570572)
-- Name: 570572; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('570572');


ALTER LARGE OBJECT 570572 OWNER TO root;

--
-- TOC entry 4137 (class 2613 OID 570573)
-- Name: 570573; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('570573');


ALTER LARGE OBJECT 570573 OWNER TO root;

--
-- TOC entry 4138 (class 2613 OID 570574)
-- Name: 570574; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('570574');


ALTER LARGE OBJECT 570574 OWNER TO root;

--
-- TOC entry 4139 (class 2613 OID 570575)
-- Name: 570575; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('570575');


ALTER LARGE OBJECT 570575 OWNER TO root;

--
-- TOC entry 4140 (class 2613 OID 570576)
-- Name: 570576; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('570576');


ALTER LARGE OBJECT 570576 OWNER TO root;

--
-- TOC entry 4141 (class 2613 OID 570577)
-- Name: 570577; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('570577');


ALTER LARGE OBJECT 570577 OWNER TO root;

--
-- TOC entry 4142 (class 2613 OID 570578)
-- Name: 570578; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('570578');


ALTER LARGE OBJECT 570578 OWNER TO root;

--
-- TOC entry 4143 (class 2613 OID 570579)
-- Name: 570579; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('570579');


ALTER LARGE OBJECT 570579 OWNER TO root;

--
-- TOC entry 4144 (class 2613 OID 570580)
-- Name: 570580; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('570580');


ALTER LARGE OBJECT 570580 OWNER TO root;

--
-- TOC entry 4145 (class 2613 OID 570689)
-- Name: 570689; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('570689');


ALTER LARGE OBJECT 570689 OWNER TO root;

--
-- TOC entry 4146 (class 2613 OID 570690)
-- Name: 570690; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('570690');


ALTER LARGE OBJECT 570690 OWNER TO root;

--
-- TOC entry 4147 (class 2613 OID 570691)
-- Name: 570691; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('570691');


ALTER LARGE OBJECT 570691 OWNER TO root;

--
-- TOC entry 4148 (class 2613 OID 570692)
-- Name: 570692; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('570692');


ALTER LARGE OBJECT 570692 OWNER TO root;

--
-- TOC entry 4149 (class 2613 OID 570693)
-- Name: 570693; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('570693');


ALTER LARGE OBJECT 570693 OWNER TO root;

--
-- TOC entry 4150 (class 2613 OID 571013)
-- Name: 571013; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571013');


ALTER LARGE OBJECT 571013 OWNER TO root;

--
-- TOC entry 4151 (class 2613 OID 571014)
-- Name: 571014; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571014');


ALTER LARGE OBJECT 571014 OWNER TO root;

--
-- TOC entry 4152 (class 2613 OID 571015)
-- Name: 571015; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571015');


ALTER LARGE OBJECT 571015 OWNER TO root;

--
-- TOC entry 4153 (class 2613 OID 571016)
-- Name: 571016; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571016');


ALTER LARGE OBJECT 571016 OWNER TO root;

--
-- TOC entry 4154 (class 2613 OID 571017)
-- Name: 571017; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571017');


ALTER LARGE OBJECT 571017 OWNER TO root;

--
-- TOC entry 4155 (class 2613 OID 571018)
-- Name: 571018; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571018');


ALTER LARGE OBJECT 571018 OWNER TO root;

--
-- TOC entry 4156 (class 2613 OID 571069)
-- Name: 571069; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571069');


ALTER LARGE OBJECT 571069 OWNER TO root;

--
-- TOC entry 4157 (class 2613 OID 571070)
-- Name: 571070; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571070');


ALTER LARGE OBJECT 571070 OWNER TO root;

--
-- TOC entry 4158 (class 2613 OID 571071)
-- Name: 571071; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571071');


ALTER LARGE OBJECT 571071 OWNER TO root;

--
-- TOC entry 4159 (class 2613 OID 571072)
-- Name: 571072; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571072');


ALTER LARGE OBJECT 571072 OWNER TO root;

--
-- TOC entry 4160 (class 2613 OID 571073)
-- Name: 571073; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571073');


ALTER LARGE OBJECT 571073 OWNER TO root;

--
-- TOC entry 4161 (class 2613 OID 571074)
-- Name: 571074; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571074');


ALTER LARGE OBJECT 571074 OWNER TO root;

--
-- TOC entry 4162 (class 2613 OID 571075)
-- Name: 571075; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571075');


ALTER LARGE OBJECT 571075 OWNER TO root;

--
-- TOC entry 4163 (class 2613 OID 571076)
-- Name: 571076; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571076');


ALTER LARGE OBJECT 571076 OWNER TO root;

--
-- TOC entry 4164 (class 2613 OID 571077)
-- Name: 571077; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571077');


ALTER LARGE OBJECT 571077 OWNER TO root;

--
-- TOC entry 4165 (class 2613 OID 571078)
-- Name: 571078; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571078');


ALTER LARGE OBJECT 571078 OWNER TO root;

--
-- TOC entry 4166 (class 2613 OID 571079)
-- Name: 571079; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571079');


ALTER LARGE OBJECT 571079 OWNER TO root;

--
-- TOC entry 4167 (class 2613 OID 571080)
-- Name: 571080; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571080');


ALTER LARGE OBJECT 571080 OWNER TO root;

--
-- TOC entry 4168 (class 2613 OID 571110)
-- Name: 571110; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571110');


ALTER LARGE OBJECT 571110 OWNER TO root;

--
-- TOC entry 4169 (class 2613 OID 571111)
-- Name: 571111; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571111');


ALTER LARGE OBJECT 571111 OWNER TO root;

--
-- TOC entry 4170 (class 2613 OID 571112)
-- Name: 571112; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571112');


ALTER LARGE OBJECT 571112 OWNER TO root;

--
-- TOC entry 4171 (class 2613 OID 571113)
-- Name: 571113; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571113');


ALTER LARGE OBJECT 571113 OWNER TO root;

--
-- TOC entry 4172 (class 2613 OID 571114)
-- Name: 571114; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571114');


ALTER LARGE OBJECT 571114 OWNER TO root;

--
-- TOC entry 4173 (class 2613 OID 571116)
-- Name: 571116; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571116');


ALTER LARGE OBJECT 571116 OWNER TO root;

--
-- TOC entry 4174 (class 2613 OID 571117)
-- Name: 571117; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571117');


ALTER LARGE OBJECT 571117 OWNER TO root;

--
-- TOC entry 4175 (class 2613 OID 571118)
-- Name: 571118; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571118');


ALTER LARGE OBJECT 571118 OWNER TO root;

--
-- TOC entry 4176 (class 2613 OID 571119)
-- Name: 571119; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571119');


ALTER LARGE OBJECT 571119 OWNER TO root;

--
-- TOC entry 4177 (class 2613 OID 571120)
-- Name: 571120; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571120');


ALTER LARGE OBJECT 571120 OWNER TO root;

--
-- TOC entry 4178 (class 2613 OID 571121)
-- Name: 571121; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571121');


ALTER LARGE OBJECT 571121 OWNER TO root;

--
-- TOC entry 4179 (class 2613 OID 571122)
-- Name: 571122; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571122');


ALTER LARGE OBJECT 571122 OWNER TO root;

--
-- TOC entry 4180 (class 2613 OID 571144)
-- Name: 571144; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571144');


ALTER LARGE OBJECT 571144 OWNER TO root;

--
-- TOC entry 4181 (class 2613 OID 571145)
-- Name: 571145; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571145');


ALTER LARGE OBJECT 571145 OWNER TO root;

--
-- TOC entry 4182 (class 2613 OID 571146)
-- Name: 571146; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571146');


ALTER LARGE OBJECT 571146 OWNER TO root;

--
-- TOC entry 4183 (class 2613 OID 571147)
-- Name: 571147; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571147');


ALTER LARGE OBJECT 571147 OWNER TO root;

--
-- TOC entry 4184 (class 2613 OID 571148)
-- Name: 571148; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571148');


ALTER LARGE OBJECT 571148 OWNER TO root;

--
-- TOC entry 4185 (class 2613 OID 571149)
-- Name: 571149; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571149');


ALTER LARGE OBJECT 571149 OWNER TO root;

--
-- TOC entry 4186 (class 2613 OID 571150)
-- Name: 571150; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571150');


ALTER LARGE OBJECT 571150 OWNER TO root;

--
-- TOC entry 4187 (class 2613 OID 571151)
-- Name: 571151; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571151');


ALTER LARGE OBJECT 571151 OWNER TO root;

--
-- TOC entry 4188 (class 2613 OID 571152)
-- Name: 571152; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571152');


ALTER LARGE OBJECT 571152 OWNER TO root;

--
-- TOC entry 4189 (class 2613 OID 571154)
-- Name: 571154; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571154');


ALTER LARGE OBJECT 571154 OWNER TO root;

--
-- TOC entry 4190 (class 2613 OID 571155)
-- Name: 571155; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571155');


ALTER LARGE OBJECT 571155 OWNER TO root;

--
-- TOC entry 4191 (class 2613 OID 571156)
-- Name: 571156; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571156');


ALTER LARGE OBJECT 571156 OWNER TO root;

--
-- TOC entry 4192 (class 2613 OID 571157)
-- Name: 571157; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571157');


ALTER LARGE OBJECT 571157 OWNER TO root;

--
-- TOC entry 4193 (class 2613 OID 571158)
-- Name: 571158; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571158');


ALTER LARGE OBJECT 571158 OWNER TO root;

--
-- TOC entry 4194 (class 2613 OID 571159)
-- Name: 571159; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571159');


ALTER LARGE OBJECT 571159 OWNER TO root;

--
-- TOC entry 4195 (class 2613 OID 571160)
-- Name: 571160; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571160');


ALTER LARGE OBJECT 571160 OWNER TO root;

--
-- TOC entry 4196 (class 2613 OID 571161)
-- Name: 571161; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571161');


ALTER LARGE OBJECT 571161 OWNER TO root;

--
-- TOC entry 4197 (class 2613 OID 571162)
-- Name: 571162; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571162');


ALTER LARGE OBJECT 571162 OWNER TO root;

--
-- TOC entry 4198 (class 2613 OID 571163)
-- Name: 571163; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571163');


ALTER LARGE OBJECT 571163 OWNER TO root;

--
-- TOC entry 4199 (class 2613 OID 571164)
-- Name: 571164; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571164');


ALTER LARGE OBJECT 571164 OWNER TO root;

--
-- TOC entry 4200 (class 2613 OID 571165)
-- Name: 571165; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571165');


ALTER LARGE OBJECT 571165 OWNER TO root;

--
-- TOC entry 4201 (class 2613 OID 571166)
-- Name: 571166; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571166');


ALTER LARGE OBJECT 571166 OWNER TO root;

--
-- TOC entry 4202 (class 2613 OID 571167)
-- Name: 571167; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571167');


ALTER LARGE OBJECT 571167 OWNER TO root;

--
-- TOC entry 4203 (class 2613 OID 571168)
-- Name: 571168; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571168');


ALTER LARGE OBJECT 571168 OWNER TO root;

--
-- TOC entry 4204 (class 2613 OID 571169)
-- Name: 571169; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571169');


ALTER LARGE OBJECT 571169 OWNER TO root;

--
-- TOC entry 4205 (class 2613 OID 571170)
-- Name: 571170; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571170');


ALTER LARGE OBJECT 571170 OWNER TO root;

--
-- TOC entry 4206 (class 2613 OID 571171)
-- Name: 571171; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571171');


ALTER LARGE OBJECT 571171 OWNER TO root;

--
-- TOC entry 4207 (class 2613 OID 571172)
-- Name: 571172; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571172');


ALTER LARGE OBJECT 571172 OWNER TO root;

--
-- TOC entry 4208 (class 2613 OID 571173)
-- Name: 571173; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571173');


ALTER LARGE OBJECT 571173 OWNER TO root;

--
-- TOC entry 4209 (class 2613 OID 571174)
-- Name: 571174; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571174');


ALTER LARGE OBJECT 571174 OWNER TO root;

--
-- TOC entry 4210 (class 2613 OID 571175)
-- Name: 571175; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571175');


ALTER LARGE OBJECT 571175 OWNER TO root;

--
-- TOC entry 4211 (class 2613 OID 571176)
-- Name: 571176; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571176');


ALTER LARGE OBJECT 571176 OWNER TO root;

--
-- TOC entry 4212 (class 2613 OID 571177)
-- Name: 571177; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571177');


ALTER LARGE OBJECT 571177 OWNER TO root;

--
-- TOC entry 4213 (class 2613 OID 571178)
-- Name: 571178; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571178');


ALTER LARGE OBJECT 571178 OWNER TO root;

--
-- TOC entry 4214 (class 2613 OID 571181)
-- Name: 571181; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571181');


ALTER LARGE OBJECT 571181 OWNER TO root;

--
-- TOC entry 4215 (class 2613 OID 571182)
-- Name: 571182; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571182');


ALTER LARGE OBJECT 571182 OWNER TO root;

--
-- TOC entry 4216 (class 2613 OID 571183)
-- Name: 571183; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571183');


ALTER LARGE OBJECT 571183 OWNER TO root;

--
-- TOC entry 4217 (class 2613 OID 571184)
-- Name: 571184; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571184');


ALTER LARGE OBJECT 571184 OWNER TO root;

--
-- TOC entry 4218 (class 2613 OID 571185)
-- Name: 571185; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571185');


ALTER LARGE OBJECT 571185 OWNER TO root;

--
-- TOC entry 4219 (class 2613 OID 571186)
-- Name: 571186; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571186');


ALTER LARGE OBJECT 571186 OWNER TO root;

--
-- TOC entry 4220 (class 2613 OID 571187)
-- Name: 571187; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571187');


ALTER LARGE OBJECT 571187 OWNER TO root;

--
-- TOC entry 4221 (class 2613 OID 571188)
-- Name: 571188; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571188');


ALTER LARGE OBJECT 571188 OWNER TO root;

--
-- TOC entry 4222 (class 2613 OID 571189)
-- Name: 571189; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571189');


ALTER LARGE OBJECT 571189 OWNER TO root;

--
-- TOC entry 4223 (class 2613 OID 571203)
-- Name: 571203; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571203');


ALTER LARGE OBJECT 571203 OWNER TO root;

--
-- TOC entry 4224 (class 2613 OID 571204)
-- Name: 571204; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571204');


ALTER LARGE OBJECT 571204 OWNER TO root;

--
-- TOC entry 4225 (class 2613 OID 571205)
-- Name: 571205; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571205');


ALTER LARGE OBJECT 571205 OWNER TO root;

--
-- TOC entry 4226 (class 2613 OID 571206)
-- Name: 571206; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571206');


ALTER LARGE OBJECT 571206 OWNER TO root;

--
-- TOC entry 4227 (class 2613 OID 571207)
-- Name: 571207; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571207');


ALTER LARGE OBJECT 571207 OWNER TO root;

--
-- TOC entry 4228 (class 2613 OID 571208)
-- Name: 571208; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571208');


ALTER LARGE OBJECT 571208 OWNER TO root;

--
-- TOC entry 4229 (class 2613 OID 571209)
-- Name: 571209; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571209');


ALTER LARGE OBJECT 571209 OWNER TO root;

--
-- TOC entry 4230 (class 2613 OID 571211)
-- Name: 571211; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571211');


ALTER LARGE OBJECT 571211 OWNER TO root;

--
-- TOC entry 4231 (class 2613 OID 571212)
-- Name: 571212; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571212');


ALTER LARGE OBJECT 571212 OWNER TO root;

--
-- TOC entry 4232 (class 2613 OID 571213)
-- Name: 571213; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571213');


ALTER LARGE OBJECT 571213 OWNER TO root;

--
-- TOC entry 4233 (class 2613 OID 571214)
-- Name: 571214; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571214');


ALTER LARGE OBJECT 571214 OWNER TO root;

--
-- TOC entry 4234 (class 2613 OID 571215)
-- Name: 571215; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571215');


ALTER LARGE OBJECT 571215 OWNER TO root;

--
-- TOC entry 4235 (class 2613 OID 571217)
-- Name: 571217; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571217');


ALTER LARGE OBJECT 571217 OWNER TO root;

--
-- TOC entry 4236 (class 2613 OID 571218)
-- Name: 571218; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571218');


ALTER LARGE OBJECT 571218 OWNER TO root;

--
-- TOC entry 4237 (class 2613 OID 571219)
-- Name: 571219; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571219');


ALTER LARGE OBJECT 571219 OWNER TO root;

--
-- TOC entry 4238 (class 2613 OID 571220)
-- Name: 571220; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571220');


ALTER LARGE OBJECT 571220 OWNER TO root;

--
-- TOC entry 4239 (class 2613 OID 571221)
-- Name: 571221; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571221');


ALTER LARGE OBJECT 571221 OWNER TO root;

--
-- TOC entry 4240 (class 2613 OID 571222)
-- Name: 571222; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571222');


ALTER LARGE OBJECT 571222 OWNER TO root;

--
-- TOC entry 4241 (class 2613 OID 571223)
-- Name: 571223; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571223');


ALTER LARGE OBJECT 571223 OWNER TO root;

--
-- TOC entry 4242 (class 2613 OID 571224)
-- Name: 571224; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571224');


ALTER LARGE OBJECT 571224 OWNER TO root;

--
-- TOC entry 4243 (class 2613 OID 571225)
-- Name: 571225; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571225');


ALTER LARGE OBJECT 571225 OWNER TO root;

--
-- TOC entry 4244 (class 2613 OID 571226)
-- Name: 571226; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571226');


ALTER LARGE OBJECT 571226 OWNER TO root;

--
-- TOC entry 4245 (class 2613 OID 571227)
-- Name: 571227; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571227');


ALTER LARGE OBJECT 571227 OWNER TO root;

--
-- TOC entry 4246 (class 2613 OID 571228)
-- Name: 571228; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571228');


ALTER LARGE OBJECT 571228 OWNER TO root;

--
-- TOC entry 4247 (class 2613 OID 571229)
-- Name: 571229; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571229');


ALTER LARGE OBJECT 571229 OWNER TO root;

--
-- TOC entry 4248 (class 2613 OID 571230)
-- Name: 571230; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571230');


ALTER LARGE OBJECT 571230 OWNER TO root;

--
-- TOC entry 4249 (class 2613 OID 571231)
-- Name: 571231; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571231');


ALTER LARGE OBJECT 571231 OWNER TO root;

--
-- TOC entry 4250 (class 2613 OID 571232)
-- Name: 571232; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571232');


ALTER LARGE OBJECT 571232 OWNER TO root;

--
-- TOC entry 4251 (class 2613 OID 571233)
-- Name: 571233; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571233');


ALTER LARGE OBJECT 571233 OWNER TO root;

--
-- TOC entry 4252 (class 2613 OID 571234)
-- Name: 571234; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571234');


ALTER LARGE OBJECT 571234 OWNER TO root;

--
-- TOC entry 4253 (class 2613 OID 571235)
-- Name: 571235; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571235');


ALTER LARGE OBJECT 571235 OWNER TO root;

--
-- TOC entry 4254 (class 2613 OID 571236)
-- Name: 571236; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571236');


ALTER LARGE OBJECT 571236 OWNER TO root;

--
-- TOC entry 4255 (class 2613 OID 571237)
-- Name: 571237; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571237');


ALTER LARGE OBJECT 571237 OWNER TO root;

--
-- TOC entry 4256 (class 2613 OID 571238)
-- Name: 571238; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571238');


ALTER LARGE OBJECT 571238 OWNER TO root;

--
-- TOC entry 4257 (class 2613 OID 571239)
-- Name: 571239; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571239');


ALTER LARGE OBJECT 571239 OWNER TO root;

--
-- TOC entry 4258 (class 2613 OID 571240)
-- Name: 571240; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571240');


ALTER LARGE OBJECT 571240 OWNER TO root;

--
-- TOC entry 4259 (class 2613 OID 571241)
-- Name: 571241; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571241');


ALTER LARGE OBJECT 571241 OWNER TO root;

--
-- TOC entry 4260 (class 2613 OID 571242)
-- Name: 571242; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571242');


ALTER LARGE OBJECT 571242 OWNER TO root;

--
-- TOC entry 4261 (class 2613 OID 571249)
-- Name: 571249; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571249');


ALTER LARGE OBJECT 571249 OWNER TO root;

--
-- TOC entry 4262 (class 2613 OID 571250)
-- Name: 571250; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571250');


ALTER LARGE OBJECT 571250 OWNER TO root;

--
-- TOC entry 4263 (class 2613 OID 571251)
-- Name: 571251; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571251');


ALTER LARGE OBJECT 571251 OWNER TO root;

--
-- TOC entry 4264 (class 2613 OID 571252)
-- Name: 571252; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571252');


ALTER LARGE OBJECT 571252 OWNER TO root;

--
-- TOC entry 4265 (class 2613 OID 571253)
-- Name: 571253; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571253');


ALTER LARGE OBJECT 571253 OWNER TO root;

--
-- TOC entry 4266 (class 2613 OID 571254)
-- Name: 571254; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571254');


ALTER LARGE OBJECT 571254 OWNER TO root;

--
-- TOC entry 4267 (class 2613 OID 571255)
-- Name: 571255; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571255');


ALTER LARGE OBJECT 571255 OWNER TO root;

--
-- TOC entry 4268 (class 2613 OID 571256)
-- Name: 571256; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571256');


ALTER LARGE OBJECT 571256 OWNER TO root;

--
-- TOC entry 4269 (class 2613 OID 571257)
-- Name: 571257; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571257');


ALTER LARGE OBJECT 571257 OWNER TO root;

--
-- TOC entry 4270 (class 2613 OID 571258)
-- Name: 571258; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571258');


ALTER LARGE OBJECT 571258 OWNER TO root;

--
-- TOC entry 4271 (class 2613 OID 571259)
-- Name: 571259; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571259');


ALTER LARGE OBJECT 571259 OWNER TO root;

--
-- TOC entry 4272 (class 2613 OID 571260)
-- Name: 571260; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571260');


ALTER LARGE OBJECT 571260 OWNER TO root;

--
-- TOC entry 4273 (class 2613 OID 571261)
-- Name: 571261; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571261');


ALTER LARGE OBJECT 571261 OWNER TO root;

--
-- TOC entry 4274 (class 2613 OID 571262)
-- Name: 571262; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571262');


ALTER LARGE OBJECT 571262 OWNER TO root;

--
-- TOC entry 4275 (class 2613 OID 571263)
-- Name: 571263; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571263');


ALTER LARGE OBJECT 571263 OWNER TO root;

--
-- TOC entry 4276 (class 2613 OID 571264)
-- Name: 571264; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571264');


ALTER LARGE OBJECT 571264 OWNER TO root;

--
-- TOC entry 4277 (class 2613 OID 571265)
-- Name: 571265; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571265');


ALTER LARGE OBJECT 571265 OWNER TO root;

--
-- TOC entry 4278 (class 2613 OID 571266)
-- Name: 571266; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571266');


ALTER LARGE OBJECT 571266 OWNER TO root;

--
-- TOC entry 4279 (class 2613 OID 571267)
-- Name: 571267; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571267');


ALTER LARGE OBJECT 571267 OWNER TO root;

--
-- TOC entry 4280 (class 2613 OID 571268)
-- Name: 571268; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571268');


ALTER LARGE OBJECT 571268 OWNER TO root;

--
-- TOC entry 4281 (class 2613 OID 571269)
-- Name: 571269; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571269');


ALTER LARGE OBJECT 571269 OWNER TO root;

--
-- TOC entry 4282 (class 2613 OID 571270)
-- Name: 571270; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571270');


ALTER LARGE OBJECT 571270 OWNER TO root;

--
-- TOC entry 4283 (class 2613 OID 571271)
-- Name: 571271; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571271');


ALTER LARGE OBJECT 571271 OWNER TO root;

--
-- TOC entry 4284 (class 2613 OID 571272)
-- Name: 571272; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571272');


ALTER LARGE OBJECT 571272 OWNER TO root;

--
-- TOC entry 4285 (class 2613 OID 571273)
-- Name: 571273; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571273');


ALTER LARGE OBJECT 571273 OWNER TO root;

--
-- TOC entry 4286 (class 2613 OID 571274)
-- Name: 571274; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571274');


ALTER LARGE OBJECT 571274 OWNER TO root;

--
-- TOC entry 4287 (class 2613 OID 571275)
-- Name: 571275; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571275');


ALTER LARGE OBJECT 571275 OWNER TO root;

--
-- TOC entry 4288 (class 2613 OID 571276)
-- Name: 571276; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571276');


ALTER LARGE OBJECT 571276 OWNER TO root;

--
-- TOC entry 4289 (class 2613 OID 571277)
-- Name: 571277; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571277');


ALTER LARGE OBJECT 571277 OWNER TO root;

--
-- TOC entry 4290 (class 2613 OID 571278)
-- Name: 571278; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571278');


ALTER LARGE OBJECT 571278 OWNER TO root;

--
-- TOC entry 4291 (class 2613 OID 571279)
-- Name: 571279; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571279');


ALTER LARGE OBJECT 571279 OWNER TO root;

--
-- TOC entry 4292 (class 2613 OID 571280)
-- Name: 571280; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571280');


ALTER LARGE OBJECT 571280 OWNER TO root;

--
-- TOC entry 4293 (class 2613 OID 571281)
-- Name: 571281; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571281');


ALTER LARGE OBJECT 571281 OWNER TO root;

--
-- TOC entry 4294 (class 2613 OID 571282)
-- Name: 571282; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571282');


ALTER LARGE OBJECT 571282 OWNER TO root;

--
-- TOC entry 4295 (class 2613 OID 571283)
-- Name: 571283; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571283');


ALTER LARGE OBJECT 571283 OWNER TO root;

--
-- TOC entry 4296 (class 2613 OID 571284)
-- Name: 571284; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571284');


ALTER LARGE OBJECT 571284 OWNER TO root;

--
-- TOC entry 4297 (class 2613 OID 571285)
-- Name: 571285; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571285');


ALTER LARGE OBJECT 571285 OWNER TO root;

--
-- TOC entry 4298 (class 2613 OID 571286)
-- Name: 571286; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571286');


ALTER LARGE OBJECT 571286 OWNER TO root;

--
-- TOC entry 4299 (class 2613 OID 571288)
-- Name: 571288; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571288');


ALTER LARGE OBJECT 571288 OWNER TO root;

--
-- TOC entry 4300 (class 2613 OID 571289)
-- Name: 571289; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571289');


ALTER LARGE OBJECT 571289 OWNER TO root;

--
-- TOC entry 4301 (class 2613 OID 571715)
-- Name: 571715; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571715');


ALTER LARGE OBJECT 571715 OWNER TO root;

--
-- TOC entry 4302 (class 2613 OID 571716)
-- Name: 571716; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571716');


ALTER LARGE OBJECT 571716 OWNER TO root;

--
-- TOC entry 4303 (class 2613 OID 571717)
-- Name: 571717; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571717');


ALTER LARGE OBJECT 571717 OWNER TO root;

--
-- TOC entry 4304 (class 2613 OID 571718)
-- Name: 571718; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571718');


ALTER LARGE OBJECT 571718 OWNER TO root;

--
-- TOC entry 4305 (class 2613 OID 571719)
-- Name: 571719; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571719');


ALTER LARGE OBJECT 571719 OWNER TO root;

--
-- TOC entry 4306 (class 2613 OID 571720)
-- Name: 571720; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571720');


ALTER LARGE OBJECT 571720 OWNER TO root;

--
-- TOC entry 4307 (class 2613 OID 571721)
-- Name: 571721; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571721');


ALTER LARGE OBJECT 571721 OWNER TO root;

--
-- TOC entry 4308 (class 2613 OID 571722)
-- Name: 571722; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('571722');


ALTER LARGE OBJECT 571722 OWNER TO root;

--
-- TOC entry 4309 (class 2613 OID 572507)
-- Name: 572507; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572507');


ALTER LARGE OBJECT 572507 OWNER TO root;

--
-- TOC entry 4310 (class 2613 OID 572508)
-- Name: 572508; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572508');


ALTER LARGE OBJECT 572508 OWNER TO root;

--
-- TOC entry 4311 (class 2613 OID 572509)
-- Name: 572509; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572509');


ALTER LARGE OBJECT 572509 OWNER TO root;

--
-- TOC entry 4312 (class 2613 OID 572510)
-- Name: 572510; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572510');


ALTER LARGE OBJECT 572510 OWNER TO root;

--
-- TOC entry 4313 (class 2613 OID 572511)
-- Name: 572511; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572511');


ALTER LARGE OBJECT 572511 OWNER TO root;

--
-- TOC entry 4314 (class 2613 OID 572512)
-- Name: 572512; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572512');


ALTER LARGE OBJECT 572512 OWNER TO root;

--
-- TOC entry 4315 (class 2613 OID 572513)
-- Name: 572513; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572513');


ALTER LARGE OBJECT 572513 OWNER TO root;

--
-- TOC entry 4316 (class 2613 OID 572645)
-- Name: 572645; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572645');


ALTER LARGE OBJECT 572645 OWNER TO root;

--
-- TOC entry 4317 (class 2613 OID 572646)
-- Name: 572646; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572646');


ALTER LARGE OBJECT 572646 OWNER TO root;

--
-- TOC entry 4318 (class 2613 OID 572647)
-- Name: 572647; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572647');


ALTER LARGE OBJECT 572647 OWNER TO root;

--
-- TOC entry 4319 (class 2613 OID 572648)
-- Name: 572648; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572648');


ALTER LARGE OBJECT 572648 OWNER TO root;

--
-- TOC entry 4320 (class 2613 OID 572649)
-- Name: 572649; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572649');


ALTER LARGE OBJECT 572649 OWNER TO root;

--
-- TOC entry 4321 (class 2613 OID 572650)
-- Name: 572650; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572650');


ALTER LARGE OBJECT 572650 OWNER TO root;

--
-- TOC entry 4322 (class 2613 OID 572651)
-- Name: 572651; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572651');


ALTER LARGE OBJECT 572651 OWNER TO root;

--
-- TOC entry 4323 (class 2613 OID 572652)
-- Name: 572652; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572652');


ALTER LARGE OBJECT 572652 OWNER TO root;

--
-- TOC entry 4324 (class 2613 OID 572653)
-- Name: 572653; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572653');


ALTER LARGE OBJECT 572653 OWNER TO root;

--
-- TOC entry 4325 (class 2613 OID 572654)
-- Name: 572654; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572654');


ALTER LARGE OBJECT 572654 OWNER TO root;

--
-- TOC entry 4326 (class 2613 OID 572655)
-- Name: 572655; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572655');


ALTER LARGE OBJECT 572655 OWNER TO root;

--
-- TOC entry 4327 (class 2613 OID 572656)
-- Name: 572656; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572656');


ALTER LARGE OBJECT 572656 OWNER TO root;

--
-- TOC entry 4328 (class 2613 OID 572657)
-- Name: 572657; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572657');


ALTER LARGE OBJECT 572657 OWNER TO root;

--
-- TOC entry 4329 (class 2613 OID 572658)
-- Name: 572658; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572658');


ALTER LARGE OBJECT 572658 OWNER TO root;

--
-- TOC entry 4330 (class 2613 OID 572659)
-- Name: 572659; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572659');


ALTER LARGE OBJECT 572659 OWNER TO root;

--
-- TOC entry 4331 (class 2613 OID 572717)
-- Name: 572717; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572717');


ALTER LARGE OBJECT 572717 OWNER TO root;

--
-- TOC entry 4332 (class 2613 OID 572718)
-- Name: 572718; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572718');


ALTER LARGE OBJECT 572718 OWNER TO root;

--
-- TOC entry 4333 (class 2613 OID 572719)
-- Name: 572719; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572719');


ALTER LARGE OBJECT 572719 OWNER TO root;

--
-- TOC entry 4334 (class 2613 OID 572720)
-- Name: 572720; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572720');


ALTER LARGE OBJECT 572720 OWNER TO root;

--
-- TOC entry 4335 (class 2613 OID 572721)
-- Name: 572721; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572721');


ALTER LARGE OBJECT 572721 OWNER TO root;

--
-- TOC entry 4336 (class 2613 OID 572722)
-- Name: 572722; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572722');


ALTER LARGE OBJECT 572722 OWNER TO root;

--
-- TOC entry 4337 (class 2613 OID 572723)
-- Name: 572723; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572723');


ALTER LARGE OBJECT 572723 OWNER TO root;

--
-- TOC entry 4338 (class 2613 OID 572724)
-- Name: 572724; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572724');


ALTER LARGE OBJECT 572724 OWNER TO root;

--
-- TOC entry 4339 (class 2613 OID 572725)
-- Name: 572725; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572725');


ALTER LARGE OBJECT 572725 OWNER TO root;

--
-- TOC entry 4340 (class 2613 OID 572726)
-- Name: 572726; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572726');


ALTER LARGE OBJECT 572726 OWNER TO root;

--
-- TOC entry 4341 (class 2613 OID 572727)
-- Name: 572727; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572727');


ALTER LARGE OBJECT 572727 OWNER TO root;

--
-- TOC entry 4342 (class 2613 OID 572728)
-- Name: 572728; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572728');


ALTER LARGE OBJECT 572728 OWNER TO root;

--
-- TOC entry 4343 (class 2613 OID 572729)
-- Name: 572729; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572729');


ALTER LARGE OBJECT 572729 OWNER TO root;

--
-- TOC entry 4344 (class 2613 OID 572730)
-- Name: 572730; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572730');


ALTER LARGE OBJECT 572730 OWNER TO root;

--
-- TOC entry 4345 (class 2613 OID 572731)
-- Name: 572731; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572731');


ALTER LARGE OBJECT 572731 OWNER TO root;

--
-- TOC entry 4346 (class 2613 OID 572732)
-- Name: 572732; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572732');


ALTER LARGE OBJECT 572732 OWNER TO root;

--
-- TOC entry 4347 (class 2613 OID 572733)
-- Name: 572733; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572733');


ALTER LARGE OBJECT 572733 OWNER TO root;

--
-- TOC entry 4348 (class 2613 OID 572734)
-- Name: 572734; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572734');


ALTER LARGE OBJECT 572734 OWNER TO root;

--
-- TOC entry 4349 (class 2613 OID 572735)
-- Name: 572735; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572735');


ALTER LARGE OBJECT 572735 OWNER TO root;

--
-- TOC entry 4350 (class 2613 OID 572736)
-- Name: 572736; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572736');


ALTER LARGE OBJECT 572736 OWNER TO root;

--
-- TOC entry 4351 (class 2613 OID 572737)
-- Name: 572737; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572737');


ALTER LARGE OBJECT 572737 OWNER TO root;

--
-- TOC entry 4352 (class 2613 OID 572738)
-- Name: 572738; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572738');


ALTER LARGE OBJECT 572738 OWNER TO root;

--
-- TOC entry 4353 (class 2613 OID 572739)
-- Name: 572739; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572739');


ALTER LARGE OBJECT 572739 OWNER TO root;

--
-- TOC entry 4354 (class 2613 OID 572740)
-- Name: 572740; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572740');


ALTER LARGE OBJECT 572740 OWNER TO root;

--
-- TOC entry 4355 (class 2613 OID 572741)
-- Name: 572741; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572741');


ALTER LARGE OBJECT 572741 OWNER TO root;

--
-- TOC entry 4356 (class 2613 OID 572742)
-- Name: 572742; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572742');


ALTER LARGE OBJECT 572742 OWNER TO root;

--
-- TOC entry 4357 (class 2613 OID 572743)
-- Name: 572743; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572743');


ALTER LARGE OBJECT 572743 OWNER TO root;

--
-- TOC entry 4358 (class 2613 OID 572744)
-- Name: 572744; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572744');


ALTER LARGE OBJECT 572744 OWNER TO root;

--
-- TOC entry 4359 (class 2613 OID 572745)
-- Name: 572745; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572745');


ALTER LARGE OBJECT 572745 OWNER TO root;

--
-- TOC entry 4360 (class 2613 OID 572746)
-- Name: 572746; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572746');


ALTER LARGE OBJECT 572746 OWNER TO root;

--
-- TOC entry 4361 (class 2613 OID 572747)
-- Name: 572747; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572747');


ALTER LARGE OBJECT 572747 OWNER TO root;

--
-- TOC entry 4362 (class 2613 OID 572748)
-- Name: 572748; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572748');


ALTER LARGE OBJECT 572748 OWNER TO root;

--
-- TOC entry 4363 (class 2613 OID 572749)
-- Name: 572749; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572749');


ALTER LARGE OBJECT 572749 OWNER TO root;

--
-- TOC entry 4364 (class 2613 OID 572750)
-- Name: 572750; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572750');


ALTER LARGE OBJECT 572750 OWNER TO root;

--
-- TOC entry 4365 (class 2613 OID 572751)
-- Name: 572751; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572751');


ALTER LARGE OBJECT 572751 OWNER TO root;

--
-- TOC entry 4366 (class 2613 OID 572752)
-- Name: 572752; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572752');


ALTER LARGE OBJECT 572752 OWNER TO root;

--
-- TOC entry 4367 (class 2613 OID 572753)
-- Name: 572753; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572753');


ALTER LARGE OBJECT 572753 OWNER TO root;

--
-- TOC entry 4368 (class 2613 OID 572754)
-- Name: 572754; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572754');


ALTER LARGE OBJECT 572754 OWNER TO root;

--
-- TOC entry 4369 (class 2613 OID 572755)
-- Name: 572755; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572755');


ALTER LARGE OBJECT 572755 OWNER TO root;

--
-- TOC entry 4370 (class 2613 OID 572756)
-- Name: 572756; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572756');


ALTER LARGE OBJECT 572756 OWNER TO root;

--
-- TOC entry 4371 (class 2613 OID 572757)
-- Name: 572757; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572757');


ALTER LARGE OBJECT 572757 OWNER TO root;

--
-- TOC entry 4372 (class 2613 OID 572758)
-- Name: 572758; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572758');


ALTER LARGE OBJECT 572758 OWNER TO root;

--
-- TOC entry 4373 (class 2613 OID 572759)
-- Name: 572759; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572759');


ALTER LARGE OBJECT 572759 OWNER TO root;

--
-- TOC entry 4374 (class 2613 OID 572760)
-- Name: 572760; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572760');


ALTER LARGE OBJECT 572760 OWNER TO root;

--
-- TOC entry 4375 (class 2613 OID 572761)
-- Name: 572761; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572761');


ALTER LARGE OBJECT 572761 OWNER TO root;

--
-- TOC entry 4376 (class 2613 OID 572763)
-- Name: 572763; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572763');


ALTER LARGE OBJECT 572763 OWNER TO root;

--
-- TOC entry 4377 (class 2613 OID 572764)
-- Name: 572764; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572764');


ALTER LARGE OBJECT 572764 OWNER TO root;

--
-- TOC entry 4378 (class 2613 OID 572765)
-- Name: 572765; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572765');


ALTER LARGE OBJECT 572765 OWNER TO root;

--
-- TOC entry 4379 (class 2613 OID 572766)
-- Name: 572766; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572766');


ALTER LARGE OBJECT 572766 OWNER TO root;

--
-- TOC entry 4380 (class 2613 OID 572767)
-- Name: 572767; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572767');


ALTER LARGE OBJECT 572767 OWNER TO root;

--
-- TOC entry 4381 (class 2613 OID 572768)
-- Name: 572768; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572768');


ALTER LARGE OBJECT 572768 OWNER TO root;

--
-- TOC entry 4382 (class 2613 OID 572769)
-- Name: 572769; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572769');


ALTER LARGE OBJECT 572769 OWNER TO root;

--
-- TOC entry 4383 (class 2613 OID 572770)
-- Name: 572770; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572770');


ALTER LARGE OBJECT 572770 OWNER TO root;

--
-- TOC entry 4384 (class 2613 OID 572771)
-- Name: 572771; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572771');


ALTER LARGE OBJECT 572771 OWNER TO root;

--
-- TOC entry 4385 (class 2613 OID 572772)
-- Name: 572772; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572772');


ALTER LARGE OBJECT 572772 OWNER TO root;

--
-- TOC entry 4386 (class 2613 OID 572773)
-- Name: 572773; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572773');


ALTER LARGE OBJECT 572773 OWNER TO root;

--
-- TOC entry 4387 (class 2613 OID 572774)
-- Name: 572774; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572774');


ALTER LARGE OBJECT 572774 OWNER TO root;

--
-- TOC entry 4388 (class 2613 OID 572775)
-- Name: 572775; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572775');


ALTER LARGE OBJECT 572775 OWNER TO root;

--
-- TOC entry 4389 (class 2613 OID 572776)
-- Name: 572776; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572776');


ALTER LARGE OBJECT 572776 OWNER TO root;

--
-- TOC entry 4390 (class 2613 OID 572777)
-- Name: 572777; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572777');


ALTER LARGE OBJECT 572777 OWNER TO root;

--
-- TOC entry 4391 (class 2613 OID 572778)
-- Name: 572778; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572778');


ALTER LARGE OBJECT 572778 OWNER TO root;

--
-- TOC entry 4392 (class 2613 OID 572779)
-- Name: 572779; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572779');


ALTER LARGE OBJECT 572779 OWNER TO root;

--
-- TOC entry 4393 (class 2613 OID 572780)
-- Name: 572780; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572780');


ALTER LARGE OBJECT 572780 OWNER TO root;

--
-- TOC entry 4394 (class 2613 OID 572781)
-- Name: 572781; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572781');


ALTER LARGE OBJECT 572781 OWNER TO root;

--
-- TOC entry 4395 (class 2613 OID 572782)
-- Name: 572782; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572782');


ALTER LARGE OBJECT 572782 OWNER TO root;

--
-- TOC entry 4396 (class 2613 OID 572783)
-- Name: 572783; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572783');


ALTER LARGE OBJECT 572783 OWNER TO root;

--
-- TOC entry 4397 (class 2613 OID 572784)
-- Name: 572784; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572784');


ALTER LARGE OBJECT 572784 OWNER TO root;

--
-- TOC entry 4398 (class 2613 OID 572785)
-- Name: 572785; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572785');


ALTER LARGE OBJECT 572785 OWNER TO root;

--
-- TOC entry 4399 (class 2613 OID 572786)
-- Name: 572786; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572786');


ALTER LARGE OBJECT 572786 OWNER TO root;

--
-- TOC entry 4400 (class 2613 OID 572787)
-- Name: 572787; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572787');


ALTER LARGE OBJECT 572787 OWNER TO root;

--
-- TOC entry 4401 (class 2613 OID 572788)
-- Name: 572788; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572788');


ALTER LARGE OBJECT 572788 OWNER TO root;

--
-- TOC entry 4402 (class 2613 OID 572925)
-- Name: 572925; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572925');


ALTER LARGE OBJECT 572925 OWNER TO root;

--
-- TOC entry 4403 (class 2613 OID 572926)
-- Name: 572926; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572926');


ALTER LARGE OBJECT 572926 OWNER TO root;

--
-- TOC entry 4404 (class 2613 OID 572927)
-- Name: 572927; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572927');


ALTER LARGE OBJECT 572927 OWNER TO root;

--
-- TOC entry 4405 (class 2613 OID 572928)
-- Name: 572928; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572928');


ALTER LARGE OBJECT 572928 OWNER TO root;

--
-- TOC entry 4406 (class 2613 OID 572929)
-- Name: 572929; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572929');


ALTER LARGE OBJECT 572929 OWNER TO root;

--
-- TOC entry 4407 (class 2613 OID 572930)
-- Name: 572930; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572930');


ALTER LARGE OBJECT 572930 OWNER TO root;

--
-- TOC entry 4408 (class 2613 OID 572931)
-- Name: 572931; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572931');


ALTER LARGE OBJECT 572931 OWNER TO root;

--
-- TOC entry 4409 (class 2613 OID 572932)
-- Name: 572932; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572932');


ALTER LARGE OBJECT 572932 OWNER TO root;

--
-- TOC entry 4410 (class 2613 OID 572933)
-- Name: 572933; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572933');


ALTER LARGE OBJECT 572933 OWNER TO root;

--
-- TOC entry 4411 (class 2613 OID 572934)
-- Name: 572934; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572934');


ALTER LARGE OBJECT 572934 OWNER TO root;

--
-- TOC entry 4412 (class 2613 OID 572935)
-- Name: 572935; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572935');


ALTER LARGE OBJECT 572935 OWNER TO root;

--
-- TOC entry 4413 (class 2613 OID 572936)
-- Name: 572936; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572936');


ALTER LARGE OBJECT 572936 OWNER TO root;

--
-- TOC entry 4414 (class 2613 OID 572937)
-- Name: 572937; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572937');


ALTER LARGE OBJECT 572937 OWNER TO root;

--
-- TOC entry 4415 (class 2613 OID 572938)
-- Name: 572938; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572938');


ALTER LARGE OBJECT 572938 OWNER TO root;

--
-- TOC entry 4416 (class 2613 OID 572939)
-- Name: 572939; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572939');


ALTER LARGE OBJECT 572939 OWNER TO root;

--
-- TOC entry 4417 (class 2613 OID 572940)
-- Name: 572940; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572940');


ALTER LARGE OBJECT 572940 OWNER TO root;

--
-- TOC entry 4418 (class 2613 OID 572941)
-- Name: 572941; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572941');


ALTER LARGE OBJECT 572941 OWNER TO root;

--
-- TOC entry 4419 (class 2613 OID 572942)
-- Name: 572942; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572942');


ALTER LARGE OBJECT 572942 OWNER TO root;

--
-- TOC entry 4420 (class 2613 OID 572943)
-- Name: 572943; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572943');


ALTER LARGE OBJECT 572943 OWNER TO root;

--
-- TOC entry 4421 (class 2613 OID 572944)
-- Name: 572944; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572944');


ALTER LARGE OBJECT 572944 OWNER TO root;

--
-- TOC entry 4422 (class 2613 OID 572945)
-- Name: 572945; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572945');


ALTER LARGE OBJECT 572945 OWNER TO root;

--
-- TOC entry 4423 (class 2613 OID 572946)
-- Name: 572946; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572946');


ALTER LARGE OBJECT 572946 OWNER TO root;

--
-- TOC entry 4424 (class 2613 OID 572947)
-- Name: 572947; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572947');


ALTER LARGE OBJECT 572947 OWNER TO root;

--
-- TOC entry 4425 (class 2613 OID 572948)
-- Name: 572948; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('572948');


ALTER LARGE OBJECT 572948 OWNER TO root;

--
-- TOC entry 4426 (class 2613 OID 573168)
-- Name: 573168; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('573168');


ALTER LARGE OBJECT 573168 OWNER TO root;

--
-- TOC entry 4427 (class 2613 OID 573169)
-- Name: 573169; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('573169');


ALTER LARGE OBJECT 573169 OWNER TO root;

--
-- TOC entry 4428 (class 2613 OID 573170)
-- Name: 573170; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('573170');


ALTER LARGE OBJECT 573170 OWNER TO root;

--
-- TOC entry 4429 (class 2613 OID 573171)
-- Name: 573171; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('573171');


ALTER LARGE OBJECT 573171 OWNER TO root;

--
-- TOC entry 4430 (class 2613 OID 573172)
-- Name: 573172; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('573172');


ALTER LARGE OBJECT 573172 OWNER TO root;

--
-- TOC entry 4431 (class 2613 OID 573173)
-- Name: 573173; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('573173');


ALTER LARGE OBJECT 573173 OWNER TO root;

--
-- TOC entry 4432 (class 2613 OID 573380)
-- Name: 573380; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('573380');


ALTER LARGE OBJECT 573380 OWNER TO root;

--
-- TOC entry 4433 (class 2613 OID 573381)
-- Name: 573381; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('573381');


ALTER LARGE OBJECT 573381 OWNER TO root;

--
-- TOC entry 4434 (class 2613 OID 573382)
-- Name: 573382; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('573382');


ALTER LARGE OBJECT 573382 OWNER TO root;

--
-- TOC entry 4435 (class 2613 OID 573383)
-- Name: 573383; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('573383');


ALTER LARGE OBJECT 573383 OWNER TO root;

--
-- TOC entry 4436 (class 2613 OID 573384)
-- Name: 573384; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('573384');


ALTER LARGE OBJECT 573384 OWNER TO root;

--
-- TOC entry 4437 (class 2613 OID 573385)
-- Name: 573385; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('573385');


ALTER LARGE OBJECT 573385 OWNER TO root;

--
-- TOC entry 4438 (class 2613 OID 573386)
-- Name: 573386; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('573386');


ALTER LARGE OBJECT 573386 OWNER TO root;

--
-- TOC entry 4439 (class 2613 OID 573387)
-- Name: 573387; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('573387');


ALTER LARGE OBJECT 573387 OWNER TO root;

--
-- TOC entry 4440 (class 2613 OID 573388)
-- Name: 573388; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('573388');


ALTER LARGE OBJECT 573388 OWNER TO root;

--
-- TOC entry 4441 (class 2613 OID 573389)
-- Name: 573389; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('573389');


ALTER LARGE OBJECT 573389 OWNER TO root;

--
-- TOC entry 4442 (class 2613 OID 573390)
-- Name: 573390; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('573390');


ALTER LARGE OBJECT 573390 OWNER TO root;

--
-- TOC entry 4443 (class 2613 OID 573391)
-- Name: 573391; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('573391');


ALTER LARGE OBJECT 573391 OWNER TO root;

--
-- TOC entry 4444 (class 2613 OID 573392)
-- Name: 573392; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('573392');


ALTER LARGE OBJECT 573392 OWNER TO root;

--
-- TOC entry 4445 (class 2613 OID 573393)
-- Name: 573393; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('573393');


ALTER LARGE OBJECT 573393 OWNER TO root;

--
-- TOC entry 4446 (class 2613 OID 573394)
-- Name: 573394; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('573394');


ALTER LARGE OBJECT 573394 OWNER TO root;

--
-- TOC entry 4447 (class 2613 OID 573395)
-- Name: 573395; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('573395');


ALTER LARGE OBJECT 573395 OWNER TO root;

--
-- TOC entry 4448 (class 2613 OID 573501)
-- Name: 573501; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('573501');


ALTER LARGE OBJECT 573501 OWNER TO root;

--
-- TOC entry 4449 (class 2613 OID 573502)
-- Name: 573502; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('573502');


ALTER LARGE OBJECT 573502 OWNER TO root;

--
-- TOC entry 4450 (class 2613 OID 573503)
-- Name: 573503; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('573503');


ALTER LARGE OBJECT 573503 OWNER TO root;

--
-- TOC entry 4451 (class 2613 OID 573504)
-- Name: 573504; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('573504');


ALTER LARGE OBJECT 573504 OWNER TO root;

--
-- TOC entry 4452 (class 2613 OID 573608)
-- Name: 573608; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('573608');


ALTER LARGE OBJECT 573608 OWNER TO root;

--
-- TOC entry 4453 (class 2613 OID 573609)
-- Name: 573609; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('573609');


ALTER LARGE OBJECT 573609 OWNER TO root;

--
-- TOC entry 4454 (class 2613 OID 573610)
-- Name: 573610; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('573610');


ALTER LARGE OBJECT 573610 OWNER TO root;

--
-- TOC entry 4455 (class 2613 OID 573611)
-- Name: 573611; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('573611');


ALTER LARGE OBJECT 573611 OWNER TO root;

--
-- TOC entry 4456 (class 2613 OID 573612)
-- Name: 573612; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('573612');


ALTER LARGE OBJECT 573612 OWNER TO root;

--
-- TOC entry 4457 (class 2613 OID 573613)
-- Name: 573613; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('573613');


ALTER LARGE OBJECT 573613 OWNER TO root;

--
-- TOC entry 4458 (class 2613 OID 573614)
-- Name: 573614; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('573614');


ALTER LARGE OBJECT 573614 OWNER TO root;

--
-- TOC entry 4459 (class 2613 OID 573616)
-- Name: 573616; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('573616');


ALTER LARGE OBJECT 573616 OWNER TO root;

--
-- TOC entry 4460 (class 2613 OID 573617)
-- Name: 573617; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('573617');


ALTER LARGE OBJECT 573617 OWNER TO root;

--
-- TOC entry 4461 (class 2613 OID 573618)
-- Name: 573618; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('573618');


ALTER LARGE OBJECT 573618 OWNER TO root;

--
-- TOC entry 4462 (class 2613 OID 573619)
-- Name: 573619; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('573619');


ALTER LARGE OBJECT 573619 OWNER TO root;

--
-- TOC entry 4463 (class 2613 OID 573620)
-- Name: 573620; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('573620');


ALTER LARGE OBJECT 573620 OWNER TO root;

--
-- TOC entry 4464 (class 2613 OID 57761)
-- Name: 57761; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('57761');


ALTER LARGE OBJECT 57761 OWNER TO root;

--
-- TOC entry 4465 (class 2613 OID 57762)
-- Name: 57762; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('57762');


ALTER LARGE OBJECT 57762 OWNER TO root;

--
-- TOC entry 4466 (class 2613 OID 57763)
-- Name: 57763; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('57763');


ALTER LARGE OBJECT 57763 OWNER TO root;

--
-- TOC entry 4467 (class 2613 OID 57764)
-- Name: 57764; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('57764');


ALTER LARGE OBJECT 57764 OWNER TO root;

--
-- TOC entry 4468 (class 2613 OID 57765)
-- Name: 57765; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('57765');


ALTER LARGE OBJECT 57765 OWNER TO root;

--
-- TOC entry 4469 (class 2613 OID 583147)
-- Name: 583147; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('583147');


ALTER LARGE OBJECT 583147 OWNER TO root;

--
-- TOC entry 4470 (class 2613 OID 583148)
-- Name: 583148; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('583148');


ALTER LARGE OBJECT 583148 OWNER TO root;

--
-- TOC entry 4471 (class 2613 OID 583149)
-- Name: 583149; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('583149');


ALTER LARGE OBJECT 583149 OWNER TO root;

--
-- TOC entry 4472 (class 2613 OID 583150)
-- Name: 583150; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('583150');


ALTER LARGE OBJECT 583150 OWNER TO root;

--
-- TOC entry 4473 (class 2613 OID 583151)
-- Name: 583151; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('583151');


ALTER LARGE OBJECT 583151 OWNER TO root;

--
-- TOC entry 4474 (class 2613 OID 583152)
-- Name: 583152; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('583152');


ALTER LARGE OBJECT 583152 OWNER TO root;

--
-- TOC entry 4475 (class 2613 OID 583153)
-- Name: 583153; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('583153');


ALTER LARGE OBJECT 583153 OWNER TO root;

--
-- TOC entry 4476 (class 2613 OID 583154)
-- Name: 583154; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('583154');


ALTER LARGE OBJECT 583154 OWNER TO root;

--
-- TOC entry 4477 (class 2613 OID 583155)
-- Name: 583155; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('583155');


ALTER LARGE OBJECT 583155 OWNER TO root;

--
-- TOC entry 4478 (class 2613 OID 583156)
-- Name: 583156; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('583156');


ALTER LARGE OBJECT 583156 OWNER TO root;

--
-- TOC entry 4479 (class 2613 OID 583157)
-- Name: 583157; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('583157');


ALTER LARGE OBJECT 583157 OWNER TO root;

--
-- TOC entry 4480 (class 2613 OID 583158)
-- Name: 583158; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('583158');


ALTER LARGE OBJECT 583158 OWNER TO root;

--
-- TOC entry 4481 (class 2613 OID 583159)
-- Name: 583159; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('583159');


ALTER LARGE OBJECT 583159 OWNER TO root;

--
-- TOC entry 4482 (class 2613 OID 583160)
-- Name: 583160; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('583160');


ALTER LARGE OBJECT 583160 OWNER TO root;

--
-- TOC entry 4483 (class 2613 OID 583161)
-- Name: 583161; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('583161');


ALTER LARGE OBJECT 583161 OWNER TO root;

--
-- TOC entry 4484 (class 2613 OID 583162)
-- Name: 583162; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('583162');


ALTER LARGE OBJECT 583162 OWNER TO root;

--
-- TOC entry 4485 (class 2613 OID 583163)
-- Name: 583163; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('583163');


ALTER LARGE OBJECT 583163 OWNER TO root;

--
-- TOC entry 4486 (class 2613 OID 583164)
-- Name: 583164; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('583164');


ALTER LARGE OBJECT 583164 OWNER TO root;

--
-- TOC entry 4487 (class 2613 OID 595440)
-- Name: 595440; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('595440');


ALTER LARGE OBJECT 595440 OWNER TO root;

--
-- TOC entry 4488 (class 2613 OID 595441)
-- Name: 595441; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('595441');


ALTER LARGE OBJECT 595441 OWNER TO root;

--
-- TOC entry 4489 (class 2613 OID 595442)
-- Name: 595442; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('595442');


ALTER LARGE OBJECT 595442 OWNER TO root;

--
-- TOC entry 4490 (class 2613 OID 595443)
-- Name: 595443; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('595443');


ALTER LARGE OBJECT 595443 OWNER TO root;

--
-- TOC entry 4491 (class 2613 OID 595444)
-- Name: 595444; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('595444');


ALTER LARGE OBJECT 595444 OWNER TO root;

--
-- TOC entry 4492 (class 2613 OID 595445)
-- Name: 595445; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('595445');


ALTER LARGE OBJECT 595445 OWNER TO root;

--
-- TOC entry 4493 (class 2613 OID 595446)
-- Name: 595446; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('595446');


ALTER LARGE OBJECT 595446 OWNER TO root;

--
-- TOC entry 4494 (class 2613 OID 595447)
-- Name: 595447; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('595447');


ALTER LARGE OBJECT 595447 OWNER TO root;

--
-- TOC entry 4495 (class 2613 OID 595448)
-- Name: 595448; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('595448');


ALTER LARGE OBJECT 595448 OWNER TO root;

--
-- TOC entry 4496 (class 2613 OID 595449)
-- Name: 595449; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('595449');


ALTER LARGE OBJECT 595449 OWNER TO root;

--
-- TOC entry 4497 (class 2613 OID 595450)
-- Name: 595450; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('595450');


ALTER LARGE OBJECT 595450 OWNER TO root;

--
-- TOC entry 4498 (class 2613 OID 595451)
-- Name: 595451; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('595451');


ALTER LARGE OBJECT 595451 OWNER TO root;

--
-- TOC entry 4499 (class 2613 OID 595452)
-- Name: 595452; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('595452');


ALTER LARGE OBJECT 595452 OWNER TO root;

--
-- TOC entry 4500 (class 2613 OID 595632)
-- Name: 595632; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('595632');


ALTER LARGE OBJECT 595632 OWNER TO root;

--
-- TOC entry 4501 (class 2613 OID 595633)
-- Name: 595633; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('595633');


ALTER LARGE OBJECT 595633 OWNER TO root;

--
-- TOC entry 4502 (class 2613 OID 595634)
-- Name: 595634; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('595634');


ALTER LARGE OBJECT 595634 OWNER TO root;

--
-- TOC entry 4503 (class 2613 OID 595635)
-- Name: 595635; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('595635');


ALTER LARGE OBJECT 595635 OWNER TO root;

--
-- TOC entry 4504 (class 2613 OID 595636)
-- Name: 595636; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('595636');


ALTER LARGE OBJECT 595636 OWNER TO root;

--
-- TOC entry 4505 (class 2613 OID 595637)
-- Name: 595637; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('595637');


ALTER LARGE OBJECT 595637 OWNER TO root;

--
-- TOC entry 4506 (class 2613 OID 599133)
-- Name: 599133; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('599133');


ALTER LARGE OBJECT 599133 OWNER TO root;

--
-- TOC entry 4507 (class 2613 OID 599134)
-- Name: 599134; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('599134');


ALTER LARGE OBJECT 599134 OWNER TO root;

--
-- TOC entry 4508 (class 2613 OID 599135)
-- Name: 599135; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('599135');


ALTER LARGE OBJECT 599135 OWNER TO root;

--
-- TOC entry 4509 (class 2613 OID 599136)
-- Name: 599136; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('599136');


ALTER LARGE OBJECT 599136 OWNER TO root;

--
-- TOC entry 4510 (class 2613 OID 599137)
-- Name: 599137; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('599137');


ALTER LARGE OBJECT 599137 OWNER TO root;

--
-- TOC entry 4511 (class 2613 OID 599138)
-- Name: 599138; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('599138');


ALTER LARGE OBJECT 599138 OWNER TO root;

--
-- TOC entry 4512 (class 2613 OID 599139)
-- Name: 599139; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('599139');


ALTER LARGE OBJECT 599139 OWNER TO root;

--
-- TOC entry 4513 (class 2613 OID 599140)
-- Name: 599140; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('599140');


ALTER LARGE OBJECT 599140 OWNER TO root;

--
-- TOC entry 4514 (class 2613 OID 599141)
-- Name: 599141; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('599141');


ALTER LARGE OBJECT 599141 OWNER TO root;

--
-- TOC entry 4515 (class 2613 OID 599142)
-- Name: 599142; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('599142');


ALTER LARGE OBJECT 599142 OWNER TO root;

--
-- TOC entry 4516 (class 2613 OID 601746)
-- Name: 601746; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('601746');


ALTER LARGE OBJECT 601746 OWNER TO root;

--
-- TOC entry 4517 (class 2613 OID 60707)
-- Name: 60707; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('60707');


ALTER LARGE OBJECT 60707 OWNER TO root;

--
-- TOC entry 4518 (class 2613 OID 60708)
-- Name: 60708; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('60708');


ALTER LARGE OBJECT 60708 OWNER TO root;

--
-- TOC entry 4519 (class 2613 OID 60709)
-- Name: 60709; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('60709');


ALTER LARGE OBJECT 60709 OWNER TO root;

--
-- TOC entry 4520 (class 2613 OID 60710)
-- Name: 60710; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('60710');


ALTER LARGE OBJECT 60710 OWNER TO root;

--
-- TOC entry 4521 (class 2613 OID 60711)
-- Name: 60711; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('60711');


ALTER LARGE OBJECT 60711 OWNER TO root;

--
-- TOC entry 4522 (class 2613 OID 60712)
-- Name: 60712; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('60712');


ALTER LARGE OBJECT 60712 OWNER TO root;

--
-- TOC entry 4523 (class 2613 OID 60713)
-- Name: 60713; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('60713');


ALTER LARGE OBJECT 60713 OWNER TO root;

--
-- TOC entry 4524 (class 2613 OID 615800)
-- Name: 615800; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('615800');


ALTER LARGE OBJECT 615800 OWNER TO root;

--
-- TOC entry 4525 (class 2613 OID 619346)
-- Name: 619346; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('619346');


ALTER LARGE OBJECT 619346 OWNER TO root;

--
-- TOC entry 4526 (class 2613 OID 619347)
-- Name: 619347; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('619347');


ALTER LARGE OBJECT 619347 OWNER TO root;

--
-- TOC entry 4527 (class 2613 OID 619348)
-- Name: 619348; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('619348');


ALTER LARGE OBJECT 619348 OWNER TO root;

--
-- TOC entry 4528 (class 2613 OID 619349)
-- Name: 619349; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('619349');


ALTER LARGE OBJECT 619349 OWNER TO root;

--
-- TOC entry 4529 (class 2613 OID 619350)
-- Name: 619350; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('619350');


ALTER LARGE OBJECT 619350 OWNER TO root;

--
-- TOC entry 4530 (class 2613 OID 619351)
-- Name: 619351; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('619351');


ALTER LARGE OBJECT 619351 OWNER TO root;

--
-- TOC entry 4531 (class 2613 OID 619352)
-- Name: 619352; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('619352');


ALTER LARGE OBJECT 619352 OWNER TO root;

--
-- TOC entry 4532 (class 2613 OID 619353)
-- Name: 619353; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('619353');


ALTER LARGE OBJECT 619353 OWNER TO root;

--
-- TOC entry 4533 (class 2613 OID 619354)
-- Name: 619354; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('619354');


ALTER LARGE OBJECT 619354 OWNER TO root;

--
-- TOC entry 4534 (class 2613 OID 619355)
-- Name: 619355; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('619355');


ALTER LARGE OBJECT 619355 OWNER TO root;

--
-- TOC entry 4535 (class 2613 OID 619356)
-- Name: 619356; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('619356');


ALTER LARGE OBJECT 619356 OWNER TO root;

--
-- TOC entry 4536 (class 2613 OID 619357)
-- Name: 619357; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('619357');


ALTER LARGE OBJECT 619357 OWNER TO root;

--
-- TOC entry 4537 (class 2613 OID 619358)
-- Name: 619358; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('619358');


ALTER LARGE OBJECT 619358 OWNER TO root;

--
-- TOC entry 4538 (class 2613 OID 619359)
-- Name: 619359; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('619359');


ALTER LARGE OBJECT 619359 OWNER TO root;

--
-- TOC entry 4539 (class 2613 OID 619360)
-- Name: 619360; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('619360');


ALTER LARGE OBJECT 619360 OWNER TO root;

--
-- TOC entry 4540 (class 2613 OID 619588)
-- Name: 619588; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('619588');


ALTER LARGE OBJECT 619588 OWNER TO root;

--
-- TOC entry 4541 (class 2613 OID 619589)
-- Name: 619589; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('619589');


ALTER LARGE OBJECT 619589 OWNER TO root;

--
-- TOC entry 4542 (class 2613 OID 619590)
-- Name: 619590; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('619590');


ALTER LARGE OBJECT 619590 OWNER TO root;

--
-- TOC entry 4543 (class 2613 OID 619591)
-- Name: 619591; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('619591');


ALTER LARGE OBJECT 619591 OWNER TO root;

--
-- TOC entry 4544 (class 2613 OID 619592)
-- Name: 619592; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('619592');


ALTER LARGE OBJECT 619592 OWNER TO root;

--
-- TOC entry 4545 (class 2613 OID 631745)
-- Name: 631745; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('631745');


ALTER LARGE OBJECT 631745 OWNER TO root;

--
-- TOC entry 4546 (class 2613 OID 631746)
-- Name: 631746; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('631746');


ALTER LARGE OBJECT 631746 OWNER TO root;

--
-- TOC entry 4547 (class 2613 OID 631747)
-- Name: 631747; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('631747');


ALTER LARGE OBJECT 631747 OWNER TO root;

--
-- TOC entry 4548 (class 2613 OID 631795)
-- Name: 631795; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('631795');


ALTER LARGE OBJECT 631795 OWNER TO root;

--
-- TOC entry 4549 (class 2613 OID 631796)
-- Name: 631796; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('631796');


ALTER LARGE OBJECT 631796 OWNER TO root;

--
-- TOC entry 4550 (class 2613 OID 631797)
-- Name: 631797; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('631797');


ALTER LARGE OBJECT 631797 OWNER TO root;

--
-- TOC entry 4551 (class 2613 OID 631798)
-- Name: 631798; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('631798');


ALTER LARGE OBJECT 631798 OWNER TO root;

--
-- TOC entry 4552 (class 2613 OID 631799)
-- Name: 631799; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('631799');


ALTER LARGE OBJECT 631799 OWNER TO root;

--
-- TOC entry 4553 (class 2613 OID 631800)
-- Name: 631800; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('631800');


ALTER LARGE OBJECT 631800 OWNER TO root;

--
-- TOC entry 4554 (class 2613 OID 631803)
-- Name: 631803; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('631803');


ALTER LARGE OBJECT 631803 OWNER TO root;

--
-- TOC entry 4555 (class 2613 OID 631804)
-- Name: 631804; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('631804');


ALTER LARGE OBJECT 631804 OWNER TO root;

--
-- TOC entry 4556 (class 2613 OID 631805)
-- Name: 631805; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('631805');


ALTER LARGE OBJECT 631805 OWNER TO root;

--
-- TOC entry 4557 (class 2613 OID 631806)
-- Name: 631806; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('631806');


ALTER LARGE OBJECT 631806 OWNER TO root;

--
-- TOC entry 4558 (class 2613 OID 631807)
-- Name: 631807; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('631807');


ALTER LARGE OBJECT 631807 OWNER TO root;

--
-- TOC entry 4559 (class 2613 OID 631808)
-- Name: 631808; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('631808');


ALTER LARGE OBJECT 631808 OWNER TO root;

--
-- TOC entry 4560 (class 2613 OID 631809)
-- Name: 631809; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('631809');


ALTER LARGE OBJECT 631809 OWNER TO root;

--
-- TOC entry 4561 (class 2613 OID 634158)
-- Name: 634158; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('634158');


ALTER LARGE OBJECT 634158 OWNER TO root;

--
-- TOC entry 4562 (class 2613 OID 634159)
-- Name: 634159; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('634159');


ALTER LARGE OBJECT 634159 OWNER TO root;

--
-- TOC entry 4563 (class 2613 OID 634160)
-- Name: 634160; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('634160');


ALTER LARGE OBJECT 634160 OWNER TO root;

--
-- TOC entry 4564 (class 2613 OID 634161)
-- Name: 634161; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('634161');


ALTER LARGE OBJECT 634161 OWNER TO root;

--
-- TOC entry 4565 (class 2613 OID 634162)
-- Name: 634162; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('634162');


ALTER LARGE OBJECT 634162 OWNER TO root;

--
-- TOC entry 4566 (class 2613 OID 634163)
-- Name: 634163; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('634163');


ALTER LARGE OBJECT 634163 OWNER TO root;

--
-- TOC entry 4567 (class 2613 OID 634164)
-- Name: 634164; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('634164');


ALTER LARGE OBJECT 634164 OWNER TO root;

--
-- TOC entry 4568 (class 2613 OID 634165)
-- Name: 634165; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('634165');


ALTER LARGE OBJECT 634165 OWNER TO root;

--
-- TOC entry 4569 (class 2613 OID 634166)
-- Name: 634166; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('634166');


ALTER LARGE OBJECT 634166 OWNER TO root;

--
-- TOC entry 4570 (class 2613 OID 634167)
-- Name: 634167; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('634167');


ALTER LARGE OBJECT 634167 OWNER TO root;

--
-- TOC entry 4571 (class 2613 OID 634168)
-- Name: 634168; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('634168');


ALTER LARGE OBJECT 634168 OWNER TO root;

--
-- TOC entry 4572 (class 2613 OID 634169)
-- Name: 634169; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('634169');


ALTER LARGE OBJECT 634169 OWNER TO root;

--
-- TOC entry 4573 (class 2613 OID 636584)
-- Name: 636584; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('636584');


ALTER LARGE OBJECT 636584 OWNER TO root;

--
-- TOC entry 4574 (class 2613 OID 636585)
-- Name: 636585; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('636585');


ALTER LARGE OBJECT 636585 OWNER TO root;

--
-- TOC entry 4575 (class 2613 OID 636586)
-- Name: 636586; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('636586');


ALTER LARGE OBJECT 636586 OWNER TO root;

--
-- TOC entry 4576 (class 2613 OID 636587)
-- Name: 636587; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('636587');


ALTER LARGE OBJECT 636587 OWNER TO root;

--
-- TOC entry 4577 (class 2613 OID 636588)
-- Name: 636588; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('636588');


ALTER LARGE OBJECT 636588 OWNER TO root;

--
-- TOC entry 4578 (class 2613 OID 636589)
-- Name: 636589; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('636589');


ALTER LARGE OBJECT 636589 OWNER TO root;

--
-- TOC entry 4579 (class 2613 OID 637408)
-- Name: 637408; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('637408');


ALTER LARGE OBJECT 637408 OWNER TO root;

--
-- TOC entry 4580 (class 2613 OID 637409)
-- Name: 637409; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('637409');


ALTER LARGE OBJECT 637409 OWNER TO root;

--
-- TOC entry 4581 (class 2613 OID 637410)
-- Name: 637410; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('637410');


ALTER LARGE OBJECT 637410 OWNER TO root;

--
-- TOC entry 4582 (class 2613 OID 80887)
-- Name: 80887; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('80887');


ALTER LARGE OBJECT 80887 OWNER TO root;

--
-- TOC entry 4583 (class 2613 OID 80888)
-- Name: 80888; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('80888');


ALTER LARGE OBJECT 80888 OWNER TO root;

--
-- TOC entry 4584 (class 2613 OID 80889)
-- Name: 80889; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('80889');


ALTER LARGE OBJECT 80889 OWNER TO root;

--
-- TOC entry 4585 (class 2613 OID 80983)
-- Name: 80983; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('80983');


ALTER LARGE OBJECT 80983 OWNER TO root;

--
-- TOC entry 4586 (class 2613 OID 80984)
-- Name: 80984; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('80984');


ALTER LARGE OBJECT 80984 OWNER TO root;

--
-- TOC entry 4587 (class 2613 OID 80985)
-- Name: 80985; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('80985');


ALTER LARGE OBJECT 80985 OWNER TO root;

--
-- TOC entry 4588 (class 2613 OID 80986)
-- Name: 80986; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('80986');


ALTER LARGE OBJECT 80986 OWNER TO root;

--
-- TOC entry 4589 (class 2613 OID 80987)
-- Name: 80987; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('80987');


ALTER LARGE OBJECT 80987 OWNER TO root;

--
-- TOC entry 4590 (class 2613 OID 80988)
-- Name: 80988; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('80988');


ALTER LARGE OBJECT 80988 OWNER TO root;

--
-- TOC entry 4591 (class 2613 OID 80989)
-- Name: 80989; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('80989');


ALTER LARGE OBJECT 80989 OWNER TO root;

--
-- TOC entry 4592 (class 2613 OID 80990)
-- Name: 80990; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('80990');


ALTER LARGE OBJECT 80990 OWNER TO root;

--
-- TOC entry 4593 (class 2613 OID 80991)
-- Name: 80991; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('80991');


ALTER LARGE OBJECT 80991 OWNER TO root;

--
-- TOC entry 4594 (class 2613 OID 80992)
-- Name: 80992; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('80992');


ALTER LARGE OBJECT 80992 OWNER TO root;

--
-- TOC entry 4595 (class 2613 OID 80993)
-- Name: 80993; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('80993');


ALTER LARGE OBJECT 80993 OWNER TO root;

--
-- TOC entry 4596 (class 2613 OID 80994)
-- Name: 80994; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('80994');


ALTER LARGE OBJECT 80994 OWNER TO root;

--
-- TOC entry 4597 (class 2613 OID 80995)
-- Name: 80995; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('80995');


ALTER LARGE OBJECT 80995 OWNER TO root;

--
-- TOC entry 4598 (class 2613 OID 80996)
-- Name: 80996; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('80996');


ALTER LARGE OBJECT 80996 OWNER TO root;

--
-- TOC entry 4599 (class 2613 OID 80997)
-- Name: 80997; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('80997');


ALTER LARGE OBJECT 80997 OWNER TO root;

--
-- TOC entry 4600 (class 2613 OID 80998)
-- Name: 80998; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('80998');


ALTER LARGE OBJECT 80998 OWNER TO root;

--
-- TOC entry 4601 (class 2613 OID 80999)
-- Name: 80999; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('80999');


ALTER LARGE OBJECT 80999 OWNER TO root;

--
-- TOC entry 4602 (class 2613 OID 81000)
-- Name: 81000; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('81000');


ALTER LARGE OBJECT 81000 OWNER TO root;

--
-- TOC entry 4603 (class 2613 OID 81001)
-- Name: 81001; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('81001');


ALTER LARGE OBJECT 81001 OWNER TO root;

--
-- TOC entry 4604 (class 2613 OID 81002)
-- Name: 81002; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('81002');


ALTER LARGE OBJECT 81002 OWNER TO root;

--
-- TOC entry 4605 (class 2613 OID 81003)
-- Name: 81003; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('81003');


ALTER LARGE OBJECT 81003 OWNER TO root;

--
-- TOC entry 4606 (class 2613 OID 81004)
-- Name: 81004; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('81004');


ALTER LARGE OBJECT 81004 OWNER TO root;

--
-- TOC entry 4607 (class 2613 OID 819399)
-- Name: 819399; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('819399');


ALTER LARGE OBJECT 819399 OWNER TO root;

--
-- TOC entry 4608 (class 2613 OID 819400)
-- Name: 819400; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('819400');


ALTER LARGE OBJECT 819400 OWNER TO root;

--
-- TOC entry 4609 (class 2613 OID 819401)
-- Name: 819401; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('819401');


ALTER LARGE OBJECT 819401 OWNER TO root;

--
-- TOC entry 4610 (class 2613 OID 819402)
-- Name: 819402; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('819402');


ALTER LARGE OBJECT 819402 OWNER TO root;

--
-- TOC entry 4611 (class 2613 OID 819403)
-- Name: 819403; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('819403');


ALTER LARGE OBJECT 819403 OWNER TO root;

--
-- TOC entry 4612 (class 2613 OID 819419)
-- Name: 819419; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('819419');


ALTER LARGE OBJECT 819419 OWNER TO root;

--
-- TOC entry 4613 (class 2613 OID 819420)
-- Name: 819420; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('819420');


ALTER LARGE OBJECT 819420 OWNER TO root;

--
-- TOC entry 4614 (class 2613 OID 819421)
-- Name: 819421; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('819421');


ALTER LARGE OBJECT 819421 OWNER TO root;

--
-- TOC entry 4615 (class 2613 OID 819422)
-- Name: 819422; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('819422');


ALTER LARGE OBJECT 819422 OWNER TO root;

--
-- TOC entry 4616 (class 2613 OID 819423)
-- Name: 819423; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('819423');


ALTER LARGE OBJECT 819423 OWNER TO root;

--
-- TOC entry 4617 (class 2613 OID 819424)
-- Name: 819424; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('819424');


ALTER LARGE OBJECT 819424 OWNER TO root;

--
-- TOC entry 4618 (class 2613 OID 819425)
-- Name: 819425; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('819425');


ALTER LARGE OBJECT 819425 OWNER TO root;

--
-- TOC entry 4619 (class 2613 OID 819426)
-- Name: 819426; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('819426');


ALTER LARGE OBJECT 819426 OWNER TO root;

--
-- TOC entry 4620 (class 2613 OID 819427)
-- Name: 819427; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('819427');


ALTER LARGE OBJECT 819427 OWNER TO root;

--
-- TOC entry 4621 (class 2613 OID 819428)
-- Name: 819428; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('819428');


ALTER LARGE OBJECT 819428 OWNER TO root;

--
-- TOC entry 4622 (class 2613 OID 821727)
-- Name: 821727; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821727');


ALTER LARGE OBJECT 821727 OWNER TO root;

--
-- TOC entry 4623 (class 2613 OID 821728)
-- Name: 821728; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821728');


ALTER LARGE OBJECT 821728 OWNER TO root;

--
-- TOC entry 4624 (class 2613 OID 821729)
-- Name: 821729; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821729');


ALTER LARGE OBJECT 821729 OWNER TO root;

--
-- TOC entry 4625 (class 2613 OID 821730)
-- Name: 821730; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821730');


ALTER LARGE OBJECT 821730 OWNER TO root;

--
-- TOC entry 4626 (class 2613 OID 821731)
-- Name: 821731; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821731');


ALTER LARGE OBJECT 821731 OWNER TO root;

--
-- TOC entry 4627 (class 2613 OID 821732)
-- Name: 821732; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821732');


ALTER LARGE OBJECT 821732 OWNER TO root;

--
-- TOC entry 4628 (class 2613 OID 821733)
-- Name: 821733; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821733');


ALTER LARGE OBJECT 821733 OWNER TO root;

--
-- TOC entry 4629 (class 2613 OID 821734)
-- Name: 821734; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821734');


ALTER LARGE OBJECT 821734 OWNER TO root;

--
-- TOC entry 4630 (class 2613 OID 821735)
-- Name: 821735; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821735');


ALTER LARGE OBJECT 821735 OWNER TO root;

--
-- TOC entry 4631 (class 2613 OID 821736)
-- Name: 821736; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821736');


ALTER LARGE OBJECT 821736 OWNER TO root;

--
-- TOC entry 4632 (class 2613 OID 821737)
-- Name: 821737; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821737');


ALTER LARGE OBJECT 821737 OWNER TO root;

--
-- TOC entry 4633 (class 2613 OID 821738)
-- Name: 821738; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821738');


ALTER LARGE OBJECT 821738 OWNER TO root;

--
-- TOC entry 4634 (class 2613 OID 821739)
-- Name: 821739; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821739');


ALTER LARGE OBJECT 821739 OWNER TO root;

--
-- TOC entry 4635 (class 2613 OID 821740)
-- Name: 821740; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821740');


ALTER LARGE OBJECT 821740 OWNER TO root;

--
-- TOC entry 4636 (class 2613 OID 821741)
-- Name: 821741; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821741');


ALTER LARGE OBJECT 821741 OWNER TO root;

--
-- TOC entry 4637 (class 2613 OID 821742)
-- Name: 821742; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821742');


ALTER LARGE OBJECT 821742 OWNER TO root;

--
-- TOC entry 4638 (class 2613 OID 821743)
-- Name: 821743; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821743');


ALTER LARGE OBJECT 821743 OWNER TO root;

--
-- TOC entry 4639 (class 2613 OID 821744)
-- Name: 821744; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821744');


ALTER LARGE OBJECT 821744 OWNER TO root;

--
-- TOC entry 4640 (class 2613 OID 821745)
-- Name: 821745; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821745');


ALTER LARGE OBJECT 821745 OWNER TO root;

--
-- TOC entry 4641 (class 2613 OID 821746)
-- Name: 821746; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821746');


ALTER LARGE OBJECT 821746 OWNER TO root;

--
-- TOC entry 4642 (class 2613 OID 821747)
-- Name: 821747; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821747');


ALTER LARGE OBJECT 821747 OWNER TO root;

--
-- TOC entry 4643 (class 2613 OID 821748)
-- Name: 821748; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821748');


ALTER LARGE OBJECT 821748 OWNER TO root;

--
-- TOC entry 4644 (class 2613 OID 821749)
-- Name: 821749; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821749');


ALTER LARGE OBJECT 821749 OWNER TO root;

--
-- TOC entry 4645 (class 2613 OID 821750)
-- Name: 821750; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821750');


ALTER LARGE OBJECT 821750 OWNER TO root;

--
-- TOC entry 4646 (class 2613 OID 821751)
-- Name: 821751; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821751');


ALTER LARGE OBJECT 821751 OWNER TO root;

--
-- TOC entry 4647 (class 2613 OID 821752)
-- Name: 821752; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821752');


ALTER LARGE OBJECT 821752 OWNER TO root;

--
-- TOC entry 4648 (class 2613 OID 821753)
-- Name: 821753; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821753');


ALTER LARGE OBJECT 821753 OWNER TO root;

--
-- TOC entry 4649 (class 2613 OID 821754)
-- Name: 821754; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821754');


ALTER LARGE OBJECT 821754 OWNER TO root;

--
-- TOC entry 4650 (class 2613 OID 821755)
-- Name: 821755; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821755');


ALTER LARGE OBJECT 821755 OWNER TO root;

--
-- TOC entry 4651 (class 2613 OID 821756)
-- Name: 821756; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821756');


ALTER LARGE OBJECT 821756 OWNER TO root;

--
-- TOC entry 4652 (class 2613 OID 821757)
-- Name: 821757; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821757');


ALTER LARGE OBJECT 821757 OWNER TO root;

--
-- TOC entry 4653 (class 2613 OID 821758)
-- Name: 821758; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821758');


ALTER LARGE OBJECT 821758 OWNER TO root;

--
-- TOC entry 4654 (class 2613 OID 821759)
-- Name: 821759; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821759');


ALTER LARGE OBJECT 821759 OWNER TO root;

--
-- TOC entry 4655 (class 2613 OID 821760)
-- Name: 821760; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821760');


ALTER LARGE OBJECT 821760 OWNER TO root;

--
-- TOC entry 4656 (class 2613 OID 821761)
-- Name: 821761; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821761');


ALTER LARGE OBJECT 821761 OWNER TO root;

--
-- TOC entry 4657 (class 2613 OID 821762)
-- Name: 821762; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821762');


ALTER LARGE OBJECT 821762 OWNER TO root;

--
-- TOC entry 4658 (class 2613 OID 821763)
-- Name: 821763; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821763');


ALTER LARGE OBJECT 821763 OWNER TO root;

--
-- TOC entry 4659 (class 2613 OID 821764)
-- Name: 821764; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821764');


ALTER LARGE OBJECT 821764 OWNER TO root;

--
-- TOC entry 4660 (class 2613 OID 821765)
-- Name: 821765; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821765');


ALTER LARGE OBJECT 821765 OWNER TO root;

--
-- TOC entry 4661 (class 2613 OID 821766)
-- Name: 821766; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821766');


ALTER LARGE OBJECT 821766 OWNER TO root;

--
-- TOC entry 4662 (class 2613 OID 821810)
-- Name: 821810; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821810');


ALTER LARGE OBJECT 821810 OWNER TO root;

--
-- TOC entry 4663 (class 2613 OID 821811)
-- Name: 821811; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821811');


ALTER LARGE OBJECT 821811 OWNER TO root;

--
-- TOC entry 4664 (class 2613 OID 821812)
-- Name: 821812; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821812');


ALTER LARGE OBJECT 821812 OWNER TO root;

--
-- TOC entry 4665 (class 2613 OID 821813)
-- Name: 821813; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821813');


ALTER LARGE OBJECT 821813 OWNER TO root;

--
-- TOC entry 4666 (class 2613 OID 821814)
-- Name: 821814; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821814');


ALTER LARGE OBJECT 821814 OWNER TO root;

--
-- TOC entry 4667 (class 2613 OID 821815)
-- Name: 821815; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821815');


ALTER LARGE OBJECT 821815 OWNER TO root;

--
-- TOC entry 4668 (class 2613 OID 821816)
-- Name: 821816; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821816');


ALTER LARGE OBJECT 821816 OWNER TO root;

--
-- TOC entry 4669 (class 2613 OID 821817)
-- Name: 821817; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821817');


ALTER LARGE OBJECT 821817 OWNER TO root;

--
-- TOC entry 4670 (class 2613 OID 821818)
-- Name: 821818; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821818');


ALTER LARGE OBJECT 821818 OWNER TO root;

--
-- TOC entry 4671 (class 2613 OID 821862)
-- Name: 821862; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821862');


ALTER LARGE OBJECT 821862 OWNER TO root;

--
-- TOC entry 4672 (class 2613 OID 821863)
-- Name: 821863; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821863');


ALTER LARGE OBJECT 821863 OWNER TO root;

--
-- TOC entry 4673 (class 2613 OID 821864)
-- Name: 821864; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821864');


ALTER LARGE OBJECT 821864 OWNER TO root;

--
-- TOC entry 4674 (class 2613 OID 821865)
-- Name: 821865; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821865');


ALTER LARGE OBJECT 821865 OWNER TO root;

--
-- TOC entry 4675 (class 2613 OID 821866)
-- Name: 821866; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821866');


ALTER LARGE OBJECT 821866 OWNER TO root;

--
-- TOC entry 4676 (class 2613 OID 821867)
-- Name: 821867; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821867');


ALTER LARGE OBJECT 821867 OWNER TO root;

--
-- TOC entry 4677 (class 2613 OID 821868)
-- Name: 821868; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821868');


ALTER LARGE OBJECT 821868 OWNER TO root;

--
-- TOC entry 4678 (class 2613 OID 821877)
-- Name: 821877; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821877');


ALTER LARGE OBJECT 821877 OWNER TO root;

--
-- TOC entry 4679 (class 2613 OID 821878)
-- Name: 821878; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821878');


ALTER LARGE OBJECT 821878 OWNER TO root;

--
-- TOC entry 4680 (class 2613 OID 821879)
-- Name: 821879; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821879');


ALTER LARGE OBJECT 821879 OWNER TO root;

--
-- TOC entry 4681 (class 2613 OID 821880)
-- Name: 821880; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821880');


ALTER LARGE OBJECT 821880 OWNER TO root;

--
-- TOC entry 4682 (class 2613 OID 821881)
-- Name: 821881; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821881');


ALTER LARGE OBJECT 821881 OWNER TO root;

--
-- TOC entry 4683 (class 2613 OID 821882)
-- Name: 821882; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821882');


ALTER LARGE OBJECT 821882 OWNER TO root;

--
-- TOC entry 4684 (class 2613 OID 821883)
-- Name: 821883; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('821883');


ALTER LARGE OBJECT 821883 OWNER TO root;

--
-- TOC entry 4685 (class 2613 OID 832392)
-- Name: 832392; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('832392');


ALTER LARGE OBJECT 832392 OWNER TO root;

--
-- TOC entry 4686 (class 2613 OID 832393)
-- Name: 832393; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('832393');


ALTER LARGE OBJECT 832393 OWNER TO root;

--
-- TOC entry 4687 (class 2613 OID 832394)
-- Name: 832394; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('832394');


ALTER LARGE OBJECT 832394 OWNER TO root;

--
-- TOC entry 4688 (class 2613 OID 832395)
-- Name: 832395; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('832395');


ALTER LARGE OBJECT 832395 OWNER TO root;

--
-- TOC entry 4689 (class 2613 OID 848776)
-- Name: 848776; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('848776');


ALTER LARGE OBJECT 848776 OWNER TO root;

--
-- TOC entry 4690 (class 2613 OID 848777)
-- Name: 848777; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('848777');


ALTER LARGE OBJECT 848777 OWNER TO root;

--
-- TOC entry 4691 (class 2613 OID 848778)
-- Name: 848778; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('848778');


ALTER LARGE OBJECT 848778 OWNER TO root;

--
-- TOC entry 4692 (class 2613 OID 848779)
-- Name: 848779; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('848779');


ALTER LARGE OBJECT 848779 OWNER TO root;

--
-- TOC entry 4693 (class 2613 OID 848780)
-- Name: 848780; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('848780');


ALTER LARGE OBJECT 848780 OWNER TO root;

--
-- TOC entry 4694 (class 2613 OID 848781)
-- Name: 848781; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('848781');


ALTER LARGE OBJECT 848781 OWNER TO root;

--
-- TOC entry 4695 (class 2613 OID 848782)
-- Name: 848782; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('848782');


ALTER LARGE OBJECT 848782 OWNER TO root;

--
-- TOC entry 4696 (class 2613 OID 848783)
-- Name: 848783; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('848783');


ALTER LARGE OBJECT 848783 OWNER TO root;

--
-- TOC entry 4697 (class 2613 OID 848784)
-- Name: 848784; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('848784');


ALTER LARGE OBJECT 848784 OWNER TO root;

--
-- TOC entry 4698 (class 2613 OID 848785)
-- Name: 848785; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('848785');


ALTER LARGE OBJECT 848785 OWNER TO root;

--
-- TOC entry 4699 (class 2613 OID 848786)
-- Name: 848786; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('848786');


ALTER LARGE OBJECT 848786 OWNER TO root;

--
-- TOC entry 4700 (class 2613 OID 848787)
-- Name: 848787; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('848787');


ALTER LARGE OBJECT 848787 OWNER TO root;

--
-- TOC entry 4701 (class 2613 OID 851119)
-- Name: 851119; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('851119');


ALTER LARGE OBJECT 851119 OWNER TO root;

--
-- TOC entry 4702 (class 2613 OID 851120)
-- Name: 851120; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('851120');


ALTER LARGE OBJECT 851120 OWNER TO root;

--
-- TOC entry 4703 (class 2613 OID 851121)
-- Name: 851121; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('851121');


ALTER LARGE OBJECT 851121 OWNER TO root;

--
-- TOC entry 4704 (class 2613 OID 851122)
-- Name: 851122; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('851122');


ALTER LARGE OBJECT 851122 OWNER TO root;

--
-- TOC entry 4705 (class 2613 OID 851123)
-- Name: 851123; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('851123');


ALTER LARGE OBJECT 851123 OWNER TO root;

--
-- TOC entry 4706 (class 2613 OID 851124)
-- Name: 851124; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('851124');


ALTER LARGE OBJECT 851124 OWNER TO root;

--
-- TOC entry 4707 (class 2613 OID 851125)
-- Name: 851125; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('851125');


ALTER LARGE OBJECT 851125 OWNER TO root;

--
-- TOC entry 4708 (class 2613 OID 851126)
-- Name: 851126; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('851126');


ALTER LARGE OBJECT 851126 OWNER TO root;

--
-- TOC entry 4709 (class 2613 OID 851127)
-- Name: 851127; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('851127');


ALTER LARGE OBJECT 851127 OWNER TO root;

--
-- TOC entry 4710 (class 2613 OID 851128)
-- Name: 851128; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('851128');


ALTER LARGE OBJECT 851128 OWNER TO root;

--
-- TOC entry 4711 (class 2613 OID 851129)
-- Name: 851129; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('851129');


ALTER LARGE OBJECT 851129 OWNER TO root;

--
-- TOC entry 4712 (class 2613 OID 851130)
-- Name: 851130; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('851130');


ALTER LARGE OBJECT 851130 OWNER TO root;

--
-- TOC entry 4713 (class 2613 OID 851131)
-- Name: 851131; Type: BLOB; Schema: -; Owner: root
--

SELECT pg_catalog.lo_create('851131');


ALTER LARGE OBJECT 851131 OWNER TO root;

--
-- TOC entry 3779 (class 0 OID 850323)
-- Dependencies: 207
-- Data for Name: credencial; Type: TABLE DATA; Schema: empresa; Owner: root
--

COPY empresa.credencial (credencial_id, filedata, description, register, activo, principal) FROM stdin;
\.


--
-- TOC entry 3780 (class 0 OID 850326)
-- Dependencies: 208
-- Data for Name: moneda; Type: TABLE DATA; Schema: empresa; Owner: root
--

COPY empresa.moneda (moneda_id, descripcion, abr, cambio) FROM stdin;
1	Boliviano	BOB	1
2	Dolar Americano	USD	6.96
\.


--
-- TOC entry 3781 (class 0 OID 850329)
-- Dependencies: 209
-- Data for Name: principal; Type: TABLE DATA; Schema: empresa; Owner: root
--

COPY empresa.principal (principal_id, nombre, apellido, email, registro, razon_social, nit, direccion, telefono, estado, celular, pin, ciudad, whatsapp, facebook, empresa, filedata, credential, idgital, descripcion, apiserver) FROM stdin;
29117463963100	H	C	helen@gmail.com	2019-12-07 21:51:11.628	Fundación	\N	\N	22117282	C	70685903	2648	El Alto - Bolivia	\N	\N	Fundación Munasim Kullakita	\N	\N	FMK	\N	\N
\.


--
-- TOC entry 3782 (class 0 OID 850335)
-- Dependencies: 210
-- Data for Name: usuario; Type: TABLE DATA; Schema: empresa; Owner: root
--

COPY empresa.usuario (usuario_id, username, passkey, activo, register, fullname, principal) FROM stdin;
80949509124600	hcastillo	040871	t	2024-03-15 11:00:03.731	Helen Castillo	29117463963100
80977014294900	kflores	039765	t	2024-03-15 11:00:31.236	Karen Flores	29117463963100
\.


--
-- TOC entry 3783 (class 0 OID 850356)
-- Dependencies: 211
-- Data for Name: filedata; Type: TABLE DATA; Schema: files; Owner: root
--

COPY files.filedata (filedata_id, contenttype, originalfilename, serverfilename, serverpath, size, registro) FROM stdin;
\.


--
-- TOC entry 3784 (class 0 OID 850374)
-- Dependencies: 212
-- Data for Name: menu; Type: TABLE DATA; Schema: logic; Owner: root
--

COPY logic.menu (menu_id, descripcion, url, activo) FROM stdin;
\.


--
-- TOC entry 3785 (class 0 OID 850380)
-- Dependencies: 213
-- Data for Name: param; Type: TABLE DATA; Schema: logic; Owner: postgres
--

COPY logic.param (param_id, key, value, description) FROM stdin;
\.


--
-- TOC entry 3786 (class 0 OID 850386)
-- Dependencies: 214
-- Data for Name: sqlcommand; Type: TABLE DATA; Schema: logic; Owner: root
--

COPY logic.sqlcommand (id, createon, description, jsonparams, locked, name, sqlcommand, modifiedon) FROM stdin;
105	2020-12-08 23:21:05.937		342845	f	load_persona	342846	\N
110	2020-12-14 03:28:10.466		\N	f	find_principal	350559	\N
61	2018-02-24 17:32:52.403		\N	f	visitorslog	615800	\N
109	2020-12-10 01:27:05.389		342871	f	find_users	342872	\N
116	2024-04-26 11:14:24.441		819427	f	donaciones_voluntario	819428	\N
114	2024-04-19 11:04:49.496		821733	f	donationdetail	821734	\N
117	2024-05-10 06:41:34.919		821750	f	count_donations	821751	\N
118	2024-05-10 08:34:38.71		821762	f	soy_voluntario	821763	\N
119	2024-05-10 10:14:44.173		\N	f	inventario	821766	\N
120	2024-05-10 11:39:07.706		821817	f	solicituddetail	821818	\N
122	2024-05-16 05:24:57.544		\N	f	donacion	821877	\N
115	2024-04-19 11:27:06.656		821882	f	donacion_voluntarios	821883	\N
123	2024-05-28 06:18:10.794		\N	f	donaciones_recogidos	848776	\N
124	2024-05-28 07:02:36.18		848781	f	soy_voluntario_sol	848782	\N
121	2024-05-14 05:57:04.968		848783	f	results	848784	\N
125	2024-05-28 08:27:40.164		848786	f	resultsol	848787	\N
126	2024-06-04 06:14:30.248		851120	f	count_responsable	851121	\N
128	2024-06-04 06:44:46.651		851126	f	solicitud_voluntarios	851127	\N
127	2024-06-04 06:15:14.398		851130	f	count_responsablesol	851131	\N
\.


--
-- TOC entry 3788 (class 0 OID 850394)
-- Dependencies: 216
-- Data for Name: persona; Type: TABLE DATA; Schema: personas; Owner: root
--

COPY personas.persona (persona_id, paterno, materno, nombres, documento, fecha_nacimiento, email, celular, direccion, razon_social, nit, register, activo, filedata, genero, webpage, facebook, twitter, telefono, nacionalidad, profesion, about) FROM stdin;
\.


--
-- TOC entry 3789 (class 0 OID 850400)
-- Dependencies: 217
-- Data for Name: acude; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.acude (idorganizacionr, idbeneficiario) FROM stdin;
\.


--
-- TOC entry 3790 (class 0 OID 850403)
-- Dependencies: 218
-- Data for Name: administrador; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.administrador (idadministrador) FROM stdin;
\.


--
-- TOC entry 3791 (class 0 OID 850406)
-- Dependencies: 219
-- Data for Name: beneficiario; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.beneficiario (beneficiario_id, tipo, nombre, apellidos, email, direccion, telefono, celular, documento, registro) FROM stdin;
\.


--
-- TOC entry 3792 (class 0 OID 850412)
-- Dependencies: 220
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.categoria (categoria_id, descripcion) FROM stdin;
1	ROPA
2	ALIMENTOS
3	MUEBLES
4	ELECTRODOMESTICOS
5	JUGUETES
0	DINERO
186001502304500	Frutas
\.


--
-- TOC entry 3793 (class 0 OID 850415)
-- Dependencies: 221
-- Data for Name: comentario; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.comentario (idcomentario, fecha, idbeneficiario) FROM stdin;
\.


--
-- TOC entry 3794 (class 0 OID 850418)
-- Dependencies: 222
-- Data for Name: device; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.device (device_id, client_address, client_os, client_browser, user_agent, register, device, level, brand, last_login) FROM stdin;
3803373196037336	200.7.172.67	UnKnown, More-Info: okhttp/3.10.0	UnKnown, More-Info: okhttp/3.10.0	okhttp/3.10.0	2024-05-16 08:07:23.407	TECNO KJ7	0	TECNO	2024-05-16 09:21:12.91
3811693734570787	66.249.84.134	UnKnown, More-Info: okhttp/3.10.0	UnKnown, More-Info: okhttp/3.10.0	okhttp/3.10.0	2024-05-16 10:26:03.946	OnePlus8Pro	0	OnePlus	2024-05-16 10:29:40.323
76633554359300	192.168.0.11	UnKnown, More-Info: okhttp/3.10.0	UnKnown, More-Info: okhttp/3.10.0	okhttp/3.10.0	2024-05-16 05:14:39.367	M2101K6G	0	Xiaomi	2024-05-17 05:19:07.166
205595652994800	192.168.0.11	UnKnown, More-Info: okhttp/3.10.0	UnKnown, More-Info: okhttp/3.10.0	okhttp/3.10.0	2024-05-21 04:52:51.708	M2101K6G	0	Xiaomi	2024-05-21 05:07:37.354
\.


--
-- TOC entry 3795 (class 0 OID 850424)
-- Dependencies: 223
-- Data for Name: donacion; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.donacion (donacion_id, fecha, estado, responsable, persona, ubicacion, ciudad, registro) FROM stdin;
188208578723900	2024-05-11	PENDIENTE	Roberta Mamani	187088185061900	Av. Siempre viva 1500 Springfield	La Paz	2024-05-10 06:09:17.437
3802159801887893	2024-05-16	PENDIENTE	Pepe Mujica	991459927403600	Camacho Bueno 3445 La Paz	El Alto	2024-05-16 07:47:10.014
987738424048100	2024-05-10	PENDIENTE	Ramiro Benitez	985197009473700	Av. Siempre viva 1500 Springfield	La Paz	2024-05-07 04:03:46.797
991555606413100	2024-05-08	RECOGIDO	Juean Perz	991459927403600	Camacho Bueno 3445 La Paz	El Alto	2024-05-07 05:07:23.979
3805461759480803	2024-05-16	RECOGIDO	JOSSD	3805391685898901	Av 16 de Julio	La Paz	2024-05-16 08:42:11.971
3802960052732222	2024-05-16	RECOGIDO	\N	187088185061900	Av. Siempre viva 1500 Springfield	Santa Cruz	2024-05-16 08:00:30.264
3807241792799103	2024-05-18	RECOGIDO	Responsable Donador	3805391685898901	Av 16 de Julio	La Paz	2024-05-16 09:11:52.005
\.


--
-- TOC entry 3796 (class 0 OID 850430)
-- Dependencies: 224
-- Data for Name: donacion_detalle; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.donacion_detalle (donacion_detalle_id, categoria, cantidad, detalle, donacion) FROM stdin;
989597087335800	1	100	Poleras	987738424048100
989666253270200	0	1000	Efectivo bolivianos	987738424048100
991579077567600	3	10	Sillas	991555606413100
991598749390000	0	5000	Cheque en Bolivianos	991555606413100
991617059838600	2	20	Bolsas de fideo	991555606413100
188362688832400	0	5000	Efectivo bolivianos	188208578723900
188377840095600	1	100	Poleras de dino	188208578723900
3802210952694348	1	50	Deportivos	3802159801887893
3802231968459343	1	100	Zapatos	3802159801887893
3802984896590041	0	5000	En Bolivianos	3802960052732222
3805502524704687	0	1200	Efectivo bolivianos	3805461759480803
3805516875793225	4	2	Licuadora	3805461759480803
3805555507645045	1	10	Bolsa de Fideos 	3805461759480803
3807276310172738	1	12	rop1	3807241792799103
3807298418179640	2	12	Al1	3807241792799103
\.


--
-- TOC entry 3797 (class 0 OID 850433)
-- Dependencies: 225
-- Data for Name: donacion_voluntario; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.donacion_voluntario (donacion_voluntario_id, donacion, voluntario, responsable) FROM stdin;
201777155139900	188208578723900	193629154566200	f
3802310572966754	3802159801887893	193629154566200	f
3802310617647256	3802159801887893	193160921709700	f
3802310460771812	3802159801887893	80106625748200	t
3806288990112522	3805461759480803	80106625748200	f
3806288958650009	3805461759480803	3805291752314722	t
3807616232812263	3807241792799103	3805206531119013	f
3807616278499304	3807241792799103	3805291752314722	t
4407558017144584	3802960052732222	3805206531119013	f
4407558127750351	3802960052732222	80106625748200	f
4407558057789635	3802960052732222	3805291752314722	t
4982850252498026	987738424048100	80106625748200	f
4982850288718537	987738424048100	193629154566200	f
4982850210198001	987738424048100	3805291752314722	t
3806980053859514	3805461759480803	3805206531119013	t
4407527201030051	991555606413100	3805206531119013	f
4407527248705511	991555606413100	3805291752314722	f
4407527285771315	991555606413100	193629154566200	f
\.


--
-- TOC entry 3798 (class 0 OID 850436)
-- Dependencies: 226
-- Data for Name: donante; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.donante (donante_id, tipo, nombre, apellidos, email, direccion, telefono, celular, documento, registro) FROM stdin;
\.


--
-- TOC entry 3799 (class 0 OID 850442)
-- Dependencies: 227
-- Data for Name: evento; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.evento (evento_id, descripcion, fecha, ubicacion, ciudad, registro, responsable, observacion) FROM stdin;
1	Evento de recolección de Alimentos - Feria 16 de Julio	2024-03-17	Av 16 de Julio Zona 16 de Julio	El Alto	2024-03-15 10:51:40.576642	\N	\N
677435657177000	Donacion feria	2024-03-22	Feria de el Alto	El Alto	2024-03-22 08:41:19.181	\N	\N
685201071953400	Recolección de alimentos	2024-03-22	Calacotio San Miguel	La Paz	2024-03-22 10:50:44.596	Juan Perez	Este evento concluye a las 18:00
\.


--
-- TOC entry 3801 (class 0 OID 850450)
-- Dependencies: 229
-- Data for Name: norma; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.norma (norma_id, descripcion, filedata, registro) FROM stdin;
161159234226100	Reglamento de recolección de alimentos 2023	161159013913400	2024-03-28 17:13:36.868
56855602786800	Ley 1178	161159013913400	2024-03-27 12:15:13.807
56277149711000	Reglamento de donación de ropa	161159013913400	2024-03-27 12:05:35.353
56243792219000	Reglamento de donación de alimentos	161159013913400	2024-03-27 12:05:01.996
164829529866700	Ley 548	164829403283800	2024-03-28 18:14:47.164
\.


--
-- TOC entry 3802 (class 0 OID 850453)
-- Dependencies: 230
-- Data for Name: normaqueaplica; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.normaqueaplica (idnorma, iddonacion) FROM stdin;
\.


--
-- TOC entry 3803 (class 0 OID 850456)
-- Dependencies: 231
-- Data for Name: organizacionresponsable; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.organizacionresponsable (idorganizacionr, nombre, idadministrador) FROM stdin;
\.


--
-- TOC entry 3804 (class 0 OID 850459)
-- Dependencies: 232
-- Data for Name: organizae; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.organizae (idadministrador, idevento) FROM stdin;
\.


--
-- TOC entry 3805 (class 0 OID 850462)
-- Dependencies: 233
-- Data for Name: perfil; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.perfil (idperfil, idusuario) FROM stdin;
\.


--
-- TOC entry 3806 (class 0 OID 850465)
-- Dependencies: 234
-- Data for Name: persona; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.persona (persona_id, nombre, apellido, direccion, celular, tipo, email, fec_nacimiento, sexo, responsable, ci, nit, usr, pin, registro) FROM stdin;
985197009473700	José	Perez 	Av. Siempre viva 1500 Springfield	77788588	per	jose@email.com	2000-12-10	M	\N	13355556	\N	don	082478	2024-05-07 03:21:25.383
94595697160200	Oscar	Perez	Av. mateo gilen 1010, Lomas Cabas	74108520	per	oscar@lapaz.bo	2001-05-11	M	\N	3244444	\N	rep	007122	2024-05-09 04:09:04.547
187088185061900	Fundación Mercantil Santa Cruz	\N	Av. Siempre viva 1500 Springfield	5663331	org	fm@mecantil.bo	\N	\N	Helen Castillo	\N	333111	don	063080	2024-05-10 05:50:37.043
991459927403600	Fundación Arco Iris	\N	Camacho Bueno 3445 La Paz	8544666	org	admin@mercantil.com	\N	\N	Roberto Mendez	\N	23232323	don	052647	2024-05-07 05:05:48.3
3805391685898901	jossd	jossd	Av 16 de Julio	79182738	per	jossd@gmail.com	2001-10-12	M	\N	12347890	\N	don	028380	2024-05-16 08:41:01.897
3825560380934580	lorena priscila 	casas manrriquez	C. Catacora	75295988	per	lorenamanrriquez789@gmail.com	2001-10-31	F	\N	9166365	\N	don	053089	2024-05-16 14:17:10.592
4413409109231098	jossr	jossr	Zona Rio Seco	72619728	per	jossr@gmail.com	2001-03-13	M	\N	12345677	\N	rep	005513	2024-05-23 09:34:39.321
\.


--
-- TOC entry 3807 (class 0 OID 850471)
-- Dependencies: 235
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.producto (producto_id, descripcion, fechavencimiento, categoria, unidad, codigo) FROM stdin;
\.


--
-- TOC entry 3808 (class 0 OID 850474)
-- Dependencies: 236
-- Data for Name: recolectadonacion; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.recolectadonacion (idevento, iddonacion) FROM stdin;
\.


--
-- TOC entry 3809 (class 0 OID 850477)
-- Dependencies: 237
-- Data for Name: recursoseducativos; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.recursoseducativos (recursoseducativos_id, tipo, administrador, enlace, registro, descripcion) FROM stdin;
167298025784800	video	\N	http://www.youtube.com/watch?v=B5mxw6YHyok	2024-03-28 18:55:55.66	Video de alimentos
168482294743700	video	\N	https://www.youtube.com/watch?v=lP7iJf3Tgn8	2024-03-28 19:15:39.928	Video de comida chatarra
\.


--
-- TOC entry 3810 (class 0 OID 850483)
-- Dependencies: 238
-- Data for Name: registra; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.registra (idadministrador, iddonacion) FROM stdin;
\.


--
-- TOC entry 3811 (class 0 OID 850486)
-- Dependencies: 239
-- Data for Name: sesion; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.sesion (idsesion, fecha, hora) FROM stdin;
\.


--
-- TOC entry 3812 (class 0 OID 850492)
-- Dependencies: 240
-- Data for Name: solicitud; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.solicitud (solicitud_id, fecha, estado, responsable, persona, ubicacion, ciudad, registro) FROM stdin;
208123158583100	2024-05-10	PENDIENTE	Juean Perz	94595697160200	Av. mateo gilen 1010, Lomas Cabas	La Paz	2024-05-10 11:41:12.017
4413495180526268	2024-05-24	PENDIENTE	Jose jose	4413409109231098	Zona Rio Seco	La Paz	2024-05-23 09:36:05.392
4983147422537067	2024-05-14	PENDIENTE	jossr	4413409109231098	Zona Rio Seco	La Paz	2024-05-29 23:50:17.634
3804237813789849	2024-05-16	PENDIENTE	\N	94595697160200	Av. mateo gilen 1010, Lomas Cabas	El Alto	2024-05-16 08:21:48.025
\.


--
-- TOC entry 3813 (class 0 OID 850498)
-- Dependencies: 241
-- Data for Name: solicitud_detalle; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.solicitud_detalle (solicitud_detalle_id, categoria, cantidad, detalle, solicitud) FROM stdin;
208561944757900	2	100	Fideo en Bolsa	208123158583100
84071249998700	1	10	Poleras	208123158583100
253680844155500	2	20	Bolsas de fideo	4413495180526268
253684555278600	0	5000	Cheque en Bolivianos	4413495180526268
253687860936300	0	5000	En Bolivianos	4413495180526268
4983171372606311	0	5000	En Bolivianos	4983147422537067
4983177859857708	2	20	Bolsas de fideo	4983147422537067
4983181613439340	1	10	Bolsa de Fideos 	4983147422537067
\.


--
-- TOC entry 3814 (class 0 OID 850501)
-- Dependencies: 242
-- Data for Name: solicitud_voluntario; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.solicitud_voluntario (solicitud_voluntario_id, solicitud, voluntario, responsable) FROM stdin;
117160031567700	3804237813789849	80106625748200	t
255138616346900	4413495180526268	80106625748200	f
121445689812600	4413495180526268	193160921709700	t
\.


--
-- TOC entry 3572 (class 0 OID 849097)
-- Dependencies: 193
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- TOC entry 3816 (class 0 OID 850506)
-- Dependencies: 244
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.usuario (idusuario, rol, correo, clave, idpersona) FROM stdin;
\.


--
-- TOC entry 3817 (class 0 OID 850512)
-- Dependencies: 245
-- Data for Name: voluntario; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.voluntario (voluntario_id, nombre, apellido, email, direccion, celular, documento, registro) FROM stdin;
193629154566200	Pepin	Saavedra	hcastillom@fcpn.edu.bo	Av. Siempre viva 1500 Springfield	70511873	13342538	2024-05-10 07:39:38.013
193160921709700	Roberta	Rodriguez	roberta@eventos.com	Av. Trigales #5221 Gran pescado	71055551	10032222	2024-05-10 07:31:49.78
80106625748200	Manfred	Manito	manito@dncs.com	La era de Hielo	74185290	556677	2024-05-16 06:12:32.439
3805206531119013	jossv	jossv	jossv@gmail.com	Zona Rio Seco	76127829	12345678	2024-05-16 08:37:56.743
3805291752314722	jossvr	jossvr	jossvr@gmail.com	Av. Villazon #1290	68927837	78291029	2024-05-16 08:39:21.964
\.


--
-- TOC entry 3818 (class 0 OID 850518)
-- Dependencies: 246
-- Data for Name: vrecoge; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.vrecoge (iddonacion, idvoluntario) FROM stdin;
\.


--
-- TOC entry 3819 (class 0 OID 850521)
-- Dependencies: 247
-- Data for Name: vrecoged; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.vrecoged (iddonacion, idvoluntario) FROM stdin;
\.


--
-- TOC entry 3820 (class 0 OID 850524)
-- Dependencies: 248
-- Data for Name: accesslog; Type: TABLE DATA; Schema: security; Owner: root
--

COPY security.accesslog (accesslog_id, referer, url, client_address, client_os, client_browser, user_agent, body, register) FROM stdin;
524526777043000	http://localhost:8084/dncs/index	\N	127.0.0.1	Windows	Firefox-125.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:125.0) Gecko/20100101 Firefox/125.0	\N	2024-05-14 03:34:32.679
543457384671699	http://localhost:8084/dncs/index	\N	127.0.0.1	Windows	Firefox-125.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:125.0) Gecko/20100101 Firefox/125.0	\N	2024-05-14 08:50:03.287
77215968128300	http://localhost:8084/dncs/index	\N	127.0.0.1	Windows	Firefox-125.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:125.0) Gecko/20100101 Firefox/125.0	\N	2024-05-16 05:24:21.781
80148736759800	http://localhost:8084/dncs/index	\N	127.0.0.1	Windows	Firefox-125.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:125.0) Gecko/20100101 Firefox/125.0	\N	2024-05-16 06:13:14.549
80191585995100	http://localhost:8084/dncs/index	\N	127.0.0.1	Windows	Firefox-125.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:125.0) Gecko/20100101 Firefox/125.0	\N	2024-05-16 06:13:57.399
82963387376100	http://localhost:8084/dncs/index	\N	127.0.0.1	Windows	Firefox-125.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:125.0) Gecko/20100101 Firefox/125.0	\N	2024-05-16 07:00:09.2
84619618764300	http://localhost:8084/dncs/index	\N	127.0.0.1	Windows	Firefox-125.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:125.0) Gecko/20100101 Firefox/125.0	\N	2024-05-16 07:27:45.431
3801728540783794	http://54.39.98.5:8084/dncs/index	\N	181.188.160.4	Windows	Chrome-124.0.0.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	\N	2024-05-16 07:39:58.753
3802259576427937	http://54.39.98.5:8084/dncs/index	\N	181.188.160.4	Windows	Chrome-124.0.0.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	\N	2024-05-16 07:48:49.788
3802518174890363	http://54.39.98.5:8084/dncs/index	\N	181.188.160.4	Windows	Chrome-124.0.0.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	\N	2024-05-16 07:53:08.387
3803220354404067	http://54.39.98.5:8084/dncs/index	\N	181.188.160.4	Windows	Chrome-124.0.0.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	\N	2024-05-16 08:04:50.566
3803480626810662	http://54.39.98.5:8084/dncs/index	\N	200.7.172.67	Android	Chrome-124.0.0.0	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36	\N	2024-05-16 08:09:10.839
3803786887181400	http://54.39.98.5:8084/dncs/index	\N	200.7.172.111	Windows	Chrome-124.0.0.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	\N	2024-05-16 08:14:17.099
3803880699683530	http://54.39.98.5:8084/dncs/index	\N	181.188.160.4	Windows	Chrome-124.0.0.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	\N	2024-05-16 08:15:50.911
3804006783077268	http://54.39.98.5:8084/dncs/index	\N	181.188.160.4	Windows	Chrome-124.0.0.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	\N	2024-05-16 08:17:56.995
3804192665551217	http://54.39.98.5:8084/dncs/index	\N	181.188.160.4	Windows	Chrome-124.0.0.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	\N	2024-05-16 08:21:02.877
3805318490141254	http://54.39.98.5:8084/dncs/index	\N	200.7.172.111	Windows	Chrome-124.0.0.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	\N	2024-05-16 08:39:48.702
3805614002856864	http://54.39.98.5:8084/dncs/index	\N	200.7.172.111	Windows	Chrome-124.0.0.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	\N	2024-05-16 08:44:44.215
3805861105675395	http://54.39.98.5:8084/dncs/index	\N	200.7.172.111	Windows	Chrome-124.0.0.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	\N	2024-05-16 08:48:51.317
3805865083741066	http://54.39.98.5:8084/dncs/index	\N	143.137.113.4	Windows	Chrome-124.0.0.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	\N	2024-05-16 08:48:55.295
3805921798885750	http://54.39.98.5:8084/dncs/index	\N	200.7.172.111	Windows	Chrome-124.0.0.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	\N	2024-05-16 08:49:52.011
3806222052847329	http://54.39.98.5:8084/dncs/index	\N	200.7.172.111	Windows	Chrome-124.0.0.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	\N	2024-05-16 08:54:52.265
3806256902921534	http://54.39.98.5:8084/dncs/index	\N	200.7.172.111	Windows	Chrome-124.0.0.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	\N	2024-05-16 08:55:27.115
3806800619256069	http://54.39.98.5:8084/dncs/index	\N	181.115.131.251	Windows	Chrome-124.0.0.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	\N	2024-05-16 09:04:30.831
3806854157394218	http://54.39.98.5:8084/dncs/index	\N	181.115.131.251	Windows	Chrome-124.0.0.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	\N	2024-05-16 09:05:24.369
3806898352533297	http://54.39.98.5:8084/dncs/index	\N	181.115.131.251	Windows	Chrome-124.0.0.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	\N	2024-05-16 09:06:08.564
3807057296868272	http://54.39.98.5:8084/dncs/index	\N	181.115.131.251	Windows	Chrome-124.0.0.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	\N	2024-05-16 09:08:47.509
3807433486565877	http://54.39.98.5:8084/dncs/index	\N	181.115.131.251	Windows	Chrome-124.0.0.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	\N	2024-05-16 09:15:03.698
3807501886632369	http://54.39.98.5:8084/dncs/index	\N	181.115.131.251	Windows	Chrome-124.0.0.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	\N	2024-05-16 09:16:12.098
3807555928357241	http://54.39.98.5:8084/dncs/index	\N	181.115.131.251	Windows	Chrome-124.0.0.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	\N	2024-05-16 09:17:06.14
3825480182192742	http://54.39.98.5:8084/dncs/index	\N	200.7.172.74	Windows	Chrome-124.0.0.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	\N	2024-05-16 14:15:50.394
3932800569709589	http://54.39.98.5:8084/dncs/index	\N	181.188.160.4	Windows	Chrome-124.0.0.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	\N	2024-05-17 20:04:30.781
3932804653082310	http://54.39.98.5:8084/dncs/index	\N	143.137.113.5	Windows	Chrome-123.0.0.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36	\N	2024-05-17 20:04:34.865
4017947619359724	http://54.39.98.5:8084/dncs/index	\N	181.188.160.4	Windows	Firefox-125.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:125.0) Gecko/20100101 Firefox/125.0	\N	2024-05-18 19:43:37.831
4200249565436700	http://54.39.98.5:8084/dncs/index	\N	181.188.160.4	Windows	Firefox-125.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:125.0) Gecko/20100101 Firefox/125.0	\N	2024-05-20 22:21:59.777
4200254001352205	http://54.39.98.5:8084/dncs/index	\N	181.188.160.4	Windows	Firefox-125.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:125.0) Gecko/20100101 Firefox/125.0	\N	2024-05-20 22:22:04.213
4200292507203043	http://54.39.98.5:8084/dncs/index	\N	181.188.160.4	Windows	Firefox-127.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0	\N	2024-05-20 22:22:42.719
4200401509151569	http://54.39.98.5:8084/dncs/index	\N	181.188.160.4	Windows	Firefox-127.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0	\N	2024-05-20 22:24:31.721
4200452680927546	http://54.39.98.5:8084/dncs/index	\N	181.188.160.4	Windows	Firefox-125.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:125.0) Gecko/20100101 Firefox/125.0	\N	2024-05-20 22:25:22.893
184232882526600	http://localhost:8084/dncs/index	\N	127.0.0.1	Windows	Firefox-125.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:125.0) Gecko/20100101 Firefox/125.0	\N	2024-05-20 22:56:48.937
4236504837047545	http://54.39.98.5:8084/dncs/index	\N	181.115.143.17	Android	Chrome-125.0.0.0	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36	\N	2024-05-21 08:26:15.049
4407473518091386	http://54.39.98.5:8084/dncs/index	\N	45.163.19.242	Android	Chrome-125.0.0.0	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36	\N	2024-05-23 07:55:43.73
4407682609885996	http://54.39.98.5:8084/dncs/index	\N	45.163.19.242	Android	Chrome-125.0.0.0	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36	\N	2024-05-23 07:59:12.822
4413169455995884	http://54.39.98.5:8084/dncs/index	\N	181.115.143.214	Windows	Chrome-124.0.0.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	\N	2024-05-23 09:30:39.668
4413367066654235	http://54.39.98.5:8084/dncs/index	\N	181.115.143.214	Windows	Chrome-124.0.0.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	\N	2024-05-23 09:33:57.278
4413570612315520	http://54.39.98.5:8084/dncs/index	\N	181.115.143.214	Windows	Chrome-124.0.0.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	\N	2024-05-23 09:37:20.824
250907318043800	http://localhost:8084/dncs/index	\N	127.0.0.1	Windows	Firefox-126.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0	\N	2024-05-28 06:01:24.121
251201795325800	http://localhost:8084/dncs/index	\N	127.0.0.1	Windows	Firefox-126.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0	\N	2024-05-28 06:06:18.598
253721385006300	http://localhost:8084/dncs/index	\N	127.0.0.1	Windows	Firefox-126.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0	\N	2024-05-28 06:48:18.187
253821269303500	http://localhost:8084/dncs/index	\N	127.0.0.1	Windows	Firefox-126.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0	\N	2024-05-28 06:49:58.072
4842422158541683	http://54.39.98.5:8084/dncs/index	\N	177.222.61.125	Windows	Firefox-126.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0	\N	2024-05-28 08:44:52.37
4842550088260014	http://54.39.98.5:8084/dncs/index	\N	177.222.61.125	Windows	Firefox-126.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0	\N	2024-05-28 08:47:00.3
4842715742351156	http://54.39.98.5:8084/dncs/index	\N	177.222.61.125	Windows	Firefox-126.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0	\N	2024-05-28 08:49:45.954
4913830491419890	http://54.39.98.5:8084/dncs/index	\N	177.222.61.125	Windows	Firefox-127.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0	\N	2024-05-29 04:35:00.703
4979556697236376	http://54.39.98.5:8084/dncs/index	\N	177.222.61.125	Windows	Firefox-126.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0	\N	2024-05-29 22:50:26.909
4979574025320812	http://54.39.98.5:8084/dncs/index	\N	181.115.171.158	Windows	Chrome-125.0.0.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36	\N	2024-05-29 22:50:44.237
4980238688548345	http://54.39.98.5:8084/dncs/index	\N	177.222.61.125	Windows	Firefox-126.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0	\N	2024-05-29 23:01:48.9
4980311856807714	http://54.39.98.5:8084/dncs/index	\N	181.115.171.158	Windows	Chrome-125.0.0.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36	\N	2024-05-29 23:03:02.069
4982247971770869	http://54.39.98.5:8084/dncs/index	\N	181.115.171.158	Windows	Chrome-125.0.0.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36	\N	2024-05-29 23:35:18.184
4982294459595443	http://54.39.98.5:8084/dncs/index	\N	181.115.171.158	Windows	Chrome-125.0.0.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36	\N	2024-05-29 23:36:04.671
4983009356531384	http://54.39.98.5:8084/dncs/index	\N	181.115.171.158	Windows	Chrome-125.0.0.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36	\N	2024-05-29 23:47:59.568
4983125027178012	http://54.39.98.5:8084/dncs/index	\N	181.115.171.158	Windows	Chrome-125.0.0.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36	\N	2024-05-29 23:49:55.239
117231807009600	http://localhost:8084/dncs/index	\N	127.0.0.1	Windows	Firefox-126.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0	\N	2024-06-04 06:03:36.561
121208127650100	http://localhost:8084/dncs/index	\N	127.0.0.1	Windows	Firefox-126.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0	\N	2024-06-04 07:09:52.882
121295104417000	http://localhost:8084/dncs/index	\N	127.0.0.1	Windows	Firefox-126.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0	\N	2024-06-04 07:11:19.859
121404799448200	http://localhost:8084/dncs/index	\N	127.0.0.1	Windows	Firefox-126.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0	\N	2024-06-04 07:13:09.554
121469665641300	http://localhost:8084/dncs/index	\N	127.0.0.1	Windows	Firefox-126.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0	\N	2024-06-04 07:14:14.42
498302197291000	http://localhost:8084/dncs/index	\N	127.0.0.1	Windows	Firefox-127.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0	\N	2024-07-04 04:04:34.367
498706978666500	http://localhost:8084/dncs/index	\N	127.0.0.1	Windows	Firefox-127.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0	\N	2024-07-04 04:11:19.149
502183110299500	http://localhost:8084/dncs/index	\N	127.0.0.1	Windows	Firefox-127.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0	\N	2024-07-04 05:09:15.281
503172079729900	http://localhost:8084/dncs/index	\N	127.0.0.1	Windows	Firefox-127.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0	\N	2024-07-04 05:25:44.25
503181828697400	http://localhost:8084/dncs/index	\N	127.0.0.1	Windows	Firefox-127.0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0	\N	2024-07-04 05:25:53.999
\.


--
-- TOC entry 3821 (class 0 OID 850530)
-- Dependencies: 249
-- Data for Name: usuario; Type: TABLE DATA; Schema: security; Owner: root
--

COPY security.usuario (usuario_id, activo, nombre, apellido, cargo, direccion, email, rol, usuario, clave, principal) FROM stdin;
29237168650400	t	Einar	Tapia	principal	\N	admin@dncs.com	admin	admin@dncs.com	eb06b9db06012a7a4179b8f3cb5384d3	29117463963100
985197304061900	t	José	Perez 	principal	\N	jose@email.com	donante	jose@email.com	be9fb4afe3d547b7af68004fee4056bb	985197009473700
94595910178200	t	Oscar	Perez	principal	\N	oscar@lapaz.bo	receptor	oscar@lapaz.bo	9ad53e194d64d6373843f949c7b576da	94595697160200
187088492782000	t	Fundación Mercantil Santa Cruz	\N	principal	\N	fm@mecantil.bo	donante	fm@mecantil.bo	95a7916c32be72cdbea3f2d79d937fae	187088185061900
80106820230100	t	Manfred	Manito	sistema	\N	manito@dncs.com	voluntario	manito	76f52b9972e8f9fb2de4a27ce1a31cdf	80106625748200
193629390069700	t	Pepin	Saavedra	sistema	\N	hcastillom@fcpn.edu.bo	voluntario	hcastillom	416cd2ddaaa3a958bf4d2680d86c22f4	193629154566200
991460118676800	t	Fundación Arco Iris	\N	principal	\N	admin@mercantil.com	donante	admin@mercantil.com	34348d272042883f0edc36db9634e189	991459927403600
3805206585455978	t	jossv	jossv	sistema	\N	jossv@gmail.com	voluntario	jossv	9d1ad17b0079e2e7c87860d5bdeab1ca	3805206531119013
3805291803934928	t	jossvr	jossvr	sistema	\N	jossvr@gmail.com	voluntario	jossvr	3c934bdf8788547ea9b917082e72ea5d	3805291752314722
3805391742809879	t	jossd	jossd	principal	\N	jossd@gmail.com	donante	jossd@gmail.com	925af2d8477fde82b855c6cb4c714393	3805391685898901
3825560432119812	t	lorena priscila 	casas manrriquez	principal	\N	lorenamanrriquez789@gmail.com	donante	lorenamanrriquez789@gmail.com	5dbdd0fb446989be7e84a4033930428b	3825560380934580
4413409173902654	t	jossr	jossr	principal	\N	jossr@gmail.com	receptor	jossr@gmail.com	2876a1519f7bc5830c8ec5eca09e78ec	4413409109231098
193161193066500	t	Roberta	Rodriguez	sistema	\N	roberta@eventos.com	voluntario	roberta	76f52b9972e8f9fb2de4a27ce1a31cdf	193160921709700
\.


--
-- TOC entry 3822 (class 0 OID 850536)
-- Dependencies: 250
-- Data for Name: jornal_audit; Type: TABLE DATA; Schema: transaction; Owner: postgres
--

COPY transaction.jornal_audit (jornal_audit_id, usuario, http, esquema, tabla, id_row, accion, fecha_accion) FROM stdin;
\.


--
-- TOC entry 4723 (class 0 OID 0)
-- Dependencies: 215
-- Name: sqlcommand_id_seq; Type: SEQUENCE SET; Schema: logic; Owner: root
--

SELECT pg_catalog.setval('logic.sqlcommand_id_seq', 128, true);


--
-- TOC entry 4724 (class 0 OID 0)
-- Dependencies: 228
-- Name: item_tarea_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.item_tarea_id_seq', 21, true);


--
-- TOC entry 4725 (class 0 OID 0)
-- Dependencies: 243
-- Name: temp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.temp_id_seq', 13, true);


--
-- TOC entry 4714 (class 0 OID 0)
-- Data for Name: BLOBS; Type: BLOBS; Schema: -; Owner: -
--

BEGIN;

SELECT pg_catalog.lo_open('20739', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374200a2020202063642e2a2c20702e2a0a202066726f6d2063726d2e636f74697a6163696f6e5f646574616c6c652063642c2062616368656f2e70726f647563746f20700a77686572652063642e636f74697a6163696f6e203d203a7169640a616e642063642e70726f647563746f203d20702e70726f647563746f5f69640a6f72646572206279206465736372697063696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('20740', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22716964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('20741', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374200a2020202063642e2a2c20702e2a0a202066726f6d2063726d2e636f74697a6163696f6e5f646574616c6c652063642c2062616368656f2e70726f647563746f20700a77686572652063642e636f74697a6163696f6e203d203a7169640a616e642063642e70726f647563746f203d20702e70726f647563746f5f69640a6f72646572206279206465736372697063696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('33964', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226f6964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('33965', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374200a2020202070642e2a2c20702e2a0a202066726f6d2062616368656f2e70656469646f5f646574616c6c652070642c2062616368656f2e70726f647563746f20700a77686572652070642e70656469646f203d203a6f69640a616e642070642e70726f647563746f203d20702e70726f647563746f5f69640a6f72646572206279206465736372697063696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('33966', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226f6964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('33967', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226f6964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('33968', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374200a2020202063642e2a0a202066726f6d2062616368656f2e70656469646f5f646574616c6c652070640a77686572652070642e70656469646f203d203a6f69640a616e642070642e70726f647563746f206973206e756c6c0a6f7264657220627920646574616c6c65');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('33969', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226f6964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('33970', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374200a2020202070642e2a0a202066726f6d2062616368656f2e70656469646f5f646574616c6c652070640a77686572652070642e70656469646f203d203a6f69640a616e642070642e70726f647563746f206973206e756c6c0a6f7264657220627920646574616c6c65');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('33989', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226f6964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('33990', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2062616368656f2e666163747572610a77686572652070656469646f203d203a6f69640a6f7264657220627920726567697374726f2064657363');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('33991', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22666964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('33992', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22666964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('33993', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c6563742066642e2a2c2070642e2a2c0a20202863617365207768656e2070642e70726f647563746f206973206e756c6c207468656e2070642e646574616c6c6520656c7365202873656c656374206465736372697063696f6e2066726f6d2062616368656f2e70726f647563746f2077686572652070726f647563746f5f6964203d2070642e70726f647563746f2920656e64292c0a20202863617365207768656e2070642e70726f647563746f206973206e6f74206e756c6c207468656e202873656c65637420756e696461642066726f6d2062616368656f2e70726f647563746f2077686572652070726f647563746f5f6964203d2070642e70726f647563746f2920656e642920200a202066726f6d2062616368656f2e666163747572615f646574616c6c652066642c2062616368656f2e70656469646f5f646574616c6c652070640a77686572652066642e66616374757261203d203a6669640a616e642066642e70656469646f5f646574616c6c65203d2070642e70656469646f5f646574616c6c655f6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('34007', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226f6964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('34008', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226f6964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('34009', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c6563742070642e2a2c0a202873656c656374206465736372697063696f6e2066726f6d2062616368656f2e7469706f5f7061676f207768657265207469706f5f7061676f5f6964203d2070642e7469706f5f7061676f292c0a202873656c656374206375656e74612066726f6d2062616368656f2e7469706f5f7061676f207768657265207469706f5f7061676f5f6964203d2070642e7469706f5f7061676f2920200a2066726f6d2062616368656f2e70656469646f5f6465706f7369746f2070640a2077686572652070656469646f203d203a6f69640a206f7264657220627920726567697374726f2064657363');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('34227', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420636f616c657363652873756d2863616e7469646164292c20636173742827302720617320646f75626c6520707265636973696f6e29292061732073756d2066726f6d2062616368656f2e70656469646f5f646574616c6c650a77686572652070726f647563746f203d203a706964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('34228', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22706964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('34229', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420636f616c657363652873756d2863616e7469646164292c20636173742827302720617320646f75626c6520707265636973696f6e29292061732073756d2066726f6d2062616368656f2e70656469646f5f646574616c6c650a77686572652070726f647563746f203d203a706964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('34230', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420636f616c657363652873756d2863616e7469646164292c20636173742827302720617320646f75626c6520707265636973696f6e29292061732073756d2066726f6d2062616368656f2e73746f636b0a77686572652070726f647563746f203d203a706964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('34231', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22706964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('34232', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420636f616c657363652873756d2863616e7469646164292c20636173742827302720617320646f75626c6520707265636973696f6e29292061732073756d2066726f6d2062616368656f2e73746f636b0a77686572652070726f647563746f203d203a706964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('34237', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22706964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('34238', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c6563742070642e2a2c20702e2a2c20632e6e6f6d6272652c20632e6170656c6c69646f2066726f6d2062616368656f2e70656469646f5f646574616c6c652070642c2062616368656f2e70656469646f20702c2063726d2e636c69656e746520630a77686572652070642e70726f647563746f203d203a7069640a616e6420702e70656469646f5f6964203d2070642e70656469646f0a616e6420702e636c69656e7465203d20632e636c69656e74655f69640a6f7264657220627920726567697374726f2064657363');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('34239', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22706964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('34240', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c6563742070642e2a2c20702e2a2c20632e6e6f6d6272652c20632e6170656c6c69646f2066726f6d2062616368656f2e70656469646f5f646574616c6c652070642c2062616368656f2e70656469646f20702c2063726d2e636c69656e746520630a77686572652070642e70726f647563746f203d203a7069640a616e6420702e70656469646f5f6964203d2070642e70656469646f0a616e6420702e636c69656e7465203d20632e636c69656e74655f69640a6f7264657220627920726567697374726f20646573630a6c696d6974203530');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('34241', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22706964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('34242', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2062616368656f2e73746f636b0a77686572652070726f647563746f203d203a7069640a6f7264657220627920726567697374726f20646573630a6c696d6974203530');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('34243', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22636964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('34244', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c6563742070642e2a2c20702e2a2066726f6d2062616368656f2e70656469646f5f646574616c6c652070642c2062616368656f2e70656469646f20700a776865726520702e636c69656e7465203d203a6369640a616e6420702e70656469646f5f6964203d2070642e70656469646f0a6f7264657220627920726567697374726f2064657363');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('34263', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420636f616c657363652873756d2863616e74696461642a70726563696f5f66696e616c292c20636173742827302720617320646f75626c6520707265636973696f6e292920617320746f74616c2066726f6d2062616368656f2e70656469646f5f646574616c6c65');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('36428', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374206d756e69636970696f5f69642c20646570657274616d656e746f2c2070726f76696e6369612c206d756e69636970696f2c206361706974616c2066726f6d2067656f646174612e6d756e69636970696f0a6f72646572206279206d756e69636970696f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('36429', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374206d756e69636970696f5f69642c20646570617274616d656e746f2c2070726f76696e6369612c206d756e69636970696f2c206361706974616c2066726f6d2067656f646174612e6d756e69636970696f0a6f72646572206279206d756e69636970696f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('36751', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22636964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('36752', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c6563742070642e2a2c20702e2a2066726f6d2062616368656f2e70656469646f5f646574616c6c652070642c2062616368656f2e70656469646f20700a776865726520702e636c69656e7465203d203a6369640a616e6420702e70656469646f5f6964203d2070642e70656469646f0a6f7264657220627920636f6469676f2c20726567697374726f2064657363');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('36753', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22636964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('36754', 131072);
SELECT pg_catalog.lowrite(0, '\x202073656c6563742070642e2a2c20702e2a2c200a20202873656c656374206465736372697063696f6e2066726f6d2062616368656f2e70726f647563746f2077686572652070726f647563746f5f6964203d2070642e70726f647563746f292c200a20202873656c65637420756e696461642066726f6d2062616368656f2e70726f647563746f2077686572652070726f647563746f5f6964203d2070642e70726f647563746f29200a202066726f6d2062616368656f2e70656469646f5f646574616c6c652070642c2062616368656f2e70656469646f20700a776865726520702e636c69656e7465203d203a6369640a616e6420702e70656469646f5f6964203d2070642e70656469646f0a6f7264657220627920636f6469676f2c20726567697374726f2064657363');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('39260', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226f6964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('39261', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226f6964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('39262', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2062616368656f2e70656469646f5f656e74726567610a77686572652070656469646f203d203a6f69640a6f7264657220627920726567697374726f2064657363');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('39294', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c6563742070652e2a2c20702e2a2c20632e2a2066726f6d2062616368656f2e70656469646f5f656e74726567612070652c2062616368656f2e70656469646f20702c2063726d2e636c69656e746520630a77686572652070652e70656469646f203d20702e70656469646f5f69640a616e6420702e636c69656e7465203d20632e636c69656e74655f69640a6f726465722062792066656368615f656e747265676120617363');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('39295', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c6563742070652e2a2c20632e2a2066726f6d2062616368656f2e70656469646f5f656e74726567612070652c2062616368656f2e70656469646f20702c2063726d2e636c69656e746520630a77686572652070652e70656469646f203d20702e70656469646f5f69640a616e6420702e636c69656e7465203d20632e636c69656e74655f69640a6f726465722062792066656368615f656e747265676120617363');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('39296', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c6563742070652e2a2c200a632e6e6f6d6272652c20632e6170656c6c69646f2066726f6d2062616368656f2e70656469646f5f656e74726567612070652c2062616368656f2e70656469646f20702c2063726d2e636c69656e746520630a77686572652070652e70656469646f203d20702e70656469646f5f69640a616e6420702e636c69656e7465203d20632e636c69656e74655f69640a6f726465722062792066656368615f656e747265676120617363');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('39297', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c6563742070652e2a2c200a632e6e6f6d6272652c20632e6170656c6c69646f2c20632e636c69656e74655f69642066726f6d2062616368656f2e70656469646f5f656e74726567612070652c2062616368656f2e70656469646f20702c2063726d2e636c69656e746520630a77686572652070652e70656469646f203d20702e70656469646f5f69640a616e6420702e636c69656e7465203d20632e636c69656e74655f69640a6f726465722062792066656368615f656e747265676120617363');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('51946', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226f6964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('51947', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226f6964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('51948', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374200a2020202070702e2a2c20702e2a0a202066726f6d2062616368656f2e70656469646f5f70726f647563746f2070702c2062616368656f2e70726f647563746f20700a77686572652070702e70656469646f203d203a6f69640a616e642070702e70726f647563746f203d20702e70726f647563746f5f69640a6f72646572206279206465736372697063696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('57761', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374200a2020202070742e2a0a202066726f6d2062616368656f2e70656469646f5f7472616e73706f7274652070740a77686572652070742e70656469646f203d203a6f6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('57762', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226f6964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('57763', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374200a2020202070742e2a0a202066726f6d2062616368656f2e70656469646f5f7472616e73706f7274652070740a77686572652070742e70656469646f203d203a6f6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('57764', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226f6964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('57765', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374200a2020202070742e2a0a202066726f6d2062616368656f2e70656469646f5f7472616e73706f7274652070740a77686572652070742e70656469646f203d203a6f6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('60707', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374200a2020202063642e2a0a202066726f6d2063726d2e636f74697a6163696f6e5f646574616c6c652063640a77686572652063642e636f74697a6163696f6e203d203a7169640a6f7264657220627920646574616c6c65');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('60708', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22716964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('60709', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374200a2020202063642e2a0a202066726f6d2063726d2e636f74697a6163696f6e5f646574616c6c652063640a77686572652063642e636f74697a6163696f6e203d203a7169640a6f7264657220627920646574616c6c65');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('60710', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22716964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('60711', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374200a2020202063642e2a0a202066726f6d2063726d2e636f74697a6163696f6e5f646574616c6c652063640a77686572652063642e636f74697a6163696f6e203d203a7169640a6f7264657220627920646574616c6c65');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('60712', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22716964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('60713', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374200a2020202063642e2a0a202066726f6d2063726d2e636f74697a6163696f6e5f646574616c6c652063640a77686572652063642e636f74697a6163696f6e203d203a7169640a616e642063642e70726f647563746f206973206e756c6c0a6f7264657220627920646574616c6c65');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('80887', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2267756961222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('80888', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2267756961222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('80889', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2062616368656f2e677569615f646f63756d656e746f0a77686572652067756961203d203a67756961');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('80983', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2270726f64756374222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('80984', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2270726f64756374222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('80985', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2062616368656f2e73746f636b0a77686572652070726f647563746f203d203a70726f647563740a6f7264657220627920726567697374726f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('80986', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420636f616c657363652873756d2863616e7469646164292c20636173742827302720617320646f75626c6520707265636973696f6e29292061732073756d2066726f6d2062616368656f2e70656469646f5f646574616c6c650a77686572652073746f636b203d203a73746f636b');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('80987', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2273746f636b222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('80988', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420636f616c657363652873756d2863616e7469646164292c20636173742827302720617320646f75626c6520707265636973696f6e29292061732073756d2066726f6d2062616368656f2e70656469646f5f646574616c6c650a77686572652073746f636b203d203a73746f636b');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('80989', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2273746f636b222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('80990', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420636f616c657363652873756d2863616e7469646164292c20636173742827302720617320646f75626c6520707265636973696f6e29292061732073756d2066726f6d2062616368656f2e70656469646f5f646574616c6c650a77686572652073746f636b203d203a73746f636b');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('80991', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2270726f64756374222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('80992', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420732e2a2c0a2873656c65637420636f616c657363652873756d2863616e7469646164292c20636173742827302720617320646f75626c6520707265636973696f6e29292061732073756d2066726f6d2062616368656f2e70656469646f5f646574616c6c650a77686572652073746f636b203d20732e73746f636b5f6964290a66726f6d2062616368656f2e73746f636b20730a77686572652070726f647563746f203d203a70726f647563740a6f7264657220627920726567697374726f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('80993', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22706964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('80994', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420732e2a2c0a2873656c65637420636f616c657363652873756d2863616e7469646164292c20636173742827302720617320646f75626c6520707265636973696f6e29292061732073756d2066726f6d2062616368656f2e70656469646f5f646574616c6c650a77686572652073746f636b203d20732e73746f636b5f6964290a66726f6d2062616368656f2e73746f636b20730a77686572652070726f647563746f203d203a7069640a6f7264657220627920726567697374726f20646573630a6c696d6974203530');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('80995', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22706964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('80996', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420732e2a2c0a2873656c65637420636f616c657363652873756d2863616e7469646164292c20636173742827302720617320646f75626c6520707265636973696f6e29292061732073756d2066726f6d2062616368656f2e70656469646f5f646574616c6c650a77686572652073746f636b203d20732e73746f636b5f6964290a66726f6d2062616368656f2e73746f636b20730a77686572652070726f647563746f203d203a7069640a6f7264657220627920726567697374726f20646573630a6c696d6974203530');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('80997', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2270726f64756374222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('80998', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420732e2a2c0a2873656c65637420636f616c657363652873756d2863616e7469646164292c20636173742827302720617320646f75626c6520707265636973696f6e29292061732073756d2066726f6d2062616368656f2e70656469646f5f646574616c6c650a77686572652073746f636b203d20732e73746f636b5f6964290a66726f6d2062616368656f2e73746f636b20730a77686572652070726f647563746f203d203a70726f647563740a616e642063616e7469646164203e2073756d0a6f7264657220627920726567697374726f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('80999', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2270726f64756374222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('81000', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420732e2a2c0a2873656c65637420636f616c657363652873756d2863616e7469646164292c20636173742827302720617320646f75626c6520707265636973696f6e29292061732073756d2066726f6d2062616368656f2e70656469646f5f646574616c6c650a77686572652073746f636b203d20732e73746f636b5f6964290a66726f6d2062616368656f2e73746f636b20730a77686572652070726f647563746f203d203a70726f647563740a616e6420732e63616e7469646164203e2073756d0a6f7264657220627920726567697374726f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('81001', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2270726f64756374222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('81002', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420732e2a2c0a2873656c65637420636f616c657363652873756d2863616e7469646164292c20636173742827302720617320646f75626c6520707265636973696f6e29292061732073756d2066726f6d2062616368656f2e70656469646f5f646574616c6c650a77686572652073746f636b203d20732e73746f636b5f6964292061732073756d0a66726f6d2062616368656f2e73746f636b20730a77686572652070726f647563746f203d203a70726f647563740a616e6420732e63616e7469646164203e2073756d0a6f7264657220627920726567697374726f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('81003', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2270726f64756374222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('81004', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d200a2873656c65637420732e2a2c0a2873656c65637420636f616c657363652873756d2863616e7469646164292c20636173742827302720617320646f75626c6520707265636973696f6e29292061732073756d2066726f6d2062616368656f2e70656469646f5f646574616c6c650a77686572652073746f636b203d20732e73746f636b5f6964292061732073756d0a66726f6d2062616368656f2e73746f636b20730a77686572652070726f647563746f203d203a70726f647563740a6f7264657220627920726567697374726f2920730a776865726520732e63616e7469646164203e20732e73756d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('107629', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c6563742063617374286d6178286e756d65726f2920617320696e746567657229206173206d6178696d6f2066726f6d2062616368656f2e67756961');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('120785', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374206d6178286e756d65726f29206173206d6178696d6f2066726f6d2062616368656f2e67756961');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('120786', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374206d6178286e756d65726f29206173206d6178696d6f2066726f6d2063726d2e636f74697a6163696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('123158', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22716964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('123159', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374200a2020202063642e2a2c20702e2a0a202066726f6d2063726d2e636f74697a6163696f6e5f646574616c6c652063642c2063726d2e70726f647563746f20700a77686572652063642e636f74697a6163696f6e203d203a7169640a616e642063642e70726f647563746f203d20702e70726f647563746f5f69640a6f72646572206279206465736372697063696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('123160', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22716964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('123161', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374200a2020202063642e2a2c20702e2a0a202066726f6d2063726d2e636f74697a6163696f6e5f646574616c6c652063642c2063726d2e70726f647563746f20700a77686572652063642e636f74697a6163696f6e203d203a7169640a616e642063642e70726f647563746f203d20702e70726f647563746f5f69640a6f72646572206279206465736372697063696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('123162', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22716964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('123163', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374200a2020202063642e2a2c20702e636f6469676f2c20702e6465736372697063696f6e2c20702e70726563696f2c20702e6d6f6e6564612c20702e6e6f74610a202066726f6d2063726d2e636f74697a6163696f6e5f646574616c6c652063642c2063726d2e70726f647563746f20700a77686572652063642e636f74697a6163696f6e203d203a7169640a616e642063642e70726f647563746f203d20702e70726f647563746f5f69640a6f72646572206279206465736372697063696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('131828', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22636f74697a6163696f6e222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('131829', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22636f74697a6163696f6e222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('131830', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374206e2e2a2c20636e2e636f74697a6163696f6e5f6e6f7461735f69642066726f6d2063726d2e6e6f7461206e206c656674206a6f696e200a2873656c656374202a2066726f6d2063726d2e636f74697a6163696f6e5f6e6f74617320776865726520636f74697a6163696f6e203d203a636f74697a6163696f6e2920636e0a6f6e20636e2e6e6f7461203d206e2e6e6f74615f69640a6f72646572206279206f7264656e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('134207', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2062616368656f2e70726f647563746f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('134208', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2062616368656f2e70726f647563746f0a77686574652061637469766f0a6f72646572206279206465736372697063696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('134209', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2062616368656f2e70726f647563746f0a77686572652061637469766f0a6f72646572206279206465736372697063696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('134210', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2270726f64756374222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('134211', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d200a2873656c65637420732e2a2c0a2873656c65637420636f616c657363652873756d2863616e7469646164292c20636173742827302720617320646f75626c6520707265636973696f6e29292061732073756d2066726f6d2062616368656f2e70656469646f5f646574616c6c650a77686572652073746f636b203d20732e73746f636b5f6964292061732073756d0a66726f6d2062616368656f2e73746f636b20730a77686572652070726f647563746f203d203a70726f647563740a6f72646572206279206e726f5f6c6f74652920730a776865726520732e63616e7469646164203e20732e73756d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('134212', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2270726f64756374222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('134213', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d200a2873656c65637420732e2a2c0a2873656c65637420636f616c657363652873756d2863616e7469646164292c20636173742827302720617320646f75626c6520707265636973696f6e29292061732073756d2066726f6d2062616368656f2e70656469646f5f646574616c6c650a77686572652073746f636b203d20732e73746f636b5f6964292061732073756d0a66726f6d2062616368656f2e73746f636b20730a77686572652070726f647563746f203d203a70726f647563740a6f7264657220627920726567697374726f2920730a776865726520732e63616e7469646164203e20732e73756d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('134214', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2270726f64756374222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('134215', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2270726f64756374222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('134216', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d200a2873656c65637420732e2a2c0a2873656c65637420636f616c657363652873756d2863616e7469646164292c20636173742827302720617320646f75626c6520707265636973696f6e29292061732073756d2066726f6d2062616368656f2e70656469646f5f646574616c6c650a77686572652073746f636b203d20732e73746f636b5f6964292061732073756d0a66726f6d2062616368656f2e73746f636b20730a77686572652070726f647563746f203d203a70726f647563740a6f72646572206279206e726f5f6c6f7465292073');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('134222', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226c6f7465222c2274797065436c617373223a22696e7465676572222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('134223', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226c6f7465222c2274797065436c617373223a22696e7465676572222c226465736372697074696f6e223a22227d2c7b226e616d65223a2270726f64756374222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('134224', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226c6f7465222c2274797065436c617373223a22696e7465676572222c226465736372697074696f6e223a22227d2c7b226e616d65223a2270726f64756374222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('134225', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2062616368656f2e73746f636b0a7768657265206e726f5f6c6f7465203d203a6c6f74650a616e642070726f647563746f203d203a70726f64756374');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('134226', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226c6f7465222c2274797065436c617373223a22696e7465676572222c226465736372697074696f6e223a22227d2c7b226e616d65223a2270726f64756374222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('134227', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2062616368656f2e73746f636b0a7768657265206e726f5f6c6f7465203d203a6c6f74650a616e642070726f647563746f203d203a70726f64756374');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('158534', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a0a46524f4d2062682e6375656e63610a57484552452066696c655f706f736974696f6e203d203a66696c655f706f736974696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('158535', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a0a46524f4d2062682e6375656e63610a57484552452066696c655f706f736974696f6e203d203a66696c655f706f736974696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('158536', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a0a46524f4d2062682e6375656e63610a57484552452066696c655f706f736974696f6e203d203a66696c655f706f736974696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('158537', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a0a46524f4d2062682e6375656e63610a57484552452066696c655f706f736974696f6e203d203a66696c655f706f736974696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('158538', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a0a46524f4d2062682e6375656e63610a57484552452066696c655f706f736974696f6e203d203a66696c655f706f736974696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('158539', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a0a46524f4d2062682e6375656e63610a57484552452066696c655f706f736974696f6e203d203a66696c655f706f736974696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('158540', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2266696c655f706f736974696f6e222c2274797065436c617373223a22696e7465676572222c226465736372697074696f6e223a2246696c6520706f736974696f6e227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('158541', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a0a46524f4d2062682e6375656e63610a57484552452066696c655f706f736974696f6e203d203a66696c655f706f736974696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('158542', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2266696c655f706f736974696f6e222c2274797065436c617373223a22696e7465676572222c226465736372697074696f6e223a2246696c6520706f736974696f6e227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('158543', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a0a46524f4d2062682e6375656e63610a57484552452066696c655f706f736974696f6e203d203a66696c655f706f736974696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('158759', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226375656e6361222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a224944206375656e6361227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('158760', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226375656e6361222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a224944206375656e6361227d2c7b226e616d65223a22706172616d6574726f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22494420706172616d6574726f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('158761', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226375656e6361222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a224944206375656e6361227d2c7b226e616d65223a22706172616d6574726f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22494420706172616d6574726f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('158762', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542053554d28206461746f29204153206461746f2c2067657374696f6e0a202046524f4d2062682e6375656e74615f646574616c6c650a20205748455245206375656e6361203d203a6375656e636120414e4420706172616d6574726f203d203a706172616d6574726f0a202047524f55502062792067657374696f6e2c2067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('217929', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('217930', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('217931', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2063726d2e636c69656e74650a7768657265207072696e636970616c203d203a7072696e636970616c');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('229226', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('229227', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('229228', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2063726d2e70726f647563746f0a7768657265207072696e636970616c203d203a7072696e636970616c');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('229229', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('229230', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2063726d2e70726f647563746f0a7768657265207072696e636970616c203d203a7072696e636970616c0a6f72646572206279206465736372697063696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('229231', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('229232', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2063726d2e636c69656e74650a7768657265207072696e636970616c203d203a7072696e636970616c0a6f7264657220627920726567697374726f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('229233', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('229234', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2063726d2e636c69656e74650a7768657265207072696e636970616c203d203a7072696e636970616c0a6f7264657220627920726567697374726f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('229235', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('229236', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2c202873656c656374206162722066726f6d20656d70726573612e6d6f6e656461207768657265206d6f6e6564615f69643d63726d2e70726f647563746f2e6d6f6e656461292061732073746d6f6e6574612066726f6d2063726d2e70726f647563746f0a7768657265207072696e636970616c203d203a7072696e636970616c0a6f72646572206279206465736372697063696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('229237', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('229238', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2c202873656c656374206162722066726f6d20656d70726573612e6d6f6e656461207768657265206d6f6e6564615f69643d63726d2e70726f647563746f2e6d6f6e656461292061732073746d6f6e6564612066726f6d2063726d2e70726f647563746f0a7768657265207072696e636970616c203d203a7072696e636970616c0a6f72646572206279206465736372697063696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('229249', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('229250', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374206d6178286e756d65726f29206173206d6178696d6f2066726f6d2063726d2e636f74697a6163696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('229251', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('229252', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2063726d2e636f74697a6163696f6e5f636f7272656c617469766f0a7768657265207072696e636970616c3d3a7072696e636970616c');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('229253', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2063726d2e636f74697a6163696f6e5f636f7272656c617469766f0a7768657265207072696e636970616c3d3a7072696e636970616c');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('229254', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('229255', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2063726d2e636f74697a6163696f6e5f636f7272656c617469766f0a7768657265207072696e636970616c3d3a7072696e636970616c');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('229256', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('229257', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2063726d2e636f74697a6163696f6e5f636f7272656c617469766f0a7768657265207072696e636970616c3d3a7072696e636970616c');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('229258', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('229259', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2063726d2e636f74697a6163696f6e5f636f7272656c617469766f0a7768657265207072696e636970616c3d3a7072696e636970616c');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('237360', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('237361', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('237362', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420632e2a2c20636c2e2a2066726f6d2063726d2e636f74697a6163696f6e20632c2063726d2e636c69656e746520636c0a776865726520636c2e636c69656e74655f6964203d20632e636c69656e74650a616e64207072696e636970616c203d203a7072696e636970616c');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('237363', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('237364', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420632e2a2c200a2020636c2e6e6f6d6272652c0a2020636c2e6170656c6c69646f2c0a2020636c2e656d61696c2c200a2020636c2e72617a6f6e5f736f6369616c2c0a2020636c2e6e69742c0a2020636c2e74656c65666f6e6f2c0a2020636c2e63656c756c61722c0a2020636c2e65737461646f2c0a2020636c2e7469706f5f636c69656e74652c0a2020636c2e7072696e636970616c0a66726f6d2063726d2e636f74697a6163696f6e20632c2063726d2e636c69656e746520636c0a776865726520636c2e636c69656e74655f6964203d20632e636c69656e74650a2d2d616e64207072696e636970616c203d203a7072696e636970616c0a6f7264657220627920726567697374726f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('237365', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('237366', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420632e2a2c200a2020636c2e6e6f6d6272652c0a2020636c2e6170656c6c69646f2c0a2020636c2e656d61696c2c200a2020636c2e72617a6f6e5f736f6369616c2c0a2020636c2e6e69742c0a2020636c2e74656c65666f6e6f2c0a2020636c2e63656c756c61722c0a2020636c2e65737461646f2c0a2020636c2e7469706f5f636c69656e74652c0a2020636c2e7072696e636970616c0a66726f6d2063726d2e636f74697a6163696f6e20632c2063726d2e636c69656e746520636c0a776865726520636c2e636c69656e74655f6964203d20632e636c69656e74650a616e64207072696e636970616c203d203a7072696e636970616c0a6f7264657220627920726567697374726f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('237367', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('237368', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420632e2a2c200a2020636c2e6e6f6d6272652c0a2020636c2e6170656c6c69646f2c0a2020636c2e656d61696c2c200a2020636c2e72617a6f6e5f736f6369616c2c0a2020636c2e6e69742c0a2020636c2e74656c65666f6e6f2c0a2020636c2e63656c756c61722c0a2020636c2e65737461646f2c0a2020636c2e7469706f5f636c69656e74652c0a2020636c2e7072696e636970616c0a66726f6d2063726d2e636f74697a6163696f6e20632c2063726d2e636c69656e746520636c0a776865726520636c2e636c69656e74655f6964203d20632e636c69656e74650a616e64207072696e636970616c203d203a7072696e636970616c0a6f7264657220627920726567697374726f2064657363');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('237369', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('237370', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420632e2a2c200a2020636c2e6e6f6d6272652c0a2020636c2e6170656c6c69646f2c0a2020636c2e656d61696c2c200a2020636c2e72617a6f6e5f736f6369616c2c0a2020636c2e6e69742c0a2020636c2e74656c65666f6e6f2c0a2020636c2e63656c756c61722c0a2020636c2e7469706f5f636c69656e74652c0a2020636c2e7072696e636970616c0a66726f6d2063726d2e636f74697a6163696f6e20632c2063726d2e636c69656e746520636c0a776865726520636c2e636c69656e74655f6964203d20632e636c69656e74650a616e64207072696e636970616c203d203a7072696e636970616c0a6f7264657220627920726567697374726f2064657363');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('279974', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22636f74697a6163696f6e222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d2c7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('279975', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374206e2e2a2c20636e2e636f74697a6163696f6e5f6e6f7461735f69642066726f6d2063726d2e6e6f7461206e206c656674206a6f696e200a2873656c656374202a2066726f6d2063726d2e636f74697a6163696f6e5f6e6f74617320776865726520636f74697a6163696f6e203d203a636f74697a6163696f6e2920636e0a6f6e20636e2e6e6f7461203d206e2e6e6f74615f69640a6f72646572206279206f7264656e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('279976', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22636f74697a6163696f6e222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d2c7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('279977', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374206e2e2a2c20636e2e636f74697a6163696f6e5f6e6f7461735f69642066726f6d2063726d2e6e6f7461206e206c656674206a6f696e200a2873656c656374202a2066726f6d2063726d2e636f74697a6163696f6e5f6e6f74617320776865726520636f74697a6163696f6e203d203a636f74697a6163696f6e20616e64207072696e636970616c203d203a7072696e636970616c2920636e0a6f6e20636e2e6e6f7461203d206e2e6e6f74615f69640a6f72646572206279206f7264656e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('279978', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22636f74697a6163696f6e222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d2c7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('279979', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374206e2e2a2c20636e2e636f74697a6163696f6e5f6e6f7461735f69642066726f6d2063726d2e6e6f7461206e206c656674206a6f696e200a2873656c656374202a2066726f6d2063726d2e636f74697a6163696f6e5f6e6f74617320776865726520636f74697a6163696f6e203d203a636f74697a6163696f6e2920636e0a6f6e20636e2e6e6f7461203d206e2e6e6f74615f69640a7768657265207072696e636970616c203d203a7072696e636970616c0a6f72646572206279206f7264656e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('279980', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2063726d2e6e6f746173');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('279981', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2063726d2e6e6f7461');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('279982', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('279983', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2063726d2e6e6f7461');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('279984', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('279985', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2063726d2e6e6f74610a7768657265207072696e636970616c203d203a7072696e636970616c0a6f72646572206279206f7264656e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('285607', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('285608', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('285609', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420636f756e74282a292066726f6d2063726d2e636c69656e74650a7768657265207072696e636970616c203d203a7072696e636970616c');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('285610', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('285611', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('285612', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420636f756e74282a292066726f6d2063726d2e70726f647563746f0a7768657265207072696e636970616c203d203a7072696e636970616c');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('285613', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('285614', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('285615', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420632e2a2c200a2020636c2e6e6f6d6272652c0a2020636c2e6170656c6c69646f2c0a2020636c2e656d61696c2c200a2020636c2e72617a6f6e5f736f6369616c2c0a2020636c2e6e69742c0a2020636c2e74656c65666f6e6f2c0a2020636c2e63656c756c61722c0a2020636c2e7469706f5f636c69656e74652c0a2020636c2e7072696e636970616c0a66726f6d2063726d2e636f74697a6163696f6e20632c2063726d2e636c69656e746520636c0a776865726520636c2e636c69656e74655f6964203d20632e636c69656e74650a616e64207072696e636970616c203d203a7072696e636970616c0a6f7264657220627920726567697374726f20646573630a6c696d6974203130');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('285616', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('285617', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('285618', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420636f756e74282a292066726f6d2063726d2e636f74697a6163696f6e20632c2063726d2e636c69656e746520636c0a776865726520636c2e636c69656e74655f6964203d20632e636c69656e74650a616e64207072696e636970616c203d203a7072696e636970616c');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('292842', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('292843', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('292844', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d20656d706c6f7965732e706572736f6e616c0a77686572652061637469766f203d2074727565');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('292845', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('292846', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d20656d706c6f7965732e706572736f6e616c0a77686572652061637469766f2069732074727565');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('292847', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('292848', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d20656d706c6f7965732e706572736f6e616c0a77686572652061637469766f20697320747275650a616e64207072696e636970616c203d203a7072696e636970616c');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('292849', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('292850', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420702e2a2c200a2873656c656374206465736372697063696f6e2066726f6d20656d706c6f7965732e636f6e747261746f20776865726520636f6e747261746f5f6964203d20702e636f6e747261746f29200a66726f6d20656d706c6f7965732e706572736f6e616c20700a776865726520702e61637469766f20697320747275650a616e64207072696e636970616c203d203a7072696e636970616c');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('342782', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('342783', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420702e2a2c200a6578747261637428796561722066726f6d206167652866656368615f6e6163696d69656e746f2929206173206e6167652c0a2873656c656374206465736372697063696f6e2066726f6d20656d706c6f7965732e636f6e747261746f20776865726520636f6e747261746f5f6964203d20702e636f6e747261746f29200a66726f6d20656d706c6f7965732e706572736f6e616c20700a776865726520702e61637469766f20697320747275650a616e64207072696e636970616c203d203a7072696e636970616c');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('342784', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420702e2a2c200a6578747261637428796561722066726f6d206167652866656368615f6e6163696d69656e746f2929206173206e6167652c0a2873656c656374206465736372697063696f6e2066726f6d20656d706c6f7965732e636f6e747261746f20776865726520636f6e747261746f5f6964203d20702e636f6e747261746f29200a66726f6d20656d706c6f7965732e706572736f6e616c20700a');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('342785', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22656d706c6f796565222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('342786', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22656d706c6f796565222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('342787', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c6563740a706572736f6e616c5f69642c0a70617465726e6f2c200a6d617465726e6f2c0a6e6f6d627265732c0a656d61696c2c0a63656c756c61722c0a66656368615f6e6163696d69656e746f2c0a2863617365207768656e2067656e65726f203d20274d27207468656e20274d415343554c494e4f27207768656e2067656e65726f203d20274627207468656e202746454d454e494e4f2720656e64292061732067656e65726f2c0a61637469766f2c0a646f63756d656e746f2c0a646972656363696f6e2c0a72656769737465722c0a66656368615f696e677265736f2c0a66696c65646174612c0a6578747261637428796561722066726f6d206167652866656368615f6e6163696d69656e746f2929206173206e6167652c0a6578747261637428796561722066726f6d206167652866656368615f696e677265736f2929206173206e696e670a66726f6d20656d706c6f7965732e706572736f6e616c0a776865726520706572736f6e616c5f6964203d203a656d706c6f796565');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('342788', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22646f63756d656e74222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('342789', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22646f63756d656e74222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('342790', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d20656d706c6f7965732e706572736f6e616c0a776865726520646f63756d656e746f203d203a646f63756d656e74');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('342791', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22646f63756d656e74222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22227d2c7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('342792', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d20656d706c6f7965732e706572736f6e616c0a776865726520646f63756d656e746f203d203a646f63756d656e74');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('342793', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22646f63756d656e74222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22227d2c7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('342794', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d20656d706c6f7965732e706572736f6e616c0a776865726520646f63756d656e746f203d203a646f63756d656e740a616e64207072696e636970616c203d203a7072696e636970616c');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('342823', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420702e2a2064656f6d20706572736f6e61732e706572736f6e61730a');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('342824', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420702e2a2064656f6d20706572736f6e61732e706572736f6e617320700a');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('342825', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420702e2a2066726f6d20706572736f6e61732e706572736f6e617320700a');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('342826', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('342827', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420702e2a2066726f6d20706572736f6e61732e706572736f6e617320700a');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('342841', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('342842', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420702e2a2066726f6d20706572736f6e61732e706572736f6e6120700a776865726520702e706572736f6e615f6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('342843', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('342844', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420702e2a2066726f6d20706572736f6e61732e706572736f6e6120700a776865726520702e706572736f6e615f6964203d203a6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('342845', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('342846', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420702e2a2c0a2863617365207768656e20702e67656e65726f203d20274627207468656e202746454d454e494e4f27207768656e20702e67656e65726f203d20274d27207468656e20274d415343554c494e4f27207768656e20702e67656e65726f203d20275027207468656e2027504552534f4e414c495a41444f2720656c736520702e67656e65726f20656e6429206173207367656e65726f0a66726f6d20706572736f6e61732e706572736f6e6120700a776865726520702e706572736f6e615f6964203d203a6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('342847', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('342848', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('342849', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420636f756e74282a292066726f6d20656d706c6f7965732e706572736f6e616c0a7768657265207072696e636970616c203d203a7072696e636970616c');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('342850', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('342851', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420636f756e74282a292066726f6d20656d706c6f7965732e706572736f6e616c0a7768657265207072696e636970616c203d203a7072696e636970616c');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('342852', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('342853', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('342854', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420702e2a2c200a6578747261637428796561722066726f6d206167652866656368615f6e6163696d69656e746f2929206173206e6167652c0a2873656c656374206465736372697063696f6e2066726f6d20656d706c6f7965732e636f6e747261746f20776865726520636f6e747261746f5f6964203d20702e636f6e747261746f29200a66726f6d20656d706c6f7965732e706572736f6e616c20700a776865726520702e61637469766f20697320747275650a616e64207072696e636970616c203d203a7072696e636970616c0a6f7264657220627920702e726567697374657220646573630a6c696d6974203130');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('342868', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('342869', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('342870', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d20656d70726573612e75736572730a7768657265207072696e636970616c203d203a7072696e636970616c');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('342871', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('342872', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d20656d70726573612e7573756172696f0a7768657265207072696e636970616c203d203a7072696e636970616c');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('350559', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d20656d70726573612e7072696e636970616c');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461647', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461648', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461649', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d20656d706c6f7965732e706572736f6e616c0a776865726520706572736f6e616c5f6964203d203a6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461650', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461651', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a200a0a66726f6d20656d706c6f7965732e706572736f6e616c20700a776865726520706572736f6e616c5f6964203d203a6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461652', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461653', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420702e2a2c200a702e646f63756d656e746f206e726f646f63756d656e746f0a66726f6d20656d706c6f7965732e706572736f6e616c20700a776865726520706572736f6e616c5f6964203d203a6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461654', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461655', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420702e2a2c200a702e646f63756d656e746f206e726f5f646f63756d656e746f0a66726f6d20656d706c6f7965732e706572736f6e616c20700a776865726520706572736f6e616c5f6964203d203a6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461656', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461657', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420702e2a2c200a702e646f63756d656e746f206e726f5f646f63756d656e746f2c0a2745585427206578745f646f63756d656e746f0a66726f6d20656d706c6f7965732e706572736f6e616c20700a776865726520706572736f6e616c5f6964203d203a6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461658', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461659', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420702e2a2c200a702e646f63756d656e746f206e726f5f646f63756d656e746f2c0a2745585427206173206578745f646f63756d656e746f0a66726f6d20656d706c6f7965732e706572736f6e616c20700a776865726520706572736f6e616c5f6964203d203a6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461660', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461661', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420702e2a2c200a702e646f63756d656e746f206e726f5f646f63756d656e746f2c0a746f5f6368617228274558542729206173206578745f646f63756d656e746f0a66726f6d20656d706c6f7965732e706572736f6e616c20700a776865726520706572736f6e616c5f6964203d203a6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461662', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461663', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420702e2a2c200a702e646f63756d656e746f206e726f5f646f63756d656e746f2c0a2765787427206173206578745f646f63756d656e746f0a66726f6d20656d706c6f7965732e706572736f6e616c20700a776865726520706572736f6e616c5f6964203d203a6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461664', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461665', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420702e2a2c200a702e646f63756d656e746f206173206e726f5f646f63756d656e746f2c0a28276578742729206173206578745f646f63756d656e746f0a66726f6d20656d706c6f7965732e706572736f6e616c20700a776865726520706572736f6e616c5f6964203d203a6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461666', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461667', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420702e2a2c200a702e646f63756d656e746f206173206e726f5f646f63756d656e746f2c0a2d2d28276578742729206173206578745f646f63756d656e746f0a66726f6d20656d706c6f7965732e706572736f6e616c20700a776865726520706572736f6e616c5f6964203d203a6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461668', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461669', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420702e2a2c200a702e646f63756d656e746f206173206e726f5f646f63756d656e746f2c0a0a66726f6d20656d706c6f7965732e706572736f6e616c20700a776865726520706572736f6e616c5f6964203d203a6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461670', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461671', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420702e2a2c200a702e646f63756d656e746f206173206e726f5f646f63756d656e746f0a0a66726f6d20656d706c6f7965732e706572736f6e616c20700a776865726520706572736f6e616c5f6964203d203a6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461672', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461673', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420702e2a2c200a702e646f63756d656e746f206173206e726f5f646f63756d656e746f2c2063617374282765787427206173207661726368617229206173206578745f646f63756d656e746f0a0a66726f6d20656d706c6f7965732e706572736f6e616c20700a776865726520706572736f6e616c5f6964203d203a6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461674', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461675', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420702e2a2c200a702e646f63756d656e746f206173206e726f5f646f63756d656e746f2c20636173742827424f27206173207661726368617229206173206578745f646f63756d656e746f0a0a66726f6d20656d706c6f7965732e706572736f6e616c20700a776865726520706572736f6e616c5f6964203d203a6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461676', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461677', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420702e2a2c200a702e646f63756d656e746f206173206e726f5f646f63756d656e746f2c20636173742827424f27206173207661726368617229206173206578745f646f63756d656e746f2c0a6361737428274944676974616c2720617320766172636861722920617320666163756c7461640a66726f6d20656d706c6f7965732e706572736f6e616c20700a776865726520706572736f6e616c5f6964203d203a6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461718', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d20656d706c6f7965732e636865636b696e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461719', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461720', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d20656d706c6f7965732e636865636b696e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461721', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461722', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d20656d706c6f7965732e636865636b696e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461723', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461724', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d20656d706c6f7965732e636865636b696e0a7768657265207573756172696f203c3e203a6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461725', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('461726', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d20656d706c6f7965732e636865636b696e0a7768657265207573756172696f203c3e203a6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('518042', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('518043', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d2c7b226e616d65223a22646f63756d656e746f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('518046', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227072696e636970616c222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d2c7b226e616d65223a22646f63756d656e746f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('518047', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d20656d706c6f7965732e706572736f6e616c0a776865726520646f63756d656e746f203d203a646f63756d656e746f0a616e64207072696e636970616c203d203a7072696e636970616c');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('545860', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420626173655f6461746f5f6964206173206e6f64655f69642c206e6f6d62726520415320746578742c434153542827636c6f73656427204153206368617261637465722076617279696e6729206173207374617465200a202046524f4d2062682e626173655f6461746f3b0a');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('547932', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2062682e6172636869766f5f7265706f727465');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('547933', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2062682e6172636869766f5f7265706f7274652077686572652073746174652069732066616c7365');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('547934', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2062682e6172636869766f5f7265706f7274652077686572652073746174652069732066616c7365');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('547935', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2062682e6172636869766f5f63616c6962726163696f6e2077686572652073746174652069732066616c7365');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('554293', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354206d65732c20726f756e64284341535428415647286461746f29206173206e756d65726963292c2031290a202046524f4d2062682e646174615f7265706f7274650a2020574845524520626173655f6461746f203d203120414e4420636f6469676f203d2027363232363832312720414e44207661726961626c655f7265706f727465203d20310a202047524f5550204259206d65730a20204f52444552204259206d6573');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('554294', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354206d65732c20726f756e64284341535428415647286461746f29206173206e756d65726963292c2031290a202046524f4d2062682e646174615f7265706f7274650a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d2027363232363832312720414e44207661726961626c655f7265706f727465203d20310a202047524f5550204259206d65730a20204f52444552204259206d6573');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('554295', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('554296', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354206d65732c20726f756e64284341535428415647286461746f29206173206e756d65726963292c2031290a202046524f4d2062682e646174615f7265706f7274650a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d2027363232363832312720414e44207661726961626c655f7265706f727465203d20310a202047524f5550204259206d65730a20204f52444552204259206d6573');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('554297', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465207265706f727465227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('554298', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354206d65732c20726f756e64284341535428415647286461746f29206173206e756d65726963292c2031290a202046524f4d2062682e646174615f7265706f7274650a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d2027363232363832312720414e44207661726961626c655f7265706f727465203d20310a202047524f5550204259206d65730a20204f52444552204259206d6573');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('554299', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465207265706f727465227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('554300', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354206d65732c20726f756e64284341535428415647286461746f29206173206e756d65726963292c2031290a202046524f4d2062682e646174615f7265706f7274650a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f7265706f727465203d203a7661726961626c655f7265706f7274650a202047524f5550204259206d65730a20204f52444552204259206d6573');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('554301', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465207265706f727465227d2c7b226e616d65223a227661726961626c655f7265706f727465222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a224944207661726961626c65207265706f727465227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('554302', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354206d65732c20726f756e64284341535428415647286461746f29206173206e756d65726963292c2031290a202046524f4d2062682e646174615f7265706f7274650a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f7265706f727465203d203a7661726961626c655f7265706f7274650a202047524f5550204259206d65730a20204f52444552204259206d6573');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('554773', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('554774', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('554775', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2062682e7265706f7274650a776865726520626173655f6461746f203d203a626173650a6f72646572206279206e6f6d627265');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('554776', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('554777', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420632e2a2066726f6d2062682e7265706f72746520632c2062682e626173655f7265706f72746520620a77686572650a202020202020622e626173655f7265706f7274655f6964203d20632e626173655f7265706f727465200a616e6420622e626173655f6461746f203d203a626173650a6f72646572206279206e6f6d627265');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('554778', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('554779', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420632e2a2066726f6d2062682e7265706f72746520632c2062682e626173655f7265706f72746520620a77686572650a202020202020622e626173655f7265706f7274655f6964203d20632e626173655f7265706f727465200a616e6420622e626173655f6461746f203d203a626173650a6f72646572206279206e6f6d627265');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('554780', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('554781', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('554782', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420632e2a2066726f6d2062682e63616c6962726163696f6e20632c2062682e626173655f63616c6962726163696f6e20620a77686572650a202020202020622e626173655f63616c6962726163696f6e5f6964203d20632e626173655f63616c6962726163696f6e0a616e6420622e626173655f6461746f203d203a626173650a6f72646572206279206e6f6d627265');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('554792', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('554793', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d2c7b226e616d65223a227661726961626c65222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('554794', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d2c7b226e616d65223a227661726961626c65222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('554795', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c6563742064697374696e637420642e67657374696f6e2066726f6d2062682e646174615f7265706f72746520640a202020202020202020776865726520642e626173655f6461746f203d203a62617365200a202020202020202020616e6420642e7661726961626c655f7265706f727465203d203a76616c6961626c650a202020202020206f726465722062792067657374696f6e2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('554796', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d2c7b226e616d65223a227661726961626c65222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('554797', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c6563742064697374696e637420642e67657374696f6e2066726f6d2062682e646174615f7265706f72746520640a202020202020202020776865726520642e626173655f6461746f203d203a62617365200a202020202020202020616e6420642e7661726961626c655f7265706f727465203d203a7661726961626c650a202020202020206f726465722062792067657374696f6e2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('554849', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('554850', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d2c7b226e616d65223a2267657374696f6e222c2274797065436c617373223a22696e7465676572222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('554851', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d2c7b226e616d65223a2267657374696f6e222c2274797065436c617373223a22696e7465676572222c226465736372697074696f6e223a22227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('554852', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d2c7b226e616d65223a2267657374696f6e222c2274797065436c617373223a22696e7465676572222c226465736372697074696f6e223a22227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('554853', 131072);
SELECT pg_catalog.lowrite(0, '\x2073656c656374202a2066726f6d2062682e6c6f61645f646174615f7265706f727465283a626173652c3a67657374696f6e2c3a636f6469676f292061732028696420626967696e742c206e6f6d62726520766172636861722c200a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d657220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e2c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('554854', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d2c7b226e616d65223a2267657374696f6e222c2274797065436c617373223a22696e7465676572222c226465736372697074696f6e223a22227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('554855', 131072);
SELECT pg_catalog.lowrite(0, '\x2073656c656374202a2066726f6d2062682e6c6f61645f646174615f7265706f727465283a626173652c3a67657374696f6e2c3a636f6469676f29206173200a2020282020696420626967696e742c200a20202020206e6f6d62726520766172636861722c200a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d657220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e2c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('554856', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d2c7b226e616d65223a2267657374696f6e222c2274797065436c617373223a22696e7465676572222c226465736372697074696f6e223a22227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('554857', 131072);
SELECT pg_catalog.lowrite(0, '\x2073656c656374202a2066726f6d2062682e6c6f61645f646174615f7265706f727465283a626173652c3a67657374696f6e2c3a636f6469676f29206173200a2020282020696420626967696e742c200a20202020206e6f6d62726520766172636861722c200a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e2c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('562322', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('562323', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d2c7b226e616d65223a2267657374696f6e222c2274797065436c617373223a22696e7465676572222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('562324', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d2c7b226e616d65223a2267657374696f6e222c2274797065436c617373223a22696e7465676572222c226465736372697074696f6e223a22227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('562325', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d2c7b226e616d65223a2267657374696f6e222c2274797065436c617373223a22696e7465676572222c226465736372697074696f6e223a22227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('562326', 131072);
SELECT pg_catalog.lowrite(0, '\x202073656c656374202a2066726f6d2062682e6c6f61645f646174615f63616c6962726163696f6e283a626173652c3a67657374696f6e2c3a636f6469676f2920617320200a2020282020696420626967696e742c200a20202020206e6f6d62726520766172636861722c200a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e2c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e0a2020293b20');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('570548', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e7265706f7274655f7461626c655f6d756c74695f6d6f6e74686c792028312c20273632323636352729206173200a2020282020696420626967696e742c200a20202020206e6f6d62726520766172636861722c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('570549', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e7265706f7274655f7461626c655f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c20636f6469676f29206173200a2020282020696420626967696e742c200a20202020206e6f6d62726520766172636861722c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('570550', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e7265706f7274655f7461626c655f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020206e6f6d62726520766172636861722c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('570551', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('570552', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e7265706f7274655f7461626c655f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020206e6f6d62726520766172636861722c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('570553', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206c61206375656e6361227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('570554', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e7265706f7274655f7461626c655f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020206e6f6d62726520766172636861722c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('570555', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206c61206375656e6361227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('570556', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e7265706f7274655f7461626c655f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020207661726961626c6520766172636861722c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('570557', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e0a202046524f4d2062682e646174615f7265706f7274650a2020574845524520626173655f6461746f203d20310a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('570558', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('570559', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e0a202046524f4d2062682e646174615f7265706f7274650a2020574845524520626173655f6461746f203d20310a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('570560', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('570561', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e0a202046524f4d2062682e646174615f7265706f7274650a2020574845524520626173655f6461746f203d203a626173655f6461746f0a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('570562', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('570563', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e0a202046524f4d2062682e646174615f7265706f7274650a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f0a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('570564', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22636f6469676f206465206c61206375656e6361227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('570565', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e0a202046524f4d2062682e646174615f7265706f7274650a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f0a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('570566', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22636f6469676f206465206c61206375656e6361227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('570567', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e0a202046524f4d2062682e646174615f7265706f7274650a2020574845524520626173655f6461746f203d203a626173655f6461746f0a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('570568', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('570569', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e0a202046524f4d2062682e646174615f7265706f7274650a2020574845524520626173655f6461746f203d203a626173655f6461746f0a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('570570', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e2c20726f756e6428434153542853554d286461746f29206173206e756d65726963292c2031290a202046524f4d2062682e646174615f7265706f7274650a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f7265706f727465203d203a7661726961626c655f7265706f7274650a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('570571', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('570572', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e2c20726f756e6428434153542853554d286461746f29206173206e756d65726963292c2031290a202046524f4d2062682e646174615f7265706f7274650a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f7265706f727465203d203a7661726961626c655f7265706f7274650a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('570573', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206375656e6361227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('570574', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e2c20726f756e6428434153542853554d286461746f29206173206e756d65726963292c2031290a202046524f4d2062682e646174615f7265706f7274650a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f7265706f727465203d203a7661726961626c655f7265706f7274650a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('570575', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206375656e6361227d2c7b226e616d65223a227661726961626c655f7265706f727465222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a224944207661726961626c65207265706f727465227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('570576', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e2c20726f756e6428434153542853554d286461746f29206173206e756d65726963292c2031290a202046524f4d2062682e646174615f7265706f7274650a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f7265706f727465203d203a7661726961626c655f7265706f7274650a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('570577', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206375656e6361227d2c7b226e616d65223a227661726961626c655f7265706f727465222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a224944207661726961626c65207265706f727465227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('570578', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e2c20726f756e6428434153542853554d286461746f29206173206e756d65726963292c2031290a202046524f4d2062682e646174615f7265706f7274650a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f7265706f727465203d203a7661726961626c655f7265706f7274650a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('570579', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206375656e6361227d2c7b226e616d65223a227661726961626c655f7265706f727465222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a224944207661726961626c65207265706f727465227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('570580', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e204153207661726961626c652c20726f756e6428434153542853554d286461746f29206173206e756d65726963292c2031292041532076616c6f720a202046524f4d2062682e646174615f7265706f7274650a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f7265706f727465203d203a7661726961626c655f7265706f7274650a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('570689', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e7265706f7274655f677261706869635f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020206e6f6d62726520766172636861722c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('570690', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('570691', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e7265706f7274655f677261706869635f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020206e6f6d62726520766172636861722c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('570692', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206375656e6361227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('570693', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e7265706f7274655f677261706869635f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020206e6f6d62726520766172636861722c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571013', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571014', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420632e7265706f7274655f69642c20632e6e6f6d6272652066726f6d2062682e7265706f72746520632c2062682e626173655f7265706f72746520620a77686572650a202020202020622e626173655f7265706f7274655f6964203d20632e626173655f7265706f727465200a616e6420622e626173655f6461746f203d203a626173650a6f72646572206279206e6f6d627265');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571015', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571016', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420632e7265706f7274655f69642c20632e6e6f6d6272652c20632e636f6469676f2066726f6d2062682e7265706f72746520632c2062682e626173655f7265706f72746520620a77686572650a202020202020622e626173655f7265706f7274655f6964203d20632e626173655f7265706f727465200a616e6420622e626173655f6461746f203d203a626173650a6f72646572206279206e6f6d627265');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571017', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571018', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420632e63616c6962726163696f6e5f69642c20632e6e6f6d6272652c20632e636f6469676f2066726f6d2062682e63616c6962726163696f6e20632c2062682e626173655f63616c6962726163696f6e20620a77686572650a202020202020622e626173655f63616c6962726163696f6e5f6964203d20632e626173655f63616c6962726163696f6e0a616e6420622e626173655f6461746f203d203a626173650a6f72646572206279206e6f6d627265');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571069', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e7265706f7274655f687964726f67726170685f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020206e6f6d62726520766172636861722c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571070', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571071', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e7265706f7274655f687964726f67726170685f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020206e6f6d62726520766172636861722c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571072', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206c61206375656e6361227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571073', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e7265706f7274655f687964726f67726170685f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020206e6f6d62726520766172636861722c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571074', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206c61206375656e6361227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571075', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e7265706f7274655f687964726f67726170685f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020206e6f6d62726520766172636861722c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571076', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e2c20726f756e6428434153542853554d286461746f292f3132206173206e756d65726963292c2032292041532076616c6f720a202046524f4d2062682e646174615f7265706f7274650a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f7265706f727465203d20320a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571077', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571078', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e2c20726f756e6428434153542853554d286461746f292f3132206173206e756d65726963292c2032292041532076616c6f720a202046524f4d2062682e646174615f7265706f7274650a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f7265706f727465203d20320a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571079', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206375656e6361227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571080', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e2c20726f756e6428434153542853554d286461746f292f3132206173206e756d65726963292c2032292041532076616c6f720a202046524f4d2062682e646174615f7265706f7274650a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f7265706f727465203d20320a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571110', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a224944202062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571111', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a224944202062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206375656e6361227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571112', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a224944202062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206375656e6361227d2c7b226e616d65223a227661726961626c655f7265706f727465222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a224944207661726961626c65207265706f727465227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571113', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a224944202062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206375656e6361227d2c7b226e616d65223a227661726961626c655f7265706f727465222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a224944207661726961626c65207265706f727465227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571114', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e2c20726f756e6428434153542853554d286461746f29206173206e756d65726963292c2032292041532076616c6f720a202046524f4d2062682e646174615f7265706f7274650a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f7265706f727465203d203a7661726961626c655f7265706f7274650a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571116', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e63616c6962726163696f6e5f677261706869635f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020206e6f6d62726520766172636861722c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571117', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571118', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e63616c6962726163696f6e5f677261706869635f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020206e6f6d62726520766172636861722c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571119', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206375656e6361227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571120', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e63616c6962726163696f6e5f677261706869635f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020206e6f6d62726520766172636861722c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571121', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206375656e6361227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571122', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e63616c6962726163696f6e5f677261706869635f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020206e6f6d62726520766172636861722c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571144', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e7265706f7274655f7461626c655f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020207661726961626c6520766172636861722c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571145', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571146', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e7265706f7274655f7461626c655f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020207661726961626c6520766172636861722c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571147', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206c61206375656e63612064652063616c6962726163696f6e227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571148', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e7265706f7274655f7461626c655f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020207661726961626c6520766172636861722c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571149', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206c61206375656e63612064652063616c6962726163696f6e227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571150', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e7265706f7274655f7461626c655f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020207661726961626c6520766172636861722c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571151', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206c61206375656e63612064652063616c6962726163696f6e227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571152', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e63616c6962726163696f6e5f7461626c655f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020207661726961626c6520766172636861722c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571154', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e63616c6962726163696f6e5f687964726f67726170685f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020206e6f6d62726520766172636861722c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571155', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571156', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e63616c6962726163696f6e5f687964726f67726170685f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020206e6f6d62726520766172636861722c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571157', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206c61206375656e63612064652063616c6962726163696f6e227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571158', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e63616c6962726163696f6e5f687964726f67726170685f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020206e6f6d62726520766172636861722c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571159', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206c61206375656e63612064652063616c6962726163696f6e227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571160', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e63616c6962726163696f6e5f687964726f67726170685f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020206e6f6d62726520766172636861722c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571161', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e2c20726f756e6428434153542853554d286461746f29206173206e756d65726963292c2032292041532076616c6f720a202046524f4d2062682e646174615f63616c6962726163696f6e0a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f63616c6962726163696f6e203d203a7661726961626c655f63616c6962726163696f6e0a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571162', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571163', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e2c20726f756e6428434153542853554d286461746f29206173206e756d65726963292c2032292041532076616c6f720a202046524f4d2062682e646174615f63616c6962726163696f6e0a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f63616c6962726163696f6e203d203a7661726961626c655f63616c6962726163696f6e0a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571164', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571165', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e2c20726f756e6428434153542853554d286461746f29206173206e756d65726963292c2032292041532076616c6f720a202046524f4d2062682e646174615f63616c6962726163696f6e0a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f63616c6962726163696f6e203d203a7661726961626c655f63616c6962726163696f6e0a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571166', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206375656e63612064652063616c6962726163696f6e227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571167', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e2c20726f756e6428434153542853554d286461746f29206173206e756d65726963292c2032292041532076616c6f720a202046524f4d2062682e646174615f63616c6962726163696f6e0a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f63616c6962726163696f6e203d203a7661726961626c655f63616c6962726163696f6e0a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571168', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206375656e63612064652063616c6962726163696f6e227d2c7b226e616d65223a227661726961626c655f63616c6962726163696f6e222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a224944207661726961626c652063616c6962726163696f6e227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571169', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e2c20726f756e6428434153542853554d286461746f29206173206e756d65726963292c2032292041532076616c6f720a202046524f4d2062682e646174615f63616c6962726163696f6e0a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f63616c6962726163696f6e203d203a7661726961626c655f63616c6962726163696f6e0a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571170', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206375656e63612064652063616c6962726163696f6e227d2c7b226e616d65223a227661726961626c655f63616c6962726163696f6e222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a224944207661726961626c652063616c6962726163696f6e227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571171', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e2c20726f756e6428434153542853554d286461746f29206173206e756d65726963292c2032292041532076616c6f720a202046524f4d2062682e646174615f63616c6962726163696f6e0a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f63616c6962726163696f6e203d203a7661726961626c655f63616c6962726163696f6e0a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571172', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e204153207661726961626c652c20726f756e6428434153542853554d286461746f29206173206e756d65726963292c2031292041532076616c6f720a202046524f4d2062682e646174615f63616c6962726163696f6e0a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f63616c6962726163696f6e203d203a7661726961626c655f63616c6962726163696f6e0a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571173', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571174', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e204153207661726961626c652c20726f756e6428434153542853554d286461746f29206173206e756d65726963292c2031292041532076616c6f720a202046524f4d2062682e646174615f63616c6962726163696f6e0a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f63616c6962726163696f6e203d203a7661726961626c655f63616c6962726163696f6e0a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571175', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206375656e63612064652063616c6962726163696f6e227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571176', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e204153207661726961626c652c20726f756e6428434153542853554d286461746f29206173206e756d65726963292c2031292041532076616c6f720a202046524f4d2062682e646174615f63616c6962726163696f6e0a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f63616c6962726163696f6e203d203a7661726961626c655f63616c6962726163696f6e0a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571177', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206375656e63612064652063616c6962726163696f6e227d2c7b226e616d65223a227661726961626c655f63616c6962726163696f6e222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a224944207661726961626c652063616c6962726163696f6e227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571178', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e204153207661726961626c652c20726f756e6428434153542853554d286461746f29206173206e756d65726963292c2031292041532076616c6f720a202046524f4d2062682e646174615f63616c6962726163696f6e0a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f63616c6962726163696f6e203d203a7661726961626c655f63616c6962726163696f6e0a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571181', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e2c20726f756e6428434153542853554d286461746f292f3132206173206e756d65726963292c2032292041532076616c6f720a202046524f4d2062682e646174615f7265706f7274650a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f7265706f727465203d20320a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571182', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e2c20726f756e6428434153542853554d286461746f292f3132206173206e756d65726963292c2032292041532076616c6f720a202046524f4d2062682e646174615f63616c6962726163696f6e0a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f63616c6962726163696f6e203d20320a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571183', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e2c20726f756e6428434153542853554d286461746f292f3132206173206e756d65726963292c2032292041532076616c6f720a202046524f4d2062682e646174615f63616c6962726163696f6e0a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f63616c6962726163696f6e203d203a7661726961626c655f63616c6962726163696f6e0a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571184', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571185', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e2c20726f756e6428434153542853554d286461746f292f3132206173206e756d65726963292c2032292041532076616c6f720a202046524f4d2062682e646174615f63616c6962726163696f6e0a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f63616c6962726163696f6e203d203a7661726961626c655f63616c6962726163696f6e0a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571186', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206375656e63612064652063616c6962726163696f6e227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571187', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e2c20726f756e6428434153542853554d286461746f292f3132206173206e756d65726963292c2032292041532076616c6f720a202046524f4d2062682e646174615f63616c6962726163696f6e0a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f63616c6962726163696f6e203d203a7661726961626c655f63616c6962726163696f6e0a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571188', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206375656e63612064652063616c6962726163696f6e227d2c7b226e616d65223a227661726961626c655f63616c6962726163696f6e222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a224944207661726961626c652063616c6962726163696f6e227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571189', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e2c20726f756e6428434153542853554d286461746f292f3132206173206e756d65726963292c2032292041532076616c6f720a202046524f4d2062682e646174615f63616c6962726163696f6e0a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f63616c6962726163696f6e203d203a7661726961626c655f63616c6962726163696f6e0a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571203', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e63616c6962726163696f6e5f687964726f67726170685f7461626c655f6d6f6e74686c792028312c20273632323636352729206173200a2020282020696420626967696e742c200a20202020206e6f6d6272655f636f6d706c65746f20766172636861722c0a20202020206e6f6d6272655f636f72746f20766172636861722c0a202020202073657020646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571204', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571205', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e63616c6962726163696f6e5f687964726f67726170685f7461626c655f6d6f6e74686c792028312c20273632323636352729206173200a2020282020696420626967696e742c200a20202020206e6f6d6272655f636f6d706c65746f20766172636861722c0a20202020206e6f6d6272655f636f72746f20766172636861722c0a202020202073657020646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571206', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206375656e63612064652063616c6962726163696f6e227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571207', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e63616c6962726163696f6e5f687964726f67726170685f7461626c655f6d6f6e74686c792028312c20273632323636352729206173200a2020282020696420626967696e742c200a20202020206e6f6d6272655f636f6d706c65746f20766172636861722c0a20202020206e6f6d6272655f636f72746f20766172636861722c0a202020202073657020646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571208', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206375656e63612064652063616c6962726163696f6e227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571209', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e63616c6962726163696f6e5f687964726f67726170685f7461626c655f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020206e6f6d6272655f636f6d706c65746f20766172636861722c0a20202020206e6f6d6272655f636f72746f20766172636861722c0a202020202073657020646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571211', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2062682e6172636869766f5f7265706f72746520656865726520626173655f6461746f203d203a62617365');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571212', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571213', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2062682e6172636869766f5f7265706f72746520656865726520626173655f6461746f203d203a62617365');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571214', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571215', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2062682e626173655f7265706f72746520656865726520626173655f6461746f203d203a62617365');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571217', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e63616c6962726163696f6e5f687964726f67726170685f7461626c655f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020206e6f6d6272655f636f6d706c65746f20766172636861722c0a20202020206e6f6d6272655f636f72746f20766172636861722c0a202020202073657020646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571218', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e63616c6962726163696f6e5f687964726f67726170685f7461626c655f7965617220283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020206e6f6d6272655f636f6d706c65746f20766172636861722c0a20202020206e6f6d6272655f636f72746f20766172636861722c0a202020202073657020646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571219', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571220', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e63616c6962726163696f6e5f687964726f67726170685f7461626c655f7965617220283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020206e6f6d6272655f636f6d706c65746f20766172636861722c0a20202020206e6f6d6272655f636f72746f20766172636861722c0a202020202073657020646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571221', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206c6120636164656e61227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571222', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e63616c6962726163696f6e5f687964726f67726170685f7461626c655f7965617220283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020206e6f6d6272655f636f6d706c65746f20766172636861722c0a20202020206e6f6d6272655f636f72746f20766172636861722c0a202020202073657020646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571223', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206c6120636164656e61227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571224', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e63616c6962726163696f6e5f687964726f67726170685f7461626c655f7965617220283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020206e6f6d6272655f636f6d706c65746f20766172636861722c0a20202020206e6f6d6272655f636f72746f20766172636861722c0a202020202073657020646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571225', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206c6120636164656e61227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571226', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e63616c6962726163696f6e5f687964726f67726170685f7461626c655f7965617220283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020206e6f6d6272655f636f6d706c65746f20766172636861722c0a20202020206e6f6d6272655f636f72746f20766172636861722c0a202020202076616c6f7220646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571227', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206375656e63612064652063616c6962726163696f6e227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571228', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e63616c6962726163696f6e5f687964726f67726170685f7461626c655f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020206e6f6d6272655f636f6d706c65746f20766172636861722c0a20202020206e6f6d6272655f636f72746f20766172636861722c0a202020202076616c6f7220646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571229', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e7265706f7274655f7461626c655f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020207661726961626c6520766172636861722c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571230', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571231', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e7265706f7274655f7461626c655f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020207661726961626c6520766172636861722c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571232', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206c61206375656e63612064652063616c6962726163696f6e227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571233', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e7265706f7274655f7461626c655f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020207661726961626c6520766172636861722c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571234', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206c61206375656e63612064652063616c6962726163696f6e227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571235', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e7265706f7274655f7461626c655f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020207661726961626c6520766172636861722c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571236', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206c61206375656e63612064652063616c6962726163696f6e227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571237', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e63616c6962726163696f6e5f7461626c655f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020207661726961626c6520766172636861722c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571238', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571239', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2062682e626173655f7265706f72746520776865726520626173655f6461746f203d203a62617365');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571240', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2062682e626173655f63616c6962726163696f6e20776865726520626173655f6461746f203d203a62617365');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571241', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571242', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2062682e626173655f63616c6962726163696f6e20776865726520626173655f6461746f203d203a62617365');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571249', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571250', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420612e2a2c20762e6e6f6d6272652c20762e6f7264656e2066726f6d2062682e6172636869766f5f7265706f72746520612c2062682e7661726961626c655f7265706f72746520760a776865726520612e7661726961626c655f7265706f727465203d20762e7661726961626c655f7265706f7274655f69640a616e6420626173655f6461746f203d2033340a6f72646572206279206f7264656e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571251', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571252', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420612e2a2c20762e6e6f6d6272652c20762e6f7264656e2066726f6d2062682e6172636869766f5f7265706f72746520612c2062682e7661726961626c655f7265706f72746520760a776865726520612e7661726961626c655f7265706f727465203d20762e7661726961626c655f7265706f7274655f69640a616e6420626173655f6461746f203d203a626173650a6f72646572206279206f7264656e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571253', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571254', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420612e2a2c20762e6e6f6d6272652c20762e6f7264656e2066726f6d2062682e6172636869766f5f7265706f72746520612c2062682e7661726961626c655f7265706f72746520760a776865726520612e7661726961626c655f7265706f727465203d20762e7661726961626c655f7265706f7274655f69640a616e6420626173655f6461746f203d203a626173650a6f72646572206279206f7264656e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571255', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571256', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420612e2a2c20762e6e6f6d6272652c20762e6f7264656e2066726f6d2062682e6172636869766f5f63616c6962726163696f6e20612c2062682e7661726961626c655f63616c6962726163696f6e20760a776865726520612e7661726961626c655f63616c6962726163696f6e203d20762e7661726961626c655f63616c6962726163696f6e5f69640a616e6420626173655f6461746f203d2033340a6f72646572206279206f7264656e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571257', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571258', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420612e2a2c20762e6e6f6d6272652c20762e6f7264656e2066726f6d2062682e6172636869766f5f63616c6962726163696f6e20612c2062682e7661726961626c655f63616c6962726163696f6e20760a776865726520612e7661726961626c655f63616c6962726163696f6e203d20762e7661726961626c655f63616c6962726163696f6e5f69640a616e6420626173655f6461746f203d203a626173650a6f72646572206279206f7264656e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571259', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571260', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571261', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2062682e626173655f7265706f72746520776865726520626173655f6461746f203d203a62617365');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571262', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571263', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571264', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2062682e626173655f63616c6962726163696f6e20776865726520626173655f6461746f203d203a62617365');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571265', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206c61206375656e6361227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571266', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e7265706f7274655f7461626c655f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020207661726961626c6520746578742c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571267', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571268', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571269', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354207661726961626c655f7265706f7274655f69642c20636f6e636174286e6f6d6272652c20272028272c20756e696461642c202729272920204153206e6f6d6272652c0a2020202020202046524f4d2062682e7661726961626c655f7265706f72746520494e4e4552204a4f494e2062682e6172636869766f5f7265706f727465204f4e207661726961626c655f7265706f727465203d207661726961626c655f7265706f7274655f69640a20202020202020574845524520626173655f6461746f203d20626173655f6461746f20414e44207661726961626c655f7265706f727465203c3e2038');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571270', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571271', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354207661726961626c655f7265706f7274655f69642c20636f6e636174286e6f6d6272652c20272028272c20756e696461642c202729272920204153206e6f6d6272652c0a2020202020202046524f4d2062682e7661726961626c655f7265706f72746520494e4e4552204a4f494e2062682e6172636869766f5f7265706f727465204f4e207661726961626c655f7265706f727465203d207661726961626c655f7265706f7274655f69640a20202020202020574845524520626173655f6461746f203d203a626173655f6461746f20414e44207661726961626c655f7265706f727465203c3e2038');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571272', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571273', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354207661726961626c655f7265706f7274655f69642c20636f6e636174286e6f6d6272652c20272028272c20756e696461642c202729272920204153206e6f6d6272652c0a2020202020202046524f4d2062682e7661726961626c655f7265706f72746520494e4e4552204a4f494e2062682e6172636869766f5f7265706f727465204f4e207661726961626c655f7265706f727465203d207661726961626c655f7265706f7274655f69640a20202020202020574845524520626173655f6461746f203d203a626173655f6461746f20414e44207661726961626c655f7265706f727465203c3e2038');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571274', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571275', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354207661726961626c655f7265706f7274655f69642c20636f6e636174286e6f6d6272652c20272028272c20756e696461642c202729272920204153206e6f6d6272650a2020202020202046524f4d2062682e7661726961626c655f7265706f72746520494e4e4552204a4f494e2062682e6172636869766f5f7265706f727465204f4e207661726961626c655f7265706f727465203d207661726961626c655f7265706f7274655f69640a20202020202020574845524520626173655f6461746f203d203a626173655f6461746f20414e44207661726961626c655f7265706f727465203c3e2038');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571276', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571277', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354207661726961626c655f7265706f7274655f69642c20636f6e636174286e6f6d6272652c20272028272c20756e696461642c202729272920204153206e6f6d6272650a2020202020202046524f4d2062682e7661726961626c655f7265706f72746520494e4e4552204a4f494e2062682e6172636869766f5f7265706f727465204f4e207661726961626c655f7265706f727465203d207661726961626c655f7265706f7274655f69640a20202020202020574845524520626173655f6461746f203d203a626173655f6461746f20414e44207661726961626c655f7265706f727465203c3e20380a202020202020204f52444552204259206f72646572');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571278', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571279', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354207661726961626c655f7265706f7274655f69642c20636f6e636174286e6f6d6272652c20272028272c20756e696461642c202729272920204153206e6f6d6272650a2020202020202046524f4d2062682e7661726961626c655f7265706f72746520494e4e4552204a4f494e2062682e6172636869766f5f7265706f727465204f4e207661726961626c655f7265706f727465203d207661726961626c655f7265706f7274655f69640a20202020202020574845524520626173655f6461746f203d203a626173655f6461746f20414e44207661726961626c655f7265706f727465203c3e20380a202020202020204f52444552204259206f7264656e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571280', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206c61206375656e63612064652063616c6962726163696f6e227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571281', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e63616c6962726163696f6e5f7461626c655f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020207661726961626c6520746578742c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571282', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354207661726961626c655f63616c6962726163696f6e5f69642c20636f6e636174286e6f6d6272652c20272028272c20756e696461642c202729272920204153206e6f6d6272650a2020202020202046524f4d2062682e7661726961626c655f63616c6962726163696f6e20494e4e4552204a4f494e2062682e6172636869766f5f63616c6962726163696f6e204f4e207661726961626c655f63616c6962726163696f6e203d207661726961626c655f63616c6962726163696f6e5f69640a202020202020205748455245207661726961626c655f63616c6962726163696f6e5f6964203c3e203820414e4420626173655f6461746f203d203a626173655f6461746f0a202020202020204f52444552204259206f7264656e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571283', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571284', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354207661726961626c655f63616c6962726163696f6e5f69642c20636f6e636174286e6f6d6272652c20272028272c20756e696461642c202729272920204153206e6f6d6272650a2020202020202046524f4d2062682e7661726961626c655f63616c6962726163696f6e20494e4e4552204a4f494e2062682e6172636869766f5f63616c6962726163696f6e204f4e207661726961626c655f63616c6962726163696f6e203d207661726961626c655f63616c6962726163696f6e5f69640a202020202020205748455245207661726961626c655f63616c6962726163696f6e5f6964203c3e203820414e4420626173655f6461746f203d203a626173655f6461746f0a202020202020204f52444552204259206f7264656e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571285', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206375656e6361227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571286', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e7265706f7274655f677261706869635f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020206e6f6d62726520746578742c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571288', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206375656e6361227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571289', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e63616c6962726163696f6e5f677261706869635f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020206e6f6d62726520746578742c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571715', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e0a202046524f4d2062682e646174615f7265706f7274650a2020574845524520626173655f6461746f203d203a626173655f6461746f200a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571716', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571717', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e0a202046524f4d2062682e646174615f7265706f7274650a2020574845524520626173655f6461746f203d203a626173655f6461746f200a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571718', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e0a202046524f4d2062682e646174615f63616c6962726163696f6e0a2020574845524520626173655f6461746f203d203a626173655f6461746f200a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571719', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571720', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e0a202046524f4d2062682e646174615f63616c6962726163696f6e0a2020574845524520626173655f6461746f203d203a626173655f6461746f200a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571721', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('571722', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e0a202046524f4d2062682e646174615f63616c6962726163696f6e0a2020574845524520626173655f6461746f203d203a626173655f6461746f200a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572507', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420626173655f6461746f5f69642c206e6f6d6272650a202046524f4d2062682e626173655f6461746f0a20205748455245206e6f6d627265206c696b65203a6e6f6d627265');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572508', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226e6f6d627265222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a224e6f6d627265206465206c612062617365206465206461746f73227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572509', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420626173655f6461746f5f69642c206e6f6d6272650a202046524f4d2062682e626173655f6461746f0a20205748455245206e6f6d627265206c696b65203a6e6f6d627265');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572510', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226e6f6d627265222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a224e6f6d627265206465206c612062617365206465206461746f73227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572511', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420626173655f6461746f5f69642c206e6f6d6272650a202046524f4d2062682e626173655f6461746f0a20205748455245205550504552286e6f6d62726529204c494b4520555050455228203a6e6f6d62726529');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572512', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226e6f6d627265222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a224e6f6d627265206465206c612062617365206465206461746f73227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572513', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420626173655f6461746f5f69642c206e6f6d6272650a202046524f4d2062682e626173655f6461746f0a20205748455245205550504552286e6f6d62726529204c494b4520555050455228203a6e6f6d62726529');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572645', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a0a46524f4d2062682e636170615f61646963696f6e616c0a574845524520626173655f6461746f203d203a626173655f6461746f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572646', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572647', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a0a46524f4d2062682e636170615f61646963696f6e616c0a574845524520626173655f6461746f203d203a626173655f6461746f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572648', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a0a46524f4d2062682e636c696d610a574845524520626173655f6461746f203d203a626173655f6461746f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572649', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a0a46524f4d2062682e636c696d610a574845524520626173655f6461746f203d203a626173655f6461746f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572650', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572651', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a0a46524f4d2062682e636c696d610a574845524520626173655f6461746f203d203a626173655f6461746f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572652', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572653', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2c2020762e6e6f6d6272652c20762e6f7264656e0a46524f4d2062682e636c696d6120632c2062682e7661726961626c655f636c696d6120760a776865726520612e7661726961626c655f636c696d61203d20762e7661726961626c655f636c696d615f69640a616e6420626173655f6461746f203d203a626173650a574845524520626173655f6461746f203d203a626173655f6461746f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572654', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572655', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2c2020762e6e6f6d6272652c20762e6f7264656e0a46524f4d2062682e636c696d6120632c2062682e7661726961626c655f636c696d6120760a574845524520612e7661726961626c655f636c696d61203d20762e7661726961626c655f636c696d615f69640a414e442020626173655f6461746f203d203a626173655f6461746f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572656', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572657', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2c2020762e6e6f6d6272652c20762e6f7264656e0a46524f4d2062682e636c696d6120632c2062682e7661726961626c655f636c696d6120760a574845524520632e7661726961626c655f636c696d61203d20762e7661726961626c655f636c696d615f69640a414e442020626173655f6461746f203d203a626173655f6461746f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572658', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572659', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420632e636c696d615f69642c2020762e6e6f6d6272652c20762e6f7264656e0a46524f4d2062682e636c696d6120632c2062682e7661726961626c655f636c696d6120760a574845524520632e7661726961626c655f636c696d61203d20762e7661726961626c655f636c696d615f69640a414e442020626173655f6461746f203d203a626173655f6461746f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572717', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e2c20726f756e6428434153542853554d286461746f292f3132206173206e756d65726963292c2032292041532076616c6f720a202046524f4d2062682e646174615f63616c6962726163696f6e0a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f63616c6962726163696f6e203d203a7661726961626c655f63616c6962726163696f6e0a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572718', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572719', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e2c20726f756e6428434153542853554d286461746f292f3132206173206e756d65726963292c2032292041532076616c6f720a202046524f4d2062682e646174615f63616c6962726163696f6e0a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f63616c6962726163696f6e203d203a7661726961626c655f63616c6962726163696f6e0a202047524f55502042592067657374696f6e0a20204f524445522042592067657374696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572720', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572721', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542067657374696f6e2c206461746f2041532076616c6f720a202046524f4d2062682e646174615f63616c6962726163696f6e0a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f63616c6962726163696f6e203d203a7661726961626c655f63616c6962726163696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572722', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572723', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420636f6e636174286d65732c20272d272c2067657374696f6e292041532067657374696f6e2c206461746f2041532076616c6f720a202046524f4d2062682e646174615f63616c6962726163696f6e0a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f63616c6962726163696f6e203d203a7661726961626c655f63616c6962726163696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572724', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206c61206375656e6361227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572725', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420636f6e636174286d65732c20272d272c2067657374696f6e292041532067657374696f6e2c206461746f2041532076616c6f720a202046524f4d2062682e646174615f63616c6962726163696f6e0a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f63616c6962726163696f6e203d203a7661726961626c655f63616c6962726163696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572726', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206c61206375656e6361227d2c7b226e616d65223a227661726961626c655f63616c6962726163696f6e222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a224944207661726961626c652063616c6962726163696f6e227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572727', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420636f6e636174286d65732c20272d272c2067657374696f6e292041532067657374696f6e2c206461746f2041532076616c6f720a202046524f4d2062682e646174615f63616c6962726163696f6e0a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f63616c6962726163696f6e203d203a7661726961626c655f63616c6962726163696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572728', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206c61206375656e6361227d2c7b226e616d65223a227661726961626c655f63616c6962726163696f6e222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a224944207661726961626c652063616c6962726163696f6e227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572729', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420636f6e636174286d65732c20272d272c2067657374696f6e292041532067657374696f6e2c20726f756e642843415354286461746f206173206e756d65726963292c20322941532076616c6f720a202046524f4d2062682e646174615f63616c6962726163696f6e0a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f63616c6962726163696f6e203d203a7661726961626c655f63616c6962726163696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572730', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420636f6e636174286d65732c20272d272c2067657374696f6e292041532067657374696f6e2c20726f756e642843415354286461746f29206173206e756d65726963292c2032292041532076616c6f720a202046524f4d2062682e646174615f7265706f7274650a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f7265706f727465203d2032');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572731', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572732', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420636f6e636174286d65732c20272d272c2067657374696f6e292041532067657374696f6e2c20726f756e642843415354286461746f29206173206e756d65726963292c2032292041532076616c6f720a202046524f4d2062682e646174615f7265706f7274650a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f7265706f727465203d2032');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572733', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206c61206375656e6361227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572734', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420636f6e636174286d65732c20272d272c2067657374696f6e292041532067657374696f6e2c20726f756e642843415354286461746f29206173206e756d65726963292c2032292041532076616c6f720a202046524f4d2062682e646174615f7265706f7274650a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f7265706f727465203d2032');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572735', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206c61206375656e6361227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572736', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420636f6e636174286d65732c20272d272c2067657374696f6e292041532067657374696f6e2c20726f756e642843415354286461746f29206173206e756d65726963292c2032292041532076616c6f720a202046524f4d2062682e646174615f7265706f7274650a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f7265706f727465203d2032');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572737', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206c61206375656e6361227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572738', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420636f6e636174286d65732c20272d272c2067657374696f6e292041532067657374696f6e2c20726f756e642843415354286461746f206173206e756d65726963292c2032292041532076616c6f720a202046524f4d2062682e646174615f7265706f7274650a2020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420636f6469676f203d203a636f6469676f20414e44207661726961626c655f7265706f727465203d2032');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572739', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354207661726961626c655f63616c6962726163696f6e5f69642c20636f6e636174286e6f6d6272652c20272028272c20756e696461642c202729272920204153206e6f6d6272650a2020202020202046524f4d2062682e7661726961626c655f63616c6962726163696f6e20494e4e4552204a4f494e2062682e6172636869766f5f63616c6962726163696f6e204f4e207661726961626c655f63616c6962726163696f6e203d207661726961626c655f63616c6962726163696f6e5f69640a202020202020205748455245207661726961626c655f63616c6962726163696f6e5f6964203d203a7661726961626c655f63616c6962726163696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572740', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227661726961626c655f63616c6962726163696f6e222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a224944207661726961626c652063616c6962726163696f6e227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572741', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354207661726961626c655f63616c6962726163696f6e5f69642c20636f6e636174286e6f6d6272652c20272028272c20756e696461642c202729272920204153206e6f6d6272650a2020202020202046524f4d2062682e7661726961626c655f63616c6962726163696f6e20494e4e4552204a4f494e2062682e6172636869766f5f63616c6962726163696f6e204f4e207661726961626c655f63616c6962726163696f6e203d207661726961626c655f63616c6962726163696f6e5f69640a202020202020205748455245207661726961626c655f63616c6962726163696f6e5f6964203d203a7661726961626c655f63616c6962726163696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572742', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354207661726961626c655f63616c6962726163696f6e5f69642c20636f6e636174286e6f6d6272652c20272028272c20756e696461642c202729272920204153206e6f6d6272650a2020202020202046524f4d2062682e7661726961626c655f63616c6962726163696f6e20494e4e4552204a4f494e2062682e6172636869766f5f63616c6962726163696f6e204f4e207661726961626c655f63616c6962726163696f6e203d207661726961626c655f63616c6962726163696f6e5f69640a20202020202020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420287661726961626c655f63616c6962726163696f6e5f6964203d2032204f52207661726961626c655f63616c6962726163696f6e5f6964203d203929');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572743', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572744', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354207661726961626c655f63616c6962726163696f6e5f69642c20636f6e636174286e6f6d6272652c20272028272c20756e696461642c202729272920204153206e6f6d6272650a2020202020202046524f4d2062682e7661726961626c655f63616c6962726163696f6e20494e4e4552204a4f494e2062682e6172636869766f5f63616c6962726163696f6e204f4e207661726961626c655f63616c6962726163696f6e203d207661726961626c655f63616c6962726163696f6e5f69640a20202020202020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420287661726961626c655f63616c6962726163696f6e5f6964203d2032204f52207661726961626c655f63616c6962726163696f6e5f6964203d203929');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572745', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420612e2a2c20762e6e6f6d6272652c20762e6f7264656e2066726f6d2062682e636c696d6120612c2062682e7661726961626c655f636c696d6120760a776865726520612e7661726961626c655f636c696d61203d20762e7661726961626c655f636c696d615f69640a616e6420626173655f6461746f203d203a626173650a6f72646572206279206f7264656e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572746', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572747', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420612e2a2c20762e6e6f6d6272652c20762e6f7264656e2066726f6d2062682e636c696d6120612c2062682e7661726961626c655f636c696d6120760a776865726520612e7661726961626c655f636c696d61203d20762e7661726961626c655f636c696d615f69640a616e6420626173655f6461746f203d203a626173650a6f72646572206279206f7264656e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572748', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420612e2a2066726f6d2062682e636170615f61646963696f6e616c20610a776865726520626173655f6461746f203d203a626173650a6f7264657220627920646174655f637265617465');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572749', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572750', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420612e2a2066726f6d2062682e636170615f61646963696f6e616c20610a776865726520626173655f6461746f203d203a626173650a6f7264657220627920646174655f637265617465');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572751', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206c61206375656e63612064652063616c6962726163696f6e227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572752', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e63616c6962726163696f6e5f687964726f67726170685f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020206e6f6d62726520746578742c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572753', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206c61206375656e6361227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572754', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e7265706f7274655f687964726f67726170685f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020206e6f6d62726520746578742c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572755', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206c61206375656e6361227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572756', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a2046524f4d2062682e7265706f7274655f687964726f67726170685f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020206e6f6d62726520746578742c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a2020293b2020');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572757', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354207661726961626c655f7265706f7274655f69642c20636f6e636174286e6f6d6272652c20272028272c20756e696461642c202729272920204153206e6f6d6272650a2020202020202046524f4d2062682e7661726961626c655f7265706f72746520494e4e4552204a4f494e2062682e6172636869766f5f7265706f727465204f4e207661726961626c655f7265706f727465203d207661726961626c655f7265706f7274655f69640a20202020202020574845524520626173655f6461746f203d203a626173655f6461746f20414e44207661726961626c655f63616c6962726163696f6e5f6964203d203220');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572758', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572759', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354207661726961626c655f7265706f7274655f69642c20636f6e636174286e6f6d6272652c20272028272c20756e696461642c202729272920204153206e6f6d6272650a2020202020202046524f4d2062682e7661726961626c655f7265706f72746520494e4e4552204a4f494e2062682e6172636869766f5f7265706f727465204f4e207661726961626c655f7265706f727465203d207661726961626c655f7265706f7274655f69640a20202020202020574845524520626173655f6461746f203d203a626173655f6461746f20414e44207661726961626c655f63616c6962726163696f6e5f6964203d203220');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572760', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572761', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354207661726961626c655f7265706f7274655f69642c20636f6e636174286e6f6d6272652c20272028272c20756e696461642c202729272920204153206e6f6d6272650a2020202020202046524f4d2062682e7661726961626c655f7265706f72746520494e4e4552204a4f494e2062682e6172636869766f5f7265706f727465204f4e207661726961626c655f7265706f727465203d207661726961626c655f7265706f7274655f69640a20202020202020574845524520626173655f6461746f203d203a626173655f6461746f20414e44207661726961626c655f7265706f7274655f6964203d203220');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572763', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572764', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572765', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354207661726961626c655f7265706f7274655f69642c20636f6e636174286e6f6d6272652c20272028272c20756e696461642c202729272920204153206e6f6d6272650a2020202020202046524f4d2062682e7661726961626c655f7265706f72746520494e4e4552204a4f494e2062682e6172636869766f5f7265706f727465204f4e207661726961626c655f7265706f727465203d207661726961626c655f7265706f7274655f69640a20202020202020574845524520626173655f6461746f203d203a626173655f6461746f20414e44207661726961626c655f7265706f7274655f6964203d203220');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572766', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572767', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354207661726961626c655f7265706f7274655f69642c20636f6e636174286e6f6d6272652c20272028272c20756e696461642c202729272920204153206e6f6d6272650a2020202020202046524f4d2062682e7661726961626c655f7265706f72746520494e4e4552204a4f494e2062682e6172636869766f5f7265706f727465204f4e207661726961626c655f7265706f727465203d207661726961626c655f7265706f7274655f69640a20202020202020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420287661726961626c655f7265706f7274655f6964203d20342020414e44207661726961626c655f7265706f7274655f6964203d20362020414e44207661726961626c655f7265706f7274655f6964203d203729');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572768', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572769', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354207661726961626c655f7265706f7274655f69642c20636f6e636174286e6f6d6272652c20272028272c20756e696461642c202729272920204153206e6f6d6272650a2020202020202046524f4d2062682e7661726961626c655f7265706f72746520494e4e4552204a4f494e2062682e6172636869766f5f7265706f727465204f4e207661726961626c655f7265706f727465203d207661726961626c655f7265706f7274655f69640a20202020202020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420287661726961626c655f7265706f7274655f6964203d203420204f52207661726961626c655f7265706f7274655f6964203d203620204f52207661726961626c655f7265706f7274655f6964203d203729');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572770', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354207661726961626c655f63616c6962726163696f6e5f69642c20636f6e636174286e6f6d6272652c20272028272c20756e696461642c202729272920204153206e6f6d6272650a2020202020202046524f4d2062682e7661726961626c655f63616c6962726163696f6e20494e4e4552204a4f494e2062682e6172636869766f5f63616c6962726163696f6e204f4e207661726961626c655f63616c6962726163696f6e203d207661726961626c655f63616c6962726163696f6e5f69640a20202020202020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420287661726961626c655f63616c6962726163696f6e5f6964203d203420204f52207661726961626c655f63616c6962726163696f6e5f6964203d203620204f52207661726961626c655f63616c6962726163696f6e5f6964203d203729');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572771', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572772', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354207661726961626c655f63616c6962726163696f6e5f69642c20636f6e636174286e6f6d6272652c20272028272c20756e696461642c202729272920204153206e6f6d6272650a2020202020202046524f4d2062682e7661726961626c655f63616c6962726163696f6e20494e4e4552204a4f494e2062682e6172636869766f5f63616c6962726163696f6e204f4e207661726961626c655f63616c6962726163696f6e203d207661726961626c655f63616c6962726163696f6e5f69640a20202020202020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420287661726961626c655f63616c6962726163696f6e5f6964203d203420204f52207661726961626c655f63616c6962726163696f6e5f6964203d203620204f52207661726961626c655f63616c6962726163696f6e5f6964203d203729');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572773', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a0a46524f4d2062682e636170615f61646963696f6e616c0a574845524520626173655f6461746f203d203a626173655f6461746f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572774', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572775', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a0a46524f4d2062682e636170615f61646963696f6e616c0a574845524520626173655f6461746f203d203a626173655f6461746f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572776', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572777', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354202a0a46524f4d2062682e636170615f61646963696f6e616c0a574845524520626173655f6461746f203d203a626173655f6461746f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572778', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354207661726961626c655f7265706f7274655f69642c20636f6e636174286e6f6d6272652c20272028272c20756e696461642c202729272920204153206e6f6d6272650a2020202020202046524f4d2062682e7661726961626c655f7265706f72746520494e4e4552204a4f494e2062682e6172636869766f5f7265706f727465204f4e207661726961626c655f7265706f727465203d207661726961626c655f7265706f7274655f69640a20202020202020574845524520626173655f6461746f203d203a626173655f6461746f20414e44207661726961626c655f7265706f7274655f6964203c3e2038');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572779', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572780', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354207661726961626c655f7265706f7274655f69642c20636f6e636174286e6f6d6272652c20272028272c20756e696461642c202729272920204153206e6f6d6272650a2020202020202046524f4d2062682e7661726961626c655f7265706f72746520494e4e4552204a4f494e2062682e6172636869766f5f7265706f727465204f4e207661726961626c655f7265706f727465203d207661726961626c655f7265706f7274655f69640a20202020202020574845524520626173655f6461746f203d203a626173655f6461746f20414e44207661726961626c655f7265706f7274655f6964203c3e2038');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572781', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572782', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354207661726961626c655f7265706f7274655f69642c20636f6e636174286e6f6d6272652c20272028272c20756e696461642c202729272920204153206e6f6d6272650a2020202020202046524f4d2062682e7661726961626c655f7265706f72746520494e4e4552204a4f494e2062682e6172636869766f5f7265706f727465204f4e207661726961626c655f7265706f727465203d207661726961626c655f7265706f7274655f69640a20202020202020574845524520626173655f6461746f203d203a626173655f6461746f20414e44207661726961626c655f7265706f7274655f6964203c3e20380a2020202020204f52444552204259206f72646572');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572783', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572784', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354207661726961626c655f7265706f7274655f69642c20636f6e636174286e6f6d6272652c20272028272c20756e696461642c202729272920204153206e6f6d6272650a2020202020202046524f4d2062682e7661726961626c655f7265706f72746520494e4e4552204a4f494e2062682e6172636869766f5f7265706f727465204f4e207661726961626c655f7265706f727465203d207661726961626c655f7265706f7274655f69640a20202020202020574845524520626173655f6461746f203d203a626173655f6461746f20414e44207661726961626c655f7265706f7274655f6964203c3e20380a2020202020204f52444552204259206f7264656e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572785', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572786', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354207661726961626c655f7265706f7274655f69642c20636f6e636174286e6f6d6272652c20272028272c20756e696461642c202729272920204153206e6f6d6272650a2020202020202046524f4d2062682e7661726961626c655f7265706f72746520494e4e4552204a4f494e2062682e6172636869766f5f7265706f727465204f4e207661726961626c655f7265706f727465203d207661726961626c655f7265706f7274655f69640a20202020202020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420287661726961626c655f7265706f7274655f6964203d203420204f52207661726961626c655f7265706f7274655f6964203d203620204f52207661726961626c655f7265706f7274655f6964203d2037290a4f52444552204259206f7264656e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572787', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572788', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354207661726961626c655f63616c6962726163696f6e5f69642c20636f6e636174286e6f6d6272652c20272028272c20756e696461642c202729272920204153206e6f6d6272650a2020202020202046524f4d2062682e7661726961626c655f63616c6962726163696f6e20494e4e4552204a4f494e2062682e6172636869766f5f63616c6962726163696f6e204f4e207661726961626c655f63616c6962726163696f6e203d207661726961626c655f63616c6962726163696f6e5f69640a20202020202020574845524520626173655f6461746f203d203a626173655f6461746f20414e4420287661726961626c655f63616c6962726163696f6e5f6964203d203420204f52207661726961626c655f63616c6962726163696f6e5f6964203d203620204f52207661726961626c655f63616c6962726163696f6e5f6964203d2037290a4f52444552204259206f7264656e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572925', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354207265706f7274655f69642c206e6f6d6272652c2053545f417347656f4a534f4e287468655f67656f6d29206173205f67656f5f6a736f6e0a202046524f4d2062682e7265706f7274650a2020574845524520626173655f7265706f727465203d203130');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572926', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354207265706f7274655f69642c206e6f6d6272652c2053545f417347656f4a534f4e287468655f67656f6d29206173205f67656f5f6a736f6e0a202046524f4d2062682e7265706f7274650a2020574845524520626173655f7265706f727465203d203a626173655f7265706f727465');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572927', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227461626c61222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a225461626c612061206c612071756520736520636f6e73756c74617261227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572928', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354207265706f7274655f69642c206e6f6d6272652c2053545f417347656f4a534f4e287468655f67656f6d29206173205f67656f5f6a736f6e0a202046524f4d2062682e7265706f7274650a2020574845524520626173655f7265706f727465203d203a626173655f7265706f727465');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572929', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227461626c61222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a225461626c612061206c612071756520736520636f6e73756c74617261227d2c7b226e616d65223a22626173655f7265706f727465222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22494420626173655f7265706f727465227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572930', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354207265706f7274655f69642c206e6f6d6272652c2053545f417347656f4a534f4e287468655f67656f6d29206173205f67656f5f6a736f6e0a202046524f4d2062682e7265706f7274650a2020574845524520626173655f7265706f727465203d203a626173655f7265706f727465');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572931', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227461626c61222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a225461626c612061206c612071756520736520636f6e73756c74617261227d2c7b226e616d65223a22626173655f7265706f727465222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22494420626173655f7265706f727465227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572932', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354207265706f7274655f69642c206e6f6d6272652c2053545f417347656f4a534f4e287468655f67656f6d29206173205f67656f5f6a736f6e0a202046524f4d2062682e7265706f7274650a2020574845524520626173655f7265706f727465203d203a626173655f7265706f727465');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572933', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227461626c61222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a225461626c612061206c612071756520736520636f6e73756c74617261227d2c7b226e616d65223a22626173655f7265706f727465222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22494420626173655f7265706f727465227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572934', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354203a7461626c612c206e6f6d6272652c2053545f417347656f4a534f4e287468655f67656f6d29206173205f67656f5f6a736f6e0a202046524f4d2062682e7265706f7274650a2020574845524520626173655f7265706f727465203d203a626173655f7265706f727465');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572935', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227461626c61222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a225461626c612061206c612071756520736520636f6e73756c74617261227d2c7b226e616d65223a22626173655f7265706f727465222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22494420626173655f7265706f727465227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572936', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354203a7461626c612c206e6f6d6272652c2053545f417347656f4a534f4e287468655f67656f6d29206173205f67656f5f6a736f6e0a202046524f4d2062682e7461626c610a2020574845524520626173655f7265706f727465203d203a626173655f7265706f727465');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572937', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227461626c61222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a225461626c612061206c612071756520736520636f6e73756c74617261227d2c7b226e616d65223a22626173655f7265706f727465222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22494420626173655f7265706f727465227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572938', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354207265706f7274655f69642c206e6f6d6272652c2053545f417347656f4a534f4e287468655f67656f6d29206173205f67656f5f6a736f6e0a202046524f4d2062682e7265706f7274650a2020574845524520626173655f7265706f727465203d203a626173655f7265706f727465');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572939', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f7265706f727465222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22494420626173655f7265706f727465227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572940', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354207265706f7274655f69642c206e6f6d6272652c2053545f417347656f4a534f4e287468655f67656f6d29206173205f67656f5f6a736f6e0a202046524f4d2062682e7265706f7274650a2020574845524520626173655f7265706f727465203d203a626173655f7265706f727465');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572941', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f7265706f727465222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22494420626173655f7265706f727465227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572942', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354203a7461626c615f69642c206e6f6d6272652c2053545f417347656f4a534f4e287468655f67656f6d29206173205f67656f5f6a736f6e0a202046524f4d2062682e7265706f7274650a2020574845524520626173655f7265706f727465203d203a626173655f7265706f727465');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572943', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f7265706f727465222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22494420626173655f7265706f727465227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572944', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354207265706f7274655f69642c206e6f6d6272652c2053545f417347656f4a534f4e287468655f67656f6d29206173205f67656f5f6a736f6e0a202046524f4d2062682e7265706f7274650a2020574845524520626173655f7265706f727465203d203a626173655f7265706f727465');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572945', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f7265706f727465222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22494420626173655f7265706f727465227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572946', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354207265706f7274655f69642c206e6f6d6272652c2053545f417347656f4a534f4e287468655f67656f6d29206173205f67656f5f6a736f6e0a202046524f4d2062682e7265706f7274650a2020574845524520626173655f7265706f727465203d203a626173655f7265706f727465');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572947', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('572948', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420632e636c696d615f69642c20632e75726c2c20762e6e6f6d6272652c20762e6f7264656e0a46524f4d2062682e636c696d6120632c2062682e7661726961626c655f636c696d6120760a574845524520632e7661726961626c655f636c696d61203d20762e7661726961626c655f636c696d615f69640a414e442020626173655f6461746f203d203a626173655f6461746f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('573168', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a224964656e746966696361646f7220fa6e69636f2064652042617365206465204461746f73206465207265706f7274652e227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('573169', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a224964656e746966696361646f7220fd6e69636f2064652042617365206465204461746f73206465207265706f7274652e227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('573170', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354207265706f7274655f69642c206e6f6d6272652c20636f6469676f2c20626173655f7265706f7274652c2053545f417347656f4a736f6e2853545f53696d706c696679287468655f67656f6d2c302e30312929206173207468655f67656f6d0a46524f4d2062682e7265706f7274650a574845524520626173655f7265706f727465203d203a6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('573171', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a224964656e746966696361646f7220fa6e69636f2064652042617365206465204461746f732064652063616c696272616369f36e2e227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('573172', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a224964656e746966696361646f7220fd6e69636f2064652042617365206465204461746f732064652063616c696272616369fd6e2e227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('573173', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542063616c6962726163696f6e5f69642c206e6f6d6272652c20636f6469676f2c20626173655f63616c6962726163696f6e2c2053545f417347656f4a736f6e2853545f53696d706c696679287468655f67656f6d2c302e30312929206173207468655f67656f6d0a46524f4d2062682e63616c6962726163696f6e0a574845524520626173655f63616c6962726163696f6e203d203a6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('573380', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('573381', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d2c7b226e616d65223a22706f696e74222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('573382', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d2c7b226e616d65223a22706f696e74222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('573383', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420632e7265706f7274655f69642061732069642c20632e6e6f6d6272652c20632e636f6469676f2c2073745f61737465787428632e7468655f67656f6d292066726f6d2062682e7265706f72746520632c2062682e626173655f7265706f72746520620a77686572652053545f436f6e7461696e7328632e7468655f67656f6d2c2073745f47656f6d46726f6d54657874283a706f696e742c3433323629290a616e6420632e626173655f7265706f727465203d20622e626173655f7265706f7274655f69640a616e6420622e626173655f6461746f203d203a62617365');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('573384', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d2c7b226e616d65223a22706f696e74222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('573385', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420632e7265706f7274655f69642061732069642c20632e6e6f6d6272652c20632e636f6469676f2c2073745f61737465787428632e7468655f67656f6d29206173207468655f67656f6d2066726f6d2062682e7265706f72746520632c2062682e626173655f7265706f72746520620a77686572652053545f436f6e7461696e7328632e7468655f67656f6d2c2073745f47656f6d46726f6d54657874283a706f696e742c3433323629290a616e6420632e626173655f7265706f727465203d20622e626173655f7265706f7274655f69640a616e6420622e626173655f6461746f203d203a62617365');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('573386', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d2c7b226e616d65223a22706f696e74222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('573387', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420632e7265706f7274655f69642061732069642c20632e6e6f6d6272652c20632e636f6469676f2c2073745f61737465787428632e7468655f67656f6d29206173207468655f67656f6d2066726f6d2062682e7265706f72746520632c2062682e626173655f7265706f72746520620a77686572652053545f436f6e7461696e7328632e7468655f67656f6d2c2073745f47656f6d46726f6d54657874283a706f696e742c3433323629290a616e6420632e626173655f7265706f727465203d20622e626173655f7265706f7274655f69640a616e6420622e626173655f6461746f203d203a62617365');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('573388', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('573389', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d2c7b226e616d65223a22706f696e74222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('573390', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d2c7b226e616d65223a22706f696e74222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('573391', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420632e7265706f7274655f69642061732069642c20632e6e6f6d6272652c20632e636f6469676f2c2073745f61737465787428632e7468655f67656f6d29206173207468655f67656f6d2066726f6d2062682e63616c6962726163696f6e20632c2062682e626173655f63616c6962726163696f6e20620a77686572652053545f436f6e7461696e7328632e7468655f67656f6d2c2073745f47656f6d46726f6d54657874283a706f696e742c3433323629290a616e6420632e626173655f63616c6962726163696f6e203d20622e626173655f63616c6962726163696f6e5f69640a616e6420622e626173655f6461746f203d203a62617365');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('573392', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d2c7b226e616d65223a22706f696e74222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('573393', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420632e63616c6962726163696f6e5f69642061732069642c20632e6e6f6d6272652c20632e636f6469676f2c2073745f61737465787428632e7468655f67656f6d29206173207468655f67656f6d2066726f6d2062682e63616c6962726163696f6e20632c2062682e626173655f63616c6962726163696f6e20620a77686572652053545f436f6e7461696e7328632e7468655f67656f6d2c2073745f47656f6d46726f6d54657874283a706f696e742c3433323629290a616e6420632e626173655f63616c6962726163696f6e203d20622e626173655f63616c6962726163696f6e5f69640a616e6420622e626173655f6461746f203d203a62617365');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('573394', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d2c7b226e616d65223a22706f696e74222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('573395', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420632e63616c6962726163696f6e5f69642061732069642c20632e6e6f6d6272652c20632e636f6469676f2c2073745f61737465787428632e7468655f67656f6d29206173207468655f67656f6d2066726f6d2062682e63616c6962726163696f6e20632c2062682e626173655f63616c6962726163696f6e20620a77686572652053545f436f6e7461696e7328632e7468655f67656f6d2c2073745f47656f6d46726f6d54657874283a706f696e742c3433323629290a616e6420632e626173655f63616c6962726163696f6e203d20622e626173655f63616c6962726163696f6e5f69640a616e6420622e626173655f6461746f203d203a62617365');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('573501', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d2c7b226e616d65223a22706f696e74222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('573502', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420632e7265706f7274655f69642061732069642c20632e6e6f6d6272652c20632e636f6469676f2c2073745f61737465787428632e7468655f67656f6d29206173207468655f67656f6d2c2053545f417347656f4a736f6e28632e7468655f67656f6d292061732067656f5f6a736f6e2066726f6d2062682e7265706f72746520632c2062682e626173655f7265706f72746520620a77686572652053545f436f6e7461696e7328632e7468655f67656f6d2c2073745f47656f6d46726f6d54657874283a706f696e742c3433323629290a616e6420632e626173655f7265706f727465203d20622e626173655f7265706f7274655f69640a616e6420622e626173655f6461746f203d203a62617365');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('573503', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d2c7b226e616d65223a22706f696e74222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('573504', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420632e63616c6962726163696f6e5f69642061732069642c20632e6e6f6d6272652c20632e636f6469676f2c2073745f61737465787428632e7468655f67656f6d29206173207468655f67656f6d2c2053545f417347656f4a736f6e28632e7468655f67656f6d292061732067656f5f6a736f6e2066726f6d2062682e63616c6962726163696f6e20632c2062682e626173655f63616c6962726163696f6e20620a77686572652053545f436f6e7461696e7328632e7468655f67656f6d2c2073745f47656f6d46726f6d54657874283a706f696e742c3433323629290a616e6420632e626173655f63616c6962726163696f6e203d20622e626173655f63616c6962726163696f6e5f69640a616e6420622e626173655f6461746f203d203a62617365');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('573608', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d2c7b226e616d65223a22706f696e74222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('573609', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420632e7265706f7274655f69642061732069642c20632e6e6f6d6272652c20632e636f6469676f2c2073745f61737465787428632e7468655f67656f6d29206173207468655f67656f6d2c2053545f417347656f4a736f6e2853545f53696d706c69667928632e7468655f67656f6d2c302e303129292061732067656f5f6a736f6e2066726f6d2062682e7265706f72746520632c2062682e626173655f7265706f72746520620a77686572652053545f436f6e7461696e7328632e7468655f67656f6d2c2073745f47656f6d46726f6d54657874283a706f696e742c3433323629290a616e6420632e626173655f7265706f727465203d20622e626173655f7265706f7274655f69640a616e6420622e626173655f6461746f203d203a62617365');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('573610', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2262617365222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d2c7b226e616d65223a22706f696e74222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('573611', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420632e63616c6962726163696f6e5f69642061732069642c20632e6e6f6d6272652c20632e636f6469676f2c2073745f61737465787428632e7468655f67656f6d29206173207468655f67656f6d2c2053545f417347656f4a736f6e2853545f53696d706c69667928632e7468655f67656f6d2c302e303129292061732067656f5f6a736f6e2066726f6d2062682e63616c6962726163696f6e20632c2062682e626173655f63616c6962726163696f6e20620a77686572652053545f436f6e7461696e7328632e7468655f67656f6d2c2073745f47656f6d46726f6d54657874283a706f696e742c3433323629290a616e6420632e626173655f63616c6962726163696f6e203d20622e626173655f63616c6962726163696f6e5f69640a616e6420622e626173655f6461746f203d203a62617365');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('573612', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('573613', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('573614', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420632e7265706f7274655f69642061732069642c20632e6e6f6d6272652c20632e636f6469676f2c2073745f61737465787428632e7468655f67656f6d29206173207468655f67656f6d2c2053545f417347656f4a736f6e2853545f53696d706c69667928632e7468655f67656f6d2c302e303129292061732067656f5f6a736f6e2066726f6d2062682e7265706f72746520630a776865726520632e7265706f7274655f6964203d203a6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('573616', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('573617', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('573618', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420632e63616c6962726163696f6e5f69642061732069642c20632e6e6f6d6272652c20632e636f6469676f2c2073745f61737465787428632e7468655f67656f6d29206173207468655f67656f6d2c2053545f417347656f4a736f6e2853545f53696d706c69667928632e7468655f67656f6d2c302e303129292061732067656f5f6a736f6e2066726f6d2062682e63616c6962726163696f6e20630a776865726520632e63616c6962726163696f6e5f6964203d203a6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('573619', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('573620', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420632e63616c6962726163696f6e5f69642061732069642c20632e6e6f6d6272652c20632e636f6469676f2c2073745f61737465787428632e7468655f67656f6d29206173207468655f67656f6d2c2053545f417347656f4a736f6e2853545f53696d706c69667928632e7468655f67656f6d2c302e303129292061732067656f5f6a736f6e2066726f6d2062682e63616c6962726163696f6e20630a776865726520632e63616c6962726163696f6e5f6964203d203a6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('583147', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a224964656e746966696361646f7220fd6e69636f2064652042617365206465204461746f732064652063616c696272616369fd6e2e227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('583148', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542063616c6962726163696f6e5f69642c206e6f6d6272652c20636f6469676f2c20626173655f63616c6962726163696f6e2c0a434153450a20205748454e202853545f53696d706c696679287468655f67656f6d2c302e303129204953204e554c4c2029205448454e2053545f417347656f4a736f6e287468655f67656f6d290a2020454c53452053545f417347656f4a736f6e2853545f53696d706c696679287468655f67656f6d2c302e303129290a20454e44204153207468655f67656f6d0a46524f4d2062682e63616c6962726163696f6e0a574845524520626173655f63616c6962726163696f6e203d203a6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('583149', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a224964656e746966696361646f7220fd6e69636f2064652042617365206465204461746f73206465207265706f7274652e227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('583150', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c454354207265706f7274655f69642c206e6f6d6272652c20636f6469676f2c20626173655f7265706f7274652c200a434153450a20205748454e202853545f53696d706c696679287468655f67656f6d2c302e303129204953204e554c4c2029205448454e2053545f417347656f4a736f6e287468655f67656f6d290a2020454c53452053545f417347656f4a736f6e2853545f53696d706c696679287468655f67656f6d2c302e303129290a20454e44204153207468655f67656f6d0a46524f4d2062682e7265706f7274650a574845524520626173655f7265706f727465203d203a6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('583151', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206c61206375656e63612064652063616c6962726163696f6e227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('583152', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420742e2a2c200a2020202020202043415345205748454e20742e6964203d2032204f5220742e6964203d2039205448454e2028736570202b206f6374202b206e6f76202b20646963202b20656e65202b20666562202b206d6172202b20616272202b206d6179202b206a756e202b206a756c202b2061676f292f31320a202020202020202020202020454c53452028736570202b206f6374202b206e6f76202b20646963202b20656e65202b20666562202b206d6172202b20616272202b206d6179202b206a756e202b206a756c202b2061676f290a20202020202020454e4420617320746f74616c0a46524f4d202853454c454354202a2046524f4d2062682e63616c6962726163696f6e5f7461626c655f6d756c74695f6d6f6e74686c792028312c2027486964726f5f312729206173200a2020282020696420626967696e742c200a20202020207661726961626c6520746578742c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a202029292074');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('583153', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206c61206375656e63612064652063616c6962726163696f6e227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('583154', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420742e2a2c200a2020202020202043415345205748454e20742e6964203d2032204f5220742e6964203d2039205448454e2028736570202b206f6374202b206e6f76202b20646963202b20656e65202b20666562202b206d6172202b20616272202b206d6179202b206a756e202b206a756c202b2061676f292f31320a202020202020202020202020454c53452028736570202b206f6374202b206e6f76202b20646963202b20656e65202b20666562202b206d6172202b20616272202b206d6179202b206a756e202b206a756c202b2061676f290a20202020202020454e4420617320746f74616c0a46524f4d202853454c454354202a2046524f4d2062682e63616c6962726163696f6e5f7461626c655f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020207661726961626c6520746578742c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a202029292074');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('583155', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206c61206375656e63612064652063616c6962726163696f6e227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('583156', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420742e2a2c200a2020202020202043415345205748454e20742e6964203d2032204f5220742e6964203d2039205448454e20726f756e6428434153542828736570202b206f6374202b206e6f76202b20646963202b20656e65202b20666562202b206d6172202b20616272202b206d6179202b206a756e202b206a756c202b2061676f292f3132206173206e756d65726963292c2031290a202020202020202020202020454c53452028736570202b206f6374202b206e6f76202b20646963202b20656e65202b20666562202b206d6172202b20616272202b206d6179202b206a756e202b206a756c202b2061676f290a20202020202020454e4420617320746f74616c0a46524f4d202853454c454354202a2046524f4d2062682e63616c6962726163696f6e5f7461626c655f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020207661726961626c6520746578742c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a202029292074');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('583157', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206c61206375656e63612064652063616c6962726163696f6e227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('583158', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420742e2a2c200a2020202020202043415345205748454e20742e6964203d2032204f5220742e6964203d2039205448454e20726f756e6428434153542828736570202b206f6374202b206e6f76202b20646963202b20656e65202b20666562202b206d6172202b20616272202b206d6179202b206a756e202b206a756c202b2061676f292f3132206173206e756d65726963292c2031290a202020202020202020202020454c53452028736570202b206f6374202b206e6f76202b20646963202b20656e65202b20666562202b206d6172202b20616272202b206d6179202b206a756e202b206a756c202b2061676f290a20202020202020454e4420617320746f74616c0a46524f4d202853454c454354202a2046524f4d2062682e63616c6962726163696f6e5f7461626c655f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020207661726961626c6520746578742c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a202029292074');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('583159', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206c61206375656e63612064652063616c6962726163696f6e227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('583160', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420742e2a2c200a2020202020202043415345205748454e20742e6964203d2032204f5220742e6964203d2039205448454e20726f756e6428434153542828736570202b206f6374202b206e6f76202b20646963202b20656e65202b20666562202b206d6172202b20616272202b206d6179202b206a756e202b206a756c202b2061676f292f3132206173206e756d65726963292c2031290a202020202020202020202020454c53452020726f756e6428434153542828736570202b206f6374202b206e6f76202b20646963202b20656e65202b20666562202b206d6172202b20616272202b206d6179202b206a756e202b206a756c202b2061676f2920206173206e756d65726963292c2031290a20202020202020454e4420617320746f74616c0a46524f4d202853454c454354202a2046524f4d2062682e63616c6962726163696f6e5f7461626c655f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020207661726961626c6520746578742c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a202029292074');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('583161', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206c61206375656e6361227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('583162', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420742e2a2c200a2020202020202043415345205748454e20742e6964203d2032204f5220742e6964203d2039205448454e20726f756e6428434153542828736570202b206f6374202b206e6f76202b20646963202b20656e65202b20666562202b206d6172202b20616272202b206d6179202b206a756e202b206a756c202b2061676f292f3132206173206e756d65726963292c2031290a202020202020202020202020454c53452020726f756e6428434153542828736570202b206f6374202b206e6f76202b20646963202b20656e65202b20666562202b206d6172202b20616272202b206d6179202b206a756e202b206a756c202b2061676f2920206173206e756d65726963292c2031290a20202020202020454e4420617320746f74616c0a46524f4d202853454c454354202a2046524f4d2062682e7265706f7274655f7461626c655f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020207661726961626c6520746578742c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a202029292074');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('583163', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22626173655f6461746f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2249442062617365206461746f227d2c7b226e616d65223a22636f6469676f222c2274797065436c617373223a226368617261637465722076617279696e67222c226465736372697074696f6e223a22436f6469676f206465206c61206375656e6361227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('583164', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420742e2a2c200a2020202020202043415345205748454e20742e6964203d2032205448454e20726f756e6428434153542828736570202b206f6374202b206e6f76202b20646963202b20656e65202b20666562202b206d6172202b20616272202b206d6179202b206a756e202b206a756c202b2061676f292f3132206173206e756d65726963292c2031290a202020202020202020202020454c53452020726f756e6428434153542828736570202b206f6374202b206e6f76202b20646963202b20656e65202b20666562202b206d6172202b20616272202b206d6179202b206a756e202b206a756c202b2061676f2920206173206e756d65726963292c2031290a20202020202020454e4420617320746f74616c0a46524f4d202853454c454354202a2046524f4d2062682e7265706f7274655f7461626c655f6d756c74695f6d6f6e74686c7920283a626173655f6461746f2c203a636f6469676f29206173200a2020282020696420626967696e742c200a20202020207661726961626c6520746578742c0a202020202073657020646f75626c6520707265636973696f6e2c0a20202020206f637420646f75626c6520707265636973696f6e2c0a20202020206e6f7620646f75626c6520707265636973696f6e2c0a202020202064696320646f75626c6520707265636973696f6e2c0a2020202020656e6520646f75626c6520707265636973696f6e2c0a202020202066656220646f75626c6520707265636973696f6e2c0a20202020206d617220646f75626c6520707265636973696f6e2c0a202020202061627220646f75626c6520707265636973696f6e2c0a20202020206d617920646f75626c6520707265636973696f6e2c0a20202020206a756e20646f75626c6520707265636973696f6e2c0a20202020206a756c20646f75626c6520707265636973696f6e2c0a202020202061676f20646f75626c6520707265636973696f6e0a202029292074');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('595440', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420522e6e6f6d627265204153206e6f6d6272655f6375656e63612c2042442e6e6f6d627265204153206e6f6d6272655f62642c2042442e6465736372697063696f6e0a46524f4d2062682e7265706f727465205220494e4e4552204a4f494e2062682e626173655f7265706f727465204252204f4e20522e626173655f7265706f727465203d2042522e626173655f7265706f7274655f696420494e4e4552204a4f494e2062682e626173655f6461746f204244204f4e2042522e626173655f6461746f203d2042442e626173655f6461746f5f69640a574845524520522e7265706f7274655f6964203d203a7265706f727465');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('595441', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227265706f727465222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a227265706f727465227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('595442', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420522e6e6f6d627265204153206e6f6d6272655f6375656e63612c2042442e6e6f6d627265204153206e6f6d6272655f62642c2042442e6465736372697063696f6e0a46524f4d2062682e7265706f727465205220494e4e4552204a4f494e2062682e626173655f7265706f727465204252204f4e20522e626173655f7265706f727465203d2042522e626173655f7265706f7274655f696420494e4e4552204a4f494e2062682e626173655f6461746f204244204f4e2042522e626173655f6461746f203d2042442e626173655f6461746f5f69640a574845524520522e7265706f7274655f6964203d203a7265706f727465');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('595443', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227265706f727465222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a227265706f727465227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('595444', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420522e6e6f6d627265204153206e6f6d6272655f6375656e63612c2042442e6e6f6d627265204153206e6f6d6272655f62642c2042442e6465736372697063696f6e0a46524f4d2062682e7265706f727465205220494e4e4552204a4f494e2062682e626173655f7265706f727465204252204f4e20522e626173655f7265706f727465203d2042522e626173655f7265706f7274655f696420494e4e4552204a4f494e2062682e626173655f6461746f204244204f4e2042522e626173655f6461746f203d2042442e626173655f6461746f5f69640a574845524520522e7265706f7274655f6964203d203a7265706f727465');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('595445', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227265706f727465222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a227265706f727465227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('595446', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420522e6e6f6d627265204153206e6f6d6272655f6375656e63612c2042442e6e6f6d627265204153206e6f6d6272655f62642c2042442e6465736372697063696f6e2c202853454c454354204d41582867657374696f6e2946524f4d2062682e646174615f7265706f72746520574845524520626173655f6461746f203d42442e626173655f6461746f5f69642029204153206d61782c202853454c454354204d494e2867657374696f6e2946524f4d2062682e646174615f7265706f72746520574845524520626173655f6461746f203d42442e626173655f6461746f5f69642029204153206d696e0a46524f4d2062682e7265706f727465205220494e4e4552204a4f494e2062682e626173655f7265706f727465204252204f4e20522e626173655f7265706f727465203d2042522e626173655f7265706f7274655f696420494e4e4552204a4f494e2062682e626173655f6461746f204244204f4e2042522e626173655f6461746f203d2042442e626173655f6461746f5f69640a574845524520522e7265706f7274655f6964203d203a7265706f727465');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('595447', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227265706f727465222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a227265706f727465227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('595448', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420522e6e6f6d627265204153206e6f6d6272655f6375656e63612c2042442e6e6f6d627265204153206e6f6d6272655f62642c2042442e6465736372697063696f6e2c202853454c454354204d41582867657374696f6e2946524f4d2062682e646174615f7265706f72746520574845524520626173655f6461746f203d42442e626173655f6461746f5f69642029204153206d61782c202853454c454354204d494e2867657374696f6e2946524f4d2062682e646174615f7265706f72746520574845524520626173655f6461746f203d42442e626173655f6461746f5f69642029204153206d696e0a46524f4d2062682e7265706f727465205220494e4e4552204a4f494e2062682e626173655f7265706f727465204252204f4e20522e626173655f7265706f727465203d2042522e626173655f7265706f7274655f696420494e4e4552204a4f494e2062682e626173655f6461746f204244204f4e2042522e626173655f6461746f203d2042442e626173655f6461746f5f69640a574845524520522e7265706f7274655f6964203d203a7265706f727465');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('595449', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227265706f727465222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a227265706f727465227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('595450', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420522e6e6f6d627265204153206e6f6d6272655f6375656e63612c2042442e6e6f6d627265204153206e6f6d6272655f62642c2042442e6465736372697063696f6e2c202853454c454354204d41582867657374696f6e2946524f4d2062682e646174615f7265706f72746520574845524520626173655f6461746f203d42442e626173655f6461746f5f69642029204153206d61782c202853454c454354204d494e2867657374696f6e2946524f4d2062682e646174615f7265706f72746520574845524520626173655f6461746f203d42442e626173655f6461746f5f69642029204153206d696e2c20646174655f70617274282779656172272c2042442e646174655f637265617465292061732067657374696f6e0a46524f4d2062682e7265706f727465205220494e4e4552204a4f494e2062682e626173655f7265706f727465204252204f4e20522e626173655f7265706f727465203d2042522e626173655f7265706f7274655f696420494e4e4552204a4f494e2062682e626173655f6461746f204244204f4e2042522e626173655f6461746f203d2042442e626173655f6461746f5f69640a574845524520522e7265706f7274655f6964203d203a7265706f727465');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('595451', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227265706f727465222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a227265706f727465227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('595452', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420522e6e6f6d627265204153206e6f6d6272655f6375656e63612c2042442e6e6f6d627265204153206e6f6d6272655f62642c2042442e6465736372697063696f6e2c202853454c454354204d41582867657374696f6e2946524f4d2062682e646174615f7265706f72746520574845524520626173655f6461746f203d42442e626173655f6461746f5f69642029204153206d61782c202853454c454354204d494e2867657374696f6e2946524f4d2062682e646174615f7265706f72746520574845524520626173655f6461746f203d42442e626173655f6461746f5f69642029204153206d696e2c20646174655f70617274282779656172272c2042442e646174655f637265617465292061732067657374696f6e2c0a42442e626173655f6461746f5f69642c20522e636f6469676f0a46524f4d2062682e7265706f727465205220494e4e4552204a4f494e2062682e626173655f7265706f727465204252204f4e20522e626173655f7265706f727465203d2042522e626173655f7265706f7274655f696420494e4e4552204a4f494e2062682e626173655f6461746f204244204f4e2042522e626173655f6461746f203d2042442e626173655f6461746f5f69640a574845524520522e7265706f7274655f6964203d203a7265706f727465');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('595632', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227265706f727465222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a227265706f727465227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('595633', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420522e626173655f7265706f7274652c20522e6e6f6d627265204153206e6f6d6272655f6375656e63612c2042442e6e6f6d627265204153206e6f6d6272655f62642c2042442e6465736372697063696f6e2c202853454c454354204d41582867657374696f6e2946524f4d2062682e646174615f7265706f72746520574845524520626173655f6461746f203d42442e626173655f6461746f5f69642029204153206d61782c202853454c454354204d494e2867657374696f6e2946524f4d2062682e646174615f7265706f72746520574845524520626173655f6461746f203d42442e626173655f6461746f5f69642029204153206d696e2c20646174655f70617274282779656172272c2042442e646174655f637265617465292061732067657374696f6e2c0a42442e626173655f6461746f5f69642c20522e636f6469676f0a46524f4d2062682e7265706f727465205220494e4e4552204a4f494e2062682e626173655f7265706f727465204252204f4e20522e626173655f7265706f727465203d2042522e626173655f7265706f7274655f696420494e4e4552204a4f494e2062682e626173655f6461746f204244204f4e2042522e626173655f6461746f203d2042442e626173655f6461746f5f69640a574845524520522e7265706f7274655f6964203d203a7265706f727465');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('595634', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420522e626173655f7265706f7274652c20522e6e6f6d627265204153206e6f6d6272655f6375656e63612c2042442e6e6f6d627265204153206e6f6d6272655f62642c2042442e6465736372697063696f6e2c202853454c454354204d41582867657374696f6e2946524f4d2062682e646174615f7265706f72746520574845524520626173655f6461746f203d42442e626173655f6461746f5f69642029204153206d61782c202853454c454354204d494e2867657374696f6e2946524f4d2062682e646174615f7265706f72746520574845524520626173655f6461746f203d42442e626173655f6461746f5f69642029204153206d696e2c20646174655f70617274282779656172272c2042442e646174655f637265617465292061732067657374696f6e2c0a42442e626173655f6461746f5f69642c20522e636f6469676f0a46524f4d2062682e7265706f727465205220494e4e4552204a4f494e2062682e626173655f7265706f727465204252204f4e20522e626173655f7265706f727465203d2042522e626173655f7265706f7274655f696420494e4e4552204a4f494e2062682e626173655f6461746f204244204f4e2042522e626173655f6461746f203d2042442e626173655f6461746f5f69640a574845524520522e7265706f7274655f6964203d203a7265706f727465');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('595635', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420522e626173655f63616c6962726163696f6e2c20522e6e6f6d627265204153206e6f6d6272655f6375656e63612c2042442e6e6f6d627265204153206e6f6d6272655f62642c2042442e6465736372697063696f6e2c202853454c454354204d41582867657374696f6e2946524f4d2062682e646174615f63616c6962726163696f6e20574845524520626173655f6461746f203d42442e626173655f6461746f5f69642029204153206d61782c202853454c454354204d494e2867657374696f6e2946524f4d2062682e646174615f63616c6962726163696f6e20574845524520626173655f6461746f203d42442e626173655f6461746f5f69642029204153206d696e2c20646174655f70617274282779656172272c2042442e646174655f637265617465292061732067657374696f6e2c0a42442e626173655f6461746f5f69642c20522e636f6469676f0a46524f4d2062682e63616c6962726163696f6e205220494e4e4552204a4f494e2062682e626173655f63616c6962726163696f6e204252204f4e20522e626173655f63616c6962726163696f6e203d2042522e626173655f63616c6962726163696f6e5f696420494e4e4552204a4f494e2062682e626173655f6461746f204244204f4e2042522e626173655f6461746f203d2042442e626173655f6461746f5f69640a574845524520522e63616c6962726163696f6e5f6964203d203a63616c6962726163696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('595636', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2263616c6962726163696f6e222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2243616c6962726163696f6e204944227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('595637', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420522e626173655f63616c6962726163696f6e2c20522e6e6f6d627265204153206e6f6d6272655f6375656e63612c2042442e6e6f6d627265204153206e6f6d6272655f62642c2042442e6465736372697063696f6e2c202853454c454354204d41582867657374696f6e2946524f4d2062682e646174615f63616c6962726163696f6e20574845524520626173655f6461746f203d42442e626173655f6461746f5f69642029204153206d61782c202853454c454354204d494e2867657374696f6e2946524f4d2062682e646174615f63616c6962726163696f6e20574845524520626173655f6461746f203d42442e626173655f6461746f5f69642029204153206d696e2c20646174655f70617274282779656172272c2042442e646174655f637265617465292061732067657374696f6e2c0a42442e626173655f6461746f5f69642c20522e636f6469676f0a46524f4d2062682e63616c6962726163696f6e205220494e4e4552204a4f494e2062682e626173655f63616c6962726163696f6e204252204f4e20522e626173655f63616c6962726163696f6e203d2042522e626173655f63616c6962726163696f6e5f696420494e4e4552204a4f494e2062682e626173655f6461746f204244204f4e2042522e626173655f6461746f203d2042442e626173655f6461746f5f69640a574845524520522e63616c6962726163696f6e5f6964203d203a63616c6962726163696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('599133', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227265706f727465222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a227265706f727465227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('599134', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542073745f61737465787428522e7468655f67656f6d292c20522e626173655f7265706f7274652c20522e6e6f6d627265204153206e6f6d6272655f6375656e63612c2042442e6e6f6d627265204153206e6f6d6272655f62642c2042442e6465736372697063696f6e2c202853454c454354204d41582867657374696f6e2946524f4d2062682e646174615f7265706f72746520574845524520626173655f6461746f203d42442e626173655f6461746f5f69642029204153206d61782c202853454c454354204d494e2867657374696f6e2946524f4d2062682e646174615f7265706f72746520574845524520626173655f6461746f203d42442e626173655f6461746f5f69642029204153206d696e2c20646174655f70617274282779656172272c2042442e646174655f637265617465292061732067657374696f6e2c0a42442e626173655f6461746f5f69642c20522e636f6469676f0a46524f4d2062682e7265706f727465205220494e4e4552204a4f494e2062682e626173655f7265706f727465204252204f4e20522e626173655f7265706f727465203d2042522e626173655f7265706f7274655f696420494e4e4552204a4f494e2062682e626173655f6461746f204244204f4e2042522e626173655f6461746f203d2042442e626173655f6461746f5f69640a574845524520522e7265706f7274655f6964203d203a7265706f727465');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('599135', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227265706f727465222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a227265706f727465227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('599136', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c4543542073745f617265612873745f7472616e73666f726d28522e7468655f67656f6d2c2039303039313329292f3130303030303020617320737570657266696369652c20522e626173655f7265706f7274652c20522e6e6f6d627265204153206e6f6d6272655f6375656e63612c2042442e6e6f6d627265204153206e6f6d6272655f62642c2042442e6465736372697063696f6e2c202853454c454354204d41582867657374696f6e2946524f4d2062682e646174615f7265706f72746520574845524520626173655f6461746f203d42442e626173655f6461746f5f69642029204153206d61782c202853454c454354204d494e2867657374696f6e2946524f4d2062682e646174615f7265706f72746520574845524520626173655f6461746f203d42442e626173655f6461746f5f69642029204153206d696e2c20646174655f70617274282779656172272c2042442e646174655f637265617465292061732067657374696f6e2c0a42442e626173655f6461746f5f69642c20522e636f6469676f0a46524f4d2062682e7265706f727465205220494e4e4552204a4f494e2062682e626173655f7265706f727465204252204f4e20522e626173655f7265706f727465203d2042522e626173655f7265706f7274655f696420494e4e4552204a4f494e2062682e626173655f6461746f204244204f4e2042522e626173655f6461746f203d2042442e626173655f6461746f5f69640a574845524520522e7265706f7274655f6964203d203a7265706f727465');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('599137', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a227265706f727465222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a227265706f727465227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('599138', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420746f5f636861722873745f617265612873745f7472616e73666f726d28522e7468655f67656f6d2c2039303039313329292f313030303030302c27393939473939304430272920617320737570657266696369652c20522e626173655f7265706f7274652c20522e6e6f6d627265204153206e6f6d6272655f6375656e63612c2042442e6e6f6d627265204153206e6f6d6272655f62642c2042442e6465736372697063696f6e2c202853454c454354204d41582867657374696f6e2946524f4d2062682e646174615f7265706f72746520574845524520626173655f6461746f203d42442e626173655f6461746f5f69642029204153206d61782c202853454c454354204d494e2867657374696f6e2946524f4d2062682e646174615f7265706f72746520574845524520626173655f6461746f203d42442e626173655f6461746f5f69642029204153206d696e2c20646174655f70617274282779656172272c2042442e646174655f637265617465292061732067657374696f6e2c0a42442e626173655f6461746f5f69642c20522e636f6469676f0a46524f4d2062682e7265706f727465205220494e4e4552204a4f494e2062682e626173655f7265706f727465204252204f4e20522e626173655f7265706f727465203d2042522e626173655f7265706f7274655f696420494e4e4552204a4f494e2062682e626173655f6461746f204244204f4e2042522e626173655f6461746f203d2042442e626173655f6461746f5f69640a574845524520522e7265706f7274655f6964203d203a7265706f727465');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('599139', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2263616c6962726163696f6e222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2243616c6962726163696f6e204944227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('599140', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420746f5f636861722873745f617265612873745f7472616e73666f726d28522e7468655f67656f6d2c2039303039313329292f313030303030302c27393939473939304430272920617320737570657266696369652c20522e626173655f63616c6962726163696f6e2c20522e6e6f6d627265204153206e6f6d6272655f6375656e63612c2042442e6e6f6d627265204153206e6f6d6272655f62642c2042442e6465736372697063696f6e2c202853454c454354204d41582867657374696f6e2946524f4d2062682e646174615f63616c6962726163696f6e20574845524520626173655f6461746f203d42442e626173655f6461746f5f69642029204153206d61782c202853454c454354204d494e2867657374696f6e2946524f4d2062682e646174615f63616c6962726163696f6e20574845524520626173655f6461746f203d42442e626173655f6461746f5f69642029204153206d696e2c20646174655f70617274282779656172272c2042442e646174655f637265617465292061732067657374696f6e2c0a42442e626173655f6461746f5f69642c20522e636f6469676f0a46524f4d2062682e63616c6962726163696f6e205220494e4e4552204a4f494e2062682e626173655f63616c6962726163696f6e204252204f4e20522e626173655f63616c6962726163696f6e203d2042522e626173655f63616c6962726163696f6e5f696420494e4e4552204a4f494e2062682e626173655f6461746f204244204f4e2042522e626173655f6461746f203d2042442e626173655f6461746f5f69640a574845524520522e63616c6962726163696f6e5f6964203d203a63616c6962726163696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('599141', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2263616c6962726163696f6e222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a2243616c6962726163696f6e204944227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('599142', 131072);
SELECT pg_catalog.lowrite(0, '\x53454c45435420746f5f636861722873745f617265612873745f7472616e73666f726d28522e7468655f67656f6d2c2039303039313329292f313030303030302c27393939473939304430272920617320737570657266696369652c20522e626173655f63616c6962726163696f6e2c20522e6e6f6d627265204153206e6f6d6272655f6375656e63612c2042442e6e6f6d627265204153206e6f6d6272655f62642c2042442e6465736372697063696f6e2c202853454c454354204d41582867657374696f6e2946524f4d2062682e646174615f63616c6962726163696f6e20574845524520626173655f6461746f203d42442e626173655f6461746f5f69642029204153206d61782c202853454c454354204d494e2867657374696f6e2946524f4d2062682e646174615f63616c6962726163696f6e20574845524520626173655f6461746f203d42442e626173655f6461746f5f69642029204153206d696e2c20646174655f70617274282779656172272c2042442e646174655f637265617465292061732067657374696f6e2c0a42442e626173655f6461746f5f69642c20522e636f6469676f0a46524f4d2062682e63616c6962726163696f6e205220494e4e4552204a4f494e2062682e626173655f63616c6962726163696f6e204252204f4e20522e626173655f63616c6962726163696f6e203d2042522e626173655f63616c6962726163696f6e5f696420494e4e4552204a4f494e2062682e626173655f6461746f204244204f4e2042522e626173655f6461746f203d2042442e626173655f6461746f5f69640a574845524520522e63616c6962726163696f6e5f6964203d203a63616c6962726163696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('601746', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420632e2a2066726f6d2062682e6361706120630a6f7264657220627920646174655f637265617465');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('615800', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2073656375726974792e6163636573736c6f67');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('619346', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c6563742073756d2863616e7469646164292066726f6d2062616368656f2e73746f636b0a77686572652070726f647563746f203d20340a616e642063616e746964616420213d2030');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('619347', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22706964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('619348', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c6563742073756d2863616e7469646164292066726f6d2062616368656f2e73746f636b0a77686572652070726f647563746f203d20340a616e642063616e746964616420213d2030');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('619349', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22706964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('619350', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c6563742073756d2863616e7469646164292066726f6d2062616368656f2e73746f636b0a77686572652070726f647563746f203d203a7069640a616e642063616e746964616420213d2030');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('619351', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22706964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('619352', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c6563742063617365207768656e2073756d2863616e746964616429206973206e756c6c207468656e20303a3a646f75626c6520707265636973696f6e20656c73652073756d2863616e74696461642920656e642066726f6d2062616368656f2e73746f636b0a77686572652070726f647563746f203d203a7069640a616e642063616e746964616420213d2030');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('619353', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22706964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('619354', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c6563742063617365207768656e2073756d2863616e746964616429206973206e756c6c207468656e20302e3020656c73652073756d2863616e74696461642920656e642066726f6d2062616368656f2e73746f636b0a77686572652070726f647563746f203d203a7069640a616e642063616e746964616420213d2030');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('619355', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22706964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('619356', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c6563742063617365207768656e2073756d2863616e746964616429206973206e756c6c207468656e20302e3020656c73652073756d2863616e74696461642920656e642066726f6d2062616368656f2e73746f636b0a77686572652070726f647563746f203d203a7069640a616e642063616e746964616420213d2030');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('619357', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2062616368656f2e73746f636b0a77686572652070726f647563746f203d20340a6f7264657220627920726567697374726f2064657363');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('619358', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2062616368656f2e73746f636b0a77686572652070726f647563746f203d203a7069640a6f7264657220627920726567697374726f2064657363');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('619359', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22706964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('619360', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2062616368656f2e73746f636b0a77686572652070726f647563746f203d203a7069640a6f7264657220627920726567697374726f2064657363');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('619588', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22656d7072657361222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('619589', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22656d7072657361222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('619590', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('619591', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22656d7072657361222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('619592', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d20656d706c6f7965732e656d706c6561646f0a776865726520656d7072657361203d203a656d70726573610a6f72646572206279206e6f6d627265');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('631745', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('631746', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('631747', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c6563742063617365207768656e2073756d2863616e746964616429206973206e756c6c207468656e20302e3020656c73652073756d2863616e74696461642920656e642066726f6d2062616368656f2e73756d696e697374726f0a7768657265206974656d203d203a69640a616e642063616e746964616420213d2030');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('631795', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22706964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('631796', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22706964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('631797', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c6563742063617365207768656e2073756d2863616e746964616429206973206e756c6c207468656e20302e3020656c73652073756d2863616e74696461642920656e642066726f6d2062616368656f2e70656469646f0a77686572652070726f647563746f203d203a7069640a616e642063616e746964616420213d2030');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('631798', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22706964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('631799', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22706964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('631800', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420702e2a2c20632e6e6f6d6272652c20632e6170656c6c69646f2066726f6d2062616368656f2e70656469646f20702c2063726d2e636c69656e746520630a77686572652070726f647563746f203d203a7069640a616e6420702e636c69656e7465203d20632e636c69656e74655f69640a6f7264657220627920726567697374726f2064657363');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('631803', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2062616368656f2e70656469646f0a776865726520636c69656e7465203d203a6369640a6f7264657220627920726567697374726f2064657363');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('631804', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22636964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('631805', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2062616368656f2e70656469646f0a776865726520636c69656e7465203d203a6369640a6f7264657220627920726567697374726f2064657363');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('631806', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22636964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('631807', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420642e2a2c20702e6465736372697063696f6e2066726f6d2062616368656f2e70656469646f20642c2062616368656f2e70726f647563746f20700a776865726520642e70726f647563746f203d20702e70726f647563746f5f69640a616e6420636c69656e7465203d203a6369640a6f7264657220627920726567697374726f2064657363');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('631808', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22636964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('631809', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420642e2a2c20702e6465736372697063696f6e2c202873656c656374206162722066726f6d2062616368656f2e6d6f6e656461207768657265206d6f6e6564615f6964203d20702e6d6f6e656461292066726f6d2062616368656f2e70656469646f20642c2062616368656f2e70726f647563746f20700a776865726520642e70726f647563746f203d20702e70726f647563746f5f69640a616e6420636c69656e7465203d203a6369640a6f7264657220627920726567697374726f2064657363');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('634158', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226f6964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('634159', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226f6964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('634160', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2062616368656f2e646573706163686f0a77686572652070656469646f203d203335343430303437333535383433390a6f7264657220627920726567697374726f2064657363');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('634161', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226f6964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('634162', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2062616368656f2e646573706163686f0a77686572652070656469646f203d203a6f69640a6f7264657220627920726567697374726f2064657363');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('634163', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226f6964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('634164', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226f6964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('634165', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c6563742073756d2863616e7469646164292066726f6d2062616368656f2e646573706163686f0a77686572652070656469646f203d203a6f6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('634166', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226f6964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('634167', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420636f616c657363652873756d2863616e7469646164292c2030292066726f6d2062616368656f2e646573706163686f0a77686572652070656469646f203d203a6f6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('634168', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226f6964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('634169', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420636f616c657363652873756d2863616e7469646164292c2030292061732073756d2066726f6d2062616368656f2e646573706163686f0a77686572652070656469646f203d203a6f6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('636584', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226f6964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('636585', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374200a2020202070742e2a2c206d6e2e6d756e69636970696f2c206d6e2e646570617274616d656e746f0a202066726f6d2062616368656f2e70656469646f5f7472616e73706f7274652070742c2067656f646174612e6d756e69636970696f206d6e0a77686572652070742e70656469646f203d203a6f69640a616e64206d6e2e6d756e69636970696f3f696420bf2070742e6d756e69636970696f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('636586', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226f6964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('636587', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374200a2020202070742e2a2c206d6e2e6d756e69636970696f2c206d6e2e646570617274616d656e746f0a202066726f6d2062616368656f2e70656469646f5f7472616e73706f7274652070742c2067656f646174612e6d756e69636970696f206d6e0a77686572652070742e70656469646f203d203a6f69640a616e64206d6e2e6d756e69636970696f5f6964203d2070742e6d756e69636970696f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('636588', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226f6964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('636589', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374200a2020202070742e2a2c206d6e2e6d756e69636970696f20617320736d756e69636970696f2c206d6e2e646570617274616d656e746f2061732073646570617274616d656e746f0a202066726f6d2062616368656f2e70656469646f5f7472616e73706f7274652070742c2067656f646174612e6d756e69636970696f206d6e0a77686572652070742e70656469646f203d203a6f69640a616e64206d6e2e6d756e69636970696f5f6964203d2070742e6d756e69636970696f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('637408', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226f6964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('637409', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226f6964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('637410', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d2062616368656f2e70656469646f5f666163747572610a77686572652070656469646f203d203a6f69640a6f7264657220627920726567697374726f2064657363');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('819399', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22646964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('819400', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22646964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('819401', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374200a2020202064642e2a2c20702e636f6469676f2c20702e6465736372697063696f6e0a202066726f6d20646f6e6163696f6e5f646574616c6c652064642c2070726f647563746f20700a77686572652064642e646f6e6163696f6e203d203a6469640a616e642064642e70726f647563746f203d20702e70726f647563746f5f69640a6f72646572206279206465736372697063696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('819402', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22646964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('819403', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374200a2020202064642e2a2c20702e636f6469676f2c20702e6465736372697063696f6e2c20702e756e696461640a202066726f6d20646f6e6163696f6e5f646574616c6c652064642c2070726f647563746f20700a77686572652064642e646f6e6163696f6e203d203a6469640a616e642064642e70726f647563746f203d20702e70726f647563746f5f69640a6f72646572206279206465736372697063696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('819419', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('819420', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('819421', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374206e2e2a2c20636e2e646f6e6163696f6e5f766f6c756e746172696f5f69642066726f6d20766f6c756e746172696f206e206c656674206a6f696e200a2873656c656374202a2066726f6d20646f6e6163696f6e5f766f6c756e746172696f20776865726520646f6e6163696f6e203d203a69642920636e0a6f6e20636e2e766f6c756e746172696f203d206e2e766f6c756e746172696f5f69640a');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('819422', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('819423', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374206e2e2a2c20636e2e646f6e6163696f6e5f766f6c756e746172696f5f69642066726f6d20766f6c756e746172696f206e206c656674206a6f696e200a2873656c656374202a2066726f6d20646f6e6163696f6e5f766f6c756e746172696f20776865726520646f6e6163696f6e203d203a69642920636e0a6f6e20636e2e766f6c756e746172696f203d206e2e766f6c756e746172696f5f69640a');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('819424', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('819425', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('819426', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d20646f6e6163696f6e0a776865726520646f6e6163696f6e5f6964200a696e202873656c6563742064697374696e637420646f6e6163696f6e2066726f6d20646f6e6163696f6e5f766f6c756e746172696f20776865726520766f6c756e746172696f203d203a696429');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('819427', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('819428', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d20646f6e6163696f6e0a776865726520646f6e6163696f6e5f6964200a696e202873656c6563742064697374696e637420646f6e6163696f6e2066726f6d20646f6e6163696f6e5f766f6c756e746172696f20776865726520766f6c756e746172696f203d203a6964290a616e642065737461646f203d202750454e4449454e544527');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821727', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22646964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821728', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374200a2020202064642e2a2c20702e636f6469676f2c20702e6465736372697063696f6e2c20702e756e696461640a202066726f6d20646f6e6163696f6e5f646574616c6c652064642c2063617465676f72696120630a77686572652064642e646f6e6163696f6e203d203a6469640a616e642064642e63617465676f726961203d20632e63617465676f7269615f69640a6f72646572206279206465736372697063696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821729', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22646964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821730', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374200a2020202064642e2a2c20702e636f6469676f2c20632e6465736372697063696f6e2c20702e756e696461640a202066726f6d20646f6e6163696f6e5f646574616c6c652064642c2063617465676f72696120630a77686572652064642e646f6e6163696f6e203d203a6469640a616e642064642e63617465676f726961203d20632e63617465676f7269615f69640a6f72646572206279206465736372697063696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821731', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22646964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821732', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c6563742064642e2a2c20632e6465736372697063696f6e2c20702e756e696461640a202066726f6d20646f6e6163696f6e5f646574616c6c652064642c2063617465676f72696120630a77686572652064642e646f6e6163696f6e203d203a6469640a616e642064642e63617465676f726961203d20632e63617465676f7269615f69640a6f72646572206279206465736372697063696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821733', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22646964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821734', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c6563742064642e2a2c20632e6465736372697063696f6e0a202066726f6d20646f6e6163696f6e5f646574616c6c652064642c2063617465676f72696120630a77686572652064642e646f6e6163696f6e203d203a6469640a616e642064642e63617465676f726961203d20632e63617465676f7269615f69640a6f72646572206279206465736372697063696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821735', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22696e7465676572222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821736', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22696e7465676572222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821737', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821738', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22696e7465676572222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821739', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420636f756e74282a292066726f6d207075626c69632e646f6e6163696f6e20776865726520706572736f6e613d3a6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821740', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22696e7465676572222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821741', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420636f756e74282a292066726f6d207075626c69632e646f6e6163696f6e20776865726520706572736f6e613d3a6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821742', 131072);
SELECT pg_catalog.lowrite(0, '\x5b5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821743', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420636f756e74282a292066726f6d207075626c69632e646f6e6163696f6e20776865726520706572736f6e613d3a6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821744', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821745', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420636f756e74282a292066726f6d207075626c69632e646f6e6163696f6e20776865726520706572736f6e613d3a6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821746', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821747', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420636f756e74282a292066726f6d207075626c69632e646f6e6163696f6e20776865726520706572736f6e613d3a6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821748', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821749', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420636f756e74282a29206e726f2066726f6d207075626c69632e646f6e6163696f6e20776865726520706572736f6e613d3a6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821750', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821751', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420636f756e74282a29206e726f2066726f6d207075626c69632e646f6e6163696f6e20776865726520706572736f6e613d3a6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821752', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2264696e6163696f6e222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821753', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2264696e6163696f6e222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d2c7b226e616d65223a22766f6c756e746172696f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821754', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a2264696e6163696f6e222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d2c7b226e616d65223a22766f6c756e746172696f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821755', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821756', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22766f6c756e746172696f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821757', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821758', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22766f6c756e746172696f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d2c7b226e616d65223a22646f6e6163696f6e222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821759', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821760', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22766f6c756e746172696f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d2c7b226e616d65223a22646f6e6163696f6e222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821761', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420636f756e74282a292066726f6d20646f6e6163696f6e5f766f6c756e746172696f200a776865726520646f6e6163696f6e203d203a646f6e6163696f6e0a616e6420766f6c756e746172696f203d203a766f6c756e746172696f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821762', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22766f6c756e746172696f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d2c7b226e616d65223a22646f6e6163696f6e222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821763', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420636f756e74282a292066726f6d20646f6e6163696f6e5f766f6c756e746172696f200a776865726520646f6e6163696f6e203d203a646f6e6163696f6e0a616e6420766f6c756e746172696f203d203a766f6c756e746172696f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821764', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374206465736372697063696f6e2c20742e73756d2066726f6d2063617465676f7269612c0a2873656c6563742063617465676f7269612c2073756d2863616e7469646164292066726f6d20646f6e6163696f6e5f646574616c6c650a67726f75702062792063617465676f7269612920740a77686572652063617465676f7269615f6964203d20742e63617465676f726961');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821765', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374206465736372697063696f6e2c20636f616c6573636528742e73756d2c30292061732073756d2066726f6d2063617465676f726961206c656674206a6f696e0a2873656c6563742063617465676f7269612c2073756d2863616e7469646164292066726f6d20646f6e6163696f6e5f646574616c6c650a67726f75702062792063617465676f7269612920740a6f6e2063617465676f7269615f6964203d20742e63617465676f726961');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821766', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374206465736372697063696f6e2c20636f616c6573636528742e73756d2c30292061732073756d2066726f6d2063617465676f726961206c656674206a6f696e0a2873656c6563742063617465676f7269612c2073756d2863616e7469646164292066726f6d20646f6e6163696f6e5f646574616c6c652c20646f6e6163696f6e200a20776865726520646f6e6163696f6e2e646f6e6163696f6e5f6964203d20646f6e6163696f6e5f646574616c6c652e646f6e6163696f6e0a20616e6420646f6e6163696f6e2e65737461646f203d20275245434f4749444f270a2067726f75702062792063617465676f7269612920740a6f6e2063617465676f7269615f6964203d20742e63617465676f726961');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821810', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821811', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821812', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c6563742064642e2a2c20632e6465736372697063696f6e0a202066726f6d20736f6c6963697475645f646574616c6c652064642c2063617465676f72696120630a77686572652064642e736f6c696369747564203d203a6469640a616e642064642e63617465676f726961203d20632e63617465676f7269615f69640a6f72646572206279206465736372697063696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821813', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821814', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c6563742064642e2a2c20632e6465736372697063696f6e0a202066726f6d20736f6c6963697475645f646574616c6c652064642c2063617465676f72696120630a77686572652064642e736f6c696369747564203d203a6469640a616e642064642e63617465676f726961203d20632e63617465676f7269615f69640a6f72646572206279206465736372697063696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821815', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821816', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c6563742064642e2a2c20632e6465736372697063696f6e0a202066726f6d20736f6c6963697475645f646574616c6c652064642c2063617465676f72696120630a77686572652064642e736f6c696369747564203d203a69640a616e642064642e63617465676f726961203d20632e63617465676f7269615f69640a6f72646572206279206465736372697063696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821817', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821818', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c6563742064642e2a2c20632e6465736372697063696f6e0a202066726f6d20736f6c6963697475645f646574616c6c652064642c2063617465676f72696120630a77686572652064642e736f6c696369747564203d203a69640a616e642064642e63617465676f726961203d20632e63617465676f7269615f69640a6f72646572206279206465736372697063696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821862', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d20646f6e6163696f6e6573');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821863', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d20646f6e6163696f6e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821864', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d20646f6e6163696f6e20642c20706572736f6e6120700a776865726520642e706572736f6e61203d20702e706572736f6e615f6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821865', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420642e2a2066726f6d20646f6e6163696f6e20642c20706572736f6e6120700a776865726520642e706572736f6e61203d20702e706572736f6e615f6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821866', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420642e2a2c20702e6e6f6d6272652066726f6d20646f6e6163696f6e20642c20706572736f6e6120700a776865726520642e706572736f6e61203d20702e706572736f6e615f6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821867', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420642e2a2c20702e6e6f6d6272652c20702e6170656c6c69646f2066726f6d20646f6e6163696f6e20642c20706572736f6e6120700a776865726520642e706572736f6e61203d20702e706572736f6e615f6964');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821868', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420642e2a2c20702e6e6f6d6272652c20702e6170656c6c69646f2066726f6d20646f6e6163696f6e20642c20706572736f6e6120700a776865726520642e706572736f6e61203d20702e706572736f6e615f69640a616e6420642e65737461646f203d202750454e4449454e544527');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821877', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d20646f6e6163696f6e0a77686572652065737461646f203d202750454e4449454e5445270a6c696d69742031');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821878', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821879', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374206e2e2a2c20636e2e646f6e6163696f6e5f766f6c756e746172696f5f69642c20636e2e726573706f6e7361626c652066726f6d20766f6c756e746172696f206e206c656674206a6f696e200a2873656c656374202a2066726f6d20646f6e6163696f6e5f766f6c756e746172696f20776865726520646f6e6163696f6e203d203a69642920636e0a6f6e20636e2e766f6c756e746172696f203d206e2e766f6c756e746172696f5f69640a');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821880', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821881', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374206e2e2a2c20636e2e646f6e6163696f6e5f766f6c756e746172696f5f69642c20636e2e726573706f6e7361626c652c20636e2e646f6e6163696f6e2066726f6d20766f6c756e746172696f206e206c656674206a6f696e200a2873656c656374202a2066726f6d20646f6e6163696f6e5f766f6c756e746172696f20776865726520646f6e6163696f6e203d203a69642920636e0a6f6e20636e2e766f6c756e746172696f203d206e2e766f6c756e746172696f5f69640a');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821882', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('821883', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374206e2e2a2c20636e2e646f6e6163696f6e5f766f6c756e746172696f5f69642c20636e2e726573706f6e7361626c652c20636e2e646f6e6163696f6e2066726f6d20766f6c756e746172696f206e206c656674206a6f696e200a2873656c656374202a2066726f6d20646f6e6163696f6e5f766f6c756e746172696f20776865726520646f6e6163696f6e203d203a69642920636e0a6f6e20636e2e766f6c756e746172696f203d206e2e766f6c756e746172696f5f69640a6f72646572206279206e6f6d6272652c206170656c6c69646f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('832392', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('832393', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420642e2a2c20702e6e6f6d6272652c20702e6170656c6c69646f2066726f6d20646f6e6163696f6e20642c20706572736f6e6120700a776865726520642e706572736f6e61203d20702e706572736f6e615f69640a616e6420642e65737461646f203d202750454e4449454e544527');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('832394', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('832395', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420642e2a2c20702e6e6f6d6272652c20702e6170656c6c69646f2066726f6d20646f6e6163696f6e20642c20706572736f6e6120700a776865726520642e706572736f6e61203d20702e706572736f6e615f69640a616e6420642e65737461646f203d202750454e4449454e5445270a616e6420642e646f6e6163696f6e5f696420696e202873656c6563742064697374696e63742064762e646f6e6163696f6e2066726f6d20646f6e6163696f6e5f766f6c756e746172696f2064762c2073656375726974792e7573756172696f20750a77686572652064762e766f6c756e746172696f203d20752e7072696e636970616c0a616e6420752e7573756172696f5f6964203d203a696429');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('848776', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374202a2066726f6d20646f6e6163696f6e5f646574616c6c652064642c2063617465676f72696120632c20646f6e6163696f6e20640a77686572652064642e63617465676f726961203d20632e63617465676f7269615f69640a616e6420642e646f6e6163696f6e5f6964203d2064642e646f6e6163696f6e0a616e642065737461646f203d20275245434f4749444f270a6f72646572206279206465736372697063696f6e2c20646574616c6c65');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('848777', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22766f6c756e746172696f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('848778', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22766f6c756e746172696f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d2c7b226e616d65223a22736f6c696369747564222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('848779', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22766f6c756e746172696f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d2c7b226e616d65223a22736f6c696369747564222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('848780', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420636f756e74282a292066726f6d20736f6c6963697475645f766f6c756e746172696f200a776865726520736f6c696369747564203d203a736f6c6963697475640a616e6420766f6c756e746172696f203d203a766f6c756e746172696f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('848781', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a22766f6c756e746172696f222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d2c7b226e616d65223a22736f6c696369747564222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('848782', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420636f756e74282a292066726f6d20736f6c6963697475645f766f6c756e746172696f200a776865726520736f6c696369747564203d203a736f6c6963697475640a616e6420766f6c756e746172696f203d203a766f6c756e746172696f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('848783', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('848784', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420642e2a2c20702e6e6f6d6272652c20702e6170656c6c69646f2066726f6d20646f6e6163696f6e20642c20706572736f6e6120700a776865726520642e706572736f6e61203d20702e706572736f6e615f69640a616e6420642e65737461646f203d202750454e4449454e5445270a616e6420642e646f6e6163696f6e5f696420696e202873656c6563742064697374696e63742064762e646f6e6163696f6e2066726f6d20646f6e6163696f6e5f766f6c756e746172696f2064762c2073656375726974792e7573756172696f20750a77686572652064762e766f6c756e746172696f203d20752e7072696e636970616c0a616e6420752e7573756172696f5f6964203d203a696429');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('848785', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('848786', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('848787', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420642e2a2c20702e6e6f6d6272652c20702e6170656c6c69646f2066726f6d20736f6c69636974756420642c20706572736f6e6120700a776865726520642e706572736f6e61203d20702e706572736f6e615f69640a616e6420642e65737461646f203d202750454e4449454e5445270a616e6420642e736f6c6963697475645f696420696e202873656c6563742064697374696e63742064762e736f6c6963697475642066726f6d20736f6c6963697475645f766f6c756e746172696f2064762c2073656375726974792e7573756172696f20750a77686572652064762e766f6c756e746172696f203d20752e7072696e636970616c0a616e6420752e7573756172696f5f6964203d203a696429');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('851119', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('851120', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('851121', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420636f756e74282a292066726f6d20646f6e6163696f6e5f766f6c756e746172696f200a776865726520646f6e6163696f6e203d203a69640a616e6420726573706f6e7361626c65203d2074727565');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('851122', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('851123', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('851124', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420636f756e74282a292066726f6d20736f6c6963697475645f766f6c756e746172696f200a776865726520736f6c696369747564203d203a69640a616e6420726573706f6e7361626c65203d2074727565');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('851125', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('851126', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('851127', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c656374206e2e2a2c20636e2e736f6c6963697475645f766f6c756e746172696f5f69642c20636e2e726573706f6e7361626c652c20636e2e736f6c6963697475642066726f6d20766f6c756e746172696f206e206c656674206a6f696e200a2873656c656374202a2066726f6d20736f6c6963697475645f766f6c756e746172696f20776865726520736f6c696369747564203d203a69642920636e0a6f6e20636e2e766f6c756e746172696f203d206e2e766f6c756e746172696f5f69640a6f72646572206279206e6f6d6272652c206170656c6c69646f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('851128', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('851129', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420636f756e74282a292066726f6d20736f6c6963697475645f766f6c756e746172696f200a776865726520736f6c696369747564203d203a69640a616e6420726573706f6e7361626c65203d2074727565');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('851130', 131072);
SELECT pg_catalog.lowrite(0, '\x5b7b226e616d65223a226964222c2274797065436c617373223a22626967696e74222c226465736372697074696f6e223a22227d5d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('851131', 131072);
SELECT pg_catalog.lowrite(0, '\x73656c65637420636f756e74282a292066726f6d20736f6c6963697475645f766f6c756e746172696f200a776865726520736f6c696369747564203d203a69640a616e6420726573706f6e7361626c65203d2074727565');
SELECT pg_catalog.lo_close(0);

COMMIT;

--
-- TOC entry 3578 (class 2606 OID 850908)
-- Name: credencial credencial_pkey; Type: CONSTRAINT; Schema: empresa; Owner: root
--

ALTER TABLE ONLY empresa.credencial
    ADD CONSTRAINT credencial_pkey PRIMARY KEY (credencial_id);


--
-- TOC entry 3580 (class 2606 OID 850910)
-- Name: moneda moneda_pkey; Type: CONSTRAINT; Schema: empresa; Owner: root
--

ALTER TABLE ONLY empresa.moneda
    ADD CONSTRAINT moneda_pkey PRIMARY KEY (moneda_id);


--
-- TOC entry 3582 (class 2606 OID 850912)
-- Name: principal principal_email_key; Type: CONSTRAINT; Schema: empresa; Owner: root
--

ALTER TABLE ONLY empresa.principal
    ADD CONSTRAINT principal_email_key UNIQUE (email);


--
-- TOC entry 3584 (class 2606 OID 850914)
-- Name: principal principal_pkey; Type: CONSTRAINT; Schema: empresa; Owner: root
--

ALTER TABLE ONLY empresa.principal
    ADD CONSTRAINT principal_pkey PRIMARY KEY (principal_id);


--
-- TOC entry 3586 (class 2606 OID 850916)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: empresa; Owner: root
--

ALTER TABLE ONLY empresa.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (usuario_id);


--
-- TOC entry 3588 (class 2606 OID 850924)
-- Name: filedata filedata_pkey; Type: CONSTRAINT; Schema: files; Owner: root
--

ALTER TABLE ONLY files.filedata
    ADD CONSTRAINT filedata_pkey PRIMARY KEY (filedata_id);


--
-- TOC entry 3590 (class 2606 OID 850930)
-- Name: menu menu_pkey; Type: CONSTRAINT; Schema: logic; Owner: root
--

ALTER TABLE ONLY logic.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (menu_id);


--
-- TOC entry 3592 (class 2606 OID 850932)
-- Name: param param_key_key; Type: CONSTRAINT; Schema: logic; Owner: postgres
--

ALTER TABLE ONLY logic.param
    ADD CONSTRAINT param_key_key UNIQUE (key);


--
-- TOC entry 3594 (class 2606 OID 850934)
-- Name: param param_pkey; Type: CONSTRAINT; Schema: logic; Owner: postgres
--

ALTER TABLE ONLY logic.param
    ADD CONSTRAINT param_pkey PRIMARY KEY (param_id);


--
-- TOC entry 3596 (class 2606 OID 850936)
-- Name: sqlcommand sqlcommand_pkey; Type: CONSTRAINT; Schema: logic; Owner: root
--

ALTER TABLE ONLY logic.sqlcommand
    ADD CONSTRAINT sqlcommand_pkey PRIMARY KEY (id);


--
-- TOC entry 3598 (class 2606 OID 850938)
-- Name: persona persona_pkey; Type: CONSTRAINT; Schema: personas; Owner: root
--

ALTER TABLE ONLY personas.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (persona_id);


--
-- TOC entry 3600 (class 2606 OID 850940)
-- Name: beneficiario beneficiario_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.beneficiario
    ADD CONSTRAINT beneficiario_pkey PRIMARY KEY (beneficiario_id);


--
-- TOC entry 3602 (class 2606 OID 850942)
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (categoria_id);


--
-- TOC entry 3604 (class 2606 OID 850944)
-- Name: device device_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.device
    ADD CONSTRAINT device_pkey PRIMARY KEY (device_id);


--
-- TOC entry 3608 (class 2606 OID 850946)
-- Name: donacion_detalle donacion_detalle_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.donacion_detalle
    ADD CONSTRAINT donacion_detalle_pkey PRIMARY KEY (donacion_detalle_id);


--
-- TOC entry 3606 (class 2606 OID 850948)
-- Name: donacion donacion_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.donacion
    ADD CONSTRAINT donacion_pkey PRIMARY KEY (donacion_id);


--
-- TOC entry 3610 (class 2606 OID 850950)
-- Name: donacion_voluntario donacion_voluntario_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.donacion_voluntario
    ADD CONSTRAINT donacion_voluntario_pkey PRIMARY KEY (donacion_voluntario_id);


--
-- TOC entry 3612 (class 2606 OID 850952)
-- Name: donante donante_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.donante
    ADD CONSTRAINT donante_pkey PRIMARY KEY (donante_id);


--
-- TOC entry 3614 (class 2606 OID 850954)
-- Name: evento evento_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.evento
    ADD CONSTRAINT evento_pkey PRIMARY KEY (evento_id);


--
-- TOC entry 3616 (class 2606 OID 850956)
-- Name: norma norma_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.norma
    ADD CONSTRAINT norma_pkey PRIMARY KEY (norma_id);


--
-- TOC entry 3618 (class 2606 OID 850958)
-- Name: persona persona_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (persona_id);


--
-- TOC entry 3620 (class 2606 OID 850960)
-- Name: producto producto_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (producto_id);


--
-- TOC entry 3622 (class 2606 OID 850962)
-- Name: recursoseducativos recursoseducativos_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.recursoseducativos
    ADD CONSTRAINT recursoseducativos_pkey PRIMARY KEY (recursoseducativos_id);


--
-- TOC entry 3626 (class 2606 OID 850964)
-- Name: solicitud_detalle solicitud_detalle_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.solicitud_detalle
    ADD CONSTRAINT solicitud_detalle_pkey PRIMARY KEY (solicitud_detalle_id);


--
-- TOC entry 3624 (class 2606 OID 850966)
-- Name: solicitud solicitud_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.solicitud
    ADD CONSTRAINT solicitud_pkey PRIMARY KEY (solicitud_id);


--
-- TOC entry 3628 (class 2606 OID 850968)
-- Name: solicitud_voluntario solicitud_voluntario_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.solicitud_voluntario
    ADD CONSTRAINT solicitud_voluntario_pkey PRIMARY KEY (solicitud_voluntario_id);


--
-- TOC entry 3630 (class 2606 OID 850970)
-- Name: voluntario voluntario_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.voluntario
    ADD CONSTRAINT voluntario_pkey PRIMARY KEY (voluntario_id);


--
-- TOC entry 3632 (class 2606 OID 850972)
-- Name: accesslog accesslog_pkey; Type: CONSTRAINT; Schema: security; Owner: root
--

ALTER TABLE ONLY security.accesslog
    ADD CONSTRAINT accesslog_pkey PRIMARY KEY (accesslog_id);


--
-- TOC entry 3634 (class 2606 OID 850974)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: security; Owner: root
--

ALTER TABLE ONLY security.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (usuario_id);


--
-- TOC entry 3636 (class 2606 OID 850976)
-- Name: usuario usuario_usuario_key; Type: CONSTRAINT; Schema: security; Owner: root
--

ALTER TABLE ONLY security.usuario
    ADD CONSTRAINT usuario_usuario_key UNIQUE (usuario);


--
-- TOC entry 3638 (class 2606 OID 850978)
-- Name: jornal_audit jornal_audit_pkey; Type: CONSTRAINT; Schema: transaction; Owner: postgres
--

ALTER TABLE ONLY transaction.jornal_audit
    ADD CONSTRAINT jornal_audit_pkey PRIMARY KEY (jornal_audit_id);


--
-- TOC entry 3639 (class 2606 OID 851024)
-- Name: credencial credencial_filedata_fkey; Type: FK CONSTRAINT; Schema: empresa; Owner: root
--

ALTER TABLE ONLY empresa.credencial
    ADD CONSTRAINT credencial_filedata_fkey FOREIGN KEY (filedata) REFERENCES files.filedata(filedata_id);


--
-- TOC entry 3640 (class 2606 OID 851029)
-- Name: credencial credencial_principal_fkey; Type: FK CONSTRAINT; Schema: empresa; Owner: root
--

ALTER TABLE ONLY empresa.credencial
    ADD CONSTRAINT credencial_principal_fkey FOREIGN KEY (principal) REFERENCES empresa.principal(principal_id);


--
-- TOC entry 3641 (class 2606 OID 851034)
-- Name: principal principal_filedata_fkey; Type: FK CONSTRAINT; Schema: empresa; Owner: root
--

ALTER TABLE ONLY empresa.principal
    ADD CONSTRAINT principal_filedata_fkey FOREIGN KEY (filedata) REFERENCES files.filedata(filedata_id);


--
-- TOC entry 3642 (class 2606 OID 851039)
-- Name: usuario usuario_principal_fkey; Type: FK CONSTRAINT; Schema: empresa; Owner: root
--

ALTER TABLE ONLY empresa.usuario
    ADD CONSTRAINT usuario_principal_fkey FOREIGN KEY (principal) REFERENCES empresa.principal(principal_id);


--
-- TOC entry 3643 (class 2606 OID 851049)
-- Name: persona persona_filedata_fkey; Type: FK CONSTRAINT; Schema: personas; Owner: root
--

ALTER TABLE ONLY personas.persona
    ADD CONSTRAINT persona_filedata_fkey FOREIGN KEY (filedata) REFERENCES files.filedata(filedata_id);


--
-- TOC entry 3645 (class 2606 OID 851054)
-- Name: donacion_detalle donacion_detalle_categoria_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.donacion_detalle
    ADD CONSTRAINT donacion_detalle_categoria_fkey FOREIGN KEY (categoria) REFERENCES public.categoria(categoria_id);


--
-- TOC entry 3646 (class 2606 OID 851059)
-- Name: donacion_detalle donacion_detalle_donacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.donacion_detalle
    ADD CONSTRAINT donacion_detalle_donacion_fkey FOREIGN KEY (donacion) REFERENCES public.donacion(donacion_id);


--
-- TOC entry 3644 (class 2606 OID 851064)
-- Name: donacion donacion_persona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.donacion
    ADD CONSTRAINT donacion_persona_fkey FOREIGN KEY (persona) REFERENCES public.persona(persona_id);


--
-- TOC entry 3650 (class 2606 OID 851069)
-- Name: solicitud donacion_persona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.solicitud
    ADD CONSTRAINT donacion_persona_fkey FOREIGN KEY (persona) REFERENCES public.persona(persona_id);


--
-- TOC entry 3647 (class 2606 OID 851074)
-- Name: donacion_voluntario donacion_voluntario_donacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.donacion_voluntario
    ADD CONSTRAINT donacion_voluntario_donacion_fkey FOREIGN KEY (donacion) REFERENCES public.donacion(donacion_id);


--
-- TOC entry 3648 (class 2606 OID 851079)
-- Name: donacion_voluntario donacion_voluntario_voluntario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.donacion_voluntario
    ADD CONSTRAINT donacion_voluntario_voluntario_fkey FOREIGN KEY (voluntario) REFERENCES public.voluntario(voluntario_id);


--
-- TOC entry 3649 (class 2606 OID 851084)
-- Name: producto producto_categoria_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_categoria_fkey FOREIGN KEY (categoria) REFERENCES public.categoria(categoria_id);


--
-- TOC entry 3651 (class 2606 OID 851089)
-- Name: solicitud_detalle solicitud_detalle_categoria_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.solicitud_detalle
    ADD CONSTRAINT solicitud_detalle_categoria_fkey FOREIGN KEY (categoria) REFERENCES public.categoria(categoria_id);


--
-- TOC entry 3652 (class 2606 OID 851094)
-- Name: solicitud_detalle solicitud_detalle_solicitud_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.solicitud_detalle
    ADD CONSTRAINT solicitud_detalle_solicitud_fkey FOREIGN KEY (solicitud) REFERENCES public.solicitud(solicitud_id);


--
-- TOC entry 3653 (class 2606 OID 851099)
-- Name: solicitud_voluntario solicitud_voluntario_solicitud_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.solicitud_voluntario
    ADD CONSTRAINT solicitud_voluntario_solicitud_fkey FOREIGN KEY (solicitud) REFERENCES public.solicitud(solicitud_id);


--
-- TOC entry 3654 (class 2606 OID 851104)
-- Name: solicitud_voluntario solicitud_voluntario_voluntario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.solicitud_voluntario
    ADD CONSTRAINT solicitud_voluntario_voluntario_fkey FOREIGN KEY (voluntario) REFERENCES public.voluntario(voluntario_id);


--
-- TOC entry 4720 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-07-04 05:53:07

--
-- PostgreSQL database dump complete
--

