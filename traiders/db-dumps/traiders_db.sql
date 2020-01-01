--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5 (Debian 11.5-3.pgdg90+1)
-- Dumped by pg_dump version 11.5 (Debian 11.5-3.pgdg90+1)

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

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: annotation_annotation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.annotation_annotation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    body_id integer NOT NULL,
    target_id integer NOT NULL
);


ALTER TABLE public.annotation_annotation OWNER TO postgres;

--
-- Name: annotation_annotation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.annotation_annotation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.annotation_annotation_id_seq OWNER TO postgres;

--
-- Name: annotation_annotation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.annotation_annotation_id_seq OWNED BY public.annotation_annotation.id;


--
-- Name: annotation_annotationbody; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.annotation_annotationbody (
    id integer NOT NULL,
    type character varying(32) NOT NULL,
    value character varying(512),
    identifier character varying(128)
);


ALTER TABLE public.annotation_annotationbody OWNER TO postgres;

--
-- Name: annotation_annotationbody_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.annotation_annotationbody_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.annotation_annotationbody_id_seq OWNER TO postgres;

--
-- Name: annotation_annotationbody_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.annotation_annotationbody_id_seq OWNED BY public.annotation_annotationbody.id;


--
-- Name: annotation_annotationtarget; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.annotation_annotationtarget (
    id integer NOT NULL,
    source character varying(200) NOT NULL,
    selector_id integer NOT NULL
);


ALTER TABLE public.annotation_annotationtarget OWNER TO postgres;

--
-- Name: annotation_annotationtarget_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.annotation_annotationtarget_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.annotation_annotationtarget_id_seq OWNER TO postgres;

--
-- Name: annotation_annotationtarget_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.annotation_annotationtarget_id_seq OWNED BY public.annotation_annotationtarget.id;


--
-- Name: annotation_fragmentselector; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.annotation_fragmentselector (
    id integer NOT NULL,
    value character varying(64) NOT NULL
);


ALTER TABLE public.annotation_fragmentselector OWNER TO postgres;

--
-- Name: annotation_fragmentselector_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.annotation_fragmentselector_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.annotation_fragmentselector_id_seq OWNER TO postgres;

--
-- Name: annotation_fragmentselector_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.annotation_fragmentselector_id_seq OWNED BY public.annotation_fragmentselector.id;


--
-- Name: api_alert; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_alert (
    id integer NOT NULL,
    target_symbol character varying(32) NOT NULL,
    base_symbol character varying(32) NOT NULL,
    ratio numeric(16,4) NOT NULL,
    increasing boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.api_alert OWNER TO postgres;

--
-- Name: api_alert_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_alert_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_alert_id_seq OWNER TO postgres;

--
-- Name: api_alert_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_alert_id_seq OWNED BY public.api_alert.id;


--
-- Name: api_article; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_article (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    content text NOT NULL,
    image character varying(100) NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.api_article OWNER TO postgres;

--
-- Name: api_article_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_article_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_article_id_seq OWNER TO postgres;

--
-- Name: api_article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_article_id_seq OWNED BY public.api_article.id;


--
-- Name: api_articlecomment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_articlecomment (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    content text NOT NULL,
    image character varying(100) NOT NULL,
    article_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.api_articlecomment OWNER TO postgres;

--
-- Name: api_articlecomment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_articlecomment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_articlecomment_id_seq OWNER TO postgres;

--
-- Name: api_articlecomment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_articlecomment_id_seq OWNED BY public.api_articlecomment.id;


--
-- Name: api_articlecomment_liked_by; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_articlecomment_liked_by (
    id integer NOT NULL,
    articlecomment_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.api_articlecomment_liked_by OWNER TO postgres;

--
-- Name: api_articlecomment_liked_by_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_articlecomment_liked_by_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_articlecomment_liked_by_id_seq OWNER TO postgres;

--
-- Name: api_articlecomment_liked_by_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_articlecomment_liked_by_id_seq OWNED BY public.api_articlecomment_liked_by.id;


--
-- Name: api_asset; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_asset (
    id integer NOT NULL,
    amount numeric(16,3) NOT NULL,
    on_hold_for_investment numeric(16,3) NOT NULL,
    equipment_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.api_asset OWNER TO postgres;

--
-- Name: api_asset_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_asset_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_asset_id_seq OWNER TO postgres;

--
-- Name: api_asset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_asset_id_seq OWNED BY public.api_asset.id;


--
-- Name: api_buyorder; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_buyorder (
    id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    buy_ratio numeric(16,4) NOT NULL,
    buy_amount numeric(15,3) NOT NULL,
    base_equipment_id integer NOT NULL,
    target_equipment_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.api_buyorder OWNER TO postgres;

--
-- Name: api_buyorder_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_buyorder_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_buyorder_id_seq OWNER TO postgres;

--
-- Name: api_buyorder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_buyorder_id_seq OWNED BY public.api_buyorder.id;


--
-- Name: api_equipment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_equipment (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    category character varying(16) NOT NULL,
    symbol character varying(32) NOT NULL
);


ALTER TABLE public.api_equipment OWNER TO postgres;

--
-- Name: api_equipment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_equipment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_equipment_id_seq OWNER TO postgres;

--
-- Name: api_equipment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_equipment_id_seq OWNED BY public.api_equipment.id;


--
-- Name: api_equipmentcomment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_equipmentcomment (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    content text NOT NULL,
    image character varying(100) NOT NULL,
    equipment_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.api_equipmentcomment OWNER TO postgres;

--
-- Name: api_equipmentcomment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_equipmentcomment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_equipmentcomment_id_seq OWNER TO postgres;

--
-- Name: api_equipmentcomment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_equipmentcomment_id_seq OWNED BY public.api_equipmentcomment.id;


--
-- Name: api_equipmentcomment_liked_by; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_equipmentcomment_liked_by (
    id integer NOT NULL,
    equipmentcomment_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.api_equipmentcomment_liked_by OWNER TO postgres;

--
-- Name: api_equipmentcomment_liked_by_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_equipmentcomment_liked_by_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_equipmentcomment_liked_by_id_seq OWNER TO postgres;

--
-- Name: api_equipmentcomment_liked_by_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_equipmentcomment_liked_by_id_seq OWNED BY public.api_equipmentcomment_liked_by.id;


--
-- Name: api_event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_event (
    id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    country character varying(2) NOT NULL,
    "calendarId" character varying(6) NOT NULL,
    category character varying(64) NOT NULL,
    actual character varying(16) NOT NULL,
    previous character varying(16) NOT NULL,
    forecast character varying(16),
    "sourceURL" character varying(200) NOT NULL,
    importance integer NOT NULL,
    event character varying(64) NOT NULL
);


ALTER TABLE public.api_event OWNER TO postgres;

--
-- Name: api_event_followed_by; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_event_followed_by (
    id integer NOT NULL,
    event_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.api_event_followed_by OWNER TO postgres;

--
-- Name: api_event_followed_by_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_event_followed_by_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_event_followed_by_id_seq OWNER TO postgres;

--
-- Name: api_event_followed_by_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_event_followed_by_id_seq OWNED BY public.api_event_followed_by.id;


--
-- Name: api_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_event_id_seq OWNER TO postgres;

--
-- Name: api_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_event_id_seq OWNED BY public.api_event.id;


--
-- Name: api_following; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_following (
    id integer NOT NULL,
    status integer NOT NULL,
    user_followed_id integer NOT NULL,
    user_following_id integer NOT NULL
);


ALTER TABLE public.api_following OWNER TO postgres;

--
-- Name: api_following_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_following_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_following_id_seq OWNER TO postgres;

--
-- Name: api_following_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_following_id_seq OWNED BY public.api_following.id;


--
-- Name: api_like; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_like (
    id integer NOT NULL,
    article_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.api_like OWNER TO postgres;

--
-- Name: api_like_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_like_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_like_id_seq OWNER TO postgres;

--
-- Name: api_like_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_like_id_seq OWNED BY public.api_like.id;


--
-- Name: api_manualinvestment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_manualinvestment (
    id integer NOT NULL,
    date date NOT NULL,
    base_amount numeric(15,3) NOT NULL,
    target_amount numeric(15,3) NOT NULL,
    base_equipment_id integer NOT NULL,
    user_id integer NOT NULL,
    target_equipment_id integer NOT NULL
);


ALTER TABLE public.api_manualinvestment OWNER TO postgres;

--
-- Name: api_manualinvestment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_manualinvestment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_manualinvestment_id_seq OWNER TO postgres;

--
-- Name: api_manualinvestment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_manualinvestment_id_seq OWNED BY public.api_manualinvestment.id;


--
-- Name: api_mobileapp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_mobileapp (
    id integer NOT NULL,
    version character varying(32) NOT NULL,
    apk_file character varying(100) NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.api_mobileapp OWNER TO postgres;

--
-- Name: api_mobileapp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_mobileapp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_mobileapp_id_seq OWNER TO postgres;

--
-- Name: api_mobileapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_mobileapp_id_seq OWNED BY public.api_mobileapp.id;


--
-- Name: api_notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_notification (
    id integer NOT NULL,
    message text NOT NULL,
    reference_obj text NOT NULL,
    reference_url character varying(200) NOT NULL,
    user_id integer NOT NULL,
    seen boolean NOT NULL
);


ALTER TABLE public.api_notification OWNER TO postgres;

--
-- Name: api_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_notification_id_seq OWNER TO postgres;

--
-- Name: api_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_notification_id_seq OWNED BY public.api_notification.id;


--
-- Name: api_onlineinvestment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_onlineinvestment (
    id integer NOT NULL,
    date date NOT NULL,
    base_amount numeric(15,3) NOT NULL,
    target_amount numeric(15,3) NOT NULL,
    base_equipment_id integer NOT NULL,
    target_equipment_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.api_onlineinvestment OWNER TO postgres;

--
-- Name: api_onlineinvestment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_onlineinvestment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_onlineinvestment_id_seq OWNER TO postgres;

--
-- Name: api_onlineinvestment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_onlineinvestment_id_seq OWNED BY public.api_onlineinvestment.id;


--
-- Name: api_parity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_parity (
    id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    base_equipment_id integer NOT NULL,
    target_equipment_id integer NOT NULL,
    close numeric(16,4) NOT NULL,
    high numeric(16,4) NOT NULL,
    low numeric(16,4) NOT NULL,
    open numeric(16,4) NOT NULL
);


ALTER TABLE public.api_parity OWNER TO postgres;

--
-- Name: api_parity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_parity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_parity_id_seq OWNER TO postgres;

--
-- Name: api_parity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_parity_id_seq OWNED BY public.api_parity.id;


--
-- Name: api_paritysetting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_paritysetting (
    id integer NOT NULL,
    update_rate interval NOT NULL,
    from_date timestamp with time zone NOT NULL,
    last_updated timestamp with time zone,
    base_equipment_id integer NOT NULL,
    target_equipment_id integer NOT NULL,
    "order" integer NOT NULL
);


ALTER TABLE public.api_paritysetting OWNER TO postgres;

--
-- Name: api_paritysetting_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_paritysetting_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_paritysetting_id_seq OWNER TO postgres;

--
-- Name: api_paritysetting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_paritysetting_id_seq OWNED BY public.api_paritysetting.id;


--
-- Name: api_portfolio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_portfolio (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.api_portfolio OWNER TO postgres;

--
-- Name: api_portfolio_followed_by; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_portfolio_followed_by (
    id integer NOT NULL,
    portfolio_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.api_portfolio_followed_by OWNER TO postgres;

--
-- Name: api_portfolio_followed_by_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_portfolio_followed_by_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_portfolio_followed_by_id_seq OWNER TO postgres;

--
-- Name: api_portfolio_followed_by_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_portfolio_followed_by_id_seq OWNED BY public.api_portfolio_followed_by.id;


--
-- Name: api_portfolio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_portfolio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_portfolio_id_seq OWNER TO postgres;

--
-- Name: api_portfolio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_portfolio_id_seq OWNED BY public.api_portfolio.id;


--
-- Name: api_portfolioitem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_portfolioitem (
    id integer NOT NULL,
    base_equipment_id integer NOT NULL,
    portfolio_id integer NOT NULL,
    target_equipment_id integer NOT NULL
);


ALTER TABLE public.api_portfolioitem OWNER TO postgres;

--
-- Name: api_portfolioitem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_portfolioitem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_portfolioitem_id_seq OWNER TO postgres;

--
-- Name: api_portfolioitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_portfolioitem_id_seq OWNED BY public.api_portfolioitem.id;


--
-- Name: api_prediction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_prediction (
    id integer NOT NULL,
    date date NOT NULL,
    direction integer NOT NULL,
    result integer NOT NULL,
    base_equipment_id integer NOT NULL,
    target_equipment_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.api_prediction OWNER TO postgres;

--
-- Name: api_prediction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_prediction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_prediction_id_seq OWNER TO postgres;

--
-- Name: api_prediction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_prediction_id_seq OWNED BY public.api_prediction.id;


--
-- Name: api_stoplossorder; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_stoplossorder (
    id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    sell_ratio numeric(16,4) NOT NULL,
    sell_amount numeric(15,3) NOT NULL,
    base_equipment_id integer NOT NULL,
    target_equipment_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.api_stoplossorder OWNER TO postgres;

--
-- Name: api_stoplossorder_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_stoplossorder_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_stoplossorder_id_seq OWNER TO postgres;

--
-- Name: api_stoplossorder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_stoplossorder_id_seq OWNED BY public.api_stoplossorder.id;


--
-- Name: api_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    is_trader boolean NOT NULL,
    iban character varying(64) NOT NULL,
    city character varying(64) NOT NULL,
    country character varying(2) NOT NULL,
    is_private boolean NOT NULL,
    avatar integer NOT NULL,
    email_verified boolean NOT NULL
);


ALTER TABLE public.api_user OWNER TO postgres;

--
-- Name: api_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.api_user_groups OWNER TO postgres;

--
-- Name: api_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_user_groups_id_seq OWNER TO postgres;

--
-- Name: api_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_user_groups_id_seq OWNED BY public.api_user_groups.id;


--
-- Name: api_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_user_id_seq OWNER TO postgres;

--
-- Name: api_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_user_id_seq OWNED BY public.api_user.id;


--
-- Name: api_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.api_user_user_permissions OWNER TO postgres;

--
-- Name: api_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: api_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_user_user_permissions_id_seq OWNED BY public.api_user_user_permissions.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO postgres;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth2_provider_accesstoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_accesstoken_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_accesstoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth2_provider_accesstoken (
    id bigint DEFAULT nextval('public.oauth2_provider_accesstoken_id_seq'::regclass) NOT NULL,
    token character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    scope text NOT NULL,
    application_id bigint,
    user_id integer,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    source_refresh_token_id bigint
);


ALTER TABLE public.oauth2_provider_accesstoken OWNER TO postgres;

--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth2_provider_application_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_application_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_application; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth2_provider_application (
    id bigint DEFAULT nextval('public.oauth2_provider_application_id_seq'::regclass) NOT NULL,
    client_id character varying(100) NOT NULL,
    redirect_uris text NOT NULL,
    client_type character varying(32) NOT NULL,
    authorization_grant_type character varying(32) NOT NULL,
    client_secret character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    user_id integer,
    skip_authorization boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);


ALTER TABLE public.oauth2_provider_application OWNER TO postgres;

--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth2_provider_grant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_grant_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_grant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth2_provider_grant (
    id bigint DEFAULT nextval('public.oauth2_provider_grant_id_seq'::regclass) NOT NULL,
    code character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    redirect_uri character varying(255) NOT NULL,
    scope text NOT NULL,
    application_id bigint NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);


ALTER TABLE public.oauth2_provider_grant OWNER TO postgres;

--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth2_provider_refreshtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_refreshtoken_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_refreshtoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth2_provider_refreshtoken (
    id bigint DEFAULT nextval('public.oauth2_provider_refreshtoken_id_seq'::regclass) NOT NULL,
    token character varying(255) NOT NULL,
    access_token_id bigint,
    application_id bigint NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    revoked timestamp with time zone
);


ALTER TABLE public.oauth2_provider_refreshtoken OWNER TO postgres;

--
-- Name: social_auth_association; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_auth_association (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    secret character varying(255) NOT NULL,
    issued integer NOT NULL,
    lifetime integer NOT NULL,
    assoc_type character varying(64) NOT NULL
);


ALTER TABLE public.social_auth_association OWNER TO postgres;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_auth_association_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_association_id_seq OWNER TO postgres;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_auth_association_id_seq OWNED BY public.social_auth_association.id;


--
-- Name: social_auth_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_auth_code (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    code character varying(32) NOT NULL,
    verified boolean NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.social_auth_code OWNER TO postgres;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_auth_code_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_code_id_seq OWNER TO postgres;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_auth_code_id_seq OWNED BY public.social_auth_code.id;


--
-- Name: social_auth_nonce; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_auth_nonce (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    "timestamp" integer NOT NULL,
    salt character varying(65) NOT NULL
);


ALTER TABLE public.social_auth_nonce OWNER TO postgres;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_auth_nonce_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_nonce_id_seq OWNER TO postgres;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_auth_nonce_id_seq OWNED BY public.social_auth_nonce.id;


--
-- Name: social_auth_partial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_auth_partial (
    id integer NOT NULL,
    token character varying(32) NOT NULL,
    next_step smallint NOT NULL,
    backend character varying(32) NOT NULL,
    data text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    CONSTRAINT social_auth_partial_next_step_check CHECK ((next_step >= 0))
);


ALTER TABLE public.social_auth_partial OWNER TO postgres;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_auth_partial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_partial_id_seq OWNER TO postgres;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_auth_partial_id_seq OWNED BY public.social_auth_partial.id;


--
-- Name: social_auth_usersocialauth; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_auth_usersocialauth (
    id integer NOT NULL,
    provider character varying(32) NOT NULL,
    uid character varying(255) NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.social_auth_usersocialauth OWNER TO postgres;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_auth_usersocialauth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_usersocialauth_id_seq OWNER TO postgres;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_auth_usersocialauth_id_seq OWNED BY public.social_auth_usersocialauth.id;


--
-- Name: annotation_annotation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation_annotation ALTER COLUMN id SET DEFAULT nextval('public.annotation_annotation_id_seq'::regclass);


--
-- Name: annotation_annotationbody id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation_annotationbody ALTER COLUMN id SET DEFAULT nextval('public.annotation_annotationbody_id_seq'::regclass);


--
-- Name: annotation_annotationtarget id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation_annotationtarget ALTER COLUMN id SET DEFAULT nextval('public.annotation_annotationtarget_id_seq'::regclass);


--
-- Name: annotation_fragmentselector id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation_fragmentselector ALTER COLUMN id SET DEFAULT nextval('public.annotation_fragmentselector_id_seq'::regclass);


--
-- Name: api_alert id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_alert ALTER COLUMN id SET DEFAULT nextval('public.api_alert_id_seq'::regclass);


--
-- Name: api_article id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_article ALTER COLUMN id SET DEFAULT nextval('public.api_article_id_seq'::regclass);


--
-- Name: api_articlecomment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_articlecomment ALTER COLUMN id SET DEFAULT nextval('public.api_articlecomment_id_seq'::regclass);


--
-- Name: api_articlecomment_liked_by id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_articlecomment_liked_by ALTER COLUMN id SET DEFAULT nextval('public.api_articlecomment_liked_by_id_seq'::regclass);


--
-- Name: api_asset id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_asset ALTER COLUMN id SET DEFAULT nextval('public.api_asset_id_seq'::regclass);


--
-- Name: api_buyorder id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_buyorder ALTER COLUMN id SET DEFAULT nextval('public.api_buyorder_id_seq'::regclass);


--
-- Name: api_equipment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_equipment ALTER COLUMN id SET DEFAULT nextval('public.api_equipment_id_seq'::regclass);


--
-- Name: api_equipmentcomment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_equipmentcomment ALTER COLUMN id SET DEFAULT nextval('public.api_equipmentcomment_id_seq'::regclass);


--
-- Name: api_equipmentcomment_liked_by id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_equipmentcomment_liked_by ALTER COLUMN id SET DEFAULT nextval('public.api_equipmentcomment_liked_by_id_seq'::regclass);


--
-- Name: api_event id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_event ALTER COLUMN id SET DEFAULT nextval('public.api_event_id_seq'::regclass);


--
-- Name: api_event_followed_by id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_event_followed_by ALTER COLUMN id SET DEFAULT nextval('public.api_event_followed_by_id_seq'::regclass);


--
-- Name: api_following id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_following ALTER COLUMN id SET DEFAULT nextval('public.api_following_id_seq'::regclass);


--
-- Name: api_like id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_like ALTER COLUMN id SET DEFAULT nextval('public.api_like_id_seq'::regclass);


--
-- Name: api_manualinvestment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_manualinvestment ALTER COLUMN id SET DEFAULT nextval('public.api_manualinvestment_id_seq'::regclass);


--
-- Name: api_mobileapp id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_mobileapp ALTER COLUMN id SET DEFAULT nextval('public.api_mobileapp_id_seq'::regclass);


--
-- Name: api_notification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_notification ALTER COLUMN id SET DEFAULT nextval('public.api_notification_id_seq'::regclass);


--
-- Name: api_onlineinvestment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_onlineinvestment ALTER COLUMN id SET DEFAULT nextval('public.api_onlineinvestment_id_seq'::regclass);


--
-- Name: api_parity id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_parity ALTER COLUMN id SET DEFAULT nextval('public.api_parity_id_seq'::regclass);


--
-- Name: api_paritysetting id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_paritysetting ALTER COLUMN id SET DEFAULT nextval('public.api_paritysetting_id_seq'::regclass);


--
-- Name: api_portfolio id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_portfolio ALTER COLUMN id SET DEFAULT nextval('public.api_portfolio_id_seq'::regclass);


--
-- Name: api_portfolio_followed_by id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_portfolio_followed_by ALTER COLUMN id SET DEFAULT nextval('public.api_portfolio_followed_by_id_seq'::regclass);


--
-- Name: api_portfolioitem id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_portfolioitem ALTER COLUMN id SET DEFAULT nextval('public.api_portfolioitem_id_seq'::regclass);


--
-- Name: api_prediction id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_prediction ALTER COLUMN id SET DEFAULT nextval('public.api_prediction_id_seq'::regclass);


--
-- Name: api_stoplossorder id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_stoplossorder ALTER COLUMN id SET DEFAULT nextval('public.api_stoplossorder_id_seq'::regclass);


--
-- Name: api_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_user ALTER COLUMN id SET DEFAULT nextval('public.api_user_id_seq'::regclass);


--
-- Name: api_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_user_groups ALTER COLUMN id SET DEFAULT nextval('public.api_user_groups_id_seq'::regclass);


--
-- Name: api_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.api_user_user_permissions_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: social_auth_association id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_association ALTER COLUMN id SET DEFAULT nextval('public.social_auth_association_id_seq'::regclass);


--
-- Name: social_auth_code id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_code ALTER COLUMN id SET DEFAULT nextval('public.social_auth_code_id_seq'::regclass);


--
-- Name: social_auth_nonce id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_nonce ALTER COLUMN id SET DEFAULT nextval('public.social_auth_nonce_id_seq'::regclass);


--
-- Name: social_auth_partial id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_partial ALTER COLUMN id SET DEFAULT nextval('public.social_auth_partial_id_seq'::regclass);


--
-- Name: social_auth_usersocialauth id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_usersocialauth ALTER COLUMN id SET DEFAULT nextval('public.social_auth_usersocialauth_id_seq'::regclass);


--
-- Data for Name: annotation_annotation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.annotation_annotation (id, created, body_id, target_id) FROM stdin;
\.


--
-- Data for Name: annotation_annotationbody; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.annotation_annotationbody (id, type, value, identifier) FROM stdin;
\.


--
-- Data for Name: annotation_annotationtarget; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.annotation_annotationtarget (id, source, selector_id) FROM stdin;
\.


--
-- Data for Name: annotation_fragmentselector; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.annotation_fragmentselector (id, value) FROM stdin;
\.


--
-- Data for Name: api_alert; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_alert (id, target_symbol, base_symbol, ratio, increasing, user_id) FROM stdin;
1	TRY	USD	6.0000	t	545
2	MKD	AED	5.9000	t	545
3	BTS	MGA	247.0000	f	545
4	AI	MAD	6.9000	f	545
5	ARS	AWG	6.5550	t	545
6	BTC	USD	7500.0000	t	589
7	ETH	USD	150.0000	t	589
8	ETH	USD	100.0000	f	589
9	BTC	USD	6500.0000	t	589
10	USD	BTC	8000.0000	t	589
11	USD	BTC	7300.0000	t	589
\.


--
-- Data for Name: api_article; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_article (id, title, created_at, content, image, author_id) FROM stdin;
94	My Evolution on Asset Allocation	2019-11-26 09:40:49.223694+00	Earlier this week I wrote about how holding can be one of the hardest aspects of investing. Anyone can buy or sell but holding takes discipline. I promised a follow-up to discuss how I handle this.\n\nTo offer a potential solution I’m going to walk you through my evolution on how I’ve come to think about asset allocation over the years.\n\nConcepts such as thinking long-term, buy and hold, value investing, and index funds were the proverbial light bulb ideas that made sense to me right away.\n\nAs I learned about other investment strategies over time I began to realize how important the behavioral and emotional aspects were for the entire process. Behavior trumps all because even the greatest portfolio or strategy in the world does you no good if you can’t get yourself or your investors to stick with it. An interest in behavioral psychology led me to study more about financial history and market trends.\n\nIn a previous role in the institutional world, my firm had a subscription to Ned Davis Research. Davis has one of the more underrated minds and track records in the business. My colleague at the time was a quant who I helped systematically go through most of NDR’s models and trading systems. After months and months of work, we discovered that the majority of the performance from these models could be explained by a single variable — trend.\n\nThis is an oversimplification but if the trend was positive (based on some fairly simple rules), these models were in stocks and if the trend was negative the models would go to bonds or cash. Since stocks go up the majority of the time, the majority of the time these models were fully invested. But when trends broke to the downside, they got out.\n\nAs I became more interested in the idea of trends and momentum in the markets I began to read work from people and firms such as Cliff Asness (and his team at AQR), Wes Gray (and his team at Alpha Architect), Meb Faber, and Gary Antonacci (see the bottom of the post for some reading material from this group).\n\nMomentum is based on the idea that assets that have performed relatively well (poorly) recently will continue to perform well (poorly) going forward, at least for a short period of time. The basis for this as an investment strategy is that the pendulum tends to swing too far in either direction because prices often dislocate from fundamentals. The historical data and research show that trends have existed pretty much everywhere in financial markets – stocks, bonds, currencies, commodities, etc.\n\nThe behavioral explanation for trends comes from our laundry list of biases. Research shows that investors hold onto losing stocks too long in hopes they’ll come back to their original price while selling their winners too early. Investors also anchor to recent results, so initially, markets underreact to news, events or data releases.\n\nOn the flip side, once things become apparent, investors enter a herd mentality and overreact, causing an overshoot to the upside. Fear, greed, overconfidence and the confirmation bias can lead investors to pile into winning areas of the market after they’ve risen or pile out after they’ve fallen.\n\nIn many ways, momentum investing acts as a counterweight to value investing, which is based on the long-term reversion to the mean. They just operate on different time frames.	img0.jpg	45
95	Why your house is a terrible investment	2019-11-26 09:40:50.263667+00	James Altucher calls homeownership a part of The American Religion, so I know I’m treading dangerous ground here. But before you get out the tar and feathers, let’s do a little thought experiment together.\n\nImagine over a cup of coffee or a glass of wine we get to talking about investments. Then maybe one of us, let’s say you, says:\n\n“Hey I’ve got an idea. We’re always talking about good investments. What if we came up with the worst possible investment we can construct? What might that look like?”\n\nWell, let’s see now (pulling out our lined yellow pad), let’s make a list. To be really terrible:\n- It should be not just an initial, but if we do it right, a relentlessly ongoing drain on the cash reserves of the owner.\n- It should be illiquid. We’ll make it something that takes weeks, no – wait – even better, months of time and effort to buy or sell.\n- It should be expensive to buy and sell. We’ll add very high transaction costs. Let’s say 5% commissions on the deal, coming and going.\n- It should be complex to buy or sell. That way we can ladle on lots of extra fees and reports and documents we can charge for.\n- It should generate low returns. Certainly no more than the inflation rate. Maybe a bit less.\n- It should be leveraged! Oh, oh this one is great! This is how we’ll get people to swallow those low returns! If the price goes up a little bit, leverage will magnify this and people will convince themselves it’s actually a good investment! Nah, don’t worry about it. Most will never even consider that leverage is also very high risk and could just as easily wipe them out.\n- It should be mortgaged! Another beauty of leverage. We can charge interest on the loans. Yep, and with just a little more effort we should easily be able to persuade people who buy this thing to borrow money against it more than once.\n- It should be unproductive. While we’re talking about interest, let’s be sure this investment we are creating never pays any. No dividends either, of course.\n\nBoy howdy! That’s quite a list! Any investment that ugly would make my skin crawl. In fact, I’m not sure you could rightly call anything with those characteristics an investment at all.\n\nThen, too, the challenge would be to get anybody to buy this turkey. But we can. In fact, I bet we can get them not only to buy but to believe doing so is the fulfillment of a dream, indeed a national birthright! We’ll run the thought experiment on just how we might make that happen in an up-coming post.\n\nFor now, in the comments let me know what other characteristics our “worst possible investment” should have that I might have missed. Here are two more from…\n- Mr. Risky Start-up: It should increase stress, lead to more divorces, but then be impossible to divide.\n- DMDave: You only need one motivated (read: desperate) seller to set the price for the whole neighborhood. Imagine your so-called “investment” suddenly get scuttled when your neighbor decided to sell his particle-board mansion at 20% below assessment.\n\nOh. Wait. I’m sorry. This was supposed to be about houses.\n\nSo a few weeks back I was at an awards banquet and sitting at our table of 10 with me was a woman I know. She began talking about how she was encouraging her young son to buy a house. You know. Stop throwing away money on rent and start building equity.\n\nI suggested that, since  her son was single, living alone and without children maybe he didn’t actually need a house. That if he didn’t need one and since they are lousy investments (and here I gave her a few reasons why this is so), maybe he should consider some alternatives instead. Or at least run the numbers first.	img1.jpg	46
96	Tax Refunds – The Ultimate Behavioral Finance Lesson	2019-11-26 09:40:50.713874+00	65% of individual taxpayers received a tax cut last year, according to the Tax Policy Center. Only 6% saw a tax increase, and the remainder saw little or no change in their tax bill.\n\nThis tax season, I read article after article about taxpayers distraught over smaller refunds. Most taxpayers owed less tax in 2018, but they don’t believe it. They feel the exact opposite because of how and when the tax cut was delivered. Instead of a large refund, taxpayers got a little more in each paycheck. That small increase in monthly take home pay pales in comparison, psychologically, to a larger refund check. The average tax savings was $780 which amounts to $30 in a bi-weekly paycheck. Would you notice it?\n\nMany Americans have been using the Treasury as a forced savings mechanism, and they’re not happy it didn’t pan out as planned this year. A tax refund is an interest free loan to the U.S. Treasury. Taxpayers accomplish this by withholding too much from their paycheck or making high estimated payments. Since tax bills are not known with precision in advance, it makes sense to pay a little more throughout the year and receive a refund rather than owe interest and penalties for underpayment. Withholding options for W2 employees are generic and cannot account for every nuance in a tax return.\n\nFrom a purely rational perspective, no one should desire a tax refund. It represents dollars you could have placed in an interest bearing savings account or used to payoff high interest debt.\n\nAmericans budget in anticipation of their tax refund. This mental accounting exercise earmarks refund dollars for credit card balances, vacations, new cars, appliances, college tuition, or just about anything. Many taxpayers found out only after filing their return, that the refund was not coming or was smaller than expected. The tax refund is so powerful that it caused cognitive dissonance. The gap between the number of Americans who received a tax cut and those who believe they did is as high as 40%.\n\nIn the seminal behavioral finance book, Nudge, Richard Thaler and Cass Sunstein make a case for institutions to build choice architecture that “nudges” people to make good decisions that they would not otherwise make on their own. The book is credited with sparking positive changes in 401(k) retirement plans, with employers adding automatic enrollment and qualified default investment alternative (QDIA) options. These options increased employee participation in 401(k) plans and ensured their long-term savings did not default to low-yielding cash.\n\nI can’t help but think of the tax refund as an accidental nudge. That nudge gets millions Americans to put aside money for large, one-off expenses. It may not be a perfect solution, but it was working for many families. If there is anything to learn from the outrage over refunds this year, it is the power of behavioral nudges. Let us hope future public policy utilizes positive behavioral nudges more deliberately.	img2.jpg	47
103	How Would It Affect Turkish Economy if EU Decides to Have Its Own Army?	2019-11-26 13:19:42+00	Relations between the European Union (EU) and Turkey were established in 1959,  Turkey is negotiating its accession to the European Union (EU) as a member state since then. Turkey has become a member of NATO in 1952. USA and Turkey are the key countries in the NATO alliance. However, recently two countries having trouble in many issues. The political crisis between two main NATO countries has ended up with French president advocating for European army which will diminish the need of European countries to NATO. If that happens, how it would affect NATO is a intriguing question. But my concern in this article is how it would affect Turkish economy. The answer to this question is related to the answer of the first question, though. EU army would repeal the NATO and a faded NATO would leave Turkey alone again the threats in its unsafe environment. Unsafe is a word which the most investors hate.	f04f56ff-d3dd-44b8-970f-e2ec26fe9467.jpeg	551
133	Baklava: Understanding the Problems of Food Economy	2019-12-24 15:14:21+00	The delicious dessert "baklava" has always been discussed as which country it originally belongs to. However, this time, it's at the center of economic and political discussions in Europe. The main opposition leader of sector has initiated the discussions with his comments on the recent inflation rates and the social inequality in the country via using the difference in prices of baklava by cities and by the time. For instance, a couple of baklava in Mykonos costs 20 times more expensive than in the poorest rural areas. Yet, the poor cannot consume that much as they identify baklava as an expensive dessert. Even though her remarks on the government's economic policies using baklava have been ridiculed at first, the people have kept these in their mind and gave her the credit in short time. Most economists agree that baklava can be thought as a "basket" to predict real inflation in food market since its ingredients represent the average. The vulnerability of the food economy seem to be risky for Euro in near future given that inflation in sector seem to grow even higher. Other European countries call the government to regulate social policies to compansate the inflation by social helps to reinforce private expenditure.	baklava.jpg	545
97	Why Invest in Index Funds?	2019-11-26 09:40:51.093797+00	The following is an adapted, excerpted chapter from the 2018 edition of my book Investing Made Simple: Investing in Index Funds Explained in 100 Pages or Less.\n\nPay less for a product or service, and you’ll have more money left over afterwards. Pretty straightforward, right? For some reason, many investors seem to think that this rule doesn’t apply to the field of investing. Big mistake.\n\nINDEX FUNDS 101\n\nA bit of background: Most mutual funds are run by people picking stocks or other investments that they think will earn above-average returns. Index funds, however, are passively managed. That is, they seek only to match (rather than beat) the performance of a given index.\n\nFor example, index funds could be used to track the performance of:\n\nThe entire U.S. stock market,\n- Certain sectors of the U.S. stock market (the pharmaceutical industry, for instance),\n- Various international stock markets,\n- The bond market of a given country, or\n- Just about anything else you can think of.\n\n\nMost Actively Managed Funds Lose.\n\nThe goal of most actively managed funds is to earn a return greater than that of their respective indexes. For example, many actively managed U.S. stock funds seek to outperform the return of the U.S. stock market. After all, if an active fund doesn’t beat its index, then its investors would have been better off in an index fund that simply tracks the market’s return.\n\nInterestingly, most investors actually would be better off in index funds. Why? Because — due to the high costs of active management — the majority of actively managed funds fail to outperform their respective indexes. In fact, according to a study done by Standard and Poors, for the ten-year period ending 6/30/2017:\n\n- Less than 15% of U.S. stock funds managed to outperform their respective indexes,\n- Less than 21% of international stock funds managed to outperform their respective indexes, and\n- Less than 23% of taxable bond funds managed to outperform their respective indexes.\n\nNow, lest you think that this particular period was an anomaly, let me assure you: It wasn’t. Standard and Poors has been doing this study since 2002, and each of the studies has shown very similar results. Actively managed funds have failed in both up markets and down markets. They’ve failed in both domestic markets and international markets. And they’ve failed in both stock markets and bond markets.\n\nWhy Index Funds Win\n\nThe investments included in a given index are generally published openly, thereby making it easy for an index fund to track its respective index. (All the fund has to do is buy all of the stocks — or other investments — that are included in the index.) As you can imagine, implementing such a strategy can be done at a far lower cost than that charged by the average actively managed fund.\n\nCommon sense (and elementary school arithmetic) tells us that:\n- If the entire stock market earns, say, a 9% annual return over a given decade, and\n- The average dollar invested in the stock market incurs investment costs (such as brokerage commissions and mutual fund fees) of 1.5%,\n	img3.jpg	48
98	How To Build Wealth (It's Ridiculously Simple)	2019-11-26 09:40:51.20065+00	Building wealth is simple.\n\nIt doesn’t require luck, genius, or special connections.\n\nYou don’t have to attend overpriced weekend financial seminars or learn the latest tricks and gimmicks sold by slick marketers.\n\nAs John Bogle wisely stated, “The secret is there are no secrets.”\n\nThe truth behind how to build wealth is public domain knowledge, simple to understand, and nobody is going to get rich selling it to you.\n\nIn fact, it's so simple it can be explained in just two sentences:\n\n1. Make more than you spend and invest the difference wisely.\n2. Develop simple daily habits that result in wealth accumulation.\nI know… you’re probably a little disappointed.\n\nYou wanted something new, different, and clever – the missing ingredient that has held you back and will produce breakthrough results. The fabled “secret” every marketer tries to sell.\n\nInstead, I give you something dangerously close to what Grandma would have said.\n\nBut listen to the voice of experience. I’ve coached hundreds of people from debtors to the wealthy, and the pattern is unmistakable.\n\nAnd it’s not just me singing this song. These same truths were taught by Benjamin Franklin hundreds of years earlier and reiterated by numerous authorities ever since, including J. Paul Getty.\n\nIt's timeless wisdom that has been proven over the centuries, and will also probably work for you (if you just put it into practice).\n\nIn short, if you want wealth in this lifetime with the highest probability of success, then these two sentences contain the essential wisdom you need to know.	img4.jpg	49
99	How I Built a Dividend Growth Investment Portfolio	2019-11-26 09:40:51.523631+00	I remember the first time I read Warren Buffett's annual letter to Berkshire Hathaway shareholders. It was witty, it was entertaining, and it wasn't anything like your standard annual report with glossy pages, full color photos, and mind-numbing marketing-speak.\n\nThat first time, the page that blew me away was his list of stock investments – specifically the dividend producing stocks.\n\nBerkshire Hathaway, as of the 2017 letter, owns 400 million shares of stock at a cost of $1.299 billion. Each share pays out $1.48 a year. Berkshire Hathaway gets $592 million from Coca Cola every single year.\n\nThat's an annual yield of 45.6%.\n\nHow is this possible!? What is this sorcery!?\n\nTime is an investor's best friend.\n\nBuffett acquired shares of Coca-Cola in 1988. Back then he wrote “We expect to hold these securities for a long time. In fact, when we own portions of outstanding businesses with outstanding managements, our favorite holding period is forever. We are just the opposite of those who hurry to sell and book profits when companies perform well but who tenaciously hang on to businesses that disappoint. Peter Lynch aptly likens such behavior to cutting the flowers and watering the weeds.” (1998 letter)\n\nThe formula is simple. He bought the shares a long time ago, his cost basis was much lower than the market value, and KO kept increasing dividends. If you buy shares today (at $41.62), you get 3.55% yield. Warren Buffett is getting 45.6%.\n\nI wanted to replicate his success. I wanted to build a portfolio of blue chip, dividend stocks that would produce passive income for us.\n\nI'll start with explaining where dividends fit in our existing portfolio, follow it up with a discussion why we invest in individuals stocks and not dividend funds, a brief chat about the factors in our favor followed by the strategy I use to pick stocks. Let's go!	img5.jpg	50
100	Germany’s November Ifo Business Climate Index Rises	2019-11-19 21:10:00+00	German business sentiment improved in November, the Ifo Institute said Monday, although the rise came in just below consensus forecasts.\n\nThe Ifo business-climate index came in at 95.0 points in November, up from an upwardly revised 94.7 in October, the Ifo Institute said. Economists surveyed by The Wall Street Journal had forecast the Ifo business climate at 95.1 points.\n\nCompanies’ assessment of the current situation improved to 97.9 points from 97.8 in October, while expectations also rose to 92.1 points in November from 91.6 points in October, said the institute. Economists polled by the Wall Street Journal forecast figures of 98.0 and 92.5 points, respectively.\n\n“The German economy is showing resilience,” the Munich-based institute said, which expects 0.2% GDP growth in the fourth quarter.\n\nThe closely watched manufacturing sector remains in recession, the institute said, after a slight increase in October.\n\n“Companies still find their current order backlog very disappointing. They are planning further production cutbacks,” Ifo said.\n\nThe Ifo result is based on a poll of about 9,000 companies in manufacturing, services, trade and construction.	img6.jpg	545
132	IOTA price analysis: IOT/USD retreats below $0.2000 amid growing bearish pressure	2019-12-24 14:02:00+00	Bitcoin or BTC is the most commonly known cryptocurrency which uses the blockchain technology, whereas IOTA is another cryptocurrency but unlike BTC, it uses Tangle technology.\r\n\r\nIOTA has continued its trip to the South. The 20th largest digital asset topped at $0.2120 on Monday and retreated all the way down to $0.1822 on Tuesday. At the time of writing, IOT/USD is changing hands at $0.1985. The coin has lost 3.5% on a day-to-day basis and over 35% in the latest month. \r\n\r\nFrom the fundamental point of view, there are little reasons for the sell-off. Basically, IOT/USD is moving in sync with the market and respond to local technical factors.\r\n\r\nIOTA's technical picture\r\nIOTA's recovery is capped by the middle line of the daily Bollinger Band at $0.2088. This barrier is closely followed by a $0.2100 area. Once it is out of the way, the upside is likely to gain traction with the next focus on $0.22. However, the critical resistance awaits IOTA bulls on approach to $0.2400. This area is reinforced by SMA50 (Simple Moving Average) daily. Notably, the coin has been trading l=below this line since the beginning of November.\r\n\r\nOn the downside, the local support is created by the lower line of the Bollinger Band at $0.1950. It is followed by the intraday low of $0.1822 and a psychological $0.1800.	images.jpg	546
126	Pound Turkish Lira (GBP/TRY) Exchange Rate Dips, UK Construction Output Suffers in October	2019-11-19 21:10:00+00	\nThe Pound Turkish Lira (GBP/TRY) exchange rate eased today, with the pairing currently trading around ₺7.352 after the UK Construction PMI for October remained firmly in contraction territory at 44.2, dampening market confidence in the British economy.\n\nBritish political news remains in focus, and while the Tories are expected to secure their lead in the polls, analysts remain cautious about predictions for a hung parliament on 12 December, leaving the GBP/TRY exchange rate subdued on rising uncertainty.\n\nThe Turkish Lira (TRY) edged higher against a weakened Pound (GBP) following this morning’s Turkish inflation figure for October, which rose from 0.99% to 2% on the month, while deteriorating to 8.55% on the year.\n\nHowever, after the credit ratings agency Fitch revised Turkey’s economic outlook from “negative” to “stable” last week, appetite for the Turkish Lira increased.\n\nIn political news, Turkey’s Prime Minister Tayyip Erdogan may call off his visit to Washington next week in protest of proposed sanctions on Turkey. As a result, we could see the Turkish Lira begin to lose some of its gains on heightened political uncertainty in the near term.\n\nAny signs of a flare-up between Turkey and the US could diminish appetite in the Turkish Lira, as this would exacerbate an already volatile political situation and weaken the Turkish economy.\n\nPound traders will be awaiting tomorrow’s release of October’s UK Markit Services PMI, which is expected to remain in recession territory at 49.7.\n\nTomorrow will also see the publication of October’s UK BRC Like-For-Like Retail Sales, which are expected to improve from -1.7% to 1.4%.\n\n	img331_rDLH2e6.jpg	586
127	British Pound Sterling to Euro exchange rate: Travellers can benefit from strong pound after Tory victory	2019-11-19 21:10:00+00	\nTHE POUND to euro exchange rate remained at a modest high following on from last week’s Conservative Party landslide General Election 2019 win. How will the boosted rates affect holidaymakers?\n\nThe pound has settled at a modest position just below the more than three-year high it struck last week. Although it experienced a minor dip on Friday, sterling remains in a comfortable position, which should be beneficial to tourists hoping to change their holiday money in the coming days. Moving forward, politics will remain the deciding factor of the pound’s position.\n\nThe pound is currently trading at a rate of 1.2039 against the euro according to Bloomberg at the time of writing.\n\nIt is a minor fall from its surge last week following the announcement of a Tory majority.\n\nSpeaking exclusively to Express.co.uk this morning, Michael Brown, Senior Market Analyst, at Caxton FX said: “Sterling experienced a modest pullback on Friday, paring roughly half of its post-election advance, in something of a buy the rumour, sell the fact reaction to the Tories’ majority.\n\n“Nonetheless, the pound closed close to the €1.20 handle, just below a more than three-year high against the common currency.\n\n“This week, while politics will remain in focus, investors will also receive a full health-check on the UK economy, including the latest employment, inflation, retail sales, and GDP reports.”\n\n	img332_qyzoHks.jpg	587
\.


--
-- Data for Name: api_articlecomment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_articlecomment (id, created_at, content, image, article_id, user_id) FROM stdin;
142	2019-11-26 09:40:49.848892+00	Very helpful.		94	45
143	2019-11-26 09:40:49.858615+00	I will try to apply these ideas.		94	46
144	2019-11-26 09:40:49.859892+00	Well, I would argue the way you think of asset allocation.		94	47
145	2019-11-26 09:40:49.861274+00	Good article!		94	48
146	2019-11-26 09:40:49.862976+00	Thanks for sharing your experience with everyone. I think thats the best thing about this platform. I love TrAiders!		94	49
147	2019-11-26 09:40:49.86439+00	I don't think you are good at investing.		94	50
148	2019-11-26 09:40:49.865925+00	Bişe anlamadım.		94	51
149	2019-11-26 09:40:49.867153+00	Best article I've ever read.		94	52
150	2019-11-26 09:40:50.366678+00	If I'm not gonna buy a house, than where am I going to live?		95	55
151	2019-11-26 09:40:50.375446+00	Very much agreed, buying your house is the worst thing.		95	56
152	2019-11-26 09:40:50.376807+00	Yeah, lost 10K because of my house.		95	57
153	2019-11-26 09:40:50.383777+00	Not true if you live in Turkey.		95	58
154	2019-11-26 09:40:50.393763+00	I am selling my house right now, gonna live in my car		95	59
155	2019-11-26 09:40:50.903538+00	This is way too smart for me.		96	65
156	2019-11-26 09:40:50.912273+00	That's irrelevant when you have no income.		96	66
157	2019-11-26 09:40:50.913454+00	Very helpful.		96	67
158	2019-11-26 09:40:50.914628+00	Tax refunds are the worst		96	68
159	2019-11-26 09:40:51.179664+00	Read it, still have no idea what an index fund is.		97	75
160	2019-11-26 09:40:51.18839+00	Very true.		97	76
161	2019-11-26 09:40:51.189566+00	Yeah, I made 40% profit in one year investing in index funds.		97	77
162	2019-11-26 09:40:51.190946+00	Well, I lost everything in index funds		97	78
163	2019-11-26 09:40:51.454189+00	It is toooo easy even you can do it.		98	85
164	2019-11-26 09:40:51.462969+00	It is not when you spend your money irresponsibly.		98	86
165	2019-11-26 09:40:51.46412+00	Good article.		98	87
166	2019-11-26 09:40:51.465329+00	What I am suppose to do with my money if I am not gonna spend it? Take it to my grave?		98	88
167	2019-11-26 09:40:51.466647+00	Kefenin cebi yok		98	89
168	2019-11-26 09:40:51.593698+00	Thanks a lot.		99	95
169	2019-11-26 09:40:51.602412+00	This is a great article.		99	96
170	2019-11-26 09:40:51.603578+00	Can anyone help me build my portfolio?		99	97
171	2019-11-26 09:40:51.604751+00	Well, this is nonsense.		99	98
172	2019-11-26 09:40:51.60597+00	I like your articles.		99	99
173	2019-11-26 09:41:04.265861+00	Wow, that guy really is a pro!		100	45
174	2019-11-26 09:41:04.304395+00	Pretty good stuff ahhaaa!		100	366
175	2019-11-26 09:41:04.31383+00	How amazing that you predicted that. I like this guy.		100	148
176	2019-11-26 09:41:04.323767+00	Really cool article		100	230
179	2019-11-26 13:21:26.721864+00	chechk out my article https://traiders.tk/articles/103		100	551
203	2019-12-24 11:30:11.08458+00	Bişe anlamadım.		126	116
180	2019-12-06 14:26:00.901028+00	Buy a house best investment ever!		98	545
181	2019-12-08 20:41:44.697108+00	Nice		97	556
186	2019-12-12 07:50:09.00746+00	I didn't read but I'm pretty sure that it is an amazing article, GO TRUMP!		95	561
192	2019-12-21 11:34:42.647983+00	Ev alma komşu al		95	550
182	2019-12-08 20:46:49.675473+00	I liked this article!		103	556
183	2019-12-10 11:46:52.837755+00	wow		103	550
197	2019-12-24 11:30:11.059618+00	Very helpful.		126	96
198	2019-12-24 11:30:11.077701+00	I will try to apply these ideas.		126	100
199	2019-12-24 11:30:11.079138+00	Well, I would argue the way you think of asset allocation.		126	103
200	2019-12-24 11:30:11.080535+00	Good article!		126	106
201	2019-12-24 11:30:11.08188+00	Thanks for sharing your experience with everyone. I think thats the best thing about this platform. I love TrAiders!		126	108
202	2019-12-24 11:30:11.083262+00	I don't think you are good at investing.		126	111
204	2019-12-24 11:30:11.085787+00	Best article I've ever read.		126	117
205	2019-12-24 11:30:11.138231+00	Very helpful.		127	96
206	2019-12-24 11:30:11.139514+00	I will try to apply these ideas.		127	100
207	2019-12-24 11:30:11.140699+00	Well, I would argue the way you think of asset allocation.		127	103
208	2019-12-24 11:30:11.141868+00	Good article!		127	106
209	2019-12-24 11:30:11.143066+00	Thanks for sharing your experience with everyone. I think thats the best thing about this platform. I love TrAiders!		127	108
210	2019-12-24 11:30:11.144311+00	I don't think you are good at investing.		127	111
212	2019-12-24 11:30:11.146783+00	Best article I've ever read.		127	117
211	2019-12-24 11:30:11.145479+00	Bişe anlamadım.		127	116
213	2019-12-24 14:19:22+00	I bought IOTA last year, it was a total loss for me.		132	62
214	2019-12-24 14:20:23+00	Microsoft was the main reason for the expectations for IOTA.		132	74
215	2019-12-24 14:21:24+00	Tangle is an amazing technology. PoW requires so much energy.		132	102
216	2019-12-24 17:13:41.485414+00	Interesting...		133	591
\.


--
-- Data for Name: api_articlecomment_liked_by; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_articlecomment_liked_by (id, articlecomment_id, user_id) FROM stdin;
40	182	556
42	183	550
46	192	550
49	182	566
50	183	566
51	211	586
53	203	44
54	213	81
55	213	79
56	214	64
57	214	67
58	214	76
59	214	77
60	214	80
61	214	82
62	215	114
\.


--
-- Data for Name: api_asset; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_asset (id, amount, on_hold_for_investment, equipment_id, user_id) FROM stdin;
16	5000.000	0.000	355	550
17	10000000000.000	0.000	355	571
10	15.730	0.000	263	547
9	99900.000	0.000	355	547
19	30.300	0.000	263	545
18	800.000	0.000	355	545
21	332.640	0.000	263	572
20	997770.000	30.000	355	572
22	10000000.000	0.000	355	574
23	56.900	0.000	364	545
24	88.960	0.000	231	545
25	66407.600	0.000	355	555
26	0.000	0.000	361	555
15	619.000	0.000	355	546
13	15.760	0.000	263	546
36	2100.000	0.000	355	586
35	700.000	0.000	266	586
37	876.000	0.000	910	589
39	45.330	0.000	263	590
38	0.000	0.000	355	590
\.


--
-- Data for Name: api_buyorder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_buyorder (id, date, buy_ratio, buy_amount, base_equipment_id, target_equipment_id, user_id) FROM stdin;
\.


--
-- Data for Name: api_equipment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_equipment (id, name, category, symbol) FROM stdin;
221	United Arab Emirates Dirham	currency	AED
222	Afghan Afghani	currency	AFN
223	Albanian Lek	currency	ALL
224	Armenian Dram	currency	AMD
225	Netherlands Antillean Guilder	currency	ANG
226	Angolan Kwanza	currency	AOA
227	Argentine Peso	currency	ARS
228	Australian Dollar	currency	AUD
229	Aruban Florin	currency	AWG
230	Azerbaijani Manat	currency	AZN
231	Bosnia-Herzegovina Convertible Mark	currency	BAM
232	Barbadian Dollar	currency	BBD
233	Bangladeshi Taka	currency	BDT
234	Bulgarian Lev	currency	BGN
235	Bahraini Dinar	currency	BHD
236	Burundian Franc	currency	BIF
237	Bermudan Dollar	currency	BMD
238	Brunei Dollar	currency	BND
239	Bolivian Boliviano	currency	BOB
240	Brazilian Real	currency	BRL
241	Bahamian Dollar	currency	BSD
242	Bhutanese Ngultrum	currency	BTN
243	Botswanan Pula	currency	BWP
244	Belize Dollar	currency	BZD
245	Canadian Dollar	currency	CAD
246	Congolese Franc	currency	CDF
247	Swiss Franc	currency	CHF
248	Chilean Unit of Account UF	currency	CLF
249	Chilean Peso	currency	CLP
250	Chinese Yuan Offshore	currency	CNH
251	Chinese Yuan	currency	CNY
252	Colombian Peso	currency	COP
253	Cuban Peso	currency	CUP
254	Cape Verdean Escudo	currency	CVE
255	Czech Republic Koruna	currency	CZK
256	Djiboutian Franc	currency	DJF
257	Danish Krone	currency	DKK
258	Dominican Peso	currency	DOP
259	Algerian Dinar	currency	DZD
260	Egyptian Pound	currency	EGP
261	Eritrean Nakfa	currency	ERN
262	Ethiopian Birr	currency	ETB
263	Euro	currency	EUR
264	Fijian Dollar	currency	FJD
265	Falkland Islands Pound	currency	FKP
266	British Pound Sterling	currency	GBP
267	Georgian Lari	currency	GEL
268	Ghanaian Cedi	currency	GHS
269	Gibraltar Pound	currency	GIP
270	Gambian Dalasi	currency	GMD
271	Guinean Franc	currency	GNF
272	Guatemalan Quetzal	currency	GTQ
273	Guyanaese Dollar	currency	GYD
274	Hong Kong Dollar	currency	HKD
275	Honduran Lempira	currency	HNL
276	Croatian Kuna	currency	HRK
277	Haitian Gourde	currency	HTG
278	Hungarian Forint	currency	HUF
279	Indonesian Rupiah	currency	IDR
280	Israeli New Sheqel	currency	ILS
281	Indian Rupee	currency	INR
282	Iraqi Dinar	currency	IQD
283	Iranian Rial	currency	IRR
284	Icelandic Krona	currency	ISK
285	Jersey Pound	currency	JEP
286	Jamaican Dollar	currency	JMD
287	Jordanian Dinar	currency	JOD
288	Japanese Yen	currency	JPY
289	Kenyan Shilling	currency	KES
290	Kyrgystani Som	currency	KGS
291	Cambodian Riel	currency	KHR
292	Comorian Franc	currency	KMF
293	North Korean Won	currency	KPW
294	South Korean Won	currency	KRW
295	Kuwaiti Dinar	currency	KWD
296	Cayman Islands Dollar	currency	KYD
297	Kazakhstani Tenge	currency	KZT
298	Laotian Kip	currency	LAK
299	Lebanese Pound	currency	LBP
300	Sri Lankan Rupee	currency	LKR
301	Liberian Dollar	currency	LRD
302	Lesotho Loti	currency	LSL
303	Libyan Dinar	currency	LYD
304	Moroccan Dirham	currency	MAD
305	Moldovan Leu	currency	MDL
306	Malagasy Ariary	currency	MGA
307	Macedonian Denar	currency	MKD
308	Myanma Kyat	currency	MMK
309	Mongolian Tugrik	currency	MNT
310	Macanese Pataca	currency	MOP
311	Mauritanian Ouguiya (pre-2018)	currency	MRO
312	Mauritanian Ouguiya	currency	MRU
313	Mauritian Rupee	currency	MUR
314	Maldivian Rufiyaa	currency	MVR
315	Malawian Kwacha	currency	MWK
316	Mexican Peso	currency	MXN
317	Malaysian Ringgit	currency	MYR
318	Mozambican Metical	currency	MZN
319	Namibian Dollar	currency	NAD
320	Nigerian Naira	currency	NGN
321	Norwegian Krone	currency	NOK
322	Nepalese Rupee	currency	NPR
323	New Zealand Dollar	currency	NZD
324	Omani Rial	currency	OMR
325	Panamanian Balboa	currency	PAB
326	Peruvian Nuevo Sol	currency	PEN
327	Papua New Guinean Kina	currency	PGK
328	Philippine Peso	currency	PHP
329	Pakistani Rupee	currency	PKR
330	Polish Zloty	currency	PLN
331	Paraguayan Guarani	currency	PYG
332	Qatari Rial	currency	QAR
333	Romanian Leu	currency	RON
334	Serbian Dinar	currency	RSD
335	Russian Ruble	currency	RUB
336	Old Russian Ruble	currency	RUR
337	Rwandan Franc	currency	RWF
338	Saudi Riyal	currency	SAR
339	Solomon Islands Dollar	currency	SBDf
340	Seychellois Rupee	currency	SCR
341	Sudanese Pound	currency	SDG
342	Swedish Krona	currency	SEK
343	Singapore Dollar	currency	SGD
344	Saint Helena Pound	currency	SHP
345	Sierra Leonean Leone	currency	SLL
346	Somali Shilling	currency	SOS
347	Surinamese Dollar	currency	SRD
348	Syrian Pound	currency	SYP
349	Swazi Lilangeni	currency	SZL
350	Thai Baht	currency	THB
351	Tajikistani Somoni	currency	TJS
352	Turkmenistani Manat	currency	TMT
353	Tunisian Dinar	currency	TND
354	Tongan Pa'anga	currency	TOP
355	Turkish Lira	currency	TRY
356	Trinidad and Tobago Dollar	currency	TTD
357	New Taiwan Dollar	currency	TWD
358	Tanzanian Shilling	currency	TZS
359	Ukrainian Hryvnia	currency	UAH
360	Ugandan Shilling	currency	UGX
361	United States Dollar	currency	USD
362	Uruguayan Peso	currency	UYU
363	Uzbekistan Som	currency	UZS
364	Vietnamese Dong	currency	VND
365	Vanuatu Vatu	currency	VUV
366	Samoan Tala	currency	WST
367	CFA Franc BEAC	currency	XAF
368	Silver Ounce	currency	XAG
369	Gold Ounce	currency	XAU
370	East Caribbean Dollar	currency	XCD
371	Special Drawing Rights	currency	XDR
372	CFA Franc BCEAO	currency	XOF
373	CFP Franc	currency	XPF
374	Yemeni Rial	currency	YER
375	South African Rand	currency	ZAR
376	Zambian Kwacha	currency	ZMW
377	Zimbabwean Dollar	currency	ZWL
378	FirstBlood	crypto	1ST
379	GiveCoin	crypto	2GIVE
380	808Coin	crypto	808
381	ArcBlock	crypto	ABT
382	ArtByte	crypto	ABY
383	AsiaCoin	crypto	AC
384	Achain	crypto	ACT
385	Cardano	crypto	ADA
386	adToken	crypto	ADT
387	AdEx	crypto	ADX
388	Aeternity	crypto	AE
389	Aeon	crypto	AEON
390	SingularityNET	crypto	AGI
391	IDNI-Agoras	crypto	AGRS
392	POLY-AI	crypto	AI
393	AidCoin	crypto	AID
394	Aion	crypto	AION
395	AirToken	crypto	AIR
396	Akuya-Coin	crypto	AKY
397	ALIS	crypto	ALIS
398	AmberCoin	crypto	AMBER
399	Synereo	crypto	AMP
400	Anoncoin	crypto	ANC
401	Aragon	crypto	ANT
402	AppCoins	crypto	APPC
403	APX-Ventures	crypto	APX
404	Ardor	crypto	ARDR
405	Ark	crypto	ARK
406	Aeron	crypto	ARN
407	AirSwap	crypto	AST
408	ATBCoin	crypto	ATB
409	ATMChain	crypto	ATM
410	Authorship	crypto	ATS
411	Auroracoin	crypto	AUR
412	Aventus	crypto	AVT
413	B3Coin	crypto	B3
414	Basic-Attention-Token	crypto	BAT
415	BitBay	crypto	BAY
416	Boolberry	crypto	BBR
417	BCAP	crypto	BCAP
418	BitConnect	crypto	BCC
419	Bitcoin-Diamond	crypto	BCD
420	Bitcoin-Cash	crypto	BCH
421	Bytecoin	crypto	BCN
422	BlockMason-Credit-Protocol-Token	crypto	BCPT
423	BitcoinX	crypto	BCX
424	BitCrystals	crypto	BCY
425	Bitdeal	crypto	BDL
426	Bee-Token	crypto	BEE
427	BelaCoin	crypto	BELA
428	DAO-Casino	crypto	BET
429	BF-Token	crypto	BFT
430	Bismuth	crypto	BIS
431	BitBean	crypto	BITB
432	BitBTC	crypto	BITBTC
433	BitCNY	crypto	BITCNY
434	BitEUR	crypto	BITEUR
435	BitGOLD	crypto	BITGOLD
436	BitSILVER	crypto	BITSILVER
437	BitUSD	crypto	BITUSD
438	Bibox-Token	crypto	BIX
439	Blitzcash	crypto	BLITZ
440	Blackcoin	crypto	BLK
441	Bolenum	crypto	BLN
442	Blocknet	crypto	BLOCK
443	Bluzelle	crypto	BLZ
444	Blackmoon-Crypto	crypto	BMC
445	Binance-Coin	crypto	BNB
446	Bancor-Network-Token	crypto	BNT
447	Bounty0x	crypto	BNTY
448	BoostCoin	crypto	BOST
449	Bodhi	crypto	BOT
450	bitqy	crypto	BQ
451	Bread	crypto	BRD
452	Breakout-Coin	crypto	BRK
453	Breakout-Stake	crypto	BRX
454	Bata	crypto	BTA
455	Bitcoin	crypto	BTC
456	BitcoinDark	crypto	BTCD
457	Bitcoin-Private	crypto	BTCP
458	Bitcoin-Gold	crypto	BTG
459	Bitmark	crypto	BTM
460	BitShares	crypto	BTS
461	BTSR	crypto	BTSR
462	Bitcore	crypto	BTX
463	Burstcoin	crypto	BURST
464	BuzzCoin	crypto	BUZZ
465	Bytecent	crypto	BYC
466	Bytom	crypto	BYTOM
467	Crypto20	crypto	C20
468	CannabisCoin	crypto	CANN
469	BlockCAT	crypto	CAT
470	CryptoCarbon	crypto	CCRB
471	Blox	crypto	CDT
472	Cofound-it	crypto	CFI
473	ChatCoin	crypto	CHAT
474	Chips	crypto	CHIPS
475	Clams	crypto	CLAM
476	CloakCoin	crypto	CLOAK
477	Compcoin	crypto	CMP
478	CyberMiles	crypto	CMT
479	Cindicator	crypto	CND
480	Cryptonex	crypto	CNX
481	CoinFi	crypto	COFI
482	COSS	crypto	COSS
483	Circuits-Of-Value	crypto	COVAL
484	CreditBIT	crypto	CRBIT
485	CreativeCoin	crypto	CREA
486	Credo	crypto	CREDO
487	Crown	crypto	CRW
488	BitDice	crypto	CSNO
489	Centra	crypto	CTR
490	Cortex	crypto	CTXC
491	CureCoin	crypto	CURE
492	Civic	crypto	CVC
493	Dai	crypto	DAI
494	Darcrus	crypto	DAR
495	Dash	crypto	DASH
496	DATAcoin	crypto	DATA
497	Chronologic	crypto	DAY
498	DeepBrain-Chain	crypto	DBC
499	DubaiCoin	crypto	DBIX
500	Dentacoin	crypto	DCN
501	Decred	crypto	DCR
502	DECENT	crypto	DCT
503	Digital-Developers-Fund	crypto	DDF
504	Dent	crypto	DENT
505	DFSCoin	crypto	DFS
506	DigiByte	crypto	DGB
507	Digitalcoin	crypto	DGC
508	DigixDAO	crypto	DGD
509	Etheroll	crypto	DICE
510	Agrello-Delta	crypto	DLT
511	Diamond	crypto	DMD
512	DMarket	crypto	DMT
513	district0x	crypto	DNT
514	DogeCoin	crypto	DOGE
515	DopeCoin	crypto	DOPE
516	Dragonchain	crypto	DRGN
517	Data	crypto	DTA
518	Databits	crypto	DTB
519	Dynamic	crypto	DYN
520	EarthCoin	crypto	EAC
521	eBoost	crypto	EBST
522	eBTC	crypto	EBTC
523	ECC	crypto	ECC
524	E-coin	crypto	ECN
525	Edgeless	crypto	EDG
526	Eidoo	crypto	EDO
527	Electronic-Gulden	crypto	EFL
528	EverGreenCoin	crypto	EGC
529	EDUCare	crypto	EKT
530	Elastos	crypto	ELA
531	Electrify.Asia	crypto	ELEC
532	aelf	crypto	ELF
533	Elixir	crypto	ELIX
534	Embercoin	crypto	EMB
535	Emercoin	crypto	EMC
536	Einsteinium	crypto	EMC2
537	Enigma	crypto	ENG
538	Enjin-Coin	crypto	ENJ
539	EnergyCoin	crypto	ENRG
540	EOS	crypto	EOS
541	EOT-Token	crypto	EOT
542	EquiTrader	crypto	EQT
543	EuropeCoin	crypto	ERC
544	Ethereum-Classic	crypto	ETC
545	Ethereum	crypto	ETH
546	Ethereum-Dark	crypto	ETHD
547	Ethos	crypto	ETHOS
548	Electroneum	crypto	ETN
549	Metaverse-Entropy	crypto	ETP
550	EncryptoTel	crypto	ETT
551	Devery	crypto	EVE
552	Everex	crypto	EVX
553	ExclusiveCoin	crypto	EXCL
554	Expanse	crypto	EXP
555	Factom	crypto	FCT
556	FoldingCoin	crypto	FLDC
557	FlorinCoin	crypto	FLO
558	FlutterCoin	crypto	FLT
559	FirstCoin	crypto	FRST
560	Feathercoin	crypto	FTC
561	Etherparty	crypto	FUEL
562	FunFair	crypto	FUN
563	Gambit	crypto	GAM
564	GameCredits	crypto	GAME
565	Gas	crypto	GAS
566	Golos Gold	crypto	GBG
567	GoByte	crypto	GBX
568	Byteball	crypto	GBYTE
569	GCRCoin	crypto	GCR
570	GeoCoin	crypto	GEO
571	GoldCoin	crypto	GLD
572	Gnosis-Token	crypto	GNO
573	Golem-Tokens	crypto	GNT
574	Golos	crypto	GOLOS
575	Gridcoin	crypto	GRC
576	Groestlcoin	crypto	GRS
577	Growers-International	crypto	GRWI
578	Game	crypto	GTC
579	Gifto	crypto	GTO
580	Guppy	crypto	GUP
581	Genesis-Vision	crypto	GVT
582	GXShares	crypto	GXS
583	HoboNickels	crypto	HBN
584	HEAT	crypto	HEAT
585	Humaniq	crypto	HMQ
586	High-Performance-Blockchain	crypto	HPB
587	Hshare	crypto	HSR
588	Hush	crypto	HUSH
589	Hive	crypto	HVN
590	HexxCoin	crypto	HXX
591	ICONOMI	crypto	ICN
592	ICON	crypto	ICX
593	Infinitecoin	crypto	IFC
594	investFeed	crypto	IFT
595	Ignis	crypto	IGNIS
596	Incent	crypto	INCNT
597	Indorse-Token	crypto	IND
598	InfChain	crypto	INF
599	Ink	crypto	INK
600	INS-Ecosystem	crypto	INS
601	Insights-Network	crypto	INSTAR
602	Internet-Node-Token	crypto	INT
603	Internxt	crypto	INXT
604	IOCoin	crypto	IOC
605	ION	crypto	ION
606	Internet-of-People	crypto	IOP
607	IOStoken	crypto	IOST
608	IOTA	crypto	IOTA
609	IoTeX	crypto	IOTX
610	Iquant-Chain	crypto	IQT
611	IoT-Chain	crypto	ITC
612	iXcoin	crypto	IXC
613	InsureX	crypto	IXT
614	JET8	crypto	J8T
615	Jibrel-Network	crypto	JNT
616	KuCoin	crypto	KCS
617	KickCoin	crypto	KICK
618	KIN	crypto	KIN
619	Komodo	crypto	KMD
620	Kyber-Network	crypto	KNC
621	KoreCoin	crypto	KORE
622	LBRY-Credits	crypto	LBC
623	Litecoin-Cash	crypto	LCC
624	EthLend	crypto	LEND
625	Leverj	crypto	LEV
626	Legends-Room	crypto	LGD
627	Linda	crypto	LINDA
628	ChainLink	crypto	LINK
629	Lykke	crypto	LKK
630	LoMoCoin	crypto	LMC
631	LOCIcoin	crypto	LOCI
632	Loom-Token	crypto	LOOM
633	Loopring	crypto	LRC
634	Lisk	crypto	LSK
635	Litecoin	crypto	LTC
636	Lunyr	crypto	LUN
637	MaidSafeCoin	crypto	MAID
638	Decentraland	crypto	MANA
639	Maxcoin	crypto	MAX
640	Embers	crypto	MBRS
641	MCAP	crypto	MCAP
642	Monaco	crypto	MCO
643	Moeda-Loyalty-Points	crypto	MDA
644	Megacoin	crypto	MEC
645	MediBlock	crypto	MED
646	Memetic	crypto	MEME
647	Mercury	crypto	MER
648	MergeCoin	crypto	MGC
649	MobileGo	crypto	MGO
650	Minex	crypto	MINEX
651	Mintcoin	crypto	MINT
652	Mithril	crypto	MITH
653	Maker	crypto	MKR
654	Melon	crypto	MLN
655	Minereum	crypto	MNE
656	MinexCoin	crypto	MNX
657	Modum	crypto	MOD
658	MonaCoin	crypto	MONA
659	Miners-Reward-Token	crypto	MRT
660	Mothership	crypto	MSP
661	Monetha	crypto	MTH
662	MedToken	crypto	MTN
663	MonetaryUnit	crypto	MUE
664	Musicoin	crypto	MUSIC
665	MyBit-Token	crypto	MYB
666	Mysterium	crypto	MYST
667	Mazacoin	crypto	MZC
668	Namocoin	crypto	NAMO
669	Nano	crypto	NANO
670	Nebulas-Token	crypto	NAS
671	Nav-Coin	crypto	NAV
672	NuBits	crypto	NBT
673	Nucleus-Vision	crypto	NCASH
674	NeverDie-Coin	crypto	NDC
675	Neblio	crypto	NEBL
676	NEO	crypto	NEO
677	NeosCoin	crypto	NEOS
678	Nimiq	crypto	NET
679	NoLimitCoin	crypto	NLC2
680	Gulden	crypto	NLG
681	Namecoin	crypto	NMC
682	Numeraire	crypto	NMR
683	NobleCoin	crypto	NOBL
684	DNotes	crypto	NOTE
685	Pundi-X-Token	crypto	NPXS
686	NuShares	crypto	NSR
687	Fujinto	crypto	NTO
688	Nuls	crypto	NULS
689	Novacoin	crypto	NVC
690	Nexium	crypto	NXC
691	Nexus	crypto	NXS
692	Nxt	crypto	NXT
693	openANX	crypto	OAX
694	Obits	crypto	OBITS
695	Oceanlab	crypto	OCL
696	Odyssey	crypto	OCN
697	ODEM	crypto	ODEM
698	Obsidian	crypto	ODN
699	OFCOIN	crypto	OF
700	OKCash	crypto	OK
701	OmiseGo	crypto	OMG
702	Omni	crypto	OMNI
703	DeepOnion	crypto	ONION
704	Ontology	crypto	ONT
705	Opus	crypto	OPT
706	Simple-Token	crypto	OST
707	Particl	crypto	PART
708	PascalCoin	crypto	PASC
709	TenX	crypto	PAY
710	Pebbles	crypto	PBL
711	Primalbase-Token	crypto	PBT
712	Payfair	crypto	PFR
713	CryptoPing	crypto	PING
714	Pinkcoin	crypto	PINK
715	PIVX	crypto	PIVX
716	Lampix	crypto	PIX
717	Polybius	crypto	PLBT
718	Pillar	crypto	PLR
719	Pluton	crypto	PLU
720	POA-Network	crypto	POA
721	Poet	crypto	POE
722	Polymath	crypto	POLY
723	PoSW-Coin	crypto	POSW
724	PotCoin	crypto	POT
725	Power-Ledger	crypto	POWR
726	Peercoin	crypto	PPC
727	Populous	crypto	PPT
728	Peerplays	crypto	PPY
729	Paragon-Coin	crypto	PRG
730	Oyster-Pearl	crypto	PRL
731	Propy	crypto	PRO
732	Primas	crypto	PST
733	Pesetacoin	crypto	PTC
734	Patientory	crypto	PTOY
735	Pura	crypto	PURA
736	QASH	crypto	QASH
737	Quantum	crypto	QAU
738	Qlink	crypto	QLC
739	Quark	crypto	QRK
740	Quantum-Resistant-Ledger	crypto	QRL
741	Quantstamp	crypto	QSP
742	Quatloo	crypto	QTL
743	Qtum	crypto	QTUM
744	Qwark	crypto	QWARK
745	Revain	crypto	R
746	Radium	crypto	RADS
747	Condensate	crypto	RAIN
748	Rubies	crypto	RBIES
749	Ripto-Bux	crypto	RBX
750	RubyCoin	crypto	RBY
751	Ripio-Credit-Network	crypto	RCN
752	ReddCoin	crypto	RDD
753	Raiden-Network-Token	crypto	RDN
754	Regalcoin	crypto	REC
755	Redcoin	crypto	RED
756	Augur	crypto	REP
757	Request-Network	crypto	REQ
758	RChain	crypto	RHOC
759	Riecoin	crypto	RIC
760	Rise	crypto	RISE
761	RLC-Token	crypto	RLC
762	RouletteToken	crypto	RLT
763	Red-Pulse	crypto	RPX
764	Recovery-Right-Tokens	crypto	RRT
765	Ruff	crypto	RUFF
766	Rupee	crypto	RUP
767	Rivetz	crypto	RVT
768	SafeExchangeCoin	crypto	SAFEX
769	Salt	crypto	SALT
770	Santiment-Network-Token	crypto	SAN
771	Steem-Dollars	crypto	SBD
772	Super-Bitcoin	crypto	SBTC
773	Siacoin	crypto	SC
774	Seele	crypto	SEELE
775	Sequence	crypto	SEQ
776	SHIFT	crypto	SHIFT
777	SIBCoin	crypto	SIB
778	SIGMAcoin	crypto	SIGMA
779	Signatum	crypto	SIGT
780	Storjcoin-X	crypto	SJCX
781	SkinCoin	crypto	SKIN
782	Skycoin	crypto	SKY
783	SolarCoin	crypto	SLR
784	SaluS	crypto	SLS
785	SmartCash	crypto	SMART
786	SmartMesh	crypto	SMT
787	SunContract	crypto	SNC
788	SingularDTV	crypto	SNGLS
789	SONM	crypto	SNM
790	Synergy	crypto	SNRG
791	Status-Network-Token	crypto	SNT
792	All-Sports	crypto	SOC
793	Phantasma	crypto	SOUL
794	SpankChain	crypto	SPANK
795	SpaceChain	crypto	SPC
796	Sphere	crypto	SPHR
797	SpreadCoin	crypto	SPR
798	Sirin-Labs-Token	crypto	SRN
799	Startcoin	crypto	START
800	Steem	crypto	STEEM
801	STK-Token	crypto	STK
802	Storj	crypto	STORJ
803	Storm	crypto	STORM
804	Storiqa	crypto	STQ
805	Stratis	crypto	STRAT
806	Stox	crypto	STX
807	Substratum	crypto	SUB
808	SwftCoin	crypto	SWFTC
809	Bitswift	crypto	SWIFT
810	Swarm-City	crypto	SWT
811	Syndicate	crypto	SYNX
812	SysCoin	crypto	SYS
813	Taas	crypto	TAAS
814	Lamden	crypto	TAU
815	The-ChampCoin	crypto	TCC
816	True-Flip	crypto	TFL
817	HempCoin	crypto	THC
818	Theta-Token	crypto	THETA
819	Time	crypto	TIME
820	Blocktix	crypto	TIX
821	TokenCard	crypto	TKN
822	Trackr	crypto	TKR
823	Tokes	crypto	TKS
824	Time-New-Bank	crypto	TNB
825	Tierion	crypto	TNT
826	ToaCoin	crypto	TOA
827	OriginTrail	crypto	TRAC
828	Terracoin	crypto	TRC
829	Tracto	crypto	TRCT
830	Triggers	crypto	TRIG
831	Trustcoin	crypto	TRST
832	TrueChain	crypto	TRUE
833	TrustPlus	crypto	TRUST
834	Tronix	crypto	TRX
835	TrueUSD	crypto	TUSD
836	TransferCoin	crypto	TX
837	Ubiq	crypto	UBQ
838	UnikoinGold	crypto	UKG
839	Ulatech	crypto	ULA
840	UnbreakableCoin	crypto	UNB
841	SuperNET	crypto	UNITY
842	Unobtanium	crypto	UNO
843	Unity-Ingot	crypto	UNY
844	UpToken	crypto	UP
845	Uro	crypto	URO
846	Tether	crypto	USDT
847	UTrust	crypto	UTK
848	BLOCKv	crypto	VEE
849	VeChain	crypto	VEN
850	Veritaseum	crypto	VERI
851	Viacoin	crypto	VIA
852	Viberate	crypto	VIB
853	Vibe	crypto	VIBE
854	VIVO	crypto	VIVO
855	Voise	crypto	VOISE
856	Voxels	crypto	VOX
857	VPNCoin	crypto	VPN
858	Vericoin	crypto	VRC
859	Verium	crypto	VRM
860	Veros	crypto	VRS
861	vSlice	crypto	VSL
862	Vertcoin	crypto	VTC
863	vTorrent	crypto	VTR
864	WaBi	crypto	WABI
865	Wanchain	crypto	WAN
866	Waves	crypto	WAVES
867	Wax-Token	crypto	WAX
868	Waves-Community	crypto	WCT
869	WorldCoin	crypto	WDC
870	WavesGo	crypto	WGO
871	Wagerr	crypto	WGR
872	Wings	crypto	WINGS
873	WePower	crypto	WPR
874	Walton	crypto	WTC
875	Giga-Watt-Token	crypto	WTT
876	Asch	crypto	XAS
877	Xaurum	crypto	XAUR
878	Bitcoin-Plus	crypto	XBC
879	XtraBYtes	crypto	XBY
880	Cryptonite	crypto	XCN
881	Counterparty	crypto	XCP
882	DigitalNote	crypto	XDN
883	Elastic	crypto	XEL
884	NEM	crypto	XEM
885	Sphere-Identity	crypto	XID
886	Stellar	crypto	XLM
887	Magi	crypto	XMG
888	Monero	crypto	XMR
889	Metal	crypto	XMT
890	Myriadcoin	crypto	XMY
891	Primecoin	crypto	XPM
892	Rialto	crypto	XRL
893	Ripple	crypto	XRP
894	Spectrecoin	crypto	XSPEC
895	Stealthcoin	crypto	XST
896	Tezos	crypto	XTZ
897	Exchange-Union	crypto	XUC
898	Vcash	crypto	XVC
899	Verge	crypto	XVG
900	WhiteCoin	crypto	XWC
901	ZCoin	crypto	XZC
902	ZrCoin	crypto	XZR
903	Yee	crypto	YEE
904	YOYOW	crypto	YOYOW
905	ZcCoin	crypto	ZCC
906	Zclassic	crypto	ZCL
907	Zebi	crypto	ZCO
908	Zcash	crypto	ZEC
909	ZenCash	crypto	ZEN
910	Zetacoin	crypto	ZET
911	Zilliqa	crypto	ZIL
912	Zilla	crypto	ZLA
913	0x	crypto	ZRX
914	Alphabet Inc.	stock	GOOGL
915	Facebook Inc.	stock	FB
916	Apple Inc.	stock	AAPL
917	Alibaba Group Holding Limited	stock	BABA
918	SPDR S&P 500 ETF	stock	SPY
919	iShares Russell 2000 ETF	stock	IWM
920	Vanguard Real Estate Index Fund ETF Shares	stock	VNQ
921	American Funds The Growth Fund of America Class A	stock	AGTHX
\.


--
-- Data for Name: api_equipmentcomment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_equipmentcomment (id, created_at, content, image, equipment_id, user_id) FROM stdin;
53	2019-11-26 10:06:26+00	Trump's presidency has effected dollar's power in a bad way.		361	142
54	2019-11-26 10:07:41+00	What does negative interest rates mean?		263	450
55	2019-11-19 11:32:22+00	EUR  is gonna skyrocket in the next two days.		263	545
58	2019-12-23 23:25:53.809714+00	russia		336	545
59	2019-12-24 14:46:44.359912+00	The dollar tends to increase recently...		361	557
\.


--
-- Data for Name: api_equipmentcomment_liked_by; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_equipmentcomment_liked_by (id, equipmentcomment_id, user_id) FROM stdin;
1	53	67
2	53	70
3	54	64
4	54	67
5	55	72
\.


--
-- Data for Name: api_event; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_event (id, date, country, "calendarId", category, actual, previous, forecast, "sourceURL", importance, event) FROM stdin;
1	2019-11-05 17:39:50+00	PH	194522	Core Inflation Rate	2.6%	2.7%	2.5%	https://tradingeconomics.com/philippines/core-inflation-rate	1	Core Inflation Rate YoY
3	2019-11-26 06:22:13+00	DE	12947	Bobl Auction	-	-0.580%	-	https://www.investing.com/economic-calendar/german-5-year-bobl-auction-579	1	German 5-Year Bobl Auction
8	2019-11-26 12:09:57+00	CA	34892	Profits	5.4%	5.2%	-	https://www.investing.com/economic-calendar/corporate-profits-394	1	Corporate Profits (QoQ)
10	2019-11-26 12:24:02+00	TR	23995	Utilization	77.2%	76.4%	-	https://www.investing.com/economic-calendar/turkish-capacity-utilization-870	2	Capacity Utilization (Nov)
11	2019-12-24 11:34:52+00	GB	2331	Import Index	0.8%	0.6%	\N	http://indexing.com	2	Sterling Import Price Index (MoM) (Dec)
9	2019-11-26 12:11:11+00	US	32943	Consumer Confidence	-	125.9	127.0	https://www.investing.com/economic-calendar/cb-consumer-confidence-48	3	CB Consumer Confidence (Nov)
6	2019-11-26 12:07:37+00	CH	12034	Employment Level	5.137M	5.109M	\N	https://www.investing.com/economic-calendar/employment-level-98	2	Employment Level (Q3)
2	2019-11-26 05:15:25+00	DE	64839	Import Index	-	0.6%	-0.2%	https://www.investing.com/economic-calendar/german-import-price-index-134	1	German Import Price Index (MoM) (Oct)
4	2019-11-26 06:24:53+00	DE	19473	Business Climate Index	95.0	95.0	94.7	https://www.investing.com/economic-calendar/german-ifo-business-climate-index-132	3	German Ifo Business Climate Index (Nov)
5	2019-11-26 12:06:01+00	JP	34023	Core CPI	0.3%	0.3%	-	https://www.investing.com/economic-calendar/boj-core-cpi-1667	1	BoJ Core CPI (YoY)
7	2019-11-26 12:08:42+00	NZ	93827	Speech	-	-	-	https://www.investing.com/economic-calendar/rba-governor-lowe-speaks-392	2	RBA Governor Lowe Speaks
\.


--
-- Data for Name: api_event_followed_by; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_event_followed_by (id, event_id, user_id) FROM stdin;
27	4	572
28	2	572
29	9	572
31	11	587
32	4	44
44	2	44
45	6	44
55	3	566
57	6	589
60	2	589
61	4	589
62	9	589
63	10	589
64	3	589
65	3	555
66	8	589
67	1	589
68	3	44
69	10	44
70	8	590
72	9	590
73	10	591
74	11	591
75	9	591
\.


--
-- Data for Name: api_following; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_following (id, status, user_followed_id, user_following_id) FROM stdin;
243	1	45	215
244	1	46	535
245	1	46	358
246	1	49	268
247	1	49	202
248	1	49	413
249	1	52	188
250	1	52	85
251	1	52	534
252	1	52	73
253	1	52	351
254	1	53	455
255	1	53	198
256	1	53	271
257	1	53	538
258	1	54	307
259	1	55	341
260	1	55	470
261	1	55	482
262	1	55	265
263	1	55	184
264	1	56	136
265	1	56	398
266	1	56	416
267	1	56	329
268	1	57	438
269	1	57	139
270	1	57	195
271	1	57	348
272	1	57	394
273	1	58	283
274	1	58	365
275	1	61	208
276	1	61	78
277	1	66	95
278	1	66	256
279	1	66	392
280	1	68	165
281	1	69	488
282	1	69	69
283	1	69	511
284	1	70	157
285	1	70	90
286	1	70	229
287	1	70	524
288	1	70	319
289	1	73	96
290	1	75	138
291	1	75	388
292	1	76	543
293	1	77	368
294	1	77	98
295	1	77	285
296	1	78	438
297	1	80	138
298	1	80	214
299	1	80	314
300	1	80	520
301	1	80	501
302	1	81	289
303	1	81	211
304	1	81	154
305	1	84	154
306	1	84	391
307	1	84	256
308	1	84	498
309	1	85	342
310	1	85	407
311	1	87	235
312	1	90	239
313	1	90	542
314	1	90	428
315	1	90	407
316	1	90	178
317	1	91	126
318	1	91	46
319	1	91	478
320	1	93	145
321	1	95	282
322	1	95	537
323	1	98	76
324	1	99	541
325	1	99	365
326	1	99	512
327	1	103	501
328	1	103	135
329	1	104	434
330	1	104	329
331	1	107	136
332	1	107	522
333	1	107	332
334	1	108	98
335	1	108	361
336	1	108	338
337	1	108	478
338	1	109	266
339	1	109	355
340	1	109	198
341	1	109	354
342	1	111	178
343	1	112	280
344	1	112	249
345	1	117	421
346	1	117	488
347	1	118	308
348	1	118	356
349	1	120	442
350	1	122	520
351	1	123	310
352	1	124	124
353	1	124	481
354	1	125	58
355	1	125	158
356	1	125	284
357	1	128	432
358	1	133	250
359	1	133	151
360	1	136	494
361	1	136	482
362	1	136	156
363	1	141	139
364	1	142	171
365	1	142	85
366	1	142	541
367	1	142	286
368	1	142	357
369	1	147	133
370	1	150	91
371	1	150	280
372	1	152	446
373	1	152	290
374	1	152	214
375	1	152	493
376	1	153	327
377	1	153	453
378	1	153	114
379	1	153	259
380	1	153	510
381	1	157	327
382	1	157	178
383	1	157	227
384	1	159	438
385	1	164	171
386	1	164	443
387	1	164	322
388	1	164	111
389	1	169	88
390	1	169	470
391	1	169	429
392	1	169	309
393	1	169	197
394	1	170	259
395	1	170	256
396	1	170	295
397	1	170	88
398	1	170	493
399	1	174	380
400	1	174	53
401	1	174	97
402	1	175	256
403	1	175	416
404	1	175	183
405	1	175	317
406	1	176	497
407	1	176	246
408	1	176	190
409	1	176	405
410	1	180	477
411	1	180	149
412	1	181	227
413	1	181	404
414	1	181	379
415	1	183	229
416	1	183	196
417	1	183	456
418	1	183	450
419	1	183	189
420	1	185	243
421	1	185	446
422	1	185	472
423	1	185	139
424	1	186	334
425	1	186	381
426	1	194	294
427	1	194	244
428	1	194	252
429	1	194	159
430	1	195	525
431	1	195	376
432	1	195	98
433	1	195	204
434	1	196	544
435	1	196	306
436	1	196	229
437	1	196	194
438	1	196	257
439	1	200	477
440	1	200	67
441	1	204	273
442	1	204	320
443	1	204	152
444	1	206	315
445	1	207	168
446	1	208	288
447	1	208	538
448	1	210	239
449	1	212	179
450	1	212	273
451	1	212	544
452	1	213	452
453	1	213	279
454	1	213	59
455	1	213	213
456	1	215	168
457	1	220	376
458	1	220	151
459	1	221	192
460	1	221	304
461	1	221	297
462	1	221	47
463	1	226	507
464	1	226	154
465	1	226	184
466	1	228	491
467	1	228	413
468	1	228	476
469	1	230	369
470	1	231	122
471	1	231	396
472	1	233	462
473	1	233	403
474	1	233	534
475	1	234	536
476	1	234	474
477	1	234	186
478	1	234	213
479	1	234	412
480	1	235	457
481	1	235	193
482	1	237	276
483	1	237	331
484	1	240	148
485	1	240	443
486	1	240	513
487	1	240	228
488	1	240	254
489	1	242	384
490	1	242	526
491	1	242	81
492	1	243	93
493	1	253	332
494	1	253	418
495	1	253	190
496	1	253	520
497	1	253	160
498	1	254	430
499	1	258	270
500	1	258	451
501	1	258	89
502	1	259	446
503	1	259	270
504	1	259	253
505	1	259	515
506	1	259	89
507	1	260	324
508	1	260	503
509	1	261	154
510	1	261	344
511	1	261	508
512	1	262	284
513	1	266	441
514	1	266	178
515	1	278	400
516	1	278	363
517	1	279	286
518	1	279	518
519	1	279	68
520	1	281	141
521	1	281	117
522	1	282	291
523	1	282	256
524	1	282	482
525	1	282	382
526	1	282	192
527	1	283	379
528	1	283	390
529	1	284	531
530	1	284	438
531	1	285	125
532	1	285	503
533	1	285	529
534	1	287	267
535	1	287	220
536	1	287	250
537	1	287	221
538	1	287	161
539	1	288	236
540	1	289	345
541	1	289	131
542	1	289	71
543	1	289	195
544	1	289	166
545	1	290	514
546	1	290	535
547	1	290	280
548	1	294	432
549	1	294	282
550	1	294	272
551	1	295	297
552	1	297	131
553	1	297	181
554	1	298	274
555	1	298	245
556	1	300	406
557	1	300	305
558	1	300	312
559	1	300	427
560	1	300	271
561	1	303	509
562	1	303	114
563	1	303	369
564	1	303	300
565	1	305	246
566	1	305	258
567	1	306	233
568	1	306	350
569	1	308	465
570	1	308	248
571	1	308	148
572	1	308	344
573	1	308	434
574	1	312	517
575	1	312	260
576	1	312	403
577	1	313	203
578	1	313	507
579	1	313	467
580	1	313	472
581	1	313	200
582	1	316	368
583	1	316	214
584	1	317	303
585	1	317	370
586	1	317	438
587	1	317	381
588	1	318	258
589	1	318	122
590	1	319	534
591	1	319	160
592	1	319	379
593	1	320	137
594	1	320	56
595	1	320	354
596	1	321	489
597	1	321	130
598	1	321	197
599	1	321	418
600	1	322	390
601	1	322	538
602	1	322	46
603	1	322	507
604	1	322	282
605	1	324	180
606	1	324	488
607	1	324	435
608	1	324	436
609	1	325	516
610	1	325	400
611	1	325	157
612	1	325	198
613	1	325	278
614	1	327	334
615	1	329	420
616	1	329	301
617	1	329	202
618	1	329	382
619	1	329	398
620	1	330	457
621	1	330	493
622	1	330	431
623	1	330	188
624	1	336	260
625	1	336	86
626	1	336	442
627	1	337	254
628	1	337	310
629	1	337	276
630	1	337	95
631	1	338	248
632	1	338	149
633	1	338	240
634	1	338	158
635	1	341	427
636	1	341	337
637	1	341	274
638	1	341	459
639	1	343	138
640	1	343	164
641	1	344	417
642	1	344	211
643	1	344	413
644	1	345	271
645	1	345	111
646	1	345	190
647	1	346	241
648	1	346	374
649	1	346	531
650	1	346	286
651	1	346	177
652	1	348	457
653	1	348	301
654	1	348	462
655	1	348	412
656	1	350	261
657	1	350	483
658	1	352	159
659	1	352	231
660	1	352	80
661	1	352	156
662	1	356	326
663	1	356	413
664	1	356	507
665	1	362	292
666	1	362	252
667	1	362	77
668	1	362	333
669	1	362	314
670	1	365	212
671	1	365	67
672	1	365	226
673	1	366	379
674	1	366	81
675	1	366	419
676	1	366	364
677	1	369	300
678	1	369	465
679	1	369	146
680	1	382	428
681	1	382	295
682	1	382	364
683	1	385	319
684	1	385	525
685	1	385	317
686	1	385	471
687	1	389	132
688	1	389	479
689	1	391	153
690	1	391	426
691	1	393	260
692	1	393	141
693	1	393	176
694	1	393	287
695	1	394	270
696	1	394	204
697	1	394	189
698	1	394	183
699	1	396	230
700	1	396	472
701	1	396	369
702	1	398	131
703	1	398	127
704	1	398	463
705	1	398	95
706	1	404	194
707	1	404	334
708	1	407	155
709	1	409	135
710	1	412	100
711	1	412	493
712	1	413	483
713	1	420	317
714	1	422	236
715	1	422	408
716	1	422	133
717	1	424	202
718	1	424	271
719	1	427	452
720	1	427	290
721	1	427	139
722	1	428	465
723	1	428	298
724	1	431	468
725	1	431	448
726	1	432	240
727	1	433	258
728	1	433	295
729	1	435	290
730	1	435	130
731	1	435	333
732	1	435	314
733	1	435	440
734	1	436	398
735	1	436	318
736	1	436	67
737	1	437	165
738	1	437	49
739	1	440	482
740	1	440	403
741	1	440	197
742	1	440	299
743	1	440	242
744	1	441	128
745	1	451	137
746	1	451	534
747	1	452	263
748	1	452	364
749	1	452	404
750	1	452	542
751	1	452	340
752	1	457	452
753	1	457	71
754	1	457	400
755	1	457	230
756	1	457	162
757	1	458	432
758	1	458	58
759	1	462	452
760	1	462	146
761	1	463	267
762	1	463	266
763	1	463	133
764	1	463	172
765	1	463	286
766	1	466	270
767	1	466	498
768	1	466	514
769	1	467	106
770	1	467	543
771	1	467	186
772	1	468	306
773	1	468	127
774	1	473	543
775	1	473	422
776	1	474	444
777	1	474	48
778	1	474	368
779	1	474	542
780	1	474	538
781	1	475	212
782	1	475	306
783	1	475	399
784	1	475	485
785	1	478	539
786	1	478	356
787	1	478	45
788	1	479	154
789	1	479	197
790	1	479	534
791	1	479	117
792	1	480	497
793	1	480	284
794	1	480	76
795	1	480	210
796	1	480	137
797	1	481	241
798	1	481	224
799	1	481	513
800	1	481	123
801	1	482	106
802	1	482	80
803	1	482	539
804	1	482	335
805	1	483	246
806	1	483	216
807	1	483	159
808	1	483	475
809	1	486	245
810	1	486	544
811	1	486	211
812	1	486	386
813	1	486	153
814	1	487	520
815	1	491	367
816	1	491	165
817	1	498	287
818	1	498	74
819	1	498	111
820	1	499	476
821	1	499	314
822	1	499	226
823	1	499	207
824	1	501	143
825	1	501	446
826	1	501	182
827	1	502	524
828	1	502	224
829	1	504	265
830	1	504	492
831	1	507	442
832	1	507	270
833	1	508	54
834	1	509	388
835	1	509	58
836	1	509	363
837	1	509	423
838	1	510	422
839	1	513	365
840	1	513	82
841	1	513	68
842	1	513	98
843	1	513	318
844	1	514	455
845	1	514	513
846	1	514	66
847	1	515	84
848	1	515	344
849	1	515	243
850	1	516	313
851	1	516	71
852	1	518	203
853	1	518	108
854	1	518	151
855	1	519	237
856	1	519	180
857	1	519	441
858	1	523	447
859	1	523	328
860	1	523	227
861	1	523	426
862	1	523	334
863	1	524	407
864	1	524	514
865	1	526	67
866	1	526	386
867	1	526	444
868	1	530	206
869	1	530	447
870	1	530	422
871	1	530	441
872	1	532	535
873	1	532	416
874	1	537	182
875	1	539	460
876	1	539	338
877	1	540	412
878	1	540	489
879	1	540	98
880	1	541	466
881	1	541	232
882	1	541	239
883	1	541	77
884	1	541	104
885	1	543	482
886	1	545	191
887	1	545	63
888	1	545	294
889	1	545	126
890	1	545	89
891	1	545	211
892	1	545	492
893	1	545	413
894	1	545	437
895	1	545	291
896	1	545	392
897	1	545	411
898	1	545	362
899	1	545	481
900	1	545	48
901	1	545	387
902	1	545	160
903	1	545	534
904	1	545	87
905	1	545	415
906	1	545	269
907	1	545	254
908	1	545	337
909	1	545	360
910	1	545	75
911	1	545	286
912	1	545	524
913	1	545	204
914	1	545	454
915	1	545	247
916	1	545	470
917	1	545	159
918	1	545	262
919	1	545	161
920	1	545	199
921	1	545	257
922	1	545	69
923	1	545	210
924	1	545	49
925	1	545	504
926	1	545	448
927	1	545	445
928	1	545	460
929	1	545	220
930	1	545	357
931	1	545	309
932	1	545	85
933	1	545	164
934	1	545	276
935	1	545	236
936	1	545	183
937	1	545	298
938	1	545	510
939	1	545	47
940	1	545	127
941	1	545	334
942	1	545	129
943	1	545	188
944	1	545	483
945	1	545	461
946	1	545	517
947	1	545	143
948	1	545	138
949	1	545	342
950	1	545	489
951	1	545	544
952	1	545	122
953	1	545	90
954	1	545	466
955	1	545	297
956	1	545	542
957	1	545	200
958	1	545	280
959	1	545	232
960	1	545	136
961	1	545	100
962	1	545	112
963	1	545	251
964	1	545	383
965	1	545	212
966	1	545	267
967	1	545	354
968	1	545	253
969	1	545	507
970	1	545	463
971	1	545	399
972	1	545	509
973	1	545	169
974	1	545	154
975	1	545	326
976	1	545	198
977	1	545	307
978	1	545	467
979	1	50	545
980	1	49	545
985	1	545	551
986	1	50	550
987	1	46	556
988	1	551	550
990	1	551	557
991	1	50	556
992	1	78	557
993	1	547	557
994	1	545	557
997	1	46	561
998	1	555	561
999	1	551	546
1002	1	536	545
1004	1	557	545
1005	1	551	545
1006	1	62	545
1007	1	551	563
1008	1	551	566
1009	1	569	566
1010	1	551	569
1012	1	556	546
1013	1	566	44
1014	1	44	550
1015	1	46	550
1016	1	569	557
1017	1	551	572
1018	1	555	573
1022	1	555	545
1021	1	555	44
1024	1	551	555
1327	1	587	120
1328	1	587	132
1329	1	587	137
1330	1	587	381
1331	1	587	503
1332	1	587	155
1333	1	587	220
1334	1	587	319
1335	1	587	136
1336	1	587	135
1337	1	587	246
1338	1	587	366
1339	1	587	438
1340	1	587	169
1341	1	587	87
1342	1	587	433
1343	1	587	216
1344	1	587	165
1345	1	587	92
1346	1	587	161
1347	1	587	555
1348	1	587	394
1349	1	587	301
1350	1	587	262
1351	1	587	127
1352	1	587	239
1353	1	587	561
1354	1	587	106
1355	1	587	386
1356	1	587	134
1357	1	587	111
1358	1	587	95
1359	1	587	48
1360	1	587	219
1361	1	587	487
1362	1	587	474
1363	1	587	66
1364	1	587	322
1365	1	587	458
1366	1	587	432
1367	1	587	543
1368	1	587	539
1369	1	587	510
1370	1	587	569
1371	1	587	245
1372	1	587	520
1373	1	587	364
1374	1	587	575
1375	1	587	80
1376	1	587	508
1377	1	587	153
1378	1	587	152
1379	1	587	47
1380	1	587	224
1381	1	587	556
1382	1	587	113
1383	1	587	73
1384	1	587	352
1385	1	587	148
1386	1	587	273
1387	1	587	286
1388	1	587	314
1389	1	587	141
1390	1	587	379
1391	1	587	103
1392	1	587	332
1393	1	587	276
1394	1	587	142
1395	1	587	259
1396	1	587	328
1397	1	587	126
1398	1	587	97
1399	1	587	160
1400	1	587	168
1401	1	587	337
1402	1	587	254
1403	1	587	586
1404	1	546	589
1405	1	545	589
1406	1	551	589
1416	1	557	589
1417	1	590	591
1418	1	545	592
\.


--
-- Data for Name: api_like; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_like (id, article_id, user_id) FROM stdin;
235	94	362
236	94	98
237	94	172
238	94	259
239	94	418
240	94	57
241	94	277
242	94	539
243	94	328
244	94	393
245	94	265
246	94	105
247	94	462
248	94	532
249	94	95
250	94	466
251	94	67
252	94	319
253	94	409
254	94	455
255	94	286
256	94	192
257	94	294
258	94	299
259	94	329
260	94	100
261	94	264
262	94	137
263	94	447
264	94	284
265	94	543
266	94	348
267	95	289
268	95	345
269	95	86
270	95	57
271	95	141
272	95	544
273	95	151
274	95	370
275	95	65
276	95	322
277	95	357
278	95	135
279	95	119
280	95	269
281	95	368
282	95	497
283	95	460
284	95	387
285	95	324
286	95	249
287	95	298
288	95	211
289	95	413
290	95	537
291	95	223
292	95	190
293	95	158
294	95	367
295	95	278
296	96	432
297	96	119
298	96	421
299	96	447
300	96	219
301	96	303
302	96	173
303	96	530
304	96	305
305	96	154
306	96	144
307	96	396
308	96	404
309	96	532
310	96	113
311	96	104
312	96	401
313	96	270
314	96	81
315	96	436
316	96	419
317	96	328
318	96	493
319	96	148
320	96	409
321	96	167
322	96	225
323	96	237
324	96	304
325	98	185
326	98	399
327	98	56
328	98	355
329	98	490
330	98	384
331	98	250
332	98	314
333	98	346
334	98	341
335	98	433
336	98	186
337	98	85
338	98	486
339	98	203
340	98	96
341	98	462
342	98	263
343	98	187
344	98	505
345	98	227
346	99	543
347	99	186
348	99	73
349	99	214
350	99	115
351	99	392
352	99	388
353	99	183
354	99	541
355	99	285
356	99	383
357	99	156
358	99	81
359	99	361
360	99	353
361	99	468
362	99	376
363	99	207
364	99	137
365	99	161
366	99	484
367	99	244
368	99	260
369	99	225
370	99	447
371	99	311
372	99	355
373	99	116
374	100	297
375	100	439
376	100	47
377	100	330
378	100	141
379	100	173
380	100	310
381	100	161
382	100	45
383	100	183
384	100	468
385	100	321
386	100	286
387	100	409
388	100	281
389	100	280
390	100	531
391	100	441
392	100	172
393	100	293
394	100	200
395	100	74
396	100	350
397	100	46
398	100	137
399	100	113
400	100	452
401	100	301
402	100	289
403	100	313
404	100	532
405	100	343
406	100	226
407	100	201
408	100	82
409	100	466
410	100	317
411	100	151
412	100	348
413	100	250
414	100	199
415	100	421
416	100	111
417	100	185
418	100	458
419	100	415
420	100	386
421	100	176
422	100	423
423	100	530
424	100	61
425	100	519
426	100	287
427	100	73
428	100	428
429	100	224
430	100	76
431	100	347
432	100	127
433	100	544
434	100	528
435	100	403
436	100	121
437	100	148
438	100	411
439	100	307
440	100	292
441	100	522
442	100	399
443	100	489
444	100	402
445	100	455
446	100	59
447	100	178
448	100	62
449	100	254
450	100	506
451	100	369
452	100	304
453	100	107
454	100	165
455	100	444
456	100	363
457	100	279
458	100	302
459	100	355
460	100	493
461	100	60
462	100	210
463	100	316
464	100	167
465	100	374
466	100	524
467	100	448
468	100	440
469	100	112
470	100	171
471	100	102
472	100	258
473	100	75
474	100	305
475	100	408
476	100	181
477	100	536
478	100	540
479	100	244
480	100	276
481	100	179
482	100	49
483	100	229
484	100	159
485	100	535
486	100	64
487	100	396
488	100	79
489	100	180
490	100	434
491	100	335
492	100	450
493	100	157
494	100	322
495	100	326
496	100	482
497	100	274
498	100	87
499	100	223
500	100	469
501	100	265
502	100	211
503	100	203
504	100	443
505	100	284
506	100	267
507	100	138
508	100	462
509	100	435
510	100	339
511	100	182
512	100	191
513	100	389
514	100	340
515	100	336
516	100	58
517	100	471
518	100	53
519	100	116
520	100	271
521	100	216
522	100	525
523	100	327
524	100	278
525	100	537
526	100	162
527	100	465
528	100	273
529	100	67
530	100	420
531	100	527
532	100	306
533	100	204
534	100	453
535	100	232
536	100	368
537	100	215
538	100	345
539	100	66
540	100	390
541	100	168
542	100	495
543	100	461
544	100	405
545	100	213
546	100	249
547	100	410
548	100	393
549	100	51
550	100	496
551	100	534
552	100	246
553	100	513
554	100	504
555	100	93
556	100	319
557	100	523
558	100	83
559	100	160
560	100	86
561	100	52
563	99	550
565	103	545
569	103	546
572	99	44
573	99	546
574	103	44
578	103	550
581	126	106
582	126	114
583	126	572
584	126	211
585	126	288
586	126	116
587	126	571
588	126	477
589	126	180
590	126	345
591	126	140
592	126	283
593	126	549
594	126	327
595	126	63
596	126	547
597	126	230
598	126	287
599	126	224
600	127	45
602	133	591
\.


--
-- Data for Name: api_manualinvestment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_manualinvestment (id, date, base_amount, target_amount, base_equipment_id, user_id, target_equipment_id) FROM stdin;
9	2019-12-31	1000.000	70.000	355	550	361
10	2019-12-23	100.000	596.000	361	572	355
11	2019-01-01	1000.000	200.000	355	555	361
\.


--
-- Data for Name: api_mobileapp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_mobileapp (id, version, apk_file, updated_at) FROM stdin;
1	list_equipment_add_comment	app-debug_oiBIxzc.apk	2019-11-11 20:53:02.780166+00
\.


--
-- Data for Name: api_notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_notification (id, message, reference_obj, reference_url, user_id, seen) FROM stdin;
450	There are news and updates about the event you have followed.	Event	/events/10/	589	f
451	There are news and updates about the event you have followed.	Event	/events/10/	44	f
452	There are news and updates about the event you have followed.	Event	/events/10/	591	f
453	There are news and updates about the event you have followed.	Event	/events/11/	587	f
454	There are news and updates about the event you have followed.	Event	/events/11/	591	f
202	There are news and updates about the event you have followed.	Event	/events/4/	572	f
206	There are news and updates about the event you have followed.	Event	/events/4/	572	f
201	There are news and updates about the event you have followed.	Event	/events/10/	572	t
205	There are news and updates about the event you have followed.	Event	/events/10/	572	t
203	There are news and updates about the event you have followed.	Event	/events/4/	545	t
204	There are news and updates about the event you have followed.	Event	/events/4/	545	t
207	There are news and updates about the event you have followed.	Event	/events/4/	545	t
212	There are news and updates about the event you have followed.	Event	/events/11/	587	f
211	There are news and updates about the event you have followed.	Event	/events/10/	44	t
214	There are news and updates about the event you have followed.	Event	/events/4/	572	f
213	There are news and updates about the event you have followed.	Event	/events/4/	44	t
217	There are news and updates about the event you have followed.	Event	/events/11/	587	f
222	Vin Lrcrtp has written an article.	Article	https://api.traiders.tk/articles/97/	589	t
215	There are news and updates about the event you have followed.	Event	/events/4/	545	t
219	There are news and updates about the event you have followed.	Event	/events/4/	572	f
220	There are news and updates about the event you have followed.	Event	https://api.traiders.tk/events/4/	589	t
230	There are news and updates about the event you have followed.	Event	/events/10/	566	t
241	There are news and updates about the event you have followed.	Event	/events/6/	589	t
226	Aron Dacemoğlu has written an article.	Article	https://api.traiders.tk/articles/103/	589	t
218	There are news and updates about the event you have followed.	Event	/events/4/	44	t
242	Aron Dacemoğlu has shared an article.	Article	https://api.traiders.tk/articles/100/	545	t
243	There are news and updates about the event you have followed.	Event	/events/4/	44	f
244	There are news and updates about the event you have followed.	Event	/events/4/	572	f
216	There are news and updates about the event you have followed.	Event	/events/11/	44	t
225	There are news and updates about the event you have followed.	Event	https://api.traiders.tk/events/6/	44	f
245	There are news and updates about the event you have followed.	Event	/events/4/	589	t
247	There are news and updates about the event you have followed.	Event	/events/1/	589	t
246	There are news and updates about the event you have followed.	Event	/events/10/	589	t
248	There are news and updates about the event you have followed.	Event	/events/11/	587	f
250	There are news and updates about the event you have followed.	Event	/events/10/	44	f
251	Furkan Duymaz has written an article.	Article	/articles/133/	191	f
229	There are news and updates about the event you have followed.	Event	/events/4/	566	t
227	There are news and updates about the event you have followed.	Event	/events/4/	44	f
228	There are news and updates about the event you have followed.	Event	/events/4/	572	f
231	There are news and updates about the event you have followed.	Event	/events/6/	44	f
233	There are news and updates about the event you have followed.	Event	/events/6/	44	f
234	There are news and updates about the event you have followed.	Event	/events/4/	44	f
235	There are news and updates about the event you have followed.	Event	/events/4/	572	f
236	There are news and updates about the event you have followed.	Event	/events/10/	566	f
237	There are news and updates about the event you have followed.	Event	/events/6/	44	f
239	There are news and updates about the event you have followed.	Event	/events/6/	44	f
240	There are news and updates about the event you have followed.	Event	/events/6/	44	f
238	There are news and updates about the event you have followed.	Event	/events/6/	589	t
223	Alperen Duymaz has written an article.	Article	https://api.traiders.tk/articles/100/	589	t
224	There are news and updates about the event you have followed.	Event	https://api.traiders.tk/events/2/	589	t
252	Furkan Duymaz has written an article.	Article	/articles/133/	63	f
253	Furkan Duymaz has written an article.	Article	/articles/133/	294	f
254	Furkan Duymaz has written an article.	Article	/articles/133/	126	f
255	Furkan Duymaz has written an article.	Article	/articles/133/	89	f
256	Furkan Duymaz has written an article.	Article	/articles/133/	211	f
257	Furkan Duymaz has written an article.	Article	/articles/133/	492	f
258	Furkan Duymaz has written an article.	Article	/articles/133/	413	f
259	Furkan Duymaz has written an article.	Article	/articles/133/	437	f
260	Furkan Duymaz has written an article.	Article	/articles/133/	291	f
261	Furkan Duymaz has written an article.	Article	/articles/133/	392	f
262	Furkan Duymaz has written an article.	Article	/articles/133/	411	f
263	Furkan Duymaz has written an article.	Article	/articles/133/	362	f
264	Furkan Duymaz has written an article.	Article	/articles/133/	481	f
265	Furkan Duymaz has written an article.	Article	/articles/133/	48	f
266	Furkan Duymaz has written an article.	Article	/articles/133/	387	f
267	Furkan Duymaz has written an article.	Article	/articles/133/	160	f
268	Furkan Duymaz has written an article.	Article	/articles/133/	534	f
269	Furkan Duymaz has written an article.	Article	/articles/133/	87	f
270	Furkan Duymaz has written an article.	Article	/articles/133/	415	f
271	Furkan Duymaz has written an article.	Article	/articles/133/	269	f
272	Furkan Duymaz has written an article.	Article	/articles/133/	254	f
232	There are news and updates about the event you have followed.	Event	/events/6/	566	t
249	There are news and updates about the event you have followed.	Event	/events/10/	589	t
273	Furkan Duymaz has written an article.	Article	/articles/133/	337	f
274	Furkan Duymaz has written an article.	Article	/articles/133/	360	f
275	Furkan Duymaz has written an article.	Article	/articles/133/	75	f
276	Furkan Duymaz has written an article.	Article	/articles/133/	286	f
277	Furkan Duymaz has written an article.	Article	/articles/133/	524	f
278	Furkan Duymaz has written an article.	Article	/articles/133/	204	f
279	Furkan Duymaz has written an article.	Article	/articles/133/	454	f
280	Furkan Duymaz has written an article.	Article	/articles/133/	247	f
281	Furkan Duymaz has written an article.	Article	/articles/133/	470	f
282	Furkan Duymaz has written an article.	Article	/articles/133/	159	f
283	Furkan Duymaz has written an article.	Article	/articles/133/	262	f
284	Furkan Duymaz has written an article.	Article	/articles/133/	161	f
285	Furkan Duymaz has written an article.	Article	/articles/133/	199	f
286	Furkan Duymaz has written an article.	Article	/articles/133/	257	f
287	Furkan Duymaz has written an article.	Article	/articles/133/	69	f
288	Furkan Duymaz has written an article.	Article	/articles/133/	210	f
289	Furkan Duymaz has written an article.	Article	/articles/133/	49	f
290	Furkan Duymaz has written an article.	Article	/articles/133/	504	f
291	Furkan Duymaz has written an article.	Article	/articles/133/	448	f
292	Furkan Duymaz has written an article.	Article	/articles/133/	445	f
293	Furkan Duymaz has written an article.	Article	/articles/133/	460	f
294	Furkan Duymaz has written an article.	Article	/articles/133/	220	f
295	Furkan Duymaz has written an article.	Article	/articles/133/	357	f
296	Furkan Duymaz has written an article.	Article	/articles/133/	309	f
297	Furkan Duymaz has written an article.	Article	/articles/133/	85	f
298	Furkan Duymaz has written an article.	Article	/articles/133/	164	f
299	Furkan Duymaz has written an article.	Article	/articles/133/	276	f
300	Furkan Duymaz has written an article.	Article	/articles/133/	236	f
301	Furkan Duymaz has written an article.	Article	/articles/133/	183	f
302	Furkan Duymaz has written an article.	Article	/articles/133/	298	f
303	Furkan Duymaz has written an article.	Article	/articles/133/	510	f
304	Furkan Duymaz has written an article.	Article	/articles/133/	47	f
305	Furkan Duymaz has written an article.	Article	/articles/133/	127	f
306	Furkan Duymaz has written an article.	Article	/articles/133/	334	f
307	Furkan Duymaz has written an article.	Article	/articles/133/	129	f
308	Furkan Duymaz has written an article.	Article	/articles/133/	188	f
309	Furkan Duymaz has written an article.	Article	/articles/133/	483	f
310	Furkan Duymaz has written an article.	Article	/articles/133/	461	f
311	Furkan Duymaz has written an article.	Article	/articles/133/	517	f
312	Furkan Duymaz has written an article.	Article	/articles/133/	143	f
313	Furkan Duymaz has written an article.	Article	/articles/133/	138	f
314	Furkan Duymaz has written an article.	Article	/articles/133/	342	f
315	Furkan Duymaz has written an article.	Article	/articles/133/	489	f
316	Furkan Duymaz has written an article.	Article	/articles/133/	544	f
317	Furkan Duymaz has written an article.	Article	/articles/133/	122	f
318	Furkan Duymaz has written an article.	Article	/articles/133/	90	f
319	Furkan Duymaz has written an article.	Article	/articles/133/	466	f
320	Furkan Duymaz has written an article.	Article	/articles/133/	297	f
321	Furkan Duymaz has written an article.	Article	/articles/133/	542	f
322	Furkan Duymaz has written an article.	Article	/articles/133/	200	f
323	Furkan Duymaz has written an article.	Article	/articles/133/	280	f
324	Furkan Duymaz has written an article.	Article	/articles/133/	232	f
325	Furkan Duymaz has written an article.	Article	/articles/133/	136	f
326	Furkan Duymaz has written an article.	Article	/articles/133/	100	f
327	Furkan Duymaz has written an article.	Article	/articles/133/	112	f
328	Furkan Duymaz has written an article.	Article	/articles/133/	251	f
329	Furkan Duymaz has written an article.	Article	/articles/133/	383	f
330	Furkan Duymaz has written an article.	Article	/articles/133/	212	f
331	Furkan Duymaz has written an article.	Article	/articles/133/	267	f
332	Furkan Duymaz has written an article.	Article	/articles/133/	354	f
333	Furkan Duymaz has written an article.	Article	/articles/133/	253	f
334	Furkan Duymaz has written an article.	Article	/articles/133/	507	f
335	Furkan Duymaz has written an article.	Article	/articles/133/	463	f
336	Furkan Duymaz has written an article.	Article	/articles/133/	399	f
337	Furkan Duymaz has written an article.	Article	/articles/133/	509	f
338	Furkan Duymaz has written an article.	Article	/articles/133/	169	f
339	Furkan Duymaz has written an article.	Article	/articles/133/	154	f
340	Furkan Duymaz has written an article.	Article	/articles/133/	326	f
341	Furkan Duymaz has written an article.	Article	/articles/133/	198	f
342	Furkan Duymaz has written an article.	Article	/articles/133/	307	f
343	Furkan Duymaz has written an article.	Article	/articles/133/	467	f
344	Furkan Duymaz has written an article.	Article	/articles/133/	551	f
345	Furkan Duymaz has written an article.	Article	/articles/133/	557	t
348	There are news and updates about the event you have followed.	Event	http://traiders.tk/event	590	t
346	Furkan Duymaz has written an article.	Article	/articles/133/	589	t
347	There are news and updates about the event you have followed.	Event	/events/8/	589	t
349	Alperen Duymaz has written an article.	Article	/articles/133/	191	f
350	Alperen Duymaz has written an article.	Article	/articles/133/	63	f
351	Alperen Duymaz has written an article.	Article	/articles/133/	294	f
352	Alperen Duymaz has written an article.	Article	/articles/133/	126	f
353	Alperen Duymaz has written an article.	Article	/articles/133/	89	f
354	Alperen Duymaz has written an article.	Article	/articles/133/	211	f
355	Alperen Duymaz has written an article.	Article	/articles/133/	492	f
356	Alperen Duymaz has written an article.	Article	/articles/133/	413	f
357	Alperen Duymaz has written an article.	Article	/articles/133/	437	f
358	Alperen Duymaz has written an article.	Article	/articles/133/	291	f
359	Alperen Duymaz has written an article.	Article	/articles/133/	392	f
360	Alperen Duymaz has written an article.	Article	/articles/133/	411	f
361	Alperen Duymaz has written an article.	Article	/articles/133/	362	f
362	Alperen Duymaz has written an article.	Article	/articles/133/	481	f
363	Alperen Duymaz has written an article.	Article	/articles/133/	48	f
364	Alperen Duymaz has written an article.	Article	/articles/133/	387	f
365	Alperen Duymaz has written an article.	Article	/articles/133/	160	f
366	Alperen Duymaz has written an article.	Article	/articles/133/	534	f
367	Alperen Duymaz has written an article.	Article	/articles/133/	87	f
368	Alperen Duymaz has written an article.	Article	/articles/133/	415	f
369	Alperen Duymaz has written an article.	Article	/articles/133/	269	f
370	Alperen Duymaz has written an article.	Article	/articles/133/	254	f
371	Alperen Duymaz has written an article.	Article	/articles/133/	337	f
372	Alperen Duymaz has written an article.	Article	/articles/133/	360	f
373	Alperen Duymaz has written an article.	Article	/articles/133/	75	f
374	Alperen Duymaz has written an article.	Article	/articles/133/	286	f
375	Alperen Duymaz has written an article.	Article	/articles/133/	524	f
376	Alperen Duymaz has written an article.	Article	/articles/133/	204	f
377	Alperen Duymaz has written an article.	Article	/articles/133/	454	f
378	Alperen Duymaz has written an article.	Article	/articles/133/	247	f
379	Alperen Duymaz has written an article.	Article	/articles/133/	470	f
380	Alperen Duymaz has written an article.	Article	/articles/133/	159	f
381	Alperen Duymaz has written an article.	Article	/articles/133/	262	f
382	Alperen Duymaz has written an article.	Article	/articles/133/	161	f
383	Alperen Duymaz has written an article.	Article	/articles/133/	199	f
384	Alperen Duymaz has written an article.	Article	/articles/133/	257	f
385	Alperen Duymaz has written an article.	Article	/articles/133/	69	f
386	Alperen Duymaz has written an article.	Article	/articles/133/	210	f
387	Alperen Duymaz has written an article.	Article	/articles/133/	49	f
388	Alperen Duymaz has written an article.	Article	/articles/133/	504	f
389	Alperen Duymaz has written an article.	Article	/articles/133/	448	f
390	Alperen Duymaz has written an article.	Article	/articles/133/	445	f
391	Alperen Duymaz has written an article.	Article	/articles/133/	460	f
392	Alperen Duymaz has written an article.	Article	/articles/133/	220	f
393	Alperen Duymaz has written an article.	Article	/articles/133/	357	f
394	Alperen Duymaz has written an article.	Article	/articles/133/	309	f
395	Alperen Duymaz has written an article.	Article	/articles/133/	85	f
396	Alperen Duymaz has written an article.	Article	/articles/133/	164	f
397	Alperen Duymaz has written an article.	Article	/articles/133/	276	f
398	Alperen Duymaz has written an article.	Article	/articles/133/	236	f
399	Alperen Duymaz has written an article.	Article	/articles/133/	183	f
400	Alperen Duymaz has written an article.	Article	/articles/133/	298	f
401	Alperen Duymaz has written an article.	Article	/articles/133/	510	f
402	Alperen Duymaz has written an article.	Article	/articles/133/	47	f
403	Alperen Duymaz has written an article.	Article	/articles/133/	127	f
404	Alperen Duymaz has written an article.	Article	/articles/133/	334	f
405	Alperen Duymaz has written an article.	Article	/articles/133/	129	f
406	Alperen Duymaz has written an article.	Article	/articles/133/	188	f
407	Alperen Duymaz has written an article.	Article	/articles/133/	483	f
408	Alperen Duymaz has written an article.	Article	/articles/133/	461	f
409	Alperen Duymaz has written an article.	Article	/articles/133/	517	f
410	Alperen Duymaz has written an article.	Article	/articles/133/	143	f
411	Alperen Duymaz has written an article.	Article	/articles/133/	138	f
412	Alperen Duymaz has written an article.	Article	/articles/133/	342	f
413	Alperen Duymaz has written an article.	Article	/articles/133/	489	f
414	Alperen Duymaz has written an article.	Article	/articles/133/	544	f
415	Alperen Duymaz has written an article.	Article	/articles/133/	122	f
416	Alperen Duymaz has written an article.	Article	/articles/133/	90	f
417	Alperen Duymaz has written an article.	Article	/articles/133/	466	f
418	Alperen Duymaz has written an article.	Article	/articles/133/	297	f
419	Alperen Duymaz has written an article.	Article	/articles/133/	542	f
420	Alperen Duymaz has written an article.	Article	/articles/133/	200	f
421	Alperen Duymaz has written an article.	Article	/articles/133/	280	f
422	Alperen Duymaz has written an article.	Article	/articles/133/	232	f
423	Alperen Duymaz has written an article.	Article	/articles/133/	136	f
424	Alperen Duymaz has written an article.	Article	/articles/133/	100	f
425	Alperen Duymaz has written an article.	Article	/articles/133/	112	f
426	Alperen Duymaz has written an article.	Article	/articles/133/	251	f
427	Alperen Duymaz has written an article.	Article	/articles/133/	383	f
428	Alperen Duymaz has written an article.	Article	/articles/133/	212	f
429	Alperen Duymaz has written an article.	Article	/articles/133/	267	f
430	Alperen Duymaz has written an article.	Article	/articles/133/	354	f
431	Alperen Duymaz has written an article.	Article	/articles/133/	253	f
432	Alperen Duymaz has written an article.	Article	/articles/133/	507	f
433	Alperen Duymaz has written an article.	Article	/articles/133/	463	f
434	Alperen Duymaz has written an article.	Article	/articles/133/	399	f
435	Alperen Duymaz has written an article.	Article	/articles/133/	509	f
436	Alperen Duymaz has written an article.	Article	/articles/133/	169	f
438	Alperen Duymaz has written an article.	Article	/articles/133/	326	f
439	Alperen Duymaz has written an article.	Article	/articles/133/	198	f
441	Alperen Duymaz has written an article.	Article	/articles/133/	467	f
442	Alperen Duymaz has written an article.	Article	/articles/133/	551	f
443	Alperen Duymaz has written an article.	Article	/articles/133/	557	f
444	Alperen Duymaz has written an article.	Article	/articles/133/	589	t
446	There are news and updates about the event you have followed.	Event	/events/10/	44	f
447	There are news and updates about the event you have followed.	Event	/events/10/	590	f
449	There are news and updates about the event you have followed.	Event	/events/10/	44	f
445	There are news and updates about the event you have followed.	Event	/events/10/	589	t
448	There are news and updates about the event you have followed.	Event	/events/10/	589	t
437	Alperen Duymaz has written an article.	Article	https://api.traiders.tk/articles/133/	589	t
440	Alperen Duymaz has written an article.	Article	https://api.traiders.tk/articles/133/	589	t
\.


--
-- Data for Name: api_onlineinvestment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_onlineinvestment (id, date, base_amount, target_amount, base_equipment_id, target_equipment_id, user_id) FROM stdin;
19	2019-11-26	100.000	15.760	355	263	546
20	2019-11-26	100.000	619.000	263	355	546
21	2019-12-22	100.000	15.150	355	263	545
22	2019-12-22	100.000	15.150	355	263	545
23	2019-12-23	200.000	30.240	355	263	572
24	2019-12-23	1000.000	151.200	355	263	572
25	2019-12-23	1000.000	151.200	355	263	572
26	2019-12-24	1000.000	5946.600	361	355	555
27	2019-12-24	10000.000	59461.000	361	355	555
32	2019-11-19	300.000	2100.000	266	355	586
33	2019-12-24	300.000	45.330	355	263	590
\.


--
-- Data for Name: api_parity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_parity (id, date, base_equipment_id, target_equipment_id, close, high, low, open) FROM stdin;
9133	2019-11-06 00:00:00+00	921	361	51.3400	51.3400	51.3400	51.3400
9134	2019-11-05 00:00:00+00	921	361	51.4300	51.4300	51.4300	51.4300
9135	2019-11-04 00:00:00+00	921	361	51.5100	51.5100	51.5100	51.5100
9136	2019-11-01 00:00:00+00	921	361	51.2800	51.2800	51.2800	51.2800
9137	2019-10-31 00:00:00+00	921	361	50.8400	50.8400	50.8400	50.8400
9138	2019-10-30 00:00:00+00	921	361	51.0500	51.0500	51.0500	51.0500
9139	2019-10-29 00:00:00+00	921	361	50.7700	50.7700	50.7700	50.7700
9140	2019-10-28 00:00:00+00	921	361	50.8100	50.8100	50.8100	50.8100
9141	2019-10-25 00:00:00+00	921	361	50.4400	50.4400	50.4400	50.4400
9142	2019-10-24 00:00:00+00	921	361	50.1500	50.1500	50.1500	50.1500
9143	2019-10-23 00:00:00+00	921	361	49.8000	49.8000	49.8000	49.8000
9144	2019-10-22 00:00:00+00	921	361	49.6700	49.6700	49.6700	49.6700
9145	2019-10-21 00:00:00+00	921	361	50.0900	50.0900	50.0900	50.0900
9146	2019-10-18 00:00:00+00	921	361	49.7600	49.7600	49.7600	49.7600
9147	2019-10-17 00:00:00+00	921	361	50.2600	50.2600	50.2600	50.2600
9148	2019-10-16 00:00:00+00	921	361	50.0600	50.0600	50.0600	50.0600
9149	2019-10-15 00:00:00+00	921	361	50.2700	50.2700	50.2700	50.2700
9150	2019-10-14 00:00:00+00	921	361	49.5800	49.5800	49.5800	49.5800
9151	2019-10-11 00:00:00+00	921	361	49.5900	49.5900	49.5900	49.5900
9152	2019-10-10 00:00:00+00	921	361	49.0500	49.0500	49.0500	49.0500
9153	2019-10-09 00:00:00+00	921	361	48.7000	48.7000	48.7000	48.7000
9154	2019-10-08 00:00:00+00	921	361	48.2800	48.2800	48.2800	48.2800
9155	2019-10-07 00:00:00+00	921	361	49.0200	49.0200	49.0200	49.0200
9156	2019-10-04 00:00:00+00	921	361	49.1600	49.1600	49.1600	49.1600
9157	2019-10-03 00:00:00+00	921	361	48.5200	48.5200	48.5200	48.5200
9158	2019-10-02 00:00:00+00	921	361	48.0100	48.0100	48.0100	48.0100
9159	2019-10-01 00:00:00+00	921	361	48.7200	48.7200	48.7200	48.7200
9160	2019-09-30 00:00:00+00	921	361	49.2500	49.2500	49.2500	49.2500
9161	2019-09-27 00:00:00+00	921	361	48.9700	48.9700	48.9700	48.9700
9162	2019-09-26 00:00:00+00	921	361	49.4200	49.4200	49.4200	49.4200
9163	2019-09-25 00:00:00+00	921	361	49.6600	49.6600	49.6600	49.6600
9164	2019-09-24 00:00:00+00	921	361	49.3900	49.3900	49.3900	49.3900
9165	2019-09-23 00:00:00+00	921	361	50.0900	50.0900	50.0900	50.0900
9166	2019-09-20 00:00:00+00	921	361	50.2300	50.2300	50.2300	50.2300
9167	2019-09-19 00:00:00+00	921	361	50.5600	50.5600	50.5600	50.5600
9168	2019-09-18 00:00:00+00	921	361	50.4900	50.4900	50.4900	50.4900
9169	2019-09-17 00:00:00+00	921	361	50.5500	50.5500	50.5500	50.5500
9170	2019-09-16 00:00:00+00	921	361	50.4100	50.4100	50.4100	50.4100
9171	2019-09-13 00:00:00+00	921	361	50.4200	50.4200	50.4200	50.4200
9172	2019-09-12 00:00:00+00	921	361	50.3200	50.3200	50.3200	50.3200
9173	2019-09-11 00:00:00+00	921	361	50.1300	50.1300	50.1300	50.1300
9174	2019-09-10 00:00:00+00	921	361	49.8200	49.8200	49.8200	49.8200
9175	2019-09-09 00:00:00+00	921	361	50.0000	50.0000	50.0000	50.0000
9176	2019-09-06 00:00:00+00	921	361	50.0000	50.0000	50.0000	50.0000
9177	2019-09-05 00:00:00+00	921	361	50.1300	50.1300	50.1300	50.1300
9178	2019-09-04 00:00:00+00	921	361	49.4500	49.4500	49.4500	49.4500
9179	2019-09-03 00:00:00+00	921	361	48.9100	48.9100	48.9100	48.9100
9180	2019-08-30 00:00:00+00	921	361	49.3900	49.3900	49.3900	49.3900
9181	2019-08-29 00:00:00+00	921	361	49.4000	49.4000	49.4000	49.4000
9182	2019-08-28 00:00:00+00	921	361	48.7300	48.7300	48.7300	48.7300
9183	2019-08-27 00:00:00+00	921	361	48.5400	48.5400	48.5400	48.5400
9184	2019-08-26 00:00:00+00	921	361	48.7100	48.7100	48.7100	48.7100
9185	2019-08-23 00:00:00+00	921	361	48.2700	48.2700	48.2700	48.2700
9186	2019-08-22 00:00:00+00	921	361	49.4000	49.4000	49.4000	49.4000
9187	2019-08-21 00:00:00+00	921	361	49.6100	49.6100	49.6100	49.6100
9188	2019-08-20 00:00:00+00	921	361	49.2000	49.2000	49.2000	49.2000
9189	2019-08-19 00:00:00+00	921	361	49.5400	49.5400	49.5400	49.5400
9190	2019-08-16 00:00:00+00	921	361	49.0100	49.0100	49.0100	49.0100
9191	2019-08-15 00:00:00+00	921	361	48.3600	48.3600	48.3600	48.3600
9192	2019-08-14 00:00:00+00	921	361	48.1900	48.1900	48.1900	48.1900
9193	2019-08-13 00:00:00+00	921	361	49.7000	49.7000	49.7000	49.7000
9194	2019-08-12 00:00:00+00	921	361	48.9900	48.9900	48.9900	48.9900
9195	2019-08-09 00:00:00+00	921	361	49.5700	49.5700	49.5700	49.5700
9196	2019-08-08 00:00:00+00	921	361	49.9300	49.9300	49.9300	49.9300
9197	2019-08-07 00:00:00+00	921	361	48.9400	48.9400	48.9400	48.9400
9198	2019-08-06 00:00:00+00	921	361	48.8000	48.8000	48.8000	48.8000
9199	2019-08-05 00:00:00+00	921	361	48.1500	48.1500	48.1500	48.1500
9200	2019-08-02 00:00:00+00	921	361	49.6100	49.6100	49.6100	49.6100
9201	2019-08-01 00:00:00+00	921	361	50.1400	50.1400	50.1400	50.1400
9202	2019-07-31 00:00:00+00	921	361	50.5900	50.5900	50.5900	50.5900
9203	2019-07-30 00:00:00+00	921	361	51.1600	51.1600	51.1600	51.1600
9204	2019-07-29 00:00:00+00	921	361	51.2800	51.2800	51.2800	51.2800
9205	2019-07-26 00:00:00+00	921	361	51.5200	51.5200	51.5200	51.5200
9206	2019-07-25 00:00:00+00	921	361	51.0700	51.0700	51.0700	51.0700
9207	2019-07-24 00:00:00+00	921	361	51.4900	51.4900	51.4900	51.4900
9208	2019-07-23 00:00:00+00	921	361	51.1800	51.1800	51.1800	51.1800
9209	2019-07-22 00:00:00+00	921	361	50.9600	50.9600	50.9600	50.9600
9210	2019-07-19 00:00:00+00	921	361	50.7500	50.7500	50.7500	50.7500
9211	2019-07-18 00:00:00+00	921	361	51.0400	51.0400	51.0400	51.0400
9212	2019-07-17 00:00:00+00	921	361	51.1200	51.1200	51.1200	51.1200
9213	2019-07-16 00:00:00+00	921	361	51.3400	51.3400	51.3400	51.3400
9214	2019-07-15 00:00:00+00	921	361	51.5500	51.5500	51.5500	51.5500
9215	2019-07-12 00:00:00+00	921	361	51.6100	51.6100	51.6100	51.6100
9216	2019-07-11 00:00:00+00	921	361	51.4200	51.4200	51.4200	51.4200
9217	2019-07-10 00:00:00+00	921	361	51.2400	51.2400	51.2400	51.2400
9218	2019-07-09 00:00:00+00	921	361	50.9700	50.9700	50.9700	50.9700
9219	2019-07-08 00:00:00+00	921	361	50.8100	50.8100	50.8100	50.8100
9220	2019-07-05 00:00:00+00	921	361	51.0800	51.0800	51.0800	51.0800
9221	2019-07-03 00:00:00+00	921	361	51.1900	51.1900	51.1900	51.1900
9222	2019-07-02 00:00:00+00	921	361	50.8700	50.8700	50.8700	50.8700
9223	2019-07-01 00:00:00+00	921	361	50.7700	50.7700	50.7700	50.7700
9224	2019-06-28 00:00:00+00	921	361	50.3400	50.3400	50.3400	50.3400
9225	2019-06-27 00:00:00+00	921	361	50.0400	50.0400	50.0400	50.0400
9226	2019-06-26 00:00:00+00	921	361	49.7000	49.7000	49.7000	49.7000
9227	2019-06-25 00:00:00+00	921	361	49.6900	49.6900	49.6900	49.6900
9228	2019-06-24 00:00:00+00	921	361	50.3400	50.3400	50.3400	50.3400
9229	2019-06-21 00:00:00+00	921	361	50.5100	50.5100	50.5100	50.5100
9230	2019-06-20 00:00:00+00	921	361	50.4800	50.4800	50.4800	50.4800
9231	2019-06-19 00:00:00+00	921	361	50.0300	50.0300	50.0300	50.0300
9232	2019-06-18 00:00:00+00	921	361	49.7900	49.7900	49.7900	49.7900
9233	2019-06-17 00:00:00+00	921	361	49.2700	49.2700	49.2700	49.2700
9234	2019-06-14 00:00:00+00	921	361	48.9400	48.9400	48.9400	48.9400
9235	2019-06-13 00:00:00+00	921	361	49.1100	49.1100	49.1100	49.1100
9236	2019-06-12 00:00:00+00	921	361	48.8800	48.8800	48.8800	48.8800
9237	2019-06-11 00:00:00+00	921	361	49.1100	49.1100	49.1100	49.1100
9238	2019-06-10 00:00:00+00	921	361	49.1300	49.1300	49.1300	49.1300
9239	2019-06-07 00:00:00+00	921	361	48.8900	48.8900	48.8900	48.8900
9240	2019-06-06 00:00:00+00	921	361	48.2100	48.2100	48.2100	48.2100
9241	2019-06-05 00:00:00+00	921	361	47.9900	47.9900	47.9900	47.9900
9242	2019-06-04 00:00:00+00	921	361	47.7300	47.7300	47.7300	47.7300
9243	2019-06-03 00:00:00+00	921	361	46.6700	46.6700	46.6700	46.6700
9244	2019-05-31 00:00:00+00	921	361	47.2700	47.2700	47.2700	47.2700
9245	2019-05-30 00:00:00+00	921	361	47.8400	47.8400	47.8400	47.8400
9246	2019-05-29 00:00:00+00	921	361	47.7400	47.7400	47.7400	47.7400
9247	2019-05-28 00:00:00+00	921	361	48.1200	48.1200	48.1200	48.1200
9248	2019-05-24 00:00:00+00	921	361	48.3400	48.3400	48.3400	48.3400
9249	2019-05-23 00:00:00+00	921	361	48.2400	48.2400	48.2400	48.2400
9250	2019-05-22 00:00:00+00	921	361	48.9800	48.9800	48.9800	48.9800
9251	2019-05-21 00:00:00+00	921	361	49.1300	49.1300	49.1300	49.1300
9252	2019-05-20 00:00:00+00	921	361	48.6800	48.6800	48.6800	48.6800
9253	2019-05-17 00:00:00+00	921	361	49.1700	49.1700	49.1700	49.1700
9254	2019-05-16 00:00:00+00	921	361	49.5600	49.5600	49.5600	49.5600
9255	2019-05-15 00:00:00+00	921	361	49.1000	49.1000	49.1000	49.1000
9256	2019-05-14 00:00:00+00	921	361	48.6500	48.6500	48.6500	48.6500
9257	2019-05-13 00:00:00+00	921	361	48.1600	48.1600	48.1600	48.1600
9258	2019-05-10 00:00:00+00	921	361	49.5300	49.5300	49.5300	49.5300
9259	2019-05-09 00:00:00+00	921	361	49.4100	49.4100	49.4100	49.4100
9260	2019-05-08 00:00:00+00	921	361	49.5100	49.5100	49.5100	49.5100
9261	2019-05-07 00:00:00+00	921	361	49.4900	49.4900	49.4900	49.4900
9262	2019-05-06 00:00:00+00	921	361	50.3100	50.3100	50.3100	50.3100
9263	2019-05-03 00:00:00+00	921	361	50.5100	50.5100	50.5100	50.5100
9264	2019-05-02 00:00:00+00	921	361	49.9500	49.9500	49.9500	49.9500
9265	2019-05-01 00:00:00+00	921	361	50.1100	50.1100	50.1100	50.1100
9266	2019-04-30 00:00:00+00	921	361	50.5300	50.5300	50.5300	50.5300
9267	2019-04-29 00:00:00+00	921	361	50.7100	50.7100	50.7100	50.7100
9268	2019-04-26 00:00:00+00	921	361	50.6100	50.6100	50.6100	50.6100
9269	2019-04-25 00:00:00+00	921	361	50.4000	50.4000	50.4000	50.4000
9270	2019-04-24 00:00:00+00	921	361	50.2100	50.2100	50.2100	50.2100
9271	2019-04-23 00:00:00+00	921	361	50.4600	50.4600	50.4600	50.4600
9272	2019-04-22 00:00:00+00	921	361	49.9500	49.9500	49.9500	49.9500
9273	2019-04-18 00:00:00+00	921	361	49.6900	49.6900	49.6900	49.6900
9274	2019-04-17 00:00:00+00	921	361	49.6300	49.6300	49.6300	49.6300
9275	2019-04-16 00:00:00+00	921	361	49.8300	49.8300	49.8300	49.8300
9276	2019-04-15 00:00:00+00	921	361	49.8400	49.8400	49.8400	49.8400
9277	2019-04-12 00:00:00+00	921	361	49.8700	49.8700	49.8700	49.8700
9278	2019-04-11 00:00:00+00	921	361	49.6200	49.6200	49.6200	49.6200
9279	2019-04-10 00:00:00+00	921	361	49.7200	49.7200	49.7200	49.7200
9280	2019-04-09 00:00:00+00	921	361	49.5400	49.5400	49.5400	49.5400
9281	2019-04-08 00:00:00+00	921	361	49.7500	49.7500	49.7500	49.7500
9282	2019-04-05 00:00:00+00	921	361	49.7100	49.7100	49.7100	49.7100
9283	2019-04-04 00:00:00+00	921	361	49.4400	49.4400	49.4400	49.4400
9284	2019-04-03 00:00:00+00	921	361	49.4500	49.4500	49.4500	49.4500
9285	2019-04-02 00:00:00+00	921	361	49.3200	49.3200	49.3200	49.3200
9286	2019-04-01 00:00:00+00	921	361	49.2400	49.2400	49.2400	49.2400
9287	2019-03-29 00:00:00+00	921	361	48.6500	48.6500	48.6500	48.6500
9288	2019-03-28 00:00:00+00	921	361	48.3000	48.3000	48.3000	48.3000
9289	2019-03-27 00:00:00+00	921	361	48.1100	48.1100	48.1100	48.1100
9290	2019-03-26 00:00:00+00	921	361	48.3800	48.3800	48.3800	48.3800
9291	2019-03-25 00:00:00+00	921	361	48.1000	48.1000	48.1000	48.1000
9292	2019-03-22 00:00:00+00	921	361	48.0800	48.0800	48.0800	48.0800
9293	2019-03-21 00:00:00+00	921	361	49.2200	49.2200	49.2200	49.2200
9294	2019-03-20 00:00:00+00	921	361	48.7100	48.7100	48.7100	48.7100
9295	2019-03-19 00:00:00+00	921	361	48.6100	48.6100	48.6100	48.6100
9296	2019-03-18 00:00:00+00	921	361	48.5200	48.5200	48.5200	48.5200
9297	2019-03-15 00:00:00+00	921	361	48.3400	48.3400	48.3400	48.3400
9298	2019-03-14 00:00:00+00	921	361	48.0900	48.0900	48.0900	48.0900
9299	2019-03-13 00:00:00+00	921	361	48.1300	48.1300	48.1300	48.1300
9300	2019-03-12 00:00:00+00	921	361	47.7600	47.7600	47.7600	47.7600
9301	2019-03-11 00:00:00+00	921	361	47.5800	47.5800	47.5800	47.5800
9302	2019-03-08 00:00:00+00	921	361	46.8600	46.8600	46.8600	46.8600
9303	2019-03-07 00:00:00+00	921	361	46.9900	46.9900	46.9900	46.9900
9304	2019-03-06 00:00:00+00	921	361	47.4800	47.4800	47.4800	47.4800
9305	2019-03-05 00:00:00+00	921	361	47.8200	47.8200	47.8200	47.8200
9306	2019-03-04 00:00:00+00	921	361	47.8300	47.8300	47.8300	47.8300
9307	2019-03-01 00:00:00+00	921	361	48.0900	48.0900	48.0900	48.0900
9308	2019-02-28 00:00:00+00	921	361	47.7400	47.7400	47.7400	47.7400
9309	2019-02-27 00:00:00+00	921	361	47.9400	47.9400	47.9400	47.9400
9310	2019-02-26 00:00:00+00	921	361	47.9900	47.9900	47.9900	47.9900
9311	2019-02-25 00:00:00+00	921	361	48.0300	48.0300	48.0300	48.0300
9312	2019-02-22 00:00:00+00	921	361	47.8600	47.8600	47.8600	47.8600
9313	2019-02-21 00:00:00+00	921	361	47.5100	47.5100	47.5100	47.5100
9314	2019-02-20 00:00:00+00	921	361	47.8100	47.8100	47.8100	47.8100
9315	2019-02-19 00:00:00+00	921	361	47.7800	47.7800	47.7800	47.7800
9316	2019-02-15 00:00:00+00	921	361	47.7500	47.7500	47.7500	47.7500
9317	2019-02-14 00:00:00+00	921	361	47.3300	47.3300	47.3300	47.3300
9318	2019-02-13 00:00:00+00	921	361	47.3100	47.3100	47.3100	47.3100
9319	2019-02-12 00:00:00+00	921	361	47.2000	47.2000	47.2000	47.2000
9320	2019-02-11 00:00:00+00	921	361	46.5600	46.5600	46.5600	46.5600
9321	2019-02-08 00:00:00+00	921	361	46.5500	46.5500	46.5500	46.5500
9322	2019-02-07 00:00:00+00	921	361	46.5200	46.5200	46.5200	46.5200
9323	2019-02-06 00:00:00+00	921	361	47.0600	47.0600	47.0600	47.0600
9324	2019-02-05 00:00:00+00	921	361	47.2700	47.2700	47.2700	47.2700
9325	2019-02-04 00:00:00+00	921	361	47.0500	47.0500	47.0500	47.0500
9326	2019-02-01 00:00:00+00	921	361	46.7200	46.7200	46.7200	46.7200
9327	2019-01-31 00:00:00+00	921	361	46.7700	46.7700	46.7700	46.7700
9328	2019-01-30 00:00:00+00	921	361	46.2000	46.2000	46.2000	46.2000
9329	2019-01-29 00:00:00+00	921	361	45.3600	45.3600	45.3600	45.3600
9330	2019-01-28 00:00:00+00	921	361	45.5700	45.5700	45.5700	45.5700
9331	2019-01-25 00:00:00+00	921	361	45.9900	45.9900	45.9900	45.9900
9332	2019-01-24 00:00:00+00	921	361	45.4800	45.4800	45.4800	45.4800
9333	2019-01-23 00:00:00+00	921	361	45.2600	45.2600	45.2600	45.2600
9334	2019-01-22 00:00:00+00	921	361	45.3500	45.3500	45.3500	45.3500
9335	2019-01-18 00:00:00+00	921	361	46.1200	46.1200	46.1200	46.1200
9336	2019-01-17 00:00:00+00	921	361	45.6000	45.6000	45.6000	45.6000
9337	2019-01-16 00:00:00+00	921	361	45.3000	45.3000	45.3000	45.3000
9338	2019-01-15 00:00:00+00	921	361	45.2300	45.2300	45.2300	45.2300
9339	2019-01-14 00:00:00+00	921	361	44.5600	44.5600	44.5600	44.5600
9340	2019-01-11 00:00:00+00	921	361	44.7600	44.7600	44.7600	44.7600
9341	2019-01-10 00:00:00+00	921	361	44.7800	44.7800	44.7800	44.7800
9342	2019-01-09 00:00:00+00	921	361	44.6300	44.6300	44.6300	44.6300
9343	2019-01-08 00:00:00+00	921	361	44.2300	44.2300	44.2300	44.2300
9344	2019-01-07 00:00:00+00	921	361	43.8200	43.8200	43.8200	43.8200
9345	2019-01-04 00:00:00+00	921	361	43.3000	43.3000	43.3000	43.3000
9346	2019-01-03 00:00:00+00	921	361	41.7600	41.7600	41.7600	41.7600
9347	2019-01-02 00:00:00+00	921	361	42.8100	42.8100	42.8100	42.8100
9348	2018-12-31 00:00:00+00	921	361	42.7600	42.7600	42.7600	42.7600
9349	2018-12-28 00:00:00+00	921	361	42.4500	42.4500	42.4500	42.4500
9350	2018-12-27 00:00:00+00	921	361	42.4400	42.4400	42.4400	42.4400
9351	2018-12-26 00:00:00+00	921	361	42.1600	42.1600	42.1600	42.1600
9352	2018-12-24 00:00:00+00	921	361	40.0500	40.0500	40.0500	40.0500
9353	2018-12-21 00:00:00+00	921	361	40.9500	40.9500	40.9500	40.9500
9354	2018-12-20 00:00:00+00	921	361	47.1200	47.1200	47.1200	47.1200
9355	2018-12-19 00:00:00+00	921	361	47.8600	47.8600	47.8600	47.8600
9356	2018-12-18 00:00:00+00	921	361	48.6400	48.6400	48.6400	48.6400
9357	2018-12-17 00:00:00+00	921	361	48.6000	48.6000	48.6000	48.6000
9358	2018-12-14 00:00:00+00	921	361	49.6100	49.6100	49.6100	49.6100
9359	2018-12-13 00:00:00+00	921	361	50.5700	50.5700	50.5700	50.5700
9360	2018-12-12 00:00:00+00	921	361	50.7000	50.7000	50.7000	50.7000
9361	2018-12-11 00:00:00+00	921	361	50.1400	50.1400	50.1400	50.1400
9362	2018-12-10 00:00:00+00	921	361	50.1000	50.1000	50.1000	50.1000
9363	2018-12-07 00:00:00+00	921	361	49.9300	49.9300	49.9300	49.9300
9364	2018-12-06 00:00:00+00	921	361	51.1200	51.1200	51.1200	51.1200
9365	2018-12-04 00:00:00+00	921	361	51.1400	51.1400	51.1400	51.1400
9366	2018-12-03 00:00:00+00	921	361	52.9100	52.9100	52.9100	52.9100
9367	2018-11-30 00:00:00+00	921	361	52.1900	52.1900	52.1900	52.1900
9368	2018-11-29 00:00:00+00	921	361	51.9500	51.9500	51.9500	51.9500
9369	2018-11-28 00:00:00+00	921	361	51.8700	51.8700	51.8700	51.8700
9370	2018-11-27 00:00:00+00	921	361	50.6100	50.6100	50.6100	50.6100
9371	2018-11-26 00:00:00+00	921	361	50.5400	50.5400	50.5400	50.5400
9372	2018-11-23 00:00:00+00	921	361	49.6400	49.6400	49.6400	49.6400
9373	2018-11-21 00:00:00+00	921	361	49.9800	49.9800	49.9800	49.9800
9374	2018-11-20 00:00:00+00	921	361	49.5700	49.5700	49.5700	49.5700
9375	2018-11-19 00:00:00+00	921	361	50.3300	50.3300	50.3300	50.3300
9376	2018-11-16 00:00:00+00	921	361	51.5500	51.5500	51.5500	51.5500
9377	2018-11-15 00:00:00+00	921	361	51.5200	51.5200	51.5200	51.5200
9378	2018-11-14 00:00:00+00	921	361	50.8900	50.8900	50.8900	50.8900
9379	2018-11-13 00:00:00+00	921	361	51.1800	51.1800	51.1800	51.1800
9380	2018-11-12 00:00:00+00	921	361	51.2500	51.2500	51.2500	51.2500
9381	2018-11-09 00:00:00+00	921	361	52.4600	52.4600	52.4600	52.4600
9382	2018-11-08 00:00:00+00	921	361	53.1700	53.1700	53.1700	53.1700
9383	2018-11-07 00:00:00+00	921	361	53.5700	53.5700	53.5700	53.5700
9384	2018-11-06 00:00:00+00	921	361	52.2200	52.2200	52.2200	52.2200
9385	2018-11-05 00:00:00+00	921	361	51.9600	51.9600	51.9600	51.9600
9386	2018-11-02 00:00:00+00	921	361	51.8400	51.8400	51.8400	51.8400
9387	2018-11-01 00:00:00+00	921	361	52.1100	52.1100	52.1100	52.1100
9388	2018-10-31 00:00:00+00	921	361	51.2600	51.2600	51.2600	51.2600
9389	2018-10-30 00:00:00+00	921	361	50.3500	50.3500	50.3500	50.3500
9390	2018-10-29 00:00:00+00	921	361	49.5900	49.5900	49.5900	49.5900
9391	2018-10-26 00:00:00+00	921	361	50.3900	50.3900	50.3900	50.3900
9392	2018-10-25 00:00:00+00	921	361	51.4100	51.4100	51.4100	51.4100
9393	2018-10-24 00:00:00+00	921	361	50.1500	50.1500	50.1500	50.1500
9394	2018-10-23 00:00:00+00	921	361	52.2100	52.2100	52.2100	52.2100
9395	2018-10-22 00:00:00+00	921	361	52.6200	52.6200	52.6200	52.6200
9396	2018-10-19 00:00:00+00	921	361	52.7300	52.7300	52.7300	52.7300
9397	2018-10-18 00:00:00+00	921	361	53.0500	53.0500	53.0500	53.0500
9398	2018-10-17 00:00:00+00	921	361	54.1100	54.1100	54.1100	54.1100
9399	2018-10-16 00:00:00+00	921	361	54.1700	54.1700	54.1700	54.1700
9400	2018-10-15 00:00:00+00	921	361	52.7900	52.7900	52.7900	52.7900
9401	2018-10-12 00:00:00+00	921	361	53.1600	53.1600	53.1600	53.1600
9402	2018-10-11 00:00:00+00	921	361	52.1700	52.1700	52.1700	52.1700
9403	2018-10-10 00:00:00+00	921	361	52.9500	52.9500	52.9500	52.9500
9404	2018-10-09 00:00:00+00	921	361	55.0900	55.0900	55.0900	55.0900
9405	2018-10-08 00:00:00+00	921	361	55.0600	55.0600	55.0600	55.0600
9406	2018-10-05 00:00:00+00	921	361	55.3800	55.3800	55.3800	55.3800
9407	2018-10-04 00:00:00+00	921	361	55.8300	55.8300	55.8300	55.8300
9408	2018-10-03 00:00:00+00	921	361	56.6600	56.6600	56.6600	56.6600
9409	2018-10-02 00:00:00+00	921	361	56.5800	56.5800	56.5800	56.5800
9410	2018-10-01 00:00:00+00	921	361	56.8100	56.8100	56.8100	56.8100
9411	2018-09-28 00:00:00+00	921	361	56.6900	56.6900	56.6900	56.6900
9412	2018-09-27 00:00:00+00	921	361	56.8000	56.8000	56.8000	56.8000
9413	2018-09-26 00:00:00+00	921	361	56.5500	56.5500	56.5500	56.5500
9414	2018-09-25 00:00:00+00	921	361	56.5900	56.5900	56.5900	56.5900
9415	2018-09-24 00:00:00+00	921	361	56.4800	56.4800	56.4800	56.4800
9416	2018-09-21 00:00:00+00	921	361	56.3800	56.3800	56.3800	56.3800
9417	2018-09-20 00:00:00+00	921	361	56.5000	56.5000	56.5000	56.5000
9418	2018-09-19 00:00:00+00	921	361	56.1400	56.1400	56.1400	56.1400
9419	2018-09-18 00:00:00+00	921	361	56.0000	56.0000	56.0000	56.0000
9420	2018-09-17 00:00:00+00	921	361	55.5000	55.5000	55.5000	55.5000
9421	2018-09-14 00:00:00+00	921	361	56.0500	56.0500	56.0500	56.0500
9422	2018-09-13 00:00:00+00	921	361	55.9800	55.9800	55.9800	55.9800
9423	2018-09-12 00:00:00+00	921	361	55.6900	55.6900	55.6900	55.6900
9424	2018-09-11 00:00:00+00	921	361	55.5900	55.5900	55.5900	55.5900
9425	2018-09-10 00:00:00+00	921	361	55.2500	55.2500	55.2500	55.2500
9426	2018-09-07 00:00:00+00	921	361	55.1400	55.1400	55.1400	55.1400
9427	2018-09-06 00:00:00+00	921	361	55.1300	55.1300	55.1300	55.1300
9428	2018-09-05 00:00:00+00	921	361	55.4400	55.4400	55.4400	55.4400
9429	2018-09-04 00:00:00+00	921	361	56.0400	56.0400	56.0400	56.0400
9430	2018-08-31 00:00:00+00	921	361	56.3100	56.3100	56.3100	56.3100
9431	2018-08-30 00:00:00+00	921	361	56.4400	56.4400	56.4400	56.4400
9432	2018-08-29 00:00:00+00	921	361	56.6100	56.6100	56.6100	56.6100
9433	2018-08-28 00:00:00+00	921	361	56.2000	56.2000	56.2000	56.2000
9434	2018-08-27 00:00:00+00	921	361	56.1900	56.1900	56.1900	56.1900
9435	2018-08-24 00:00:00+00	921	361	55.6500	55.6500	55.6500	55.6500
9436	2018-08-23 00:00:00+00	921	361	55.1400	55.1400	55.1400	55.1400
9437	2018-08-22 00:00:00+00	921	361	55.3400	55.3400	55.3400	55.3400
9438	2018-08-21 00:00:00+00	921	361	55.1200	55.1200	55.1200	55.1200
9439	2018-08-20 00:00:00+00	921	361	54.8500	54.8500	54.8500	54.8500
9440	2018-08-17 00:00:00+00	921	361	54.6500	54.6500	54.6500	54.6500
9441	2018-08-16 00:00:00+00	921	361	54.6800	54.6800	54.6800	54.6800
9442	2018-08-15 00:00:00+00	921	361	54.5000	54.5000	54.5000	54.5000
9443	2018-08-14 00:00:00+00	921	361	55.2800	55.2800	55.2800	55.2800
9444	2018-08-13 00:00:00+00	921	361	55.0400	55.0400	55.0400	55.0400
9445	2018-08-10 00:00:00+00	921	361	55.3000	55.3000	55.3000	55.3000
9446	2018-08-09 00:00:00+00	921	361	55.6800	55.6800	55.6800	55.6800
9447	2018-08-08 00:00:00+00	921	361	55.7300	55.7300	55.7300	55.7300
9448	2018-08-07 00:00:00+00	921	361	55.7600	55.7600	55.7600	55.7600
9449	2018-08-06 00:00:00+00	921	361	55.5300	55.5300	55.5300	55.5300
9450	2018-08-03 00:00:00+00	921	361	55.2400	55.2400	55.2400	55.2400
9451	2018-08-02 00:00:00+00	921	361	55.3000	55.3000	55.3000	55.3000
9452	2018-08-01 00:00:00+00	921	361	54.9300	54.9300	54.9300	54.9300
9453	2018-07-31 00:00:00+00	921	361	55.0300	55.0300	55.0300	55.0300
9454	2018-07-30 00:00:00+00	921	361	54.7700	54.7700	54.7700	54.7700
9455	2018-07-27 00:00:00+00	921	361	55.3400	55.3400	55.3400	55.3400
9456	2018-07-26 00:00:00+00	921	361	55.8300	55.8300	55.8300	55.8300
9457	2018-07-25 00:00:00+00	921	361	56.2800	56.2800	56.2800	56.2800
9458	2018-07-24 00:00:00+00	921	361	55.6400	55.6400	55.6400	55.6400
9459	2018-07-23 00:00:00+00	921	361	55.4700	55.4700	55.4700	55.4700
9460	2018-07-20 00:00:00+00	921	361	55.4200	55.4200	55.4200	55.4200
9461	2018-07-19 00:00:00+00	921	361	55.3900	55.3900	55.3900	55.3900
9462	2018-07-18 00:00:00+00	921	361	55.7600	55.7600	55.7600	55.7600
9463	2018-07-17 00:00:00+00	921	361	55.6000	55.6000	55.6000	55.6000
9464	2018-07-16 00:00:00+00	921	361	55.4800	55.4800	55.4800	55.4800
9465	2018-07-13 00:00:00+00	921	361	55.6100	55.6100	55.6100	55.6100
9466	2018-07-12 00:00:00+00	921	361	55.6200	55.6200	55.6200	55.6200
9467	2018-07-11 00:00:00+00	921	361	55.2100	55.2100	55.2100	55.2100
9468	2018-07-10 00:00:00+00	921	361	55.5500	55.5500	55.5500	55.5500
9469	2018-07-09 00:00:00+00	921	361	55.4500	55.4500	55.4500	55.4500
9470	2018-07-06 00:00:00+00	921	361	54.8200	54.8200	54.8200	54.8200
9471	2018-07-05 00:00:00+00	921	361	54.2500	54.2500	54.2500	54.2500
9472	2018-07-03 00:00:00+00	921	361	53.7800	53.7800	53.7800	53.7800
9473	2018-07-02 00:00:00+00	921	361	54.0800	54.0800	54.0800	54.0800
9474	2018-06-29 00:00:00+00	921	361	54.0100	54.0100	54.0100	54.0100
9475	2018-06-28 00:00:00+00	921	361	53.8100	53.8100	53.8100	53.8100
9476	2018-06-27 00:00:00+00	921	361	53.4700	53.4700	53.4700	53.4700
9477	2018-06-26 00:00:00+00	921	361	53.9500	53.9500	53.9500	53.9500
9478	2018-06-25 00:00:00+00	921	361	53.7100	53.7100	53.7100	53.7100
9479	2018-06-22 00:00:00+00	921	361	54.8300	54.8300	54.8300	54.8300
9480	2018-06-21 00:00:00+00	921	361	54.7500	54.7500	54.7500	54.7500
9481	2018-06-20 00:00:00+00	921	361	55.1800	55.1800	55.1800	55.1800
9482	2018-06-19 00:00:00+00	921	361	54.8300	54.8300	54.8300	54.8300
9483	2018-06-18 00:00:00+00	921	361	55.0100	55.0100	55.0100	55.0100
9484	2018-06-15 00:00:00+00	921	361	55.0000	55.0000	55.0000	55.0000
9485	2018-06-14 00:00:00+00	921	361	55.1000	55.1000	55.1000	55.1000
9486	2018-06-13 00:00:00+00	921	361	54.8000	54.8000	54.8000	54.8000
9487	2018-06-12 00:00:00+00	921	361	54.7700	54.7700	54.7700	54.7700
9488	2018-06-11 00:00:00+00	921	361	54.5800	54.5800	54.5800	54.5800
9489	2018-06-08 00:00:00+00	921	361	54.4300	54.4300	54.4300	54.4300
9490	2018-06-07 00:00:00+00	921	361	54.3300	54.3300	54.3300	54.3300
9491	2018-06-06 00:00:00+00	921	361	54.5700	54.5700	54.5700	54.5700
9492	2018-06-05 00:00:00+00	921	361	54.1400	54.1400	54.1400	54.1400
9493	2018-06-04 00:00:00+00	921	361	54.0500	54.0500	54.0500	54.0500
9494	2018-06-01 00:00:00+00	921	361	53.7600	53.7600	53.7600	53.7600
9495	2018-05-31 00:00:00+00	921	361	53.2200	53.2200	53.2200	53.2200
9496	2018-05-30 00:00:00+00	921	361	53.4200	53.4200	53.4200	53.4200
9497	2018-05-29 00:00:00+00	921	361	52.8000	52.8000	52.8000	52.8000
9498	2018-05-25 00:00:00+00	921	361	53.3300	53.3300	53.3300	53.3300
9499	2018-05-24 00:00:00+00	921	361	53.4000	53.4000	53.4000	53.4000
9500	2018-05-23 00:00:00+00	921	361	53.5200	53.5200	53.5200	53.5200
9501	2018-05-22 00:00:00+00	921	361	53.3100	53.3100	53.3100	53.3100
9502	2018-05-21 00:00:00+00	921	361	53.5700	53.5700	53.5700	53.5700
9503	2018-05-18 00:00:00+00	921	361	53.1900	53.1900	53.1900	53.1900
9504	2018-05-17 00:00:00+00	921	361	53.3100	53.3100	53.3100	53.3100
9505	2018-05-16 00:00:00+00	921	361	53.2400	53.2400	53.2400	53.2400
9506	2018-05-15 00:00:00+00	921	361	52.9500	52.9500	52.9500	52.9500
9507	2018-05-14 00:00:00+00	921	361	53.3500	53.3500	53.3500	53.3500
9508	2018-05-11 00:00:00+00	921	361	53.2600	53.2600	53.2600	53.2600
9509	2018-05-10 00:00:00+00	921	361	53.2500	53.2500	53.2500	53.2500
9510	2018-05-09 00:00:00+00	921	361	52.8800	52.8800	52.8800	52.8800
9511	2018-05-08 00:00:00+00	921	361	52.4200	52.4200	52.4200	52.4200
9512	2018-05-07 00:00:00+00	921	361	52.4000	52.4000	52.4000	52.4000
9513	2018-05-04 00:00:00+00	921	361	52.0900	52.0900	52.0900	52.0900
9514	2018-05-03 00:00:00+00	921	361	51.5100	51.5100	51.5100	51.5100
9515	2018-05-02 00:00:00+00	921	361	51.6800	51.6800	51.6800	51.6800
9516	2018-05-01 00:00:00+00	921	361	51.9500	51.9500	51.9500	51.9500
9517	2018-04-30 00:00:00+00	921	361	51.7400	51.7400	51.7400	51.7400
9518	2018-04-27 00:00:00+00	921	361	52.0200	52.0200	52.0200	52.0200
9519	2018-04-26 00:00:00+00	921	361	51.9600	51.9600	51.9600	51.9600
9520	2018-04-25 00:00:00+00	921	361	51.2000	51.2000	51.2000	51.2000
9521	2018-04-24 00:00:00+00	921	361	51.2000	51.2000	51.2000	51.2000
9522	2018-04-23 00:00:00+00	921	361	52.0700	52.0700	52.0700	52.0700
9523	2018-04-20 00:00:00+00	921	361	52.2300	52.2300	52.2300	52.2300
9524	2018-04-19 00:00:00+00	921	361	52.6500	52.6500	52.6500	52.6500
9525	2018-04-18 00:00:00+00	921	361	52.8500	52.8500	52.8500	52.8500
9526	2018-04-17 00:00:00+00	921	361	52.6300	52.6300	52.6300	52.6300
9527	2018-04-16 00:00:00+00	921	361	51.7700	51.7700	51.7700	51.7700
9528	2018-04-13 00:00:00+00	921	361	51.4100	51.4100	51.4100	51.4100
9529	2018-04-12 00:00:00+00	921	361	51.5300	51.5300	51.5300	51.5300
9530	2018-04-11 00:00:00+00	921	361	51.1300	51.1300	51.1300	51.1300
9531	2018-04-10 00:00:00+00	921	361	51.2700	51.2700	51.2700	51.2700
9532	2018-04-09 00:00:00+00	921	361	50.4000	50.4000	50.4000	50.4000
9533	2018-04-06 00:00:00+00	921	361	50.1600	50.1600	50.1600	50.1600
9534	2018-04-05 00:00:00+00	921	361	51.2200	51.2200	51.2200	51.2200
9535	2018-04-04 00:00:00+00	921	361	50.8300	50.8300	50.8300	50.8300
9536	2018-04-03 00:00:00+00	921	361	50.3800	50.3800	50.3800	50.3800
9537	2018-04-02 00:00:00+00	921	361	49.8300	49.8300	49.8300	49.8300
9538	2018-03-29 00:00:00+00	921	361	51.0000	51.0000	51.0000	51.0000
9539	2018-03-28 00:00:00+00	921	361	50.2200	50.2200	50.2200	50.2200
9540	2018-03-27 00:00:00+00	921	361	50.7400	50.7400	50.7400	50.7400
9541	2018-03-26 00:00:00+00	921	361	51.8500	51.8500	51.8500	51.8500
9542	2018-03-23 00:00:00+00	921	361	50.5200	50.5200	50.5200	50.5200
9543	2018-03-22 00:00:00+00	921	361	51.4600	51.4600	51.4600	51.4600
9544	2018-03-21 00:00:00+00	921	361	52.7600	52.7600	52.7600	52.7600
9545	2018-03-20 00:00:00+00	921	361	52.7200	52.7200	52.7200	52.7200
9546	2018-03-19 00:00:00+00	921	361	52.4900	52.4900	52.4900	52.4900
9547	2018-03-16 00:00:00+00	921	361	53.2600	53.2600	53.2600	53.2600
9548	2018-03-15 00:00:00+00	921	361	53.3500	53.3500	53.3500	53.3500
9549	2018-03-14 00:00:00+00	921	361	53.4300	53.4300	53.4300	53.4300
9550	2018-03-13 00:00:00+00	921	361	53.5200	53.5200	53.5200	53.5200
9551	2018-03-12 00:00:00+00	921	361	53.9200	53.9200	53.9200	53.9200
9552	2018-03-09 00:00:00+00	921	361	53.9400	53.9400	53.9400	53.9400
9553	2018-03-08 00:00:00+00	921	361	53.0100	53.0100	53.0100	53.0100
9554	2018-03-07 00:00:00+00	921	361	52.8500	52.8500	52.8500	52.8500
9555	2018-03-06 00:00:00+00	921	361	52.7500	52.7500	52.7500	52.7500
9556	2018-03-05 00:00:00+00	921	361	52.4500	52.4500	52.4500	52.4500
9557	2018-03-02 00:00:00+00	921	361	51.8900	51.8900	51.8900	51.8900
9558	2018-03-01 00:00:00+00	921	361	51.5400	51.5400	51.5400	51.5400
9559	2018-02-28 00:00:00+00	921	361	52.1200	52.1200	52.1200	52.1200
9560	2018-02-27 00:00:00+00	921	361	52.6300	52.6300	52.6300	52.6300
9561	2018-02-26 00:00:00+00	921	361	53.2700	53.2700	53.2700	53.2700
9562	2018-02-23 00:00:00+00	921	361	52.7300	52.7300	52.7300	52.7300
9563	2018-02-22 00:00:00+00	921	361	51.9300	51.9300	51.9300	51.9300
9564	2018-02-21 00:00:00+00	921	361	51.9500	51.9500	51.9500	51.9500
9565	2018-02-20 00:00:00+00	921	361	52.0900	52.0900	52.0900	52.0900
9566	2018-02-16 00:00:00+00	921	361	52.1800	52.1800	52.1800	52.1800
9567	2018-02-15 00:00:00+00	921	361	52.2600	52.2600	52.2600	52.2600
9568	2018-02-14 00:00:00+00	921	361	51.6500	51.6500	51.6500	51.6500
9569	2018-02-13 00:00:00+00	921	361	50.7400	50.7400	50.7400	50.7400
9570	2018-02-12 00:00:00+00	921	361	50.5800	50.5800	50.5800	50.5800
9571	2018-02-09 00:00:00+00	921	361	49.8100	49.8100	49.8100	49.8100
9572	2018-02-08 00:00:00+00	921	361	49.2600	49.2600	49.2600	49.2600
9573	2018-02-07 00:00:00+00	921	361	51.1800	51.1800	51.1800	51.1800
9574	2018-02-06 00:00:00+00	921	361	51.5600	51.5600	51.5600	51.5600
9575	2018-02-05 00:00:00+00	921	361	50.6100	50.6100	50.6100	50.6100
9576	2018-02-02 00:00:00+00	921	361	52.4700	52.4700	52.4700	52.4700
9577	2018-02-01 00:00:00+00	921	361	53.4300	53.4300	53.4300	53.4300
9578	2018-01-31 00:00:00+00	921	361	53.5800	53.5800	53.5800	53.5800
9579	2018-01-30 00:00:00+00	921	361	53.5000	53.5000	53.5000	53.5000
9580	2018-01-29 00:00:00+00	921	361	54.0300	54.0300	54.0300	54.0300
9581	2018-01-26 00:00:00+00	921	361	54.2400	54.2400	54.2400	54.2400
9582	2018-01-25 00:00:00+00	921	361	53.5800	53.5800	53.5800	53.5800
9583	2018-01-24 00:00:00+00	921	361	53.5300	53.5300	53.5300	53.5300
9584	2018-01-23 00:00:00+00	921	361	53.5000	53.5000	53.5000	53.5000
9585	2018-01-22 00:00:00+00	921	361	53.1400	53.1400	53.1400	53.1400
9586	2018-01-19 00:00:00+00	921	361	52.6600	52.6600	52.6600	52.6600
9587	2018-01-18 00:00:00+00	921	361	52.4200	52.4200	52.4200	52.4200
9588	2018-01-17 00:00:00+00	921	361	52.3800	52.3800	52.3800	52.3800
9589	2018-01-16 00:00:00+00	921	361	51.9400	51.9400	51.9400	51.9400
9590	2018-01-12 00:00:00+00	921	361	52.0800	52.0800	52.0800	52.0800
9591	2018-01-11 00:00:00+00	921	361	51.6600	51.6600	51.6600	51.6600
9592	2018-01-10 00:00:00+00	921	361	51.2200	51.2200	51.2200	51.2200
9593	2018-01-09 00:00:00+00	921	361	51.3300	51.3300	51.3300	51.3300
9594	2018-01-08 00:00:00+00	921	361	51.2300	51.2300	51.2300	51.2300
9595	2018-01-05 00:00:00+00	921	361	51.1500	51.1500	51.1500	51.1500
9596	2018-01-04 00:00:00+00	921	361	50.7600	50.7600	50.7600	50.7600
9597	2018-01-03 00:00:00+00	921	361	50.5800	50.5800	50.5800	50.5800
9598	2018-01-02 00:00:00+00	921	361	50.1600	50.1600	50.1600	50.1600
9600	2019-11-09 00:00:00+00	888	361	61.8300	62.3600	60.4200	60.7200
9601	2019-11-08 00:00:00+00	888	361	60.7700	63.6100	59.8800	63.0400
9602	2019-11-07 00:00:00+00	888	361	63.0700	67.4900	62.7600	64.0100
9603	2019-11-06 00:00:00+00	888	361	64.0000	64.5000	62.3700	62.7300
9604	2019-11-05 00:00:00+00	888	361	62.8000	63.6500	61.6800	62.9600
9605	2019-11-04 00:00:00+00	888	361	62.9800	64.1600	62.2700	63.3200
9606	2019-11-03 00:00:00+00	888	361	63.2500	65.0000	61.0200	62.1500
9607	2019-11-02 00:00:00+00	888	361	62.1500	63.0800	60.4300	60.6500
9608	2019-11-01 00:00:00+00	888	361	60.6200	61.2000	58.2300	59.0100
9609	2019-10-31 00:00:00+00	888	361	59.0100	60.0500	56.9400	58.4100
9610	2019-10-30 00:00:00+00	888	361	58.4200	59.5400	57.1600	59.5300
9611	2019-10-29 00:00:00+00	888	361	59.4900	63.1200	58.9200	59.2900
9612	2019-10-28 00:00:00+00	888	361	59.2900	61.6300	58.5500	59.7500
9613	2019-10-27 00:00:00+00	888	361	59.6700	61.2400	55.4400	56.6900
9614	2019-10-26 00:00:00+00	888	361	56.7700	67.0100	55.1500	59.1100
9615	2019-10-25 00:00:00+00	888	361	59.0500	60.0000	52.2400	53.3800
9616	2019-10-24 00:00:00+00	888	361	53.3200	54.4900	50.8600	53.2800
9617	2019-10-23 00:00:00+00	888	361	53.2700	57.2800	52.0000	56.6000
9618	2019-10-22 00:00:00+00	888	361	56.6700	58.6500	55.8300	57.4300
9619	2019-10-21 00:00:00+00	888	361	57.5100	59.3700	55.5700	56.3400
9620	2019-10-20 00:00:00+00	888	361	56.4000	57.2700	53.6700	54.3500
9621	2019-10-19 00:00:00+00	888	361	54.4200	55.3000	53.3300	55.2200
9622	2019-10-18 00:00:00+00	888	361	55.2300	58.3700	55.1000	55.9300
9623	2019-10-17 00:00:00+00	888	361	55.9200	60.6100	54.5100	54.8000
9624	2019-10-16 00:00:00+00	888	361	54.7900	55.3000	51.6400	52.0500
9625	2019-10-15 00:00:00+00	888	361	52.1000	53.9000	51.6500	53.0600
9626	2019-10-14 00:00:00+00	888	361	53.0600	53.6600	52.3600	53.2600
9627	2019-10-13 00:00:00+00	888	361	53.2500	54.0500	52.3200	53.5500
9628	2019-10-12 00:00:00+00	888	361	53.5800	54.8200	53.3500	53.8600
9629	2019-10-11 00:00:00+00	888	361	53.9300	56.6300	53.8200	55.6900
9630	2019-10-10 00:00:00+00	888	361	55.6900	57.4500	55.0000	57.0000
9631	2019-10-09 00:00:00+00	888	361	57.0000	57.4500	54.8800	55.3700
9632	2019-10-08 00:00:00+00	888	361	55.4600	56.9500	55.0000	56.1200
9633	2019-10-07 00:00:00+00	888	361	56.1100	57.0800	54.1900	54.6800
9634	2019-10-06 00:00:00+00	888	361	54.7100	56.5800	54.2000	56.4000
9635	2019-10-05 00:00:00+00	888	361	56.4100	57.6200	55.1700	57.1100
9636	2019-10-04 00:00:00+00	888	361	57.1100	57.7700	53.8400	56.1600
9637	2019-10-03 00:00:00+00	888	361	56.1300	57.2300	54.0700	55.9300
9638	2019-10-02 00:00:00+00	888	361	55.8800	56.8000	54.3000	55.5200
9639	2019-10-01 00:00:00+00	888	361	55.5000	58.2800	50.0000	56.8100
9640	2019-09-30 00:00:00+00	888	361	56.8300	57.5400	53.3600	55.8900
9641	2019-09-29 00:00:00+00	888	361	55.8200	57.8100	54.4900	57.6600
9642	2019-09-28 00:00:00+00	888	361	57.6000	58.2800	56.0800	57.5600
9643	2019-09-27 00:00:00+00	888	361	57.4800	70.0000	54.0600	57.1700
9644	2019-09-26 00:00:00+00	888	361	57.3000	77.9000	54.2300	59.8600
9645	2019-09-25 00:00:00+00	888	361	59.5900	61.3500	57.3000	58.7000
9646	2019-09-24 00:00:00+00	888	361	58.6300	70.1800	55.2800	68.3700
9647	2019-09-23 00:00:00+00	888	361	68.4900	73.1800	68.1100	73.0000
9648	2019-09-22 00:00:00+00	888	361	73.0000	74.2000	70.8000	72.3400
9649	2019-09-21 00:00:00+00	888	361	72.3300	73.9100	71.9500	73.7800
9650	2019-09-20 00:00:00+00	888	361	73.7800	77.9800	72.5300	75.6600
9651	2019-09-19 00:00:00+00	888	361	75.7700	81.5800	72.5000	80.8900
9652	2019-09-18 00:00:00+00	888	361	80.9900	82.1800	73.6300	73.8600
9653	2019-09-17 00:00:00+00	888	361	73.7300	75.4700	73.0500	75.3700
9654	2019-09-16 00:00:00+00	888	361	75.3700	76.4700	71.2300	75.4500
9655	2019-09-15 00:00:00+00	888	361	75.4500	76.5000	73.9900	76.0800
9656	2019-09-14 00:00:00+00	888	361	76.1000	76.8200	73.5800	76.7900
9657	2019-09-13 00:00:00+00	888	361	76.7900	76.7900	72.6800	74.8900
9132	2019-11-07 00:00:00+00	921	361	51.5400	51.5400	51.5400	51.5400
9658	2019-09-12 00:00:00+00	888	361	74.8800	75.4200	71.5200	74.1800
9659	2019-09-11 00:00:00+00	888	361	74.1800	74.1900	69.4300	72.0500
9660	2019-09-10 00:00:00+00	888	361	72.2700	76.0000	71.5000	74.9800
9661	2019-09-09 00:00:00+00	888	361	74.9400	77.5500	70.2000	77.0300
9662	2019-09-08 00:00:00+00	888	361	77.1500	78.9800	75.5500	77.9700
9663	2019-09-07 00:00:00+00	888	361	78.0000	78.5900	73.7800	75.0200
9664	2019-09-06 00:00:00+00	888	361	75.2200	79.7100	74.8300	76.0700
9665	2019-09-05 00:00:00+00	888	361	75.9700	78.0000	73.5200	73.9800
9666	2019-09-04 00:00:00+00	888	361	73.7900	75.0100	71.4100	74.7800
9667	2019-09-03 00:00:00+00	888	361	74.7800	75.7500	72.8700	73.2500
9668	2019-09-02 00:00:00+00	888	361	73.0500	74.0600	69.6700	71.3200
9669	2019-09-01 00:00:00+00	888	361	71.3400	74.6100	66.6300	67.3100
9670	2019-08-31 00:00:00+00	888	361	67.3400	68.3400	66.0700	67.8500
9671	2019-08-30 00:00:00+00	888	361	67.8200	68.3200	65.7000	66.9000
9672	2019-08-29 00:00:00+00	888	361	66.9000	72.1000	66.7100	72.1000
9673	2019-08-28 00:00:00+00	888	361	72.1000	79.7700	71.4100	78.5000
9674	2019-08-27 00:00:00+00	888	361	78.5000	80.0800	77.5600	79.7000
9675	2019-08-26 00:00:00+00	888	361	79.7500	83.9100	79.0400	80.7500
9676	2019-08-25 00:00:00+00	888	361	80.6000	82.3300	79.0000	80.4600
9677	2019-08-24 00:00:00+00	888	361	80.5200	82.2000	78.0600	82.0800
9678	2019-08-23 00:00:00+00	888	361	82.0800	83.5000	80.9100	82.0200
9679	2019-08-22 00:00:00+00	888	361	82.0200	83.3600	78.2200	81.0000
9680	2019-08-21 00:00:00+00	888	361	80.8400	86.5100	78.8100	85.8400
9681	2019-08-20 00:00:00+00	888	361	85.6100	91.0200	84.2800	89.5000
9682	2019-08-19 00:00:00+00	888	361	89.3200	91.2800	84.1800	87.7500
9683	2019-08-18 00:00:00+00	888	361	87.7500	87.9200	81.5400	81.9000
9684	2019-08-17 00:00:00+00	888	361	81.5200	83.8400	80.8200	81.6900
9685	2019-08-16 00:00:00+00	888	361	82.2500	83.5000	78.0000	82.4400
9686	2019-08-15 00:00:00+00	888	361	82.4400	82.8800	78.1100	79.0400
9687	2019-08-14 00:00:00+00	888	361	78.9000	85.7800	78.1000	85.5700
9688	2019-08-13 00:00:00+00	888	361	85.7800	92.0000	84.7500	91.1400
9689	2019-08-12 00:00:00+00	888	361	91.2100	92.4900	89.5000	92.3000
9690	2019-08-11 00:00:00+00	888	361	92.3000	93.1200	88.7000	90.7400
9691	2019-08-10 00:00:00+00	888	361	90.7800	95.0000	90.0700	93.6200
9692	2019-08-09 00:00:00+00	888	361	93.4000	96.0000	91.0100	95.5500
9693	2019-08-08 00:00:00+00	888	361	95.5500	97.9200	91.4400	97.4300
9694	2019-08-07 00:00:00+00	888	361	97.4300	98.1000	88.9900	89.6400
9695	2019-08-06 00:00:00+00	888	361	89.9000	96.7000	88.0000	93.5100
9696	2019-08-05 00:00:00+00	888	361	93.5500	95.0000	87.6300	87.6600
9697	2019-08-04 00:00:00+00	888	361	87.7600	88.9000	85.3900	87.9000
9698	2019-08-03 00:00:00+00	888	361	88.0300	88.1400	83.9500	84.1000
9699	2019-08-02 00:00:00+00	888	361	83.9300	85.2100	81.4900	82.1800
9700	2019-08-01 00:00:00+00	888	361	82.1500	82.7100	79.6500	80.6400
9701	2019-07-31 00:00:00+00	888	361	80.4600	82.6700	77.8400	78.0900
9702	2019-07-30 00:00:00+00	888	361	78.2400	80.8300	77.4700	78.0000
9703	2019-07-29 00:00:00+00	888	361	78.2800	81.6900	77.7300	80.3100
9704	2019-07-28 00:00:00+00	888	361	80.1800	83.6600	77.1800	78.8500
9705	2019-07-27 00:00:00+00	888	361	78.8900	83.1900	77.4300	80.1000
9706	2019-07-26 00:00:00+00	888	361	80.2000	81.3700	78.4800	80.9500
9707	2019-07-25 00:00:00+00	888	361	81.0400	83.6700	80.2500	80.3200
9708	2019-07-24 00:00:00+00	888	361	80.4400	82.1800	78.3900	81.0100
9709	2019-07-23 00:00:00+00	888	361	81.0900	84.0300	80.1600	83.4300
9710	2019-07-22 00:00:00+00	888	361	83.4800	85.5700	81.0600	84.2300
9711	2019-07-21 00:00:00+00	888	361	84.1000	88.1400	83.1200	84.8900
9712	2019-07-20 00:00:00+00	888	361	85.3500	87.7300	81.3700	82.0500
9713	2019-07-19 00:00:00+00	888	361	82.0500	84.6600	80.1800	83.8300
9714	2019-07-18 00:00:00+00	888	361	84.0600	85.7000	74.8200	76.8000
9715	2019-07-17 00:00:00+00	888	361	76.5900	80.6000	71.8000	74.2500
9716	2019-07-16 00:00:00+00	888	361	74.2200	89.3700	73.5000	88.8400
9717	2019-07-15 00:00:00+00	888	361	88.8400	90.5200	76.0100	85.9400
9718	2019-07-14 00:00:00+00	888	361	86.2300	94.7400	85.0100	93.3900
9719	2019-07-13 00:00:00+00	888	361	93.4900	98.0800	89.0300	98.0800
9720	2019-07-12 00:00:00+00	888	361	98.0800	98.4100	86.1300	89.7600
9721	2019-07-11 00:00:00+00	888	361	89.7500	95.3700	87.3000	95.0000
9722	2019-07-10 00:00:00+00	888	361	95.0000	101.8200	92.4700	99.3500
9723	2019-07-09 00:00:00+00	888	361	99.3500	104.6700	97.4200	101.1600
9724	2019-07-08 00:00:00+00	888	361	101.1500	107.4000	99.9300	106.7800
9725	2019-07-07 00:00:00+00	888	361	106.9900	107.0700	93.0000	94.5800
9726	2019-07-06 00:00:00+00	888	361	94.6500	98.9800	89.3900	89.4000
9727	2019-07-05 00:00:00+00	888	361	89.4500	92.6500	86.1800	87.6300
9728	2019-07-04 00:00:00+00	888	361	87.6500	92.9000	87.1400	89.9300
9729	2019-07-03 00:00:00+00	888	361	89.8400	92.4000	85.5900	86.7800
9730	2019-07-02 00:00:00+00	888	361	86.7300	89.6000	82.4300	88.9600
9731	2019-07-01 00:00:00+00	888	361	88.9600	94.8000	84.1400	88.7400
9732	2019-06-30 00:00:00+00	888	361	88.7100	100.9600	87.8000	100.2700
9733	2019-06-29 00:00:00+00	888	361	99.9300	102.0900	93.2000	102.0000
9734	2019-06-28 00:00:00+00	888	361	102.0600	103.0000	94.2800	96.3900
9735	2019-06-27 00:00:00+00	888	361	96.3800	106.9100	89.3100	105.0000
9736	2019-06-26 00:00:00+00	888	361	105.0000	114.4300	99.5100	112.3300
9737	2019-06-25 00:00:00+00	888	361	112.3000	118.3900	111.4300	117.8700
9738	2019-06-24 00:00:00+00	888	361	117.8600	119.9800	112.6400	115.6800
9739	2019-06-23 00:00:00+00	888	361	116.0100	121.5500	114.2100	115.6500
9740	2019-06-22 00:00:00+00	888	361	115.4800	119.0700	107.5700	109.5000
9741	2019-06-21 00:00:00+00	888	361	109.5400	110.0900	105.2400	105.2400
9742	2019-06-20 00:00:00+00	888	361	105.0700	109.0100	99.7300	100.3700
9743	2019-06-19 00:00:00+00	888	361	100.1900	102.3100	95.8100	96.4900
9744	2019-06-18 00:00:00+00	888	361	96.4900	98.9800	95.0300	98.3000
9745	2019-06-17 00:00:00+00	888	361	98.7100	99.6800	95.9900	95.9900
9746	2019-06-16 00:00:00+00	888	361	95.9900	97.8200	93.8000	94.8500
9747	2019-06-15 00:00:00+00	888	361	94.7200	95.2300	89.7800	90.5200
9748	2019-06-14 00:00:00+00	888	361	90.2900	90.7000	87.0000	89.3500
9749	2019-06-13 00:00:00+00	888	361	89.2600	91.9800	89.0100	90.1000
9750	2019-06-12 00:00:00+00	888	361	90.1000	90.1400	85.3800	86.1900
9751	2019-06-11 00:00:00+00	888	361	86.1300	87.5000	85.2800	86.7200
9752	2019-06-10 00:00:00+00	888	361	86.7200	87.3600	82.2900	83.0400
9753	2019-06-09 00:00:00+00	888	361	83.3800	87.8900	82.0700	87.2900
9754	2019-06-08 00:00:00+00	888	361	87.3200	88.5200	85.8900	87.6400
9755	2019-06-07 00:00:00+00	888	361	88.0000	89.5200	85.0900	86.7300
9756	2019-06-06 00:00:00+00	888	361	86.6900	87.1400	82.7800	84.6300
9757	2019-06-05 00:00:00+00	888	361	84.6500	87.0000	82.8700	83.6500
9758	2019-06-04 00:00:00+00	888	361	83.6500	89.0000	81.1700	88.8100
9759	2019-06-03 00:00:00+00	888	361	88.8500	96.0000	88.8300	94.7700
9760	2019-06-02 00:00:00+00	888	361	94.7700	96.1400	92.5600	92.8200
9761	2019-06-01 00:00:00+00	888	361	92.9600	93.9300	91.0700	93.2500
9762	2019-05-31 00:00:00+00	888	361	93.2500	93.6600	89.0700	91.6900
9763	2019-05-30 00:00:00+00	888	361	91.6100	98.9900	88.2800	93.7700
9764	2019-05-29 00:00:00+00	888	361	93.8100	95.9100	90.0000	95.6300
9765	2019-05-28 00:00:00+00	888	361	95.9300	98.4700	95.2800	97.3100
9766	2019-05-27 00:00:00+00	888	361	97.4300	98.8400	91.2200	91.2200
9767	2019-05-26 00:00:00+00	888	361	91.3000	92.3900	85.0000	86.6700
9768	2019-05-25 00:00:00+00	888	361	86.8000	87.3100	85.0200	85.3200
9769	2019-05-24 00:00:00+00	888	361	85.4400	86.9300	83.3600	84.8100
9770	2019-05-23 00:00:00+00	888	361	84.6900	85.3400	80.6600	83.1900
9771	2019-05-22 00:00:00+00	888	361	83.0700	91.2700	80.1800	88.5100
9772	2019-05-21 00:00:00+00	888	361	88.5100	92.5000	87.0600	87.1400
9773	2019-05-20 00:00:00+00	888	361	87.1900	90.3000	84.0000	89.7200
9774	2019-05-19 00:00:00+00	888	361	90.0900	90.6000	79.3900	79.5500
9775	2019-05-18 00:00:00+00	888	361	79.7500	83.0000	78.9500	82.6100
9776	2019-05-17 00:00:00+00	888	361	82.6100	87.7900	76.2500	87.1000
9777	2019-05-16 00:00:00+00	888	361	87.2000	97.2700	84.5100	94.0100
9778	2019-05-15 00:00:00+00	888	361	94.0000	95.0300	82.3700	83.4600
9779	2019-05-14 00:00:00+00	888	361	83.4600	84.9100	72.0000	79.5100
9780	2019-05-13 00:00:00+00	888	361	79.5300	82.6700	74.8600	75.4500
9781	2019-05-12 00:00:00+00	888	361	75.6600	81.4000	71.6000	77.5000
9782	2019-05-11 00:00:00+00	888	361	77.7300	81.7200	68.8700	68.8700
9783	2019-05-10 00:00:00+00	888	361	68.8400	69.3300	64.9700	65.7900
9784	2019-05-09 00:00:00+00	888	361	65.6100	69.1900	64.2600	68.0600
9785	2019-05-08 00:00:00+00	888	361	67.9300	68.2900	65.1200	65.9300
9786	2019-05-07 00:00:00+00	888	361	65.9300	71.2100	65.8300	67.5000
9787	2019-05-06 00:00:00+00	888	361	67.5000	68.2900	64.6700	66.7100
9788	2019-05-05 00:00:00+00	888	361	66.5200	68.9900	65.9800	68.5000
9789	2019-05-04 00:00:00+00	888	361	68.4000	68.9700	65.7000	67.5000
9790	2019-05-03 00:00:00+00	888	361	67.4600	68.5800	64.5900	65.1000
9791	2019-05-02 00:00:00+00	888	361	65.1000	66.5000	63.9200	65.4800
9792	2019-05-01 00:00:00+00	888	361	65.6400	65.6400	62.6600	62.6600
9793	2019-04-30 00:00:00+00	888	361	62.5500	62.7800	60.6900	61.0800
9794	2019-04-29 00:00:00+00	888	361	61.0800	62.5600	60.1100	61.9200
9795	2019-04-28 00:00:00+00	888	361	62.0700	63.5400	61.4200	63.0000
9796	2019-04-27 00:00:00+00	888	361	63.1200	64.5800	62.0000	62.4500
9797	2019-04-26 00:00:00+00	888	361	62.5000	65.4200	60.0300	61.7000
9798	2019-04-25 00:00:00+00	888	361	61.4900	67.4800	61.4900	67.3700
9799	2019-04-24 00:00:00+00	888	361	67.3100	70.4500	64.3600	68.2900
9800	2019-04-23 00:00:00+00	888	361	68.2900	70.7500	67.4400	68.2200
9801	2019-04-22 00:00:00+00	888	361	68.1700	69.0500	67.1900	68.1800
9802	2019-04-21 00:00:00+00	888	361	68.2900	69.9900	66.4500	69.1900
9803	2019-04-20 00:00:00+00	888	361	69.3500	69.9600	67.1200	68.2900
9804	2019-04-19 00:00:00+00	888	361	68.2700	69.4000	67.0300	68.7100
9805	2019-04-18 00:00:00+00	888	361	68.7400	69.8800	67.0200	67.0200
9806	2019-04-17 00:00:00+00	888	361	67.0100	69.4000	66.2300	68.1600
9807	2019-04-16 00:00:00+00	888	361	68.1600	69.6600	63.4100	63.8100
9808	2019-04-15 00:00:00+00	888	361	63.9100	66.8200	63.2700	66.3200
9809	2019-04-14 00:00:00+00	888	361	66.2500	67.0000	63.8100	64.8200
9810	2019-04-13 00:00:00+00	888	361	64.9200	67.3600	63.0700	65.3900
9811	2019-04-12 00:00:00+00	888	361	65.7300	68.5000	64.3600	66.1000
9812	2019-04-11 00:00:00+00	888	361	65.9700	71.1700	61.5100	70.6400
9813	2019-04-10 00:00:00+00	888	361	70.8600	72.0000	67.4900	67.7500
9814	2019-04-09 00:00:00+00	888	361	67.7500	70.5500	66.8200	70.4200
9815	2019-04-08 00:00:00+00	888	361	70.4700	72.2700	67.4000	69.3500
9816	2019-04-07 00:00:00+00	888	361	69.3400	70.0900	67.6300	67.8700
9817	2019-04-06 00:00:00+00	888	361	67.8200	69.9700	66.3200	68.9300
9818	2019-04-05 00:00:00+00	888	361	69.0800	69.0800	63.2200	63.7700
9819	2019-04-04 00:00:00+00	888	361	63.5700	66.7700	61.1500	65.8800
9820	2019-04-03 00:00:00+00	888	361	65.8800	72.9000	60.0100	68.8300
9821	2019-04-02 00:00:00+00	888	361	68.9400	70.0000	58.8700	60.0500
9822	2019-04-01 00:00:00+00	888	361	60.1300	60.5000	55.6600	56.0100
9823	2019-03-31 00:00:00+00	888	361	56.0700	56.8300	50.5600	53.5000
9824	2019-03-30 00:00:00+00	888	361	53.5300	54.0000	53.0100	53.5800
9825	2019-03-29 00:00:00+00	888	361	53.7200	54.1500	52.1800	52.5700
9826	2019-03-28 00:00:00+00	888	361	52.8000	53.3500	52.1800	53.2700
9827	2019-03-27 00:00:00+00	888	361	53.4800	53.6000	51.6700	51.8100
9828	2019-03-26 00:00:00+00	888	361	51.7400	52.0500	49.7600	51.2800
9829	2019-03-25 00:00:00+00	888	361	51.2100	52.9200	50.0000	52.5700
9830	2019-03-24 00:00:00+00	888	361	52.6400	52.8900	52.2000	52.5600
9831	2019-03-23 00:00:00+00	888	361	52.6700	53.2500	51.9300	52.9000
9832	2019-03-22 00:00:00+00	888	361	52.6600	53.2500	51.8300	52.2200
9833	2019-03-21 00:00:00+00	888	361	52.2800	54.2900	50.0000	54.2900
9834	2019-03-20 00:00:00+00	888	361	54.1900	54.6000	52.4100	52.8300
9835	2019-03-19 00:00:00+00	888	361	52.9000	54.0000	51.6100	51.9300
9836	2019-03-18 00:00:00+00	888	361	52.0600	53.0100	51.2700	52.3800
9837	2019-03-17 00:00:00+00	888	361	52.3600	53.5700	51.5400	53.5600
9838	2019-03-16 00:00:00+00	888	361	53.3500	54.8900	52.1000	52.1000
9839	2019-03-15 00:00:00+00	888	361	52.1000	52.2200	48.6700	51.9900
9841	2019-11-09 00:00:00+00	455	355	50802.1056	51209.1840	50314.6380	50596.4038
9842	2019-11-08 00:00:00+00	455	355	50596.3462	53406.3348	50148.0928	53135.2952
9843	2019-11-07 00:00:00+00	455	355	53147.9822	54063.7500	52483.6468	53857.0679
9844	2019-11-06 00:00:00+00	455	355	53856.4335	54443.8398	53342.9577	53675.8174
9845	2019-11-05 00:00:00+00	455	355	53681.1805	54524.8057	52914.7728	54164.0923
9846	2019-11-04 00:00:00+00	455	355	54169.5708	54863.4898	52569.2261	53034.1455
9847	2019-11-03 00:00:00+00	455	355	53024.0536	53992.0687	52282.6162	53572.7070
9848	2019-11-02 00:00:00+00	455	355	53570.8039	54056.4838	52975.0358	53235.6375
9849	2019-11-01 00:00:00+00	455	355	53236.8485	53510.1372	52074.2040	52713.5114
9850	2019-10-31 00:00:00+00	455	355	52713.4538	54236.7540	51399.4884	52789.4025
9851	2019-10-30 00:00:00+00	455	355	52793.4393	54264.6653	51907.0245	54251.8630
9852	2019-10-29 00:00:00+00	455	355	54251.8630	55072.9400	52316.4096	53080.2223
9853	2019-10-28 00:00:00+00	455	355	53084.2014	57103.4303	52823.8880	54947.3968
9854	2019-10-27 00:00:00+00	455	355	54957.2003	56485.6907	52329.9039	53227.5640
9855	2019-10-26 00:00:00+00	455	355	53227.5640	59801.7160	48846.9874	49916.7288
9856	2019-10-25 00:00:00+00	455	355	49911.7693	50742.0732	42449.4148	42745.8860
9857	2019-10-24 00:00:00+00	455	355	42745.8860	43272.2218	42316.7207	43069.1728
9858	2019-10-23 00:00:00+00	455	355	43058.5042	46408.8420	42097.6400	46250.0820
9859	2019-10-22 00:00:00+00	455	355	46249.7360	47852.8487	46134.4000	47272.0743
9860	2019-10-21 00:00:00+00	455	355	47272.0166	48054.7444	46953.4586	47422.4148
9861	2019-10-20 00:00:00+00	455	355	47422.4148	47847.1396	45384.7160	45845.3103
9862	2019-10-19 00:00:00+00	455	355	45834.5841	46700.1231	45366.9543	45828.1253
9863	2019-10-18 00:00:00+00	455	355	45828.8173	46797.5820	45073.3665	46542.1704
9864	2019-10-17 00:00:00+00	455	355	46541.4207	46854.7887	45725.1302	46105.6813
9865	2019-10-16 00:00:00+00	455	355	46086.7662	47179.1135	45655.7556	47053.0512
9866	2019-10-15 00:00:00+00	455	355	47052.9936	48458.4204	46653.4120	48134.6722
9867	2019-10-14 00:00:00+00	455	355	48142.3998	48376.8202	47305.0604	47721.6540
9868	2019-10-13 00:00:00+00	455	355	47720.3277	48737.3605	47057.0880	47875.8583
9869	2019-10-12 00:00:00+00	455	355	47864.9590	48441.1200	47576.1000	47621.9461
9870	2019-10-11 00:00:00+00	455	355	47625.1178	50629.6783	47359.1530	49351.2364
9871	2019-10-10 00:00:00+00	455	355	49352.4474	49848.2192	48524.8539	49376.2066
9872	2019-10-09 00:00:00+00	455	355	49368.0754	49998.1560	46797.5820	47119.3118
9873	2019-10-08 00:00:00+00	455	355	47105.4715	48008.6100	46646.2035	47234.8208
9874	2019-10-07 00:00:00+00	455	355	47230.6110	47863.9787	44761.9016	45299.9440
9875	2019-10-06 00:00:00+00	455	355	45293.8889	47021.7375	44894.5380	46869.9553
9876	2019-10-05 00:00:00+00	455	355	46862.1125	47192.0888	46209.2531	46924.9706
9877	2019-10-04 00:00:00+00	455	355	46925.2013	47474.6620	46163.2340	47428.6429
9878	2019-10-03 00:00:00+00	455	355	47425.9325	48400.7524	46480.4080	48210.4480
9879	2019-10-02 00:00:00+00	455	355	48210.1020	48290.6642	47006.4555	47822.1694
9880	2019-10-01 00:00:00+00	455	355	47820.8430	49017.8000	47132.3447	47806.5990
9881	2019-09-30 00:00:00+00	455	355	47802.9659	48079.3110	44462.0280	46382.6031
9882	2019-09-29 00:00:00+00	455	355	46387.1012	47455.7469	45500.0520	47284.1846
9883	2019-09-28 00:00:00+00	455	355	47280.8975	47950.9420	46140.6858	47157.8340
9884	2019-09-27 00:00:00+00	455	355	47160.3714	47662.6020	45281.7786	46500.5341
9885	2019-09-26 00:00:00+00	455	355	46501.9182	48821.6711	44692.7000	48614.4123
9886	2019-09-25 00:00:00+00	455	355	48614.4123	50344.1640	47377.9528	49003.6713
9887	2019-09-24 00:00:00+00	455	355	48978.2398	56485.7483	44981.0400	55950.6470
9888	2019-09-23 00:00:00+00	455	355	55950.9353	57956.2823	55452.2224	57829.7587
9889	2019-09-22 00:00:00+00	455	355	57834.4875	58181.2452	56825.8742	57582.3630
9890	2019-09-21 00:00:00+00	455	355	57589.5139	58686.9936	57091.3200	58636.3611
9891	2019-09-20 00:00:00+00	455	355	58640.2248	59288.4708	58022.0239	59073.3692
9892	2019-09-19 00:00:00+00	455	355	59076.7716	59542.2100	55666.9204	58569.9852
9893	2019-09-18 00:00:00+00	455	355	58573.3299	59155.9497	58244.6800	58749.1597
9894	2019-09-17 00:00:00+00	455	355	58751.1204	59253.8700	58406.2081	59107.8546
9895	2019-09-16 00:00:00+00	455	355	59117.2545	59715.2140	58117.8104	59417.3011
9896	2019-09-15 00:00:00+00	455	355	59409.6313	59744.0480	59122.0986	59587.2487
9897	2019-09-14 00:00:00+00	455	355	59599.9933	60089.9983	58950.1326	59652.5289
9898	2019-09-13 00:00:00+00	455	355	59640.5916	60199.6252	58550.3204	60061.2797
9899	2019-09-12 00:00:00+00	455	355	60061.2797	60256.1975	57898.6720	58583.4795
9900	2019-09-11 00:00:00+00	455	355	58581.0574	59357.6724	56975.9840	58234.2421
9901	2019-09-10 00:00:00+00	455	355	58234.0114	59888.1603	57396.9604	59412.9183
9902	2019-09-09 00:00:00+00	455	355	59416.0324	60436.0640	58063.0258	59866.5348
9903	2019-09-08 00:00:00+00	455	355	59866.1888	61084.8290	58867.4944	60297.0841
9904	2019-09-07 00:00:00+00	455	355	60296.9688	60885.8744	59332.1255	59390.6008
9905	2019-09-06 00:00:00+00	455	355	59390.7162	62891.9711	58533.0200	60915.4581
9906	2019-09-05 00:00:00+00	455	355	60923.3009	62858.1200	60263.0600	60931.5475
9907	2019-09-04 00:00:00+00	455	355	60937.8909	62275.6732	59801.0817	61196.4166
9908	2019-09-03 00:00:00+00	455	355	61216.1967	62125.7364	59236.5696	59628.7120
9909	2019-09-02 00:00:00+00	455	355	59628.7120	60263.0600	56010.0450	56073.9988
9910	2019-09-01 00:00:00+00	455	355	56082.0147	56687.6440	54899.9360	55296.3458
9911	2019-08-31 00:00:00+00	455	355	55289.0220	55848.6323	54327.5811	55261.8604
9912	2019-08-30 00:00:00+00	455	355	55272.1253	55914.8928	53921.9444	54778.8909
9913	2019-08-29 00:00:00+00	455	355	54775.6038	56076.3632	53746.5760	56059.0628
9914	2019-08-28 00:00:00+00	455	355	56059.0628	59392.2732	55367.1045	58738.8371
9915	2019-08-27 00:00:00+00	455	355	58735.1463	59923.2801	57962.5681	59822.4765
9916	2019-08-26 00:00:00+00	455	355	59814.6913	61151.1472	58463.4147	58490.8647
9917	2019-08-25 00:00:00+00	455	355	58490.8647	59588.3444	57131.5146	58444.2689
9918	2019-08-24 00:00:00+00	455	355	58442.7696	60086.7113	57033.6520	59906.4411
9919	2019-08-23 00:00:00+00	455	355	59914.4569	60234.2260	57782.1250	58244.1033
9920	2019-08-22 00:00:00+00	455	355	58243.9880	59063.5656	56295.5016	58480.0808
9921	2019-08-21 00:00:00+00	455	355	58490.1727	62305.2569	56849.1144	62053.7091
9922	2019-08-20 00:00:00+00	455	355	62053.7091	63146.2293	60897.4080	62943.0650
9923	2019-08-19 00:00:00+00	455	355	62947.7361	63031.1240	59159.2945	59433.6212
9924	2019-08-18 00:00:00+00	455	355	59437.1389	60551.4000	58129.3440	58913.9171
9925	2019-08-17 00:00:00+00	455	355	58913.7441	60350.3694	57668.0000	59577.6758
9926	2019-08-16 00:00:00+00	455	355	59579.9249	60759.1778	56226.3000	59379.4132
9927	2019-08-15 00:00:00+00	455	355	59363.0355	60320.7280	57154.7548	57986.0967
9928	2019-08-14 00:00:00+00	455	355	57958.4737	62843.5877	57253.3671	62819.8284
9929	2019-08-13 00:00:00+00	455	355	62816.0800	66065.3835	62214.8335	65732.0048
9930	2019-08-12 00:00:00+00	455	355	65718.9141	66767.3761	64791.8434	66543.5665
9931	2019-08-11 00:00:00+00	455	355	66606.3670	66894.8800	64081.3159	65218.1252
9932	2019-08-10 00:00:00+00	455	355	65218.5289	69115.0980	64991.8360	68509.4687
9933	2019-08-09 00:00:00+00	455	355	68509.5263	69465.0274	67471.5600	69167.9796
9934	2019-08-08 00:00:00+00	455	355	69200.2736	69547.6080	66439.3028	69057.6607
9935	2019-08-07 00:00:00+00	455	355	69057.6030	70015.6992	65642.5617	66212.6099
9936	2019-08-06 00:00:00+00	455	355	66212.6099	71108.6808	64742.1336	68221.2440
9937	2019-08-05 00:00:00+00	455	355	68214.3238	68841.2903	63018.4370	63031.0663
9938	2019-08-04 00:00:00+00	455	355	63026.6836	63665.4720	60851.2736	62378.6682
9939	2019-08-03 00:00:00+00	455	355	62378.6682	62885.6276	60539.4627	60688.3615
9940	2019-08-02 00:00:00+00	455	355	60688.3615	61531.7560	59290.4892	59830.5500
9941	2019-08-01 00:00:00+00	455	355	59830.4923	60366.0550	56880.6011	58132.4004
9942	2019-07-31 00:00:00+00	455	355	58132.4004	58301.1946	55101.7740	55217.1100
9943	2019-07-30 00:00:00+00	455	355	55212.5542	56020.3099	54219.4536	54836.9049
9944	2019-07-29 00:00:00+00	455	355	54828.6584	56105.1972	54179.0860	55024.1529
9945	2019-07-28 00:00:00+00	455	355	55024.1529	55332.3883	52852.7220	54663.0359
9946	2019-07-27 00:00:00+00	455	355	54649.1955	58755.9645	53821.5444	56653.0432
9947	2019-07-26 00:00:00+00	455	355	56653.0432	57033.5367	55574.6516	56988.3826
9948	2019-07-25 00:00:00+00	455	355	56975.2343	58677.1900	56053.4690	56303.5751
9949	2019-07-24 00:00:00+00	455	355	56302.8831	57304.6916	54928.7700	56888.2133
9950	2019-07-23 00:00:00+00	455	355	56888.9630	59651.6062	56641.5096	59646.4737
9951	2019-07-22 00:00:00+00	455	355	59630.4997	61607.6471	58244.6800	61071.2770
9952	2019-07-21 00:00:00+00	455	355	61067.2403	62384.6657	59328.8384	61936.9890
9953	2019-07-20 00:00:00+00	455	355	61936.7584	63832.6515	59686.3800	60584.7321
9954	2019-07-19 00:00:00+00	455	355	60576.1396	62106.7636	58370.6269	61293.2412
9955	2019-07-18 00:00:00+00	455	355	61284.7063	62212.2384	53354.4336	55758.3818
9956	2019-07-17 00:00:00+00	455	355	55752.9611	57420.0276	52247.2080	54381.9044
9957	2019-07-16 00:00:00+00	455	355	54436.2276	63596.2704	53919.6377	62476.2425
9958	2019-07-15 00:00:00+00	455	355	62504.7305	64011.4800	56860.6480	58672.4612
9959	2019-07-14 00:00:00+00	455	355	58672.4612	66041.3936	58261.9804	65486.5121
9960	2019-07-13 00:00:00+00	455	355	65486.3968	68048.1247	62454.4440	67801.5363
9961	2019-07-12 00:00:00+00	455	355	67801.5363	68538.4180	63855.7764	65412.1204
9962	2019-07-11 00:00:00+00	455	355	65412.1781	69845.9246	63434.8000	69825.0487
9963	2019-07-10 00:00:00+00	455	355	69826.5481	75816.5809	66716.1092	72364.7475
9964	2019-07-09 00:00:00+00	455	355	72335.3368	73784.6490	69593.7424	70577.5585
9965	2019-07-08 00:00:00+00	455	355	70577.5585	71150.9514	64703.4960	65799.1880
9966	2019-07-07 00:00:00+00	455	355	65777.5048	66537.3384	63979.0129	64913.6959
9967	2019-07-06 00:00:00+00	455	355	64913.9265	67269.7220	63230.1363	63333.3620
9968	2019-07-05 00:00:00+00	455	355	63266.0058	65780.9072	62260.9102	64274.8498
9969	2019-07-04 00:00:00+00	455	355	64274.8498	69201.6000	63751.9740	68855.5920
9970	2019-07-03 00:00:00+00	455	355	68855.5920	69154.8313	62518.1095	62540.8307
9971	2019-07-02 00:00:00+00	455	355	62528.5474	63081.5835	56093.6636	61271.6733
9972	2019-07-01 00:00:00+00	455	355	61271.8463	65062.6523	57841.0040	62593.4239
9973	2019-06-30 00:00:00+00	455	355	62593.4239	70239.6240	62085.5418	68642.9701
9974	2019-06-29 00:00:00+00	455	355	68642.9701	71747.8729	66174.1453	71549.0336
9975	2019-06-28 00:00:00+00	455	355	71511.9531	71969.6640	63336.0724	65337.7863
9976	2019-06-27 00:00:00+00	455	355	65337.7863	77725.1611	60696.1467	75535.7378
9977	2019-06-26 00:00:00+00	455	355	75509.3258	80562.1960	67707.9988	68170.9575
9978	2019-06-25 00:00:00+00	455	355	68168.5354	68336.5800	63584.7368	63761.1432
9979	2019-06-24 00:00:00+00	455	355	63761.1432	64263.0855	61248.0294	62892.4325
9980	2019-06-23 00:00:00+00	455	355	62893.1245	65699.0764	60869.6120	61871.9972
9981	2019-06-22 00:00:00+00	455	355	61874.8806	64357.4880	57216.5749	58589.8806
9982	2019-06-21 00:00:00+00	455	355	58589.8806	58677.1323	54888.7484	54888.7484
9983	2019-06-20 00:00:00+00	455	355	54883.3276	55303.6120	52911.5434	53364.5832
9984	2019-06-19 00:00:00+00	455	355	53374.5597	53654.3072	51670.5280	52373.9046
9985	2019-06-18 00:00:00+00	455	355	52371.4825	53840.9208	51612.8600	53701.1913
9986	2019-06-17 00:00:00+00	455	355	53711.7445	54461.6592	51612.8600	51630.1604
9987	2019-06-16 00:00:00+00	455	355	51632.0634	53821.5444	50517.1680	50809.9484
9988	2019-06-15 00:00:00+00	455	355	50798.0112	51122.6243	49407.8087	49887.8948
9989	2019-06-14 00:00:00+00	455	355	49882.8200	50081.2556	46966.6646	47382.5662
9990	2019-06-13 00:00:00+00	455	355	47394.6765	47921.0700	46192.2410	46870.4744
9991	2019-06-12 00:00:00+00	455	355	46870.4744	47287.7600	44917.5475	45470.6413
9992	2019-06-11 00:00:00+00	455	355	45470.6413	46192.0680	44359.5520	46024.8308
9993	2019-06-10 00:00:00+00	455	355	46034.9227	46249.7360	43314.4348	43986.6707
9994	2019-06-09 00:00:00+00	455	355	43989.9001	45759.5580	43289.4069	45530.5007
9995	2019-06-08 00:00:00+00	455	355	45520.9278	46391.8876	44698.4668	46012.9512
9996	2019-06-07 00:00:00+00	455	355	46022.1204	46711.0800	44620.5573	44909.3587
9997	2019-06-06 00:00:00+00	455	355	44904.3416	45373.9321	42931.4039	44854.6317
9998	2019-06-05 00:00:00+00	455	355	44845.5202	45538.6896	43670.7077	44329.6223
9999	2019-06-04 00:00:00+00	455	355	44329.5646	46801.3881	43141.5461	46801.3881
10000	2019-06-03 00:00:00+00	455	355	46802.3108	50753.3185	46600.3574	50321.0968
10001	2019-06-02 00:00:00+00	455	355	50320.9815	50833.0733	49156.2032	49277.8827
10002	2019-06-01 00:00:00+00	455	355	49271.9429	49744.4168	48685.4016	49334.9740
10003	2019-05-31 00:00:00+00	455	355	49334.9740	49559.8792	46760.0978	47674.7123
10004	2019-05-30 00:00:00+00	455	355	47688.7833	52329.4426	46163.2340	49862.6362
10005	2019-05-29 00:00:00+00	455	355	49857.9074	50459.5000	48479.1809	50268.4459
10006	2019-05-28 00:00:00+00	455	355	50261.3528	50739.1321	49079.1011	50474.0323
10007	2019-05-27 00:00:00+00	455	355	50495.9462	51372.4998	49531.0452	49666.7957
10008	2019-05-26 00:00:00+00	455	355	49677.6949	50401.8320	45173.7665	46267.0364
10009	2019-05-25 00:00:00+00	455	355	46280.9344	46663.7922	45605.8151	45929.7939
10010	2019-05-24 00:00:00+00	455	355	45931.8123	46884.0840	44784.9688	45269.0917
10011	2019-05-23 00:00:00+00	455	355	45278.0879	45794.0435	43026.0948	43987.9970
10012	2019-05-22 00:00:00+00	455	355	43991.6301	46226.6688	43049.1620	45583.5553
10013	2019-05-21 00:00:00+00	455	355	45585.8043	46378.4510	44813.8028	45772.0143
10014	2019-05-20 00:00:00+00	455	355	45777.7234	47034.1938	43556.6404	46987.5404
10015	2019-05-19 00:00:00+00	455	355	46990.6545	47720.7890	41769.3937	41851.5130
10016	2019-05-18 00:00:00+00	455	355	41852.2627	43008.7944	41270.7385	42416.4287
10017	2019-05-17 00:00:00+00	455	355	42416.3134	45701.8900	39865.8884	45377.0462
10018	2019-05-16 00:00:00+00	455	355	45365.0512	47979.7760	44433.1940	47109.4505
10019	2019-05-15 00:00:00+00	455	355	47114.0063	47570.3332	45269.3800	45818.7254
10020	2019-05-14 00:00:00+00	455	355	45831.9890	48245.0488	43825.1426	44955.7814
10021	2019-05-13 00:00:00+00	455	355	44927.4664	46711.0800	39617.9160	40184.4464
10022	2019-05-12 00:00:00+00	455	355	40179.0833	43376.6009	38925.9000	40807.2608
10023	2019-05-11 00:00:00+00	455	355	40807.1455	42351.3215	36750.9514	36764.2727
10024	2019-05-10 00:00:00+00	455	355	36753.7194	37304.9679	35592.6896	35811.5397
10025	2019-05-09 00:00:00+00	455	355	35807.0992	35895.7349	34506.8588	34523.8709
10026	2019-05-08 00:00:00+00	455	355	34527.5040	34685.6873	33287.1230	33714.6735
10027	2019-05-07 00:00:00+00	455	355	33714.6735	34764.6348	33146.0670	33158.6387
10028	2019-05-06 00:00:00+00	455	355	33146.3554	33476.2740	32404.4566	33292.7744
10029	2019-05-05 00:00:00+00	455	355	33306.8454	33677.5353	32847.6928	33619.4636
10030	2019-05-04 00:00:00+00	455	355	33617.2723	34024.1200	32221.7067	33278.0114
10031	2019-05-03 00:00:00+00	455	355	33289.9487	33701.1792	31588.0507	31687.4703
10032	2019-05-02 00:00:00+00	455	355	31676.2827	31936.5384	30967.7160	31043.8378
10033	2019-05-01 00:00:00+00	455	355	31043.8378	31152.2536	30657.4622	30690.5636
10034	2019-04-30 00:00:00+00	455	355	30684.0471	30794.5967	29942.0906	30207.3058
10035	2019-04-29 00:00:00+00	455	355	30207.3058	30748.5776	29865.1038	30620.6123
10036	2019-04-28 00:00:00+00	455	355	30607.4063	30794.7120	30330.3693	30539.1851
10037	2019-04-27 00:00:00+00	455	355	30539.1851	30809.1290	30319.9314	30650.5420
10038	2019-04-26 00:00:00+00	455	355	30645.3519	31775.0680	29766.0302	30105.4064
10039	2019-04-25 00:00:00+00	455	355	30102.1193	31670.3429	29422.2136	31227.2220
10040	2019-04-24 00:00:00+00	455	355	31227.2220	32191.4310	30756.3628	31664.9798
10041	2019-04-23 00:00:00+00	455	355	31678.8201	32294.0800	30750.9420	30893.5550
10042	2019-04-22 00:00:00+00	455	355	30893.5550	31140.7200	30035.5128	30318.4320
10043	2019-04-21 00:00:00+00	455	355	30311.1082	30646.7936	29785.5220	30523.1534
10044	2019-04-20 00:00:00+00	455	355	30516.3486	30756.7665	30160.9407	30325.7558
10045	2019-04-19 00:00:00+00	455	355	30325.7558	30679.3760	29843.1900	30324.3718
10046	2019-04-18 00:00:00+00	455	355	30324.3718	30489.0716	29980.4398	30001.2580
10047	2019-04-17 00:00:00+00	455	355	30003.6224	30162.6707	29680.5662	29835.8085
10048	2019-04-16 00:00:00+00	455	355	29835.8085	29974.2117	28856.7212	28977.8817
10049	2019-04-15 00:00:00+00	455	355	28977.8817	29799.2470	28545.6600	29591.0655
10050	2019-04-14 00:00:00+00	455	355	29591.1808	29716.2627	28834.0000	29107.6347
10051	2019-04-13 00:00:00+00	455	355	29094.7747	29404.9132	28857.0672	29105.0396
10052	2019-04-12 00:00:00+00	455	355	29110.8641	29298.6887	28033.6835	28934.1693
10053	2019-04-11 00:00:00+00	455	355	28934.1693	30752.4414	28413.0236	30609.3670
10054	2019-04-10 00:00:00+00	455	355	30611.6161	31267.5896	29612.5180	29699.0200
10055	2019-04-09 00:00:00+00	455	355	29699.0200	30208.8051	29276.1982	30208.6898
10056	2019-04-08 00:00:00+00	455	355	30200.1549	30592.8740	29058.9052	29815.9130
10057	2019-04-07 00:00:00+00	455	355	29815.9130	30183.4312	28983.9368	29076.6093
10058	2019-04-06 00:00:00+00	455	355	29087.1049	30016.1940	28422.1928	28862.6033
10059	2019-04-05 00:00:00+00	455	355	28862.5457	28996.7391	28145.5594	28249.4772
10060	2019-04-04 00:00:00+00	455	355	28249.5925	29059.3665	27548.0036	28445.2600
10061	2019-04-03 00:00:00+00	455	355	28445.3177	30419.9277	27412.4838	28010.4433
10062	2019-04-02 00:00:00+00	455	355	28011.0200	28245.7287	23877.6661	23900.7333
10063	2019-04-01 00:00:00+00	455	355	23900.8486	23982.3912	23453.5756	23657.9510
10064	2019-03-31 00:00:00+00	455	355	23666.6589	23736.8408	23543.3647	23684.1899
10065	2019-03-30 00:00:00+00	455	355	23684.0746	23874.5520	23367.0736	23668.3312
10066	2019-03-29 00:00:00+00	455	355	23662.6221	23780.6108	23205.7762	23229.9391
10067	2019-03-28 00:00:00+00	455	355	23227.5747	23296.1420	23078.7336	23295.4499
10068	2019-03-27 00:00:00+00	455	355	23286.6267	23344.0064	22698.9898	22771.7668
10069	2019-03-26 00:00:00+00	455	355	22770.4981	22830.6459	22455.9192	22695.0684
10070	2019-03-25 00:00:00+00	455	355	22698.8168	23063.1632	22425.4128	23017.3172
10071	2019-03-24 00:00:00+00	455	355	23022.1036	23101.9161	22778.8600	23101.8585
10072	2019-03-23 00:00:00+00	455	355	23101.8585	23175.7888	22940.3881	22997.3641
10073	2019-03-22 00:00:00+00	455	355	22991.8279	23113.3344	22884.1041	22956.7658
10074	2019-03-21 00:00:00+00	455	355	22955.5548	23466.9546	22375.2417	23315.4031
10075	2019-03-20 00:00:00+00	455	355	23315.4031	23355.5400	22954.7474	23168.0037
10076	2019-03-19 00:00:00+00	455	355	23156.7584	23245.9708	22894.1960	22997.0180
10077	2019-03-18 00:00:00+00	455	355	22996.9027	23280.5716	22798.0634	22962.5326
10078	2019-03-17 00:00:00+00	455	355	22958.4382	23136.4016	22778.9177	23101.6855
10079	2019-03-16 00:00:00+00	455	355	23101.6855	23395.7923	22617.2743	22631.5759
10080	2019-03-15 00:00:00+00	455	355	22627.5392	22716.6939	22330.2030	22358.5756
10081	2019-03-14 00:00:00+00	455	355	22358.5756	22605.8560	21973.9877	22294.4488
10082	2019-03-13 00:00:00+00	455	355	22294.4488	22453.3818	22144.5120	22390.6967
10083	2019-03-12 00:00:00+00	455	355	22390.9274	22520.5074	22064.1228	22326.8005
10084	2019-03-11 00:00:00+00	455	355	22326.8005	22703.7763	22086.8440	22582.7311
10085	2019-03-10 00:00:00+00	455	355	22587.5176	22740.9721	22384.9299	22740.9721
10086	2019-03-09 00:00:00+00	455	355	22738.7231	22904.2879	22229.5723	22287.9900
10087	2019-03-08 00:00:00+00	455	355	22288.0477	22675.0576	21913.8400	22338.4495
10088	2019-03-07 00:00:00+00	455	355	22338.5072	22521.6607	22146.8187	22270.4589
10089	2019-03-06 00:00:00+00	455	355	22270.4589	22530.8876	21989.3274	22245.8923
10090	2019-03-05 00:00:00+00	455	355	22246.7574	22358.4603	21357.6321	21430.0055
10091	2019-03-04 00:00:00+00	455	355	21425.3920	22086.8440	21168.1351	21956.0530
10092	2019-03-03 00:00:00+00	455	355	21958.5327	22115.6780	21806.1162	22029.0030
10093	2019-03-02 00:00:00+00	455	355	22028.7723	22152.0665	21753.8113	22041.6900
10094	2019-03-01 00:00:00+00	455	355	22046.4764	22242.5476	21988.8661	21996.0746
10095	2019-02-28 00:00:00+00	455	355	21992.7875	22421.3184	21705.4855	22017.8731
10096	2019-02-27 00:00:00+00	455	355	22018.0461	22137.8802	21205.5040	21967.5289
10097	2019-02-26 00:00:00+00	455	355	21967.0676	22153.2199	21781.2036	22077.8478
10098	2019-02-25 00:00:00+00	455	355	22074.8491	22332.8557	21567.8320	21588.3618
10099	2019-02-24 00:00:00+00	455	355	21588.3618	24209.0264	21410.1677	23747.6824
10100	2019-02-23 00:00:00+00	455	355	23746.2984	24001.5369	22681.6894	22848.0616
10101	2019-02-22 00:00:00+00	455	355	22848.0616	22997.9984	22644.2052	22705.6793
10102	2019-02-21 00:00:00+00	455	355	22705.6793	23162.2369	22496.4598	22892.6966
10103	2019-02-20 00:00:00+00	455	355	22892.6966	22992.1163	22321.3221	22532.9060
10104	2019-02-19 00:00:00+00	455	355	22535.4434	23035.5979	22236.7808	22475.2380
10105	2019-02-18 00:00:00+00	455	355	22482.4465	22634.6900	21077.6540	21150.4310
10106	2019-02-17 00:00:00+00	455	355	21150.2003	21337.7943	20785.8539	20859.7843
10107	2019-02-16 00:00:00+00	455	355	20866.6468	21038.4398	20748.4274	20774.8393
10108	2019-02-15 00:00:00+00	455	355	20774.7240	21067.4468	20607.3715	20706.0991
10109	2019-02-14 00:00:00+00	455	355	20706.0414	20912.7235	20576.5767	20808.5751
10110	2019-02-13 00:00:00+00	455	355	20814.6879	21164.1560	20712.9039	20942.1919
10111	2019-02-12 00:00:00+00	455	355	20941.9035	21150.3157	20658.6383	20939.5391
10112	2019-02-11 00:00:00+00	455	355	20939.5391	21250.0813	20850.0384	21220.3823
10113	2019-02-10 00:00:00+00	455	355	21222.1700	21250.6003	20816.7640	21136.3600
10114	2019-02-09 00:00:00+00	455	355	21136.3600	21221.9393	20905.3997	21108.0450
10115	2019-02-08 00:00:00+00	455	355	21100.9519	21530.8091	19451.9931	19597.8931
10116	2019-02-07 00:00:00+00	455	355	19597.8931	19759.6519	19549.4520	19647.4876
10117	2019-02-06 00:00:00+00	455	355	19638.0877	20084.1497	19491.7840	20019.8499
10118	2019-02-05 00:00:00+00	455	355	20019.9652	20062.5242	19886.4061	19971.6971
10119	2019-02-04 00:00:00+00	455	355	19971.6971	20096.6060	19799.2121	19942.2287
10120	2019-02-03 00:00:00+00	455	355	19942.2287	20247.7538	19757.0568	20207.2132
10121	2019-02-02 00:00:00+00	455	355	20211.3076	20336.0435	19839.4644	19965.8150
10122	2019-02-01 00:00:00+00	455	355	19965.0653	20114.5984	19614.0402	19803.7679
10123	2019-01-31 00:00:00+00	455	355	19803.7679	20121.5186	19715.5358	19938.7110
10124	2019-01-30 00:00:00+00	455	355	19942.6324	20056.9304	19532.7283	19665.0187
10125	2019-01-29 00:00:00+00	455	355	19670.7855	19857.6875	19318.3187	19803.1912
10126	2019-01-28 00:00:00+00	455	355	19804.0562	20516.8327	19493.3410	20472.4283
10127	2019-01-27 00:00:00+00	455	355	20476.9841	20639.3772	20103.0648	20562.2174
10128	2019-01-26 00:00:00+00	455	355	20560.0837	21123.4424	20443.3060	20568.3879
10129	2019-01-25 00:00:00+00	455	355	20560.3144	20686.3766	20313.6107	20582.1129
10130	2019-01-24 00:00:00+00	455	355	20585.2846	20697.0452	20352.3059	20489.2674
10131	2019-01-23 00:00:00+00	455	355	20488.4024	20806.4991	20267.4186	20589.8404
10132	2019-01-22 00:00:00+00	455	355	20592.8391	20809.4978	19808.0930	20338.8116
10133	2019-01-21 00:00:00+00	455	355	20338.9269	20526.9823	20042.5134	20410.2046
10134	2019-01-20 00:00:00+00	455	355	20410.3199	21301.0022	20039.6300	21139.6471
10135	2019-01-19 00:00:00+00	455	355	21137.0520	21452.4960	20727.2056	20730.8963
10136	2019-01-18 00:00:00+00	455	355	20730.8963	20875.8160	20562.9671	20837.2938
10137	2019-01-17 00:00:00+00	455	355	20853.9598	20960.5880	20359.0531	20713.4229
10138	2019-01-16 00:00:00+00	455	355	20713.4229	21019.9860	20434.7135	20489.7864
10139	2019-01-15 00:00:00+00	455	355	20489.7864	21039.7085	20279.6442	20910.8781
10140	2019-01-14 00:00:00+00	455	355	20910.9358	21174.9399	19993.6109	20054.3930
10141	2019-01-13 00:00:00+00	455	355	20050.0679	20824.4915	19845.2888	20668.7879
10142	2019-01-12 00:00:00+00	455	355	20663.1941	20865.3781	20356.8040	20768.0345
10143	2019-01-11 00:00:00+00	455	355	20768.0345	21094.9544	19981.9620	20679.0528
10144	2019-01-10 00:00:00+00	455	355	20679.0528	23044.1905	20414.4720	22871.4748
10145	2019-01-09 00:00:00+00	455	355	22874.8772	23106.4719	22663.7547	22810.2891
10146	2019-01-08 00:00:00+00	455	355	22808.4437	23469.7226	22507.8204	22933.1796
10147	2019-01-07 00:00:00+00	455	355	22925.6251	23170.4257	22614.6792	22995.8070
10148	2019-01-06 00:00:00+00	455	355	22995.6917	23226.9980	21567.8320	21747.2948
10149	2019-01-05 00:00:00+00	455	355	21746.3721	22150.2211	21631.2668	21856.6910
10150	2019-01-04 00:00:00+00	455	355	21867.7633	22050.1672	21357.7475	21724.6890
10151	2019-01-03 00:00:00+00	455	355	21722.2669	22275.6490	21510.1640	22245.8347
10152	2019-01-02 00:00:00+00	455	355	22251.5438	22387.5250	21628.0951	21893.3679
10153	2019-01-01 00:00:00+00	455	355	21897.3470	21972.4307	21002.6856	21344.2532
10154	2018-12-31 00:00:00+00	455	355	21353.8837	21971.5080	20935.3870	21931.8324
10155	2018-12-30 00:00:00+00	455	355	21924.8546	22510.7038	21094.3777	21318.1872
10156	2018-12-29 00:00:00+00	455	355	21310.1714	22444.3856	21164.1560	22138.7452
10157	2018-12-28 00:00:00+00	455	355	22140.2446	22416.9933	20414.7027	20575.3081
10158	2018-12-27 00:00:00+00	455	355	20575.4234	21994.4599	20385.6380	21785.4710
10159	2018-12-26 00:00:00+00	455	355	21785.4710	22128.0766	21087.6882	21599.8954
10160	2018-12-25 00:00:00+00	455	355	21601.2218	23182.5360	21028.1172	23125.5023
10161	2018-12-24 00:00:00+00	455	355	23113.3921	24209.0264	22633.7096	22661.8516
10162	2018-12-23 00:00:00+00	455	355	22661.8516	23191.3592	22317.5160	22772.5742
10163	2018-12-22 00:00:00+00	455	355	22772.5742	22946.0972	21827.3380	22145.9537
10164	2018-12-21 00:00:00+00	455	355	22136.7845	23874.4943	21706.2352	23366.2662
10165	2018-12-20 00:00:00+00	455	355	23353.3486	23759.2160	20962.3180	21106.5457
10166	2018-12-19 00:00:00+00	455	355	21119.2903	22563.9314	20890.5213	21066.1204
10167	2018-12-18 00:00:00+00	455	355	21066.0051	21213.6928	19748.2336	20235.8742
10168	2018-12-17 00:00:00+00	455	355	20236.1625	20673.9780	18546.0288	18622.2659
10169	2018-12-16 00:00:00+00	455	355	18619.0942	18995.8392	18373.0248	18521.2892
10170	2018-12-15 00:00:00+00	455	355	18521.3469	18894.9202	18201.5202	18599.0257
10171	2018-12-14 00:00:00+00	455	355	18593.1436	19234.5271	18321.1236	19042.3196
10172	2018-12-13 00:00:00+00	455	355	19042.3196	19953.1280	18773.8174	19874.5842
10173	2018-12-12 00:00:00+00	455	355	19866.6260	20137.6656	19318.7800	19487.3436
10174	2018-12-11 00:00:00+00	455	355	19494.0331	20068.4640	19170.6886	19803.2489
10175	2018-12-10 00:00:00+00	455	355	19796.7324	20818.1480	19434.7503	20463.4321
10176	2018-12-09 00:00:00+00	455	355	20445.4397	21094.9544	19572.7499	19672.6308
10177	2018-12-08 00:00:00+00	455	355	19670.1511	20154.9660	18580.6296	19627.7075
10178	2018-12-07 00:00:00+00	455	355	19627.5921	20472.0823	18595.6233	20234.2595
10179	2018-12-06 00:00:00+00	455	355	20234.2595	22490.4623	20183.8000	21731.8398
10180	2018-12-05 00:00:00+00	455	355	21739.9133	22894.1960	21596.6660	22784.5115
10181	2018-12-04 00:00:00+00	455	355	22788.3176	23557.3780	21804.2708	22402.6340
10182	2018-12-03 00:00:00+00	455	355	22398.3089	24099.4572	22069.5436	23993.0597
10183	2018-12-02 00:00:00+00	455	355	23995.7125	24872.1507	23661.4111	24168.5435
10184	2018-12-01 00:00:00+00	455	355	24163.0073	24797.1823	22853.8861	23305.1958
10185	2018-11-30 00:00:00+00	455	355	23305.4842	25035.7548	22738.4924	24772.5581
10186	2018-11-29 00:00:00+00	455	355	24773.2501	25664.4514	23791.7984	24578.4476
10187	2018-11-28 00:00:00+00	455	355	24594.5370	25342.0296	22342.1402	22349.9831
10188	2018-11-27 00:00:00+00	455	355	22347.5610	22721.1920	21274.4172	22285.5103
10189	2018-11-26 00:00:00+00	455	355	22272.5350	24255.1608	21342.9268	23578.6575
10190	2018-11-25 00:00:00+00	455	355	23561.8761	24410.8644	21064.1597	22684.7458
10191	2018-11-24 00:00:00+00	455	355	22677.5950	26106.3036	22056.2223	25464.0551
10192	2018-11-23 00:00:00+00	455	355	25492.7737	25858.3312	24352.8504	25206.1061
10193	2018-11-22 00:00:00+00	455	355	25200.9160	27229.5032	24999.0780	26879.5161
10194	2018-11-21 00:00:00+00	455	355	26879.4585	27606.8250	25453.7902	26296.0890
10195	2018-11-20 00:00:00+00	455	355	26290.0338	29112.1904	24947.1768	28334.5951
10196	2018-11-19 00:00:00+00	455	355	28315.1610	32663.1552	27997.8140	32651.2756
10197	2018-11-18 00:00:00+00	455	355	32651.6216	33090.8788	32392.1156	32469.9097
10198	2018-11-17 00:00:00+00	455	355	32457.2228	32620.4809	32094.7217	32585.7071
10199	2018-11-16 00:00:00+00	455	355	32616.6748	33348.7701	32001.4149	33199.9866
10200	2018-11-15 00:00:00+00	455	355	33178.7071	34252.1393	31160.4425	34123.3090
10201	2018-11-14 00:00:00+00	455	355	34153.3540	37385.2417	32622.0379	37247.6459
10202	2018-11-13 00:00:00+00	455	355	37240.0337	37472.6664	36856.4838	37205.5482
10203	2018-11-12 00:00:00+00	455	355	37213.5641	37466.8996	37028.6228	37199.9544
10204	2018-11-11 00:00:00+00	455	355	37194.7643	37265.8690	36648.0140	37110.2807
10205	2018-11-10 00:00:00+00	455	355	37098.1127	37343.2017	36970.9548	37022.7983
10206	2018-11-09 00:00:00+00	455	355	37022.7983	37550.6912	36855.6765	37367.9413
10207	2018-11-08 00:00:00+00	455	355	37367.9413	38026.2792	37300.9311	37936.6631
10208	2018-11-07 00:00:00+00	455	355	37936.6631	38148.2470	37536.1012	37615.2794
10209	2018-11-06 00:00:00+00	455	355	37594.4035	37664.7585	37168.0640	37305.3715
10210	2018-11-05 00:00:00+00	455	355	37305.3715	37509.5163	37086.4061	37402.5998
10211	2018-11-04 00:00:00+00	455	355	37402.5998	37628.3700	36671.0812	36838.3184
10212	2018-11-03 00:00:00+00	455	355	36833.0706	37138.0190	36590.3460	37096.6710
10213	2018-11-02 00:00:00+00	455	355	37103.4759	37255.4887	36839.4718	36965.1880
10214	2018-11-01 00:00:00+00	455	355	36965.1880	37153.4740	36611.4525	36731.7479
10215	2018-10-31 00:00:00+00	455	355	36745.6459	37068.9904	36013.7813	36503.9017
10216	2018-10-30 00:00:00+00	455	355	36508.8611	36878.6860	36428.9333	36587.4626
10217	2018-10-29 00:00:00+00	455	355	36587.4626	37513.0917	36417.3420	37426.1283
10218	2018-10-28 00:00:00+00	455	355	37426.1283	37565.9156	37213.1604	37516.4941
10219	2018-10-27 00:00:00+00	455	355	37516.4941	37820.6928	37271.0591	37706.9715
10220	2018-10-26 00:00:00+00	455	355	37706.9715	38060.8800	37570.7597	37646.4201
10221	2018-10-25 00:00:00+00	455	355	37646.1894	37917.2290	37500.3470	37869.4799
10222	2018-10-24 00:00:00+00	455	355	37861.9254	38233.8840	37758.2960	37792.7815
10223	2018-10-23 00:00:00+00	455	355	37792.7815	38032.0460	37573.2971	37952.4642
10224	2018-10-22 00:00:00+00	455	355	37952.4642	38285.7852	37687.5950	38003.9040
10225	2018-10-21 00:00:00+00	455	355	38003.8463	38429.3785	37945.5440	37978.5301
10226	2018-10-20 00:00:00+00	455	355	37993.9851	38162.6640	37516.2057	37650.7452
10227	2018-10-19 00:00:00+00	455	355	37650.7452	38338.4938	37616.8364	38170.2185
10228	2018-10-18 00:00:00+00	455	355	38170.2185	39191.1728	37870.5756	38862.5229
10229	2018-10-17 00:00:00+00	455	355	38873.3645	39278.3668	38499.2145	38999.4844
10230	2018-10-16 00:00:00+00	455	355	38979.3582	39790.9200	38464.5560	38940.3170
10231	2018-10-15 00:00:00+00	455	355	38940.3170	44289.0240	36330.8400	36557.7059
10232	2018-10-14 00:00:00+00	455	355	36557.7059	36999.7888	36376.9744	36520.6831
10233	2018-10-13 00:00:00+00	455	355	36520.7407	36590.3460	36244.7417	36319.3064
10234	2018-10-12 00:00:00+00	455	355	36319.3641	36676.8480	35806.0612	36058.1280
10235	2018-10-11 00:00:00+00	455	355	36057.9550	38256.4899	35782.9940	38235.0950
10236	2018-10-10 00:00:00+00	455	355	38239.6508	38406.5997	37657.2040	38387.6846
10237	2018-10-09 00:00:00+00	455	355	38387.3385	38553.2494	38101.2476	38481.9141
10238	2018-10-08 00:00:00+00	455	355	38481.9141	38727.5221	37985.9116	38148.8814
10239	2018-10-07 00:00:00+00	455	355	38148.8814	38291.5520	37628.3700	38040.3502
10240	2018-10-06 00:00:00+00	455	355	38027.8362	38354.9868	37869.2492	38266.4664
10241	2018-10-05 00:00:00+00	455	355	38266.4664	38620.2596	37732.6337	38012.9579
10242	2018-10-04 00:00:00+00	455	355	38025.0682	38311.5051	37513.5530	37541.9257
10243	2018-10-03 00:00:00+00	455	355	37541.8680	37766.7732	37080.5240	37632.9258
10244	2018-10-02 00:00:00+00	455	355	37632.9258	38291.5520	37449.5992	38118.5480
10245	2018-10-01 00:00:00+00	455	355	38127.8325	38447.7746	37541.8680	38214.1039
10246	2018-09-30 00:00:00+00	455	355	38214.1039	38418.4216	37674.5044	38047.3857
10247	2018-09-29 00:00:00+00	455	355	38040.0042	38268.4848	37279.8823	38260.2959
10248	2018-09-28 00:00:00+00	455	355	38260.2959	39299.5886	37719.9468	38574.8172
10249	2018-09-27 00:00:00+00	455	355	38574.8749	38925.9000	37103.5912	37298.7397
10250	2018-09-26 00:00:00+00	455	355	37283.0540	37818.6167	36790.4540	37167.6603
10251	2018-09-25 00:00:00+00	455	355	37181.6737	37968.6689	36475.1253	37953.7329
10252	2018-09-24 00:00:00+00	455	355	37953.5599	38810.5640	37812.9076	38676.8319
10253	2018-09-23 00:00:00+00	455	355	38683.6944	39146.3648	38416.9799	38770.4847
10254	2018-09-22 00:00:00+00	455	355	38770.4847	39439.3182	38216.5836	38977.8589
10255	2018-09-21 00:00:00+00	455	355	38977.9165	39126.9306	37432.2988	37438.0656
10256	2018-09-20 00:00:00+00	455	355	37438.0656	37714.8720	36475.0100	36861.3856
10257	2018-09-19 00:00:00+00	455	355	36860.7513	37586.2724	35310.1164	36540.6939
10258	2018-09-18 00:00:00+00	455	355	36541.0399	36849.8520	35898.2147	36034.9455
10259	2018-09-17 00:00:00+00	455	355	36034.9455	37679.3485	35759.9268	37484.6613
10260	2018-09-16 00:00:00+00	455	355	37513.0340	37626.1786	36734.5160	37570.4713
10261	2018-09-15 00:00:00+00	455	355	37570.4713	37861.6371	37288.8785	37349.4299
10262	2018-09-14 00:00:00+00	455	355	37349.4299	37974.3203	36824.5934	37411.4807
10263	2018-09-13 00:00:00+00	455	355	37411.4230	37686.0380	36546.5183	36553.5538
10264	2018-09-12 00:00:00+00	455	355	36553.5538	36676.8480	35710.1593	36290.4724
10265	2018-09-11 00:00:00+00	455	355	36301.4870	36930.5872	35579.3106	36399.9839
10266	2018-09-10 00:00:00+00	455	355	36400.0416	36757.4679	35875.2628	36055.5330
10267	2018-09-09 00:00:00+00	455	355	36047.1711	37143.9588	35416.9752	35668.0040
10268	2018-09-08 00:00:00+00	455	355	35667.9463	37357.3304	35240.9148	36881.8001
10269	2018-09-07 00:00:00+00	455	355	36881.8001	37737.9392	36446.1760	37581.3129
10270	2018-09-06 00:00:00+00	455	355	37576.5265	38781.7300	36129.0020	38621.8166
10271	2018-09-05 00:00:00+00	455	355	38637.5600	42658.7496	38533.7576	42438.1695
10272	2018-09-04 00:00:00+00	455	355	42438.2272	42731.9880	41677.6440	41884.2684
10273	2018-09-03 00:00:00+00	455	355	41884.3837	42318.3931	41472.6919	42109.1736
10274	2018-09-02 00:00:00+00	455	355	42109.2313	42359.7411	41099.9836	41530.0139
10275	2018-09-01 00:00:00+00	455	355	41521.0177	41953.4700	40418.0018	40432.2458
10276	2018-08-31 00:00:00+00	455	355	40432.2458	40880.8452	39721.7184	40280.1753
10277	2018-08-30 00:00:00+00	455	355	40280.1753	40734.5415	39126.6423	40559.1154
10278	2018-08-29 00:00:00+00	455	355	40547.6395	41139.2555	39862.0823	40811.6436
10279	2018-08-28 00:00:00+00	455	355	40806.5111	41146.1180	39560.2480	39832.7870
10280	2018-08-27 00:00:00+00	455	355	39840.7452	40024.5331	38329.0362	38637.5600
10281	2018-08-26 00:00:00+00	455	355	38637.5600	39071.6270	37876.3424	38831.5552
10282	2018-08-25 00:00:00+00	455	355	38831.5552	39150.8052	38352.7377	38562.4763
10283	2018-08-24 00:00:00+00	455	355	38531.6816	38781.7300	37141.0754	37628.3700
10284	2018-08-23 00:00:00+00	455	355	37628.4277	37928.1859	36574.6603	36691.6687
10285	2018-08-22 00:00:00+00	455	355	36681.9805	39690.2317	36049.4202	37368.7487
10286	2018-08-21 00:00:00+00	455	355	37368.8640	37484.2000	35956.4593	36048.2668
10287	2018-08-20 00:00:00+00	455	355	36070.4113	37657.2040	35869.4960	37354.6200
10288	2018-08-19 00:00:00+00	455	355	37354.6200	37720.6388	36330.8400	36838.0877
10289	2018-08-18 00:00:00+00	455	355	36838.0877	38176.2160	36261.6384	37940.0079
10290	2018-08-17 00:00:00+00	455	355	37971.4369	37974.3780	36246.6447	36423.1088
10291	2018-08-16 00:00:00+00	455	355	36398.5999	37368.8640	35786.4541	36130.5590
10292	2018-08-15 00:00:00+00	455	355	36141.4583	38112.7812	35593.3239	35685.4197
10293	2018-08-14 00:00:00+00	455	355	35685.4197	36044.4030	33908.7840	36032.4081
10294	2018-08-13 00:00:00+00	455	355	36021.4512	37743.7060	35437.2167	36380.2038
10295	2018-08-12 00:00:00+00	455	355	36378.8774	37324.4596	35350.4840	35884.2013
10296	2018-08-11 00:00:00+00	455	355	35940.7160	37414.9984	34433.5628	35455.0361
10297	2018-08-10 00:00:00+00	455	355	35431.2769	37921.7848	34752.9859	37655.9930
10298	2018-08-09 00:00:00+00	455	355	37655.9930	38192.4207	35630.7505	36234.3614
10299	2018-08-08 00:00:00+00	455	355	36244.3380	38761.7769	35310.1164	38756.5291
10300	2018-08-07 00:00:00+00	455	355	38753.2420	41235.2727	38464.5560	39992.7580
10301	2018-08-06 00:00:00+00	455	355	39991.7200	41290.2880	39335.3428	40507.0989
10302	2018-08-05 00:00:00+00	455	355	40507.0989	40885.8623	39688.7900	40424.3453
10303	2018-08-04 00:00:00+00	455	355	40424.3453	43221.0703	39940.8568	42745.0786
10304	2018-08-03 00:00:00+00	455	355	42782.6205	43481.6720	41996.3750	43399.2644
10305	2018-08-02 00:00:00+00	455	355	43399.2644	44458.9139	42995.6461	43828.1413
10306	2018-08-01 00:00:00+00	455	355	43854.0919	44692.7000	42847.3240	44610.0618
10307	2018-07-31 00:00:00+00	455	355	44582.7271	47172.4240	44017.9844	47122.8295
10308	2018-07-30 00:00:00+00	455	355	47137.3619	47708.7364	45361.6488	47351.1371
10309	2018-07-29 00:00:00+00	455	355	47351.1948	47832.7803	46797.5820	47432.1607
10310	2018-07-28 00:00:00+00	455	355	47432.1607	47556.1469	46520.7756	47221.8455
10311	2018-07-27 00:00:00+00	455	355	47221.8455	47777.9380	45009.8740	45673.0560
10312	2018-07-26 00:00:00+00	455	355	45673.0560	47954.9211	45269.7260	47147.2231
10313	2018-07-25 00:00:00+00	455	355	47147.2808	48970.3392	46422.7400	48425.2036
10314	2018-07-24 00:00:00+00	455	355	48425.2036	48937.0648	44381.2928	44529.2112
10315	2018-07-23 00:00:00+00	455	355	44525.5205	45171.3444	42530.1500	42644.2173
10316	2018-07-22 00:00:00+00	455	355	42644.2750	43726.1843	42302.3614	42669.9949
10317	2018-07-21 00:00:00+00	455	355	42667.2845	43011.5048	41584.3948	42313.7220
10318	2018-07-20 00:00:00+00	455	355	42314.0680	44404.3600	41941.9364	43071.4218
10319	2018-07-19 00:00:00+00	455	355	43056.1398	43690.8915	41924.6360	42569.8256
10320	2018-07-18 00:00:00+00	455	355	42569.9409	43758.9397	41667.3214	42198.2130
10321	2018-07-17 00:00:00+00	455	355	42198.2130	43072.1715	38360.9843	38772.0994
10322	2018-07-16 00:00:00+00	455	355	38772.2148	38910.3296	36506.1507	36643.1122
10323	2018-07-15 00:00:00+00	455	355	36636.5381	36878.6860	35900.6367	36047.6901
10324	2018-07-14 00:00:00+00	455	355	36053.9759	36532.6780	35627.2904	35838.1823
10325	2018-07-13 00:00:00+00	455	355	35838.1823	36619.1800	35235.1480	36050.5735
10326	2018-07-12 00:00:00+00	455	355	36045.7871	36793.7987	35004.4760	36781.0541
10327	2018-07-11 00:00:00+00	455	355	36781.0541	36942.1208	36209.6795	36313.0206
10328	2018-07-10 00:00:00+00	455	355	36313.0206	38527.9908	36117.4684	38422.9197
10329	2018-07-09 00:00:00+00	455	355	38419.1136	39226.1196	38131.4656	38707.3383
10330	2018-07-08 00:00:00+00	455	355	38707.3383	39098.9040	38449.7930	38945.9685
10331	2018-07-07 00:00:00+00	455	355	38966.1523	39318.9651	37535.4092	38117.3370
10332	2018-07-06 00:00:00+00	455	355	38117.2793	38340.8005	37051.6900	37652.5906
10333	2018-07-05 00:00:00+00	455	355	37652.5906	38706.7616	37215.0634	37977.4344
10334	2018-07-04 00:00:00+00	455	355	37985.7963	39127.2767	37144.5931	37547.6925
10335	2018-07-03 00:00:00+00	455	355	37564.1278	38518.4756	37270.8861	38149.0544
10336	2018-07-02 00:00:00+00	455	355	38149.0544	38551.0580	36167.1782	36681.5768
10337	2018-07-01 00:00:00+00	455	355	36658.4519	37144.3048	36048.2668	36856.0801
10338	2018-06-30 00:00:00+00	455	355	36850.2557	37651.3795	35673.5978	35742.1651
10339	2018-06-29 00:00:00+00	455	355	35742.1651	36330.8400	33332.1040	33741.6045
10340	2018-06-28 00:00:00+00	455	355	33758.7319	35598.5141	33603.1436	35377.7610
10341	2018-06-27 00:00:00+00	455	355	35371.9942	35698.9717	34433.5628	34980.7745
10342	2018-06-26 00:00:00+00	455	355	35008.9741	36172.4837	34802.6380	36054.0336
10343	2018-06-25 00:00:00+00	455	355	36054.0336	36619.1800	34958.1686	35396.3301
10344	2018-06-24 00:00:00+00	455	355	35390.6786	36099.0146	33159.1000	35465.7047
10345	2018-06-23 00:00:00+00	455	355	35465.7047	36100.1680	34649.7025	34865.6115
10346	2018-06-22 00:00:00+00	455	355	34860.3060	38833.4582	34133.3432	38739.5747
10347	2018-06-21 00:00:00+00	455	355	38746.2065	39185.4060	38479.3767	39002.0794
10348	2018-06-20 00:00:00+00	455	355	38992.2759	39313.6020	37782.9779	38868.2320
10349	2018-06-19 00:00:00+00	455	355	38875.2098	39454.9462	38366.5204	38703.2439
10350	2018-06-18 00:00:00+00	455	355	38709.4143	39181.8306	36792.1840	37161.6052
10351	2018-06-17 00:00:00+00	455	355	37193.6109	37997.6182	37034.3896	37383.2810
10352	2018-06-16 00:00:00+00	455	355	37391.8159	37830.2080	36451.1354	36792.2417
10353	2018-06-15 00:00:00+00	455	355	36843.5085	38445.2949	36690.1693	38283.8822
10354	2018-06-14 00:00:00+00	455	355	38268.3695	38752.8960	36100.1680	36289.2037
10355	2018-06-13 00:00:00+00	455	355	36289.2037	38220.0437	35285.2038	37657.2040
10356	2018-06-12 00:00:00+00	455	355	37657.2040	39736.1931	37109.3580	39629.4496
10357	2018-06-11 00:00:00+00	455	355	39629.4496	39917.7896	38118.5480	39012.4020
10358	2018-06-10 00:00:00+00	455	355	39012.3443	43203.3086	38192.4207	43203.3086
10359	2018-06-09 00:00:00+00	455	355	43203.3086	44311.9759	42962.6600	43847.5178
10360	2018-06-08 00:00:00+00	455	355	43847.5178	44424.5438	43429.7708	44352.9201
10361	2018-06-07 00:00:00+00	455	355	44352.9201	44779.2020	43943.0160	44166.7102
10362	2018-06-06 00:00:00+00	455	355	44166.9985	44398.5932	43060.9839	43981.3076
10363	2018-06-05 00:00:00+00	455	355	43971.8500	44286.0829	42432.1144	43176.0316
10364	2018-06-04 00:00:00+00	455	355	43176.0316	44753.3667	42942.4762	44486.5946
10365	2018-06-03 00:00:00+00	455	355	44486.5946	44904.2839	43827.6800	44039.9559
10366	2018-06-02 00:00:00+00	455	355	44058.5250	44388.9626	42887.6916	43372.1605
10367	2018-06-01 00:00:00+00	455	355	43372.1605	43876.9861	42417.9281	43164.5557
10368	2018-05-31 00:00:00+00	455	355	43164.5557	44398.5932	42256.2847	42570.9213
10369	2018-05-30 00:00:00+00	455	355	42535.6861	43648.9092	41869.8514	43066.3471
10370	2018-05-29 00:00:00+00	455	355	43027.7672	43481.6720	40557.6161	40938.5132
10371	2018-05-28 00:00:00+00	455	355	40938.5132	42887.6916	40702.1897	42322.4875
10372	2018-05-27 00:00:00+00	455	355	42322.4875	42674.3200	41700.3651	42293.7112
10373	2018-05-26 00:00:00+00	455	355	42293.4805	43943.0160	42097.6400	43002.9699
10374	2018-05-25 00:00:00+00	455	355	43003.0276	44113.4249	42144.6394	43706.5195
10375	2018-05-24 00:00:00+00	455	355	43683.5677	44581.5738	41907.2779	43262.2453
10376	2018-05-23 00:00:00+00	455	355	43262.2453	46318.3609	42818.4900	46002.4556
10377	2018-05-22 00:00:00+00	455	355	46002.3979	48442.1580	45760.1923	48365.5173
10378	2018-05-21 00:00:00+00	455	355	48332.9348	49567.4337	47893.2740	49173.3306
10379	2018-05-20 00:00:00+00	455	355	49173.3883	49646.3812	47079.5785	47480.8901
10380	2018-05-19 00:00:00+00	455	355	47480.8901	48388.0654	46686.4558	47506.9561
10381	2018-05-18 00:00:00+00	455	355	47517.3363	47709.9474	45626.3449	46358.2672
10382	2018-05-17 00:00:00+00	455	355	46373.4915	48810.1952	46013.2972	48037.4440
10383	2018-05-16 00:00:00+00	455	355	48037.4440	48948.5984	46613.1021	48798.6616
10384	2018-05-15 00:00:00+00	455	355	48798.6616	51093.7903	48448.6168	49959.9221
10385	2018-05-14 00:00:00+00	455	355	49959.7491	51209.1263	47731.8036	50054.1516
10386	2018-05-13 00:00:00+00	455	355	50054.1516	50536.5444	47852.9064	48876.1674
10387	2018-05-12 00:00:00+00	455	355	48821.3828	49864.8276	47016.7204	48475.3748
10388	2018-05-11 00:00:00+00	455	355	48441.1200	51998.0822	48100.8788	51913.9446
10389	2018-05-10 00:00:00+00	455	355	51913.8870	54179.7780	51728.1960	53688.9080
10390	2018-05-09 00:00:00+00	455	355	53688.9080	54150.2520	51699.3620	52927.6904
10391	2018-05-08 00:00:00+00	455	355	52982.8210	54644.4668	52250.3221	54006.0820
10392	2018-05-07 00:00:00+00	455	355	54006.0820	55878.3890	52944.9908	55713.1701
10393	2018-05-06 00:00:00+00	455	355	55701.5789	57494.9960	54306.1286	56883.6575
10394	2018-05-05 00:00:00+00	455	355	56883.7152	57783.3360	55834.1576	56018.6952
10395	2018-05-04 00:00:00+00	455	355	56018.6375	56687.8747	54904.8378	56226.3000
10396	2018-05-03 00:00:00+00	455	355	56226.3000	56768.3792	52872.3291	53330.2707
10397	2018-05-02 00:00:00+00	455	355	53330.4437	53446.7024	51729.3494	52313.4109
10398	2018-05-01 00:00:00+00	455	355	52313.4109	53337.0755	50750.6657	53319.8905
10399	2018-04-30 00:00:00+00	455	355	53319.8905	54546.0852	52621.9923	54306.1863
10400	2018-04-29 00:00:00+00	455	355	54317.4892	55191.2171	52845.4558	53908.0464
10401	2018-04-28 00:00:00+00	455	355	53908.0464	54366.3917	51151.5160	51413.0404
10402	2018-04-27 00:00:00+00	455	355	51413.0404	54179.0860	51261.0852	53441.1086
10403	2018-04-26 00:00:00+00	455	355	53435.1688	53674.3757	49892.1622	51151.4583
10404	2018-04-25 00:00:00+00	455	355	51151.4583	56282.9300	50344.1640	55470.6185
10405	2018-04-24 00:00:00+00	455	355	55476.5583	56116.7885	51451.3896	51520.5912
10406	2018-04-23 00:00:00+00	455	355	51520.6489	51814.6980	50430.6660	50665.3748
10407	2018-04-22 00:00:00+00	455	355	50672.9869	52020.3998	50330.7850	51412.8097
10408	2018-04-21 00:00:00+00	455	355	51412.8097	52103.0380	49392.6420	51048.4056
10409	2018-04-20 00:00:00+00	455	355	51076.4323	51497.5240	47155.6426	47713.5805
10410	2018-04-19 00:00:00+00	455	355	47737.5704	47841.3728	46595.7440	47137.7655
10411	2018-04-18 00:00:00+00	455	355	47132.0564	47497.8445	45373.1824	45505.5881
10412	2018-04-17 00:00:00+00	455	355	45471.3333	47136.0932	45127.5167	46508.7807
10413	2018-04-16 00:00:00+00	455	355	46508.7807	48550.6892	45367.4156	48182.0177
10414	2018-04-15 00:00:00+00	455	355	48181.6140	48611.4713	46128.7485	46157.4672
10415	2018-04-14 00:00:00+00	455	355	46128.6909	47207.0248	45038.7080	45427.8517
10416	2018-04-13 00:00:00+00	455	355	45427.4480	47480.3135	44588.8976	45690.2987
10417	2018-04-12 00:00:00+00	455	355	45690.3564	46204.9280	38886.6858	40101.0585
10418	2018-04-11 00:00:00+00	455	355	40101.1162	40309.9320	39139.2716	39442.3746
10419	2018-04-10 00:00:00+00	455	355	39467.4025	39733.2520	38383.8208	39107.8425
10420	2018-04-09 00:00:00+00	455	355	39114.5897	41434.4580	38124.3148	40431.2655
10421	2018-04-08 00:00:00+00	455	355	40471.4024	40996.9309	39675.5840	39766.7571
10422	2018-04-07 00:00:00+00	455	355	39766.6994	40771.2760	37981.7595	38068.8959
10423	2018-04-06 00:00:00+00	455	355	38068.8959	39502.5800	37484.2000	39041.2360
10424	2018-04-05 00:00:00+00	455	355	39045.6188	39802.4536	37868.7879	39191.7495
10425	2018-04-04 00:00:00+00	455	355	39191.7495	42833.0223	38677.9276	42704.3650
10426	2018-04-03 00:00:00+00	455	355	42704.3650	43366.3360	40431.0925	40736.5022
10427	2018-04-02 00:00:00+00	455	355	40690.5408	41088.4500	39012.4020	39289.2661
10428	2018-04-01 00:00:00+00	455	355	39289.2661	40655.8247	37080.5240	39917.7896
10429	2018-03-31 00:00:00+00	455	355	39928.8042	41655.6724	39081.6036	39446.2960
10430	2018-03-30 00:00:00+00	455	355	39446.2384	42053.9853	38061.4567	40887.5347
10431	2018-03-29 00:00:00+00	455	355	40887.4194	45990.2300	40027.9931	45842.0232
10432	2018-03-28 00:00:00+00	455	355	45842.0232	46762.9812	44565.8304	44955.1471
10433	2018-03-27 00:00:00+00	455	355	44955.1471	47379.6828	44577.3640	46908.4199
10434	2018-03-26 00:00:00+00	455	355	46908.4776	49103.6677	45159.8108	48845.6034
10435	2018-03-25 00:00:00+00	455	355	48845.6610	49997.2910	48243.7224	49198.0125
10436	2018-03-24 00:00:00+00	455	355	49288.0322	51900.9117	48965.8988	51313.2171
10437	2018-03-23 00:00:00+00	455	355	51313.1594	51376.4212	47685.6692	50286.4960
10438	2018-03-22 00:00:00+00	455	355	50303.2197	52477.8800	48816.5387	51236.9800
10439	2018-03-21 00:00:00+00	455	355	51238.0180	52921.9813	50462.9601	51381.9573
10440	2018-03-20 00:00:00+00	455	355	51382.0727	52189.5400	47749.1040	49565.7037
10441	2018-03-19 00:00:00+00	455	355	49594.4800	50201.3204	46644.1851	47224.3252
10442	2018-03-18 00:00:00+00	455	355	47230.0343	47964.7823	42224.5096	45119.5009
10443	2018-03-17 00:00:00+00	455	355	45124.0566	48144.8218	44531.1719	47633.7680
10444	2018-03-16 00:00:00+00	455	355	47633.7680	49661.6056	45557.7200	47524.0835
10445	2018-03-15 00:00:00+00	455	355	47524.0835	48614.1240	44116.0200	47195.5489
10446	2018-03-14 00:00:00+00	455	355	47114.7560	53826.0425	45559.3347	52777.2923
10447	2018-03-13 00:00:00+00	455	355	52766.2200	54634.6632	50880.4764	52658.6115
10448	2018-03-12 00:00:00+00	455	355	52658.6115	57027.1932	50632.5040	54978.1915
10449	2018-03-11 00:00:00+00	455	355	54978.1915	56168.6320	48729.4600	50576.1047
10450	2018-03-10 00:00:00+00	455	355	50576.1047	54726.9320	49981.2593	53227.5640
10451	2018-03-09 00:00:00+00	455	355	53210.2636	54265.5880	48031.6772	53441.3393
10452	2018-03-08 00:00:00+00	455	355	53467.6936	58238.9132	52247.2080	57148.9880
10453	2018-03-07 00:00:00+00	455	355	57148.9880	62852.3532	54146.2729	61799.7969
10454	2018-03-06 00:00:00+00	455	355	61799.7969	66058.6940	60871.3421	66058.6940
10455	2018-03-05 00:00:00+00	455	355	66052.9272	67529.2280	65828.0797	66404.7020
10456	2018-03-04 00:00:00+00	455	355	66404.7020	66693.0420	63723.2553	66113.3056
10457	2018-03-03 00:00:00+00	455	355	66113.3633	66571.9392	63521.3597	63659.6475
10458	2018-03-02 00:00:00+00	455	355	63659.7052	64588.1600	62108.4360	62992.8324
10459	2018-03-01 00:00:00+00	455	355	62973.4560	63783.1724	59052.0320	59545.9008
10460	2018-02-28 00:00:00+00	455	355	59552.3596	63999.9464	59398.0400	61037.7142
10461	2018-02-27 00:00:00+00	455	355	60949.5399	62685.1160	58365.7828	59519.1428
10462	2018-02-26 00:00:00+00	455	355	59536.4432	60230.3046	53919.5800	55303.6120
10463	2018-02-25 00:00:00+00	455	355	55303.6120	56785.6796	53485.9166	55906.3003
10464	2018-02-24 00:00:00+00	455	355	55906.3003	60533.9266	53931.1136	58423.6815
10465	2018-02-23 00:00:00+00	455	355	58423.6815	60176.5580	55189.3717	56604.3137
10466	2018-02-22 00:00:00+00	455	355	56578.3055	63050.9618	55816.8572	60199.7405
10467	2018-02-21 00:00:00+00	455	355	60191.5517	65188.0802	58821.3600	64559.7297
10468	2018-02-20 00:00:00+00	455	355	64593.8691	67967.5625	64014.8824	64283.1539
10469	2018-02-19 00:00:00+00	455	355	64317.1204	64876.5000	59226.9390	59830.6077
10470	2018-02-18 00:00:00+00	455	355	59879.1641	65014.9032	58129.3440	63662.8769
10471	2018-02-17 00:00:00+00	455	355	63662.8769	63867.7137	57956.3400	58568.0245
10472	2018-02-16 00:00:00+00	455	355	58590.5727	59532.8101	55741.8888	57673.1325
10473	2018-02-15 00:00:00+00	455	355	57668.5190	58933.8126	53639.8902	54496.1447
10474	2018-02-14 00:00:00+00	455	355	54496.2023	54724.6253	49208.1044	49220.6184
10475	2018-02-13 00:00:00+00	455	355	49247.8953	51612.8600	48158.5468	51341.8204
10476	2018-02-12 00:00:00+00	455	355	51341.8204	51837.7652	46440.0404	46502.4372
10477	2018-02-11 00:00:00+00	455	355	46502.7832	49300.3732	44557.3532	49213.8135
10478	2018-02-10 00:00:00+00	455	355	49213.7559	52280.5401	46826.4160	50078.4875
10479	2018-02-09 00:00:00+00	455	355	50078.4299	50390.2984	44922.7953	44922.7953
10480	2018-02-08 00:00:00+00	455	355	44888.8865	45234.7792	43666.7286	43821.9132
10481	2018-02-07 00:00:00+00	455	355	43821.9132	48879.3968	41232.6777	44144.9693
10482	2018-02-06 00:00:00+00	455	355	44128.3610	45430.8504	34600.8577	40019.4583
10483	2018-02-05 00:00:00+00	455	355	40021.5343	48341.9310	38205.0500	47172.3663
10484	2018-02-04 00:00:00+00	455	355	47200.1623	54023.3824	45730.7240	53054.3293
10485	2018-02-03 00:00:00+00	455	355	53054.3293	54628.9541	47454.9972	51168.9894
10486	2018-02-02 00:00:00+00	455	355	51168.9894	53342.9000	46192.1833	53195.9619
10487	2018-02-01 00:00:00+00	455	355	53195.9619	59599.8780	50465.2091	59312.1147
10488	2018-01-31 00:00:00+00	455	355	59312.1147	60123.7918	55937.9600	58994.3640
10489	2018-01-30 00:00:00+00	455	355	59037.6727	65213.3965	57091.3200	64877.1343
10490	2018-01-29 00:00:00+00	455	355	64882.2668	69057.5453	64239.5569	68509.2957
10491	2018-01-28 00:00:00+00	455	355	68509.2957	70608.6992	65787.6544	66318.0847
10492	2018-01-27 00:00:00+00	455	355	66266.2988	67183.2200	62527.6247	63948.0452
10493	2018-01-26 00:00:00+00	455	355	63948.0452	67142.8524	59462.3398	64499.9280
10494	2018-01-25 00:00:00+00	455	355	64445.5470	68013.9275	63147.6710	65452.9493
10495	2018-01-24 00:00:00+00	455	355	65453.1223	66724.6441	60551.4000	62276.4806
10496	2018-01-23 00:00:00+00	455	355	62276.7112	65735.7532	57120.1540	62051.0563
10497	2018-01-22 00:00:00+00	455	355	62051.0563	68776.8752	57092.7040	66491.2040
10498	2018-01-21 00:00:00+00	455	355	66491.2040	73813.8866	63232.9620	73813.8866
10499	2018-01-20 00:00:00+00	455	355	73814.6940	75539.3132	65813.3167	66173.9147
10500	2018-01-19 00:00:00+00	455	355	66173.9147	68019.4060	59744.0480	63204.1280
10501	2018-01-18 00:00:00+00	455	355	63215.4886	68502.7792	60178.4610	63276.7320
10502	2018-01-17 00:00:00+00	455	355	63370.1542	67361.9331	52119.9924	62858.0623
10503	2018-01-16 00:00:00+00	455	355	62858.1200	78099.3687	52103.0380	77851.8000
10504	2018-01-15 00:00:00+00	455	355	78082.0683	82176.8423	75820.6754	77724.8151
10505	2018-01-14 00:00:00+00	455	355	77707.5723	82693.0286	72484.0626	81946.2280
10506	2018-01-13 00:00:00+00	455	355	81946.2280	84079.9440	79040.6258	79293.2117
10507	2018-01-12 00:00:00+00	455	355	79235.8897	81368.2793	72085.0000	76345.2812
10508	2018-01-11 00:00:00+00	455	355	76345.3965	86321.3838	65741.5200	86155.9920
10509	2018-01-10 00:00:00+00	455	355	85966.2066	86246.3001	75725.6385	83047.6868
10510	2018-01-09 00:00:00+00	455	355	83041.9200	89385.4000	80798.9231	85939.9677
10511	2018-01-08 00:00:00+00	455	355	85939.9677	94127.4396	73884.2416	93530.8642
10512	2018-01-07 00:00:00+00	455	355	93133.9930	98612.0493	90019.7480	98438.0650
10513	2018-01-06 00:00:00+00	455	355	98438.0650	98861.0021	92333.4458	97807.1771
10514	2018-01-05 00:00:00+00	455	355	97807.1771	99051.9408	84195.2800	86845.4706
10515	2018-01-04 00:00:00+00	455	355	86845.3553	88116.7040	80262.5531	86037.8303
10516	2018-01-03 00:00:00+00	455	355	86037.8303	88275.6370	81600.2200	84714.2920
10517	2018-01-02 00:00:00+00	455	355	84628.4243	89232.5221	74334.1673	77172.2403
10518	2018-01-01 00:00:00+00	455	355	77159.7840	79688.8141	73526.7000	79095.4104
55574	2019-12-27 00:10:00+00	355	263	0.1513	0.1513	0.1513	0.1513
10520	2019-11-07 00:00:00+00	914	361	1306.9399	1322.6500	1293.7500	1294.2800
10521	2019-11-06 00:00:00+00	914	361	1291.0100	1292.9900	1282.2700	1290.0900
10522	2019-11-05 00:00:00+00	914	361	1291.4399	1297.2400	1289.3800	1291.2000
10523	2019-11-04 00:00:00+00	914	361	1289.6100	1292.5000	1276.1100	1276.1100
10524	2019-11-01 00:00:00+00	914	361	1272.2500	1273.0000	1259.7100	1265.8000
10525	2019-10-31 00:00:00+00	914	361	1258.8000	1266.5200	1249.4800	1260.0000
10526	2019-10-30 00:00:00+00	914	361	1260.7000	1268.0200	1250.6500	1255.1500
10527	2019-10-29 00:00:00+00	914	361	1260.6600	1280.8000	1255.6100	1276.0000
10528	2019-10-28 00:00:00+00	914	361	1288.9800	1299.2400	1272.3101	1275.0000
10529	2019-10-25 00:00:00+00	914	361	1264.3000	1268.0000	1249.1500	1252.0000
10530	2019-10-24 00:00:00+00	914	361	1259.1100	1262.9000	1252.3500	1259.1100
10531	2019-10-23 00:00:00+00	914	361	1257.6300	1258.0400	1240.2100	1240.2100
10532	2019-10-22 00:00:00+00	914	361	1241.2000	1248.7300	1239.8500	1244.4800
10533	2019-10-21 00:00:00+00	914	361	1244.2800	1253.5100	1239.9900	1248.7000
10534	2019-10-18 00:00:00+00	914	361	1244.4100	1258.1100	1240.1400	1254.6899
10535	2019-10-17 00:00:00+00	914	361	1252.8000	1263.7500	1249.8700	1251.4000
10536	2019-10-16 00:00:00+00	914	361	1243.0000	1254.1899	1238.5300	1241.8101
10537	2019-10-15 00:00:00+00	914	361	1242.2400	1247.1300	1220.9200	1221.5000
10538	2019-10-14 00:00:00+00	914	361	1217.7700	1225.8800	1211.8800	1213.8900
10539	2019-10-11 00:00:00+00	914	361	1215.7100	1228.7500	1213.6400	1224.0300
10540	2019-10-10 00:00:00+00	914	361	1209.4700	1215.6200	1197.8600	1198.6000
10541	2019-10-09 00:00:00+00	914	361	1202.4000	1208.4600	1198.1200	1201.3300
10542	2019-10-08 00:00:00+00	914	361	1190.1300	1206.8700	1189.4800	1198.7700
10543	2019-10-07 00:00:00+00	914	361	1208.2500	1218.9100	1204.3600	1207.0000
10544	2019-10-04 00:00:00+00	914	361	1210.9600	1212.4600	1190.9700	1194.2900
10545	2019-10-03 00:00:00+00	914	361	1189.4301	1191.0000	1163.1400	1183.3400
10546	2019-10-02 00:00:00+00	914	361	1177.9200	1198.7600	1172.6300	1196.5000
10547	2019-10-01 00:00:00+00	914	361	1206.0000	1232.8600	1205.5500	1222.4900
10548	2019-09-30 00:00:00+00	914	361	1221.1400	1227.4100	1213.4200	1220.6000
10549	2019-09-27 00:00:00+00	914	361	1225.9500	1244.9900	1215.2000	1242.8300
10550	2019-09-26 00:00:00+00	914	361	1242.2900	1244.6700	1231.8199	1242.1400
10551	2019-09-25 00:00:00+00	914	361	1245.9399	1248.0200	1209.2000	1216.0100
10552	2019-09-24 00:00:00+00	914	361	1218.3300	1247.1100	1210.6400	1240.0000
10553	2019-09-23 00:00:00+00	914	361	1234.6899	1239.6801	1223.7800	1226.5699
10554	2019-09-20 00:00:00+00	914	361	1229.8400	1242.8000	1223.5800	1233.6400
10555	2019-09-19 00:00:00+00	914	361	1238.7500	1244.3400	1232.3101	1232.3199
10556	2019-09-18 00:00:00+00	914	361	1232.6500	1236.2400	1216.4700	1230.2400
10557	2019-09-17 00:00:00+00	914	361	1229.8800	1235.0000	1223.3500	1231.6300
10558	2019-09-16 00:00:00+00	914	361	1231.6300	1239.0200	1225.1899	1230.4399
10559	2019-09-13 00:00:00+00	914	361	1240.0300	1241.0500	1227.0800	1232.1100
10560	2019-09-12 00:00:00+00	914	361	1234.9700	1242.4200	1222.5601	1223.4700
10561	2019-09-11 00:00:00+00	914	361	1220.0000	1222.4700	1202.2800	1203.8900
10562	2019-09-10 00:00:00+00	914	361	1205.7000	1210.0000	1196.0100	1196.0900
10563	2019-09-09 00:00:00+00	914	361	1205.2700	1220.5500	1193.1700	1207.0800
10564	2019-09-06 00:00:00+00	914	361	1206.3199	1212.9500	1203.2600	1209.1400
10565	2019-09-05 00:00:00+00	914	361	1212.1899	1214.0000	1192.6899	1193.6600
10566	2019-09-04 00:00:00+00	914	361	1182.2700	1184.8800	1171.5300	1179.4500
10567	2019-09-03 00:00:00+00	914	361	1169.5500	1189.0800	1163.7100	1181.8500
10568	2019-08-30 00:00:00+00	914	361	1190.5300	1200.3500	1185.7200	1200.3500
10569	2019-08-29 00:00:00+00	914	361	1194.2400	1199.1899	1185.2800	1186.4200
10570	2019-08-28 00:00:00+00	914	361	1173.7500	1178.5000	1160.2500	1164.8700
10571	2019-08-27 00:00:00+00	914	361	1170.8199	1185.0000	1164.5601	1183.0000
10572	2019-08-26 00:00:00+00	914	361	1171.1801	1171.8600	1154.8500	1159.4500
10573	2019-08-23 00:00:00+00	914	361	1153.5800	1195.6700	1150.0000	1185.1700
10574	2019-08-22 00:00:00+00	914	361	1191.5200	1198.7800	1178.9100	1193.8000
10575	2019-08-21 00:00:00+00	914	361	1191.5800	1200.5601	1187.9200	1195.8199
10576	2019-08-20 00:00:00+00	914	361	1183.5300	1198.0000	1183.0500	1195.3500
10577	2019-08-19 00:00:00+00	914	361	1200.4399	1209.3900	1190.4000	1191.8300
10578	2019-08-16 00:00:00+00	914	361	1179.2100	1183.8400	1173.0000	1180.7900
10579	2019-08-15 00:00:00+00	914	361	1169.3200	1176.4200	1163.0000	1168.4300
10580	2019-08-14 00:00:00+00	914	361	1164.2500	1182.7900	1161.0700	1176.0700
10581	2019-08-13 00:00:00+00	914	361	1196.7300	1205.4300	1172.9950	1174.3500
10582	2019-08-12 00:00:00+00	914	361	1174.5000	1185.6100	1168.7200	1180.0000
10583	2019-08-09 00:00:00+00	914	361	1188.9000	1204.4600	1184.8900	1199.9950
10584	2019-08-08 00:00:00+00	914	361	1206.1900	1206.2800	1173.9949	1186.4300
10585	2019-08-07 00:00:00+00	914	361	1175.9100	1179.8700	1150.8400	1157.8000
10586	2019-08-06 00:00:00+00	914	361	1171.0800	1181.4000	1161.5300	1165.5200
10587	2019-08-05 00:00:00+00	914	361	1154.7500	1176.8800	1142.7500	1172.9700
10588	2019-08-02 00:00:00+00	914	361	1196.3200	1209.5000	1190.0000	1203.0000
10589	2019-08-01 00:00:00+00	914	361	1211.7800	1236.3000	1207.0000	1217.6300
10590	2019-07-31 00:00:00+00	914	361	1218.2000	1234.9100	1208.1800	1224.8700
10591	2019-07-30 00:00:00+00	914	361	1228.0000	1236.9100	1225.3200	1227.0000
10592	2019-07-29 00:00:00+00	914	361	1241.8400	1248.9900	1230.2000	1242.5000
10593	2019-07-26 00:00:00+00	914	361	1245.2200	1268.3900	1227.8814	1228.0000
10594	2019-07-25 00:00:00+00	914	361	1135.9400	1143.5900	1123.7100	1138.9500
10595	2019-07-24 00:00:00+00	914	361	1139.7300	1145.4600	1128.5100	1132.6200
10596	2019-07-23 00:00:00+00	914	361	1148.0500	1148.8600	1132.8368	1143.4500
10597	2019-07-22 00:00:00+00	914	361	1139.2100	1140.0200	1125.2100	1135.4700
10598	2019-07-19 00:00:00+00	914	361	1131.5500	1151.5800	1131.2500	1149.3200
10599	2019-07-18 00:00:00+00	914	361	1147.2400	1148.1994	1132.8600	1142.0000
10600	2019-07-17 00:00:00+00	914	361	1146.7400	1158.4400	1146.6200	1150.9200
10601	2019-07-16 00:00:00+00	914	361	1153.4600	1158.5800	1146.7300	1146.7300
10602	2019-07-15 00:00:00+00	914	361	1150.5100	1150.6800	1140.0000	1145.3400
10603	2019-07-12 00:00:00+00	914	361	1145.3400	1147.5000	1138.5600	1142.9536
10604	2019-07-11 00:00:00+00	914	361	1144.0800	1153.1822	1139.5300	1146.1600
10605	2019-07-10 00:00:00+00	914	361	1140.9100	1142.3400	1130.6600	1132.3200
10606	2019-07-09 00:00:00+00	914	361	1124.2900	1127.8600	1107.1500	1110.3200
10607	2019-07-08 00:00:00+00	914	361	1116.7900	1127.2100	1111.7600	1125.8700
10608	2019-07-05 00:00:00+00	914	361	1132.6650	1134.6500	1117.5000	1119.3700
10609	2019-07-03 00:00:00+00	914	361	1122.9900	1127.9306	1114.8500	1118.5000
10610	2019-07-02 00:00:00+00	914	361	1112.6000	1112.8900	1099.6700	1104.8285
10611	2019-07-01 00:00:00+00	914	361	1100.0000	1108.5900	1095.3300	1101.0400
10612	2019-06-28 00:00:00+00	914	361	1082.8000	1082.8000	1073.8000	1077.2300
10613	2019-06-27 00:00:00+00	914	361	1076.6300	1088.4650	1075.8500	1086.7500
10614	2019-06-26 00:00:00+00	914	361	1080.3200	1095.1200	1073.6870	1091.0000
10615	2019-06-25 00:00:00+00	914	361	1087.5800	1115.7000	1084.6000	1115.0800
10616	2019-06-24 00:00:00+00	914	361	1116.7000	1123.5700	1113.3100	1120.0000
10617	2019-06-21 00:00:00+00	914	361	1125.3700	1126.5700	1109.7200	1109.8600
10618	2019-06-20 00:00:00+00	914	361	1113.2000	1122.7200	1107.0000	1121.7000
10619	2019-06-19 00:00:00+00	914	361	1104.5100	1109.4300	1096.0529	1107.2400
10620	2019-06-18 00:00:00+00	914	361	1105.2400	1118.7800	1100.7900	1111.5000
10621	2019-06-17 00:00:00+00	914	361	1093.8900	1101.2800	1088.0000	1089.1000
10622	2019-06-14 00:00:00+00	914	361	1086.3000	1094.7074	1081.4750	1089.7400
10623	2019-06-13 00:00:00+00	914	361	1091.0100	1096.5900	1082.5700	1084.6873
10624	2019-06-12 00:00:00+00	914	361	1079.1000	1082.5200	1069.6000	1079.9064
10625	2019-06-11 00:00:00+00	914	361	1081.0400	1104.0050	1079.5700	1096.9900
10626	2019-06-10 00:00:00+00	914	361	1082.7600	1094.8400	1075.2820	1077.0000
10627	2019-06-07 00:00:00+00	914	361	1068.3700	1073.4300	1051.1500	1054.2987
10628	2019-06-06 00:00:00+00	914	361	1047.7600	1050.0000	1035.5100	1046.2100
10629	2019-06-05 00:00:00+00	914	361	1044.6400	1056.7532	1033.0000	1055.0000
10630	2019-06-04 00:00:00+00	914	361	1054.4900	1058.4370	1036.0300	1044.4900
10631	2019-06-03 00:00:00+00	914	361	1038.7400	1067.0000	1027.0300	1066.9300
10632	2019-05-31 00:00:00+00	914	361	1106.5000	1113.4030	1103.3500	1105.6400
10633	2019-05-30 00:00:00+00	914	361	1121.4100	1126.7950	1115.9000	1120.1500
10634	2019-05-29 00:00:00+00	914	361	1119.9400	1135.0000	1111.9500	1132.7000
10635	2019-05-28 00:00:00+00	914	361	1139.5600	1156.5396	1138.6700	1141.4800
10636	2019-05-24 00:00:00+00	914	361	1138.6100	1154.3600	1136.7100	1152.0000
10637	2019-05-23 00:00:00+00	914	361	1145.3400	1150.0500	1133.1600	1146.0504
10638	2019-05-22 00:00:00+00	914	361	1155.8500	1163.7800	1151.0000	1151.2500
10639	2019-05-21 00:00:00+00	914	361	1154.4400	1158.0000	1143.3100	1154.4800
10640	2019-05-20 00:00:00+00	914	361	1144.6600	1153.0000	1138.1350	1153.0000
10641	2019-05-17 00:00:00+00	914	361	1168.7800	1186.2900	1166.4200	1175.8300
10642	2019-05-16 00:00:00+00	914	361	1184.5000	1194.1600	1168.4500	1171.7683
10643	2019-05-15 00:00:00+00	914	361	1170.8000	1178.3000	1121.4725	1122.5500
10644	2019-05-14 00:00:00+00	914	361	1124.8600	1144.8650	1123.5300	1142.3200
10645	2019-05-13 00:00:00+00	914	361	1136.5900	1151.9700	1125.5000	1145.2400
10646	2019-05-10 00:00:00+00	914	361	1167.6400	1176.2800	1146.3700	1168.8400
10647	2019-05-09 00:00:00+00	914	361	1167.9700	1174.0700	1154.6400	1162.6000
10648	2019-05-08 00:00:00+00	914	361	1170.7800	1184.2700	1167.6300	1177.2900
10649	2019-05-07 00:00:00+00	914	361	1178.8600	1194.7700	1165.0000	1185.8100
10650	2019-05-06 00:00:00+00	914	361	1193.4600	1195.4300	1171.1550	1172.0000
10651	2019-05-03 00:00:00+00	914	361	1189.5500	1191.4000	1173.5450	1177.4100
10652	2019-05-02 00:00:00+00	914	361	1166.5100	1179.3800	1158.3300	1172.6000
10653	2019-05-01 00:00:00+00	914	361	1173.3200	1199.2500	1171.6750	1197.5000
10654	2019-04-30 00:00:00+00	914	361	1198.9600	1200.9780	1183.0000	1190.6300
10655	2019-04-29 00:00:00+00	914	361	1296.2000	1296.9750	1271.7100	1280.5100
10656	2019-04-26 00:00:00+00	914	361	1277.4200	1278.9100	1265.0000	1273.3800
10657	2019-04-25 00:00:00+00	914	361	1267.3400	1272.8000	1257.9596	1270.3000
10658	2019-04-24 00:00:00+00	914	361	1260.0500	1274.0000	1259.8100	1270.5900
10659	2019-04-23 00:00:00+00	914	361	1270.5900	1274.4300	1251.9750	1256.6400
10660	2019-04-22 00:00:00+00	914	361	1253.7600	1254.3410	1233.4893	1236.6700
10661	2019-04-18 00:00:00+00	914	361	1241.4700	1245.9400	1239.4100	1245.0000
10662	2019-04-17 00:00:00+00	914	361	1240.1400	1245.0950	1232.9000	1237.0000
10663	2019-04-16 00:00:00+00	914	361	1231.9100	1235.9800	1225.0400	1230.0000
10664	2019-04-15 00:00:00+00	914	361	1226.5300	1229.2950	1214.5600	1224.0900
10665	2019-04-12 00:00:00+00	914	361	1222.7300	1223.0500	1213.2900	1215.6200
10666	2019-04-11 00:00:00+00	914	361	1209.5900	1212.7400	1204.5573	1208.9000
10667	2019-04-10 00:00:00+00	914	361	1206.4500	1208.9380	1200.6610	1205.0900
10668	2019-04-09 00:00:00+00	914	361	1202.6900	1207.1500	1198.3800	1201.8900
10669	2019-04-08 00:00:00+00	914	361	1208.2800	1213.9500	1204.6950	1211.1100
10670	2019-04-05 00:00:00+00	914	361	1211.4500	1220.3900	1210.0300	1219.3000
10671	2019-04-04 00:00:00+00	914	361	1219.4500	1220.5500	1209.0400	1211.2900
10672	2019-04-03 00:00:00+00	914	361	1210.8100	1220.6428	1205.0750	1212.7000
10673	2019-04-02 00:00:00+00	914	361	1205.5400	1205.8100	1191.2400	1200.0500
10674	2019-04-01 00:00:00+00	914	361	1198.9800	1200.2000	1186.3600	1187.5400
10675	2019-03-29 00:00:00+00	914	361	1176.8900	1183.9700	1166.3800	1180.1800
10676	2019-03-28 00:00:00+00	914	361	1172.2700	1177.3805	1163.4300	1175.5000
10677	2019-03-27 00:00:00+00	914	361	1178.0100	1191.9200	1164.2300	1191.9289
10678	2019-03-26 00:00:00+00	914	361	1189.8400	1207.6500	1181.7600	1205.1900
10679	2019-03-25 00:00:00+00	914	361	1197.3800	1209.4400	1190.0030	1199.5600
10680	2019-03-22 00:00:00+00	914	361	1207.6500	1233.6300	1206.0000	1228.8500
10681	2019-03-21 00:00:00+00	914	361	1236.1300	1236.4400	1216.5750	1220.0000
10682	2019-03-20 00:00:00+00	914	361	1226.4300	1229.9900	1199.5900	1201.4000
10683	2019-03-19 00:00:00+00	914	361	1202.4600	1203.4050	1189.4560	1191.7200
10684	2019-03-18 00:00:00+00	914	361	1188.5500	1194.9500	1181.4760	1189.6900
10685	2019-03-15 00:00:00+00	914	361	1190.3000	1201.7250	1187.0100	1198.0000
10686	2019-03-14 00:00:00+00	914	361	1192.5300	1204.7000	1191.2300	1199.0200
10687	2019-03-13 00:00:00+00	914	361	1199.0600	1207.1230	1197.9100	1205.9300
10688	2019-03-12 00:00:00+00	914	361	1197.2500	1205.7100	1182.3000	1182.3000
10689	2019-03-11 00:00:00+00	914	361	1179.2600	1179.9100	1151.5700	1152.0000
10690	2019-03-08 00:00:00+00	914	361	1149.9700	1153.4500	1130.2000	1133.9000
10691	2019-03-07 00:00:00+00	914	361	1150.8500	1163.5800	1141.7150	1160.5000
10692	2019-03-06 00:00:00+00	914	361	1164.9400	1174.7400	1163.0500	1171.7600
10693	2019-03-05 00:00:00+00	914	361	1169.1900	1176.4900	1153.0200	1156.0000
10694	2019-03-04 00:00:00+00	914	361	1153.4200	1165.5200	1138.1257	1154.5600
10695	2019-03-01 00:00:00+00	914	361	1148.5200	1150.0000	1131.0000	1131.0000
10696	2019-02-28 00:00:00+00	914	361	1126.5500	1133.9900	1118.4100	1119.0000
10697	2019-02-27 00:00:00+00	914	361	1122.8900	1125.7300	1108.5600	1114.0100
10698	2019-02-26 00:00:00+00	914	361	1122.0100	1126.4166	1106.7000	1114.3700
10699	2019-02-25 00:00:00+00	914	361	1117.3300	1125.4000	1114.1100	1121.9300
10700	2019-02-22 00:00:00+00	914	361	1116.5600	1117.2500	1100.5000	1109.7000
10701	2019-02-21 00:00:00+00	914	361	1104.2100	1119.1500	1097.9800	1118.7800
10702	2019-02-20 00:00:00+00	914	361	1120.5900	1130.9300	1111.7500	1128.9503
10703	2019-02-19 00:00:00+00	914	361	1126.5100	1129.6400	1116.6400	1116.6400
10704	2019-02-15 00:00:00+00	914	361	1119.6300	1139.3000	1116.7200	1139.3000
10705	2019-02-14 00:00:00+00	914	361	1129.2000	1136.1300	1117.0900	1125.0000
10706	2019-02-13 00:00:00+00	914	361	1128.6300	1142.8500	1126.0000	1133.0400
10707	2019-02-12 00:00:00+00	914	361	1127.5800	1132.8600	1110.9772	1111.0100
10708	2019-02-11 00:00:00+00	914	361	1102.1200	1113.4300	1100.0000	1103.7500
10709	2019-02-08 00:00:00+00	914	361	1102.3800	1105.0950	1094.2400	1094.8800
10710	2019-02-07 00:00:00+00	914	361	1105.9100	1111.9900	1093.5900	1111.8200
10711	2019-02-06 00:00:00+00	914	361	1122.8900	1154.0000	1118.3600	1149.2700
10712	2019-02-05 00:00:00+00	914	361	1151.8700	1152.7700	1123.6000	1129.6300
10713	2019-02-04 00:00:00+00	914	361	1141.4200	1142.3400	1117.5100	1119.0100
10714	2019-02-01 00:00:00+00	914	361	1118.6200	1134.4000	1114.2500	1122.2900
10715	2019-01-31 00:00:00+00	914	361	1125.8900	1127.6700	1105.2500	1112.2400
10716	2019-01-30 00:00:00+00	914	361	1097.9900	1099.5200	1076.6400	1077.3600
10717	2019-01-29 00:00:00+00	914	361	1070.0600	1084.7300	1066.0200	1081.0400
10718	2019-01-28 00:00:00+00	914	361	1079.8600	1093.3650	1074.6100	1090.0700
10719	2019-01-25 00:00:00+00	914	361	1101.5100	1103.3600	1091.8010	1094.2300
10720	2019-01-24 00:00:00+00	914	361	1084.0000	1088.0000	1070.0200	1082.5100
10721	2019-01-23 00:00:00+00	914	361	1084.4100	1092.9500	1067.5700	1086.8600
10722	2019-01-22 00:00:00+00	914	361	1078.6300	1098.9700	1070.8900	1096.0000
10723	2019-01-18 00:00:00+00	914	361	1107.3000	1118.0000	1099.2830	1108.5810
10724	2019-01-17 00:00:00+00	914	361	1099.1200	1100.7000	1083.2550	1087.9900
10725	2019-01-16 00:00:00+00	914	361	1089.5100	1102.3600	1088.0100	1090.0000
10726	2019-01-15 00:00:00+00	914	361	1086.5100	1088.3280	1054.4400	1058.0100
10727	2019-01-14 00:00:00+00	914	361	1051.5100	1058.4500	1048.5500	1053.3400
10728	2019-01-11 00:00:00+00	914	361	1064.4700	1073.3700	1056.4300	1069.9000
10729	2019-01-10 00:00:00+00	914	361	1078.8300	1079.8100	1064.6800	1074.9400
10730	2019-01-09 00:00:00+00	914	361	1081.6500	1091.6400	1074.3700	1087.9900
10731	2019-01-08 00:00:00+00	914	361	1085.3700	1093.3500	1068.3490	1086.0000
10732	2019-01-07 00:00:00+00	914	361	1075.9200	1082.7000	1062.6400	1080.9700
10733	2019-01-04 00:00:00+00	914	361	1078.0700	1080.0000	1036.8600	1042.5600
10734	2019-01-03 00:00:00+00	914	361	1025.4700	1066.2600	1022.3700	1050.6840
10735	2019-01-02 00:00:00+00	914	361	1054.6800	1060.7900	1025.2750	1027.2000
10736	2018-12-31 00:00:00+00	914	361	1044.9600	1062.9900	1033.0390	1057.8300
10737	2018-12-28 00:00:00+00	914	361	1046.6800	1064.2300	1042.0000	1059.5000
10738	2018-12-27 00:00:00+00	914	361	1052.9000	1053.3400	1007.0000	1026.2000
10739	2018-12-26 00:00:00+00	914	361	1047.8500	1048.4500	992.6450	997.9900
10740	2018-12-24 00:00:00+00	914	361	984.6700	1012.1200	977.6600	984.3200
10741	2018-12-21 00:00:00+00	914	361	991.2500	1037.6700	981.1900	1032.0400
10742	2018-12-20 00:00:00+00	914	361	1023.5800	1047.4400	1007.8650	1026.0000
10743	2018-12-19 00:00:00+00	914	361	1035.4600	1075.7100	1019.4300	1047.2900
10744	2018-12-18 00:00:00+00	914	361	1043.4100	1059.6900	1030.4800	1034.0000
10745	2018-12-17 00:00:00+00	914	361	1025.6500	1062.3800	1016.6300	1047.0100
10746	2018-12-14 00:00:00+00	914	361	1051.7100	1071.7200	1049.3700	1060.0200
10747	2018-12-13 00:00:00+00	914	361	1073.5400	1088.4487	1064.9940	1075.6700
10748	2018-12-12 00:00:00+00	914	361	1073.7300	1091.7330	1071.9700	1077.0001
10749	2018-12-11 00:00:00+00	914	361	1061.6500	1070.4000	1050.1000	1066.9400
10750	2018-12-10 00:00:00+00	914	361	1053.1800	1059.6000	1033.0000	1042.9400
10751	2018-12-07 00:00:00+00	914	361	1046.5800	1085.0300	1039.3700	1072.2300
10752	2018-12-06 00:00:00+00	914	361	1078.0800	1079.3842	1042.4800	1045.0000
10753	2018-12-04 00:00:00+00	914	361	1062.4700	1114.2400	1060.7750	1112.9900
10754	2018-12-03 00:00:00+00	914	361	1116.3600	1135.0000	1111.7300	1132.1600
10755	2018-11-30 00:00:00+00	914	361	1109.6500	1109.6500	1083.1800	1095.6300
10756	2018-11-29 00:00:00+00	914	361	1094.5800	1100.1500	1082.0000	1083.5300
10757	2018-11-28 00:00:00+00	914	361	1091.7900	1092.8580	1042.8917	1057.4600
10758	2018-11-27 00:00:00+00	914	361	1052.2800	1066.7600	1045.5000	1051.3400
10759	2018-11-26 00:00:00+00	914	361	1055.9400	1057.0000	1039.7700	1044.0000
10760	2018-11-23 00:00:00+00	914	361	1030.1000	1043.0000	1028.5200	1033.5000
10761	2018-11-21 00:00:00+00	914	361	1043.4300	1054.7050	1039.4550	1045.3100
10762	2018-11-20 00:00:00+00	914	361	1030.4500	1037.3500	1002.2100	1007.1940
10763	2018-11-19 00:00:00+00	914	361	1027.4200	1068.0000	1022.8690	1063.3900
10764	2018-11-16 00:00:00+00	914	361	1068.2700	1072.4400	1054.9000	1065.2300
10765	2018-11-15 00:00:00+00	914	361	1071.0500	1078.8700	1041.2930	1051.4600
10766	2018-11-14 00:00:00+00	914	361	1054.5800	1065.7900	1041.1085	1060.0000
10767	2018-11-13 00:00:00+00	914	361	1047.9700	1066.6650	1040.4000	1054.8100
10768	2018-11-12 00:00:00+00	914	361	1049.3600	1074.1000	1040.3500	1073.1300
10769	2018-11-09 00:00:00+00	914	361	1077.0200	1088.3500	1064.2600	1084.0200
10770	2018-11-08 00:00:00+00	914	361	1094.6300	1108.2200	1084.3600	1107.3000
10771	2018-11-07 00:00:00+00	914	361	1108.2400	1109.9300	1080.5900	1083.4900
10772	2018-11-06 00:00:00+00	914	361	1069.5700	1079.8200	1053.6100	1055.0708
10773	2018-11-05 00:00:00+00	914	361	1055.7300	1073.3500	1034.0000	1072.5300
10774	2018-11-02 00:00:00+00	914	361	1071.4900	1098.0000	1067.6600	1089.0000
10775	2018-11-01 00:00:00+00	914	361	1085.9800	1099.9000	1077.8200	1091.4000
10776	2018-10-31 00:00:00+00	914	361	1090.5800	1108.0000	1068.2000	1068.2000
10777	2018-10-30 00:00:00+00	914	361	1049.5100	1050.9000	1013.9700	1020.0100
10778	2018-10-29 00:00:00+00	914	361	1034.7300	1108.8920	1007.2000	1096.5400
10779	2018-10-26 00:00:00+00	914	361	1083.7500	1117.0000	1042.2300	1048.3300
10780	2018-10-25 00:00:00+00	914	361	1103.5900	1117.8200	1075.5450	1080.2715
10781	2018-10-24 00:00:00+00	914	361	1057.1200	1116.6200	1055.0600	1115.0000
10782	2018-10-23 00:00:00+00	914	361	1114.9100	1118.0000	1079.0100	1091.2900
10783	2018-10-22 00:00:00+00	914	361	1111.3700	1121.6900	1100.0000	1112.5100
10784	2018-10-19 00:00:00+00	914	361	1105.1800	1120.9500	1097.0300	1103.7100
10785	2018-10-18 00:00:00+00	914	361	1097.9100	1132.3330	1086.3400	1130.0000
10786	2018-10-17 00:00:00+00	914	361	1127.5900	1147.0000	1114.0000	1140.0000
10787	2018-10-16 00:00:00+00	914	361	1133.0800	1136.3700	1111.7500	1113.4800
10788	2018-10-15 00:00:00+00	914	361	1102.4400	1121.7950	1098.2200	1118.0000
10789	2018-10-12 00:00:00+00	914	361	1120.5400	1125.8300	1095.0250	1119.6400
10790	2018-10-11 00:00:00+00	914	361	1090.7400	1116.0550	1075.8900	1079.0400
10791	2018-10-10 00:00:00+00	914	361	1092.1600	1137.0200	1091.5183	1136.4000
10792	2018-10-09 00:00:00+00	914	361	1145.1700	1161.5500	1144.1700	1151.3100
10793	2018-10-08 00:00:00+00	914	361	1155.9200	1175.9037	1135.4000	1160.0000
10794	2018-10-05 00:00:00+00	914	361	1167.8300	1182.0000	1154.3200	1176.0000
10795	2018-10-04 00:00:00+00	914	361	1177.0700	1205.9000	1163.8450	1205.0300
10796	2018-10-03 00:00:00+00	914	361	1211.5300	1214.1800	1202.1500	1212.0000
10797	2018-10-02 00:00:00+00	914	361	1207.6400	1224.5200	1199.6600	1206.6700
10798	2018-10-01 00:00:00+00	914	361	1208.5300	1224.1866	1203.1900	1213.0000
10799	2018-09-28 00:00:00+00	914	361	1207.0800	1208.4500	1197.8300	1204.0900
10800	2018-09-27 00:00:00+00	914	361	1207.3600	1216.8600	1198.0500	1200.0000
10801	2018-09-26 00:00:00+00	914	361	1194.0600	1207.2400	1185.3970	1193.6900
10802	2018-09-25 00:00:00+00	914	361	1193.8900	1196.8600	1174.0900	1184.2790
10803	2018-09-24 00:00:00+00	914	361	1179.5600	1185.1900	1151.5752	1159.4100
10804	2018-09-21 00:00:00+00	914	361	1172.1200	1196.5800	1172.0600	1194.9200
10805	2018-09-20 00:00:00+00	914	361	1191.5700	1194.0000	1176.2500	1180.6700
10806	2018-09-19 00:00:00+00	914	361	1174.2700	1176.2700	1158.6150	1168.9907
10807	2018-09-18 00:00:00+00	914	361	1167.1100	1181.3300	1161.4250	1162.6600
10808	2018-09-17 00:00:00+00	914	361	1159.8300	1181.8200	1158.4550	1177.7700
10809	2018-09-14 00:00:00+00	914	361	1177.9800	1187.9737	1173.5200	1188.0000
10810	2018-09-13 00:00:00+00	914	361	1182.1400	1187.8600	1169.2200	1179.7000
10811	2018-09-12 00:00:00+00	914	361	1171.6000	1190.6940	1166.1015	1182.0000
10812	2018-09-11 00:00:00+00	914	361	1189.9900	1190.9400	1165.9500	1171.1000
10813	2018-09-10 00:00:00+00	914	361	1175.0600	1186.6600	1170.6100	1184.2000
10814	2018-09-07 00:00:00+00	914	361	1177.5900	1188.5450	1169.2700	1172.0000
10815	2018-09-06 00:00:00+00	914	361	1183.9900	1198.9860	1163.6100	1198.5700
10816	2018-09-05 00:00:00+00	914	361	1199.1000	1214.8531	1175.3400	1209.2200
10817	2018-09-04 00:00:00+00	914	361	1211.3100	1227.8700	1206.5600	1222.5200
10818	2018-08-31 00:00:00+00	914	361	1231.8000	1252.5242	1225.7550	1252.2100
10819	2018-08-30 00:00:00+00	914	361	1254.4400	1269.4900	1247.2100	1263.4000
10820	2018-08-29 00:00:00+00	914	361	1264.6500	1267.1700	1252.8000	1255.0000
10821	2018-08-28 00:00:00+00	914	361	1245.8600	1256.5600	1242.9700	1255.9000
10822	2018-08-27 00:00:00+00	914	361	1256.2700	1257.8700	1240.6711	1244.1400
10823	2018-08-24 00:00:00+00	914	361	1236.7500	1237.4700	1221.4200	1226.0000
10824	2018-08-23 00:00:00+00	914	361	1221.1600	1235.1700	1219.3490	1219.8800
10825	2018-08-22 00:00:00+00	914	361	1221.7500	1226.5300	1213.2200	1214.1484
10826	2018-08-21 00:00:00+00	914	361	1217.4100	1232.7600	1215.0300	1223.0200
10827	2018-08-20 00:00:00+00	914	361	1221.9500	1225.9100	1208.7000	1220.6600
10828	2018-08-17 00:00:00+00	914	361	1215.8500	1226.9550	1204.0000	1222.0400
10829	2018-08-16 00:00:00+00	914	361	1224.0600	1243.6263	1219.6300	1241.9900
10830	2018-08-15 00:00:00+00	914	361	1232.2200	1251.9800	1226.2450	1244.2800
10831	2018-08-14 00:00:00+00	914	361	1258.1400	1260.5900	1239.5400	1252.5000
10832	2018-08-13 00:00:00+00	914	361	1248.6400	1265.9700	1247.0300	1251.2000
10833	2018-08-10 00:00:00+00	914	361	1252.5100	1261.2000	1247.1640	1259.1800
10834	2018-08-09 00:00:00+00	914	361	1264.4600	1271.9650	1260.1010	1262.7300
10835	2018-08-08 00:00:00+00	914	361	1261.3300	1271.7200	1252.1200	1256.7200
10836	2018-08-07 00:00:00+00	914	361	1255.8400	1266.0800	1251.8000	1252.0100
10837	2018-08-06 00:00:00+00	914	361	1237.6700	1242.4620	1230.5300	1241.6100
10838	2018-08-03 00:00:00+00	914	361	1238.1600	1246.5200	1229.4200	1245.1800
10839	2018-08-02 00:00:00+00	914	361	1241.1300	1244.4100	1218.0600	1218.5000
10840	2018-08-01 00:00:00+00	914	361	1232.9900	1245.9000	1224.9400	1239.1100
10841	2018-07-31 00:00:00+00	914	361	1227.2200	1241.1969	1216.1900	1231.7100
10842	2018-07-30 00:00:00+00	914	361	1230.0400	1252.8900	1224.1700	1245.0500
10843	2018-07-27 00:00:00+00	914	361	1252.8900	1291.4400	1244.4950	1289.1200
10844	2018-07-26 00:00:00+00	914	361	1285.5000	1287.4000	1263.0000	1267.1800
10845	2018-07-25 00:00:00+00	914	361	1275.9400	1278.2513	1249.0500	1252.6200
10846	2018-07-24 00:00:00+00	914	361	1258.1500	1275.0000	1244.1400	1271.0000
10847	2018-07-23 00:00:00+00	914	361	1211.0000	1215.1000	1192.0100	1195.6600
10848	2018-07-20 00:00:00+00	914	361	1197.8800	1210.7650	1196.5900	1199.2400
10849	2018-07-19 00:00:00+00	914	361	1199.1000	1216.4800	1197.7340	1206.6500
10850	2018-07-18 00:00:00+00	914	361	1212.9100	1221.5900	1204.5980	1208.5300
10851	2018-07-17 00:00:00+00	914	361	1213.0800	1218.7600	1182.0000	1182.7400
10852	2018-07-16 00:00:00+00	914	361	1196.5100	1208.7100	1193.4010	1203.8100
10853	2018-07-13 00:00:00+00	914	361	1204.4200	1210.4400	1195.2900	1202.8000
10854	2018-07-12 00:00:00+00	914	361	1201.2600	1201.9860	1173.1000	1174.8600
10855	2018-07-11 00:00:00+00	914	361	1171.4600	1180.4400	1155.3740	1155.6200
10856	2018-07-10 00:00:00+00	914	361	1167.1400	1173.5000	1162.5600	1169.9900
10857	2018-07-09 00:00:00+00	914	361	1167.2800	1167.9300	1157.1902	1160.0000
10858	2018-07-06 00:00:00+00	914	361	1155.0800	1156.2000	1137.2400	1141.7700
10859	2018-07-05 00:00:00+00	914	361	1141.2900	1144.1780	1123.1200	1124.6000
10860	2018-07-03 00:00:00+00	914	361	1116.2800	1149.9100	1114.4300	1149.4200
10861	2018-07-02 00:00:00+00	914	361	1142.1100	1142.9900	1106.6000	1115.3500
10862	2018-06-29 00:00:00+00	914	361	1129.1900	1141.3590	1127.0200	1132.3100
10863	2018-06-28 00:00:00+00	914	361	1126.7800	1134.0672	1106.0720	1112.3900
10864	2018-06-27 00:00:00+00	914	361	1116.9400	1146.2100	1116.6483	1136.0000
10865	2018-06-26 00:00:00+00	914	361	1132.6200	1146.8700	1129.0000	1144.1400
10866	2018-06-25 00:00:00+00	914	361	1139.2800	1155.9900	1119.9000	1155.0000
10867	2018-06-22 00:00:00+00	914	361	1169.2900	1175.0000	1159.6500	1171.4950
10868	2018-06-21 00:00:00+00	914	361	1169.4400	1190.3330	1163.4800	1185.5100
10869	2018-06-20 00:00:00+00	914	361	1184.0700	1201.4900	1182.0300	1183.3000
10870	2018-06-19 00:00:00+00	914	361	1178.6900	1182.8100	1161.6100	1170.1100
10871	2018-06-18 00:00:00+00	914	361	1183.5800	1184.1300	1151.0000	1152.6900
10872	2018-06-15 00:00:00+00	914	361	1159.2700	1163.9090	1153.6900	1159.8981
10873	2018-06-14 00:00:00+00	914	361	1160.1100	1165.9900	1150.6000	1152.2100
10874	2018-06-13 00:00:00+00	914	361	1144.2300	1155.6400	1143.3800	1152.2800
10875	2018-06-12 00:00:00+00	914	361	1148.1900	1148.7500	1141.0200	1141.0200
10876	2018-06-11 00:00:00+00	914	361	1140.9000	1147.7400	1131.3990	1132.9400
10877	2018-06-08 00:00:00+00	914	361	1132.7100	1138.7800	1123.2300	1131.2100
10878	2018-06-07 00:00:00+00	914	361	1134.4200	1145.8650	1126.1200	1144.5800
10879	2018-06-06 00:00:00+00	914	361	1146.9500	1154.7140	1136.3200	1152.7700
10880	2018-06-05 00:00:00+00	914	361	1151.0200	1161.0960	1147.4600	1154.6600
10881	2018-06-04 00:00:00+00	914	361	1153.0400	1157.8570	1137.0000	1138.5000
10882	2018-06-01 00:00:00+00	914	361	1135.0000	1138.1600	1112.0100	1112.8700
10883	2018-05-31 00:00:00+00	914	361	1100.0000	1110.0000	1078.0000	1082.0000
10884	2018-05-30 00:00:00+00	914	361	1077.4700	1078.9900	1066.5500	1073.4800
10885	2018-05-29 00:00:00+00	914	361	1068.0700	1081.3894	1063.0800	1076.0000
10886	2018-05-25 00:00:00+00	914	361	1084.0800	1089.5700	1082.6000	1086.5500
10887	2018-05-24 00:00:00+00	914	361	1085.4500	1087.1200	1072.3000	1086.9000
10888	2018-05-23 00:00:00+00	914	361	1085.9600	1088.0000	1066.9600	1070.0000
10889	2018-05-22 00:00:00+00	914	361	1075.3100	1091.8000	1072.2600	1089.8000
10890	2018-05-21 00:00:00+00	914	361	1084.0100	1093.3000	1078.0000	1079.0000
10891	2018-05-18 00:00:00+00	914	361	1069.6400	1073.7300	1064.6800	1066.0000
10892	2018-05-17 00:00:00+00	914	361	1081.2600	1091.0000	1076.4200	1081.4600
10893	2018-05-16 00:00:00+00	914	361	1084.0900	1094.3820	1081.6300	1085.0900
10894	2018-05-15 00:00:00+00	914	361	1084.8700	1099.1200	1078.7800	1096.9000
10895	2018-05-14 00:00:00+00	914	361	1106.6000	1118.1500	1104.8000	1105.5980
10896	2018-05-11 00:00:00+00	914	361	1103.3800	1109.0100	1097.2200	1100.4100
10897	2018-05-10 00:00:00+00	914	361	1105.4700	1109.4100	1093.8833	1095.0000
10898	2018-05-09 00:00:00+00	914	361	1088.9500	1094.0000	1062.1100	1064.1000
10899	2018-05-08 00:00:00+00	914	361	1058.5900	1065.2300	1051.6410	1064.6200
10900	2018-05-07 00:00:00+00	914	361	1059.4600	1065.0000	1050.2700	1053.8900
10901	2018-05-04 00:00:00+00	914	361	1051.0000	1051.8790	1018.0500	1019.6100
10902	2018-05-03 00:00:00+00	914	361	1026.3000	1030.6900	1007.8900	1025.3700
10903	2018-05-02 00:00:00+00	914	361	1026.0500	1043.9800	1023.1600	1034.0000
10904	2018-05-01 00:00:00+00	914	361	1040.7500	1041.7300	1010.6100	1016.3000
10905	2018-04-30 00:00:00+00	914	361	1018.5800	1038.3700	1018.3000	1034.4200
10906	2018-04-27 00:00:00+00	914	361	1031.4500	1051.6950	1027.5900	1045.5400
10907	2018-04-26 00:00:00+00	914	361	1043.3100	1052.0200	1020.4477	1033.2200
10908	2018-04-25 00:00:00+00	914	361	1022.9900	1036.0700	1017.0100	1029.7500
10909	2018-04-24 00:00:00+00	914	361	1022.6400	1064.4900	1012.8550	1059.2000
10910	2018-04-23 00:00:00+00	914	361	1073.8100	1088.0000	1066.7585	1082.9800
10911	2018-04-20 00:00:00+00	914	361	1077.3200	1094.7500	1072.1000	1084.2700
10912	2018-04-19 00:00:00+00	914	361	1089.4500	1097.5100	1069.0200	1069.0200
10913	2018-04-18 00:00:00+00	914	361	1075.3900	1082.0000	1070.5150	1079.0100
10914	2018-04-17 00:00:00+00	914	361	1079.3600	1085.0000	1057.0900	1061.2000
10915	2018-04-16 00:00:00+00	914	361	1046.1000	1051.4290	1033.9200	1045.5500
10916	2018-04-13 00:00:00+00	914	361	1036.0400	1052.9800	1030.1500	1046.9396
10917	2018-04-12 00:00:00+00	914	361	1037.2900	1044.6500	1026.0500	1031.4700
10918	2018-04-11 00:00:00+00	914	361	1025.0600	1035.8700	1019.2000	1032.0000
10919	2018-04-10 00:00:00+00	914	361	1036.5000	1041.2100	1015.4100	1030.2600
10920	2018-04-09 00:00:00+00	914	361	1020.0900	1044.5900	1019.2000	1020.0400
10921	2018-04-06 00:00:00+00	914	361	1009.9500	1036.0000	1006.2500	1023.1000
10922	2018-04-05 00:00:00+00	914	361	1032.6400	1046.7100	1024.0000	1046.3900
10923	2018-04-04 00:00:00+00	914	361	1029.7100	1032.7400	996.5100	998.1888
10924	2018-04-03 00:00:00+00	914	361	1018.6800	1025.0000	997.2450	1016.1500
10925	2018-04-02 00:00:00+00	914	361	1012.6300	1039.5300	994.2606	1027.6200
10926	2018-03-29 00:00:00+00	914	361	1037.1400	1048.0500	1004.0400	1011.2100
10927	2018-03-28 00:00:00+00	914	361	1005.1800	1024.9900	984.0000	1001.9100
10928	2018-03-27 00:00:00+00	914	361	1006.9400	1064.5400	997.6200	1063.9000
10929	2018-03-26 00:00:00+00	914	361	1054.0900	1059.2700	1010.5800	1050.6000
10930	2018-03-23 00:00:00+00	914	361	1026.5500	1066.7800	1024.8700	1051.3700
10931	2018-03-22 00:00:00+00	914	361	1053.1500	1083.9200	1049.6400	1080.0100
10932	2018-03-21 00:00:00+00	914	361	1094.0000	1108.7000	1087.2100	1092.5700
10933	2018-03-20 00:00:00+00	914	361	1095.8000	1105.5500	1082.4200	1098.4000
10934	2018-03-19 00:00:00+00	914	361	1100.0700	1119.3700	1088.9200	1117.7600
10935	2018-03-16 00:00:00+00	914	361	1134.4200	1156.8100	1131.3600	1155.3500
10936	2018-03-15 00:00:00+00	914	361	1150.6100	1162.5000	1135.6600	1149.5700
10937	2018-03-14 00:00:00+00	914	361	1148.8900	1159.7600	1142.3434	1145.8000
10938	2018-03-13 00:00:00+00	914	361	1139.9100	1178.0001	1134.5700	1171.8300
10939	2018-03-12 00:00:00+00	914	361	1165.9300	1178.1600	1159.2000	1165.0500
10940	2018-03-09 00:00:00+00	914	361	1160.8400	1161.0000	1134.2900	1139.5000
10941	2018-03-08 00:00:00+00	914	361	1129.3800	1131.4400	1117.2000	1117.2000
10942	2018-03-07 00:00:00+00	914	361	1115.0400	1116.2000	1089.9100	1092.8200
10943	2018-03-06 00:00:00+00	914	361	1100.9000	1105.6300	1094.5000	1102.1020
10944	2018-03-05 00:00:00+00	914	361	1094.7600	1101.1800	1072.2700	1078.2142
10945	2018-03-02 00:00:00+00	914	361	1084.1400	1086.8900	1050.1100	1057.9800
10946	2018-03-01 00:00:00+00	914	361	1071.4100	1111.2730	1067.2850	1109.5400
10947	2018-02-28 00:00:00+00	914	361	1103.9200	1127.6500	1103.0000	1122.0000
10948	2018-02-27 00:00:00+00	914	361	1117.5100	1144.2500	1116.7900	1143.7000
10949	2018-02-26 00:00:00+00	914	361	1143.7000	1144.2000	1129.3400	1131.8600
10950	2018-02-23 00:00:00+00	914	361	1128.0900	1129.0000	1108.4370	1118.6600
10951	2018-02-22 00:00:00+00	914	361	1109.9000	1125.4600	1105.1500	1119.1700
10952	2018-02-21 00:00:00+00	914	361	1113.7500	1136.2000	1107.5100	1109.1000
10953	2018-02-20 00:00:00+00	914	361	1103.5900	1116.2900	1090.0000	1092.7600
10954	2018-02-16 00:00:00+00	914	361	1095.5000	1108.3100	1091.6392	1093.3800
10955	2018-02-15 00:00:00+00	914	361	1091.3600	1094.1000	1067.2300	1083.4500
10956	2018-02-14 00:00:00+00	914	361	1072.7000	1075.4417	1049.8000	1054.3200
10957	2018-02-13 00:00:00+00	914	361	1054.1400	1061.2200	1046.9200	1050.0000
10958	2018-02-12 00:00:00+00	914	361	1054.5600	1065.5700	1045.4900	1056.6700
10959	2018-02-09 00:00:00+00	914	361	1046.2700	1051.7200	997.0000	1025.8373
10960	2018-02-08 00:00:00+00	914	361	1007.7100	1063.9300	1004.7000	1059.8700
10961	2018-02-07 00:00:00+00	914	361	1055.4100	1086.5300	1054.6200	1084.9700
10962	2018-02-06 00:00:00+00	914	361	1084.4300	1087.3750	1030.0100	1034.0491
10963	2018-02-05 00:00:00+00	914	361	1062.3900	1114.9900	1056.7400	1100.6100
10964	2018-02-02 00:00:00+00	914	361	1119.2000	1131.3000	1111.1448	1127.4200
10965	2018-02-01 00:00:00+00	914	361	1181.5900	1187.4500	1169.3600	1175.9900
10966	2018-01-31 00:00:00+00	914	361	1182.2200	1186.3200	1172.1000	1183.8100
10967	2018-01-30 00:00:00+00	914	361	1177.3700	1187.9300	1174.5100	1177.7200
10968	2018-01-29 00:00:00+00	914	361	1186.4800	1198.0000	1184.0600	1188.0000
10969	2018-01-26 00:00:00+00	914	361	1187.5600	1187.5600	1168.0300	1187.5300
10970	2018-01-25 00:00:00+00	914	361	1182.1400	1185.0000	1171.8400	1180.7100
10971	2018-01-24 00:00:00+00	914	361	1171.2900	1187.0500	1167.4010	1184.9800
10972	2018-01-23 00:00:00+00	914	361	1176.1700	1178.5100	1167.3403	1170.6200
10973	2018-01-22 00:00:00+00	914	361	1164.1600	1166.8800	1141.8200	1143.8200
10974	2018-01-19 00:00:00+00	914	361	1143.5000	1143.7800	1132.5000	1138.0300
10975	2018-01-18 00:00:00+00	914	361	1135.9700	1140.5977	1124.4650	1139.3500
10976	2018-01-17 00:00:00+00	914	361	1139.1000	1139.3200	1123.4900	1136.3600
10977	2018-01-16 00:00:00+00	914	361	1130.7000	1148.8800	1126.6600	1140.3100
10978	2018-01-12 00:00:00+00	914	361	1130.6500	1131.3030	1108.0100	1110.1000
10979	2018-01-11 00:00:00+00	914	361	1112.0500	1114.8500	1106.4800	1112.3100
10980	2018-01-10 00:00:00+00	914	361	1110.1400	1112.7800	1103.9840	1107.0000
10981	2018-01-09 00:00:00+00	914	361	1112.7900	1118.4400	1108.2010	1118.4400
10982	2018-01-08 00:00:00+00	914	361	1114.2100	1119.1600	1110.0000	1111.0000
10983	2018-01-05 00:00:00+00	914	361	1110.2900	1113.5795	1101.7950	1103.4500
10984	2018-01-04 00:00:00+00	914	361	1095.7600	1104.0760	1094.2600	1097.0900
10985	2018-01-03 00:00:00+00	914	361	1091.5200	1096.1000	1073.4300	1073.9300
10986	2018-01-02 00:00:00+00	914	361	1073.2100	1075.9800	1053.0200	1053.0200
55684	2019-12-27 02:25:00+00	355	263	0.1512	0.1514	0.1511	0.1513
55963	2019-12-27 08:05:00+00	266	355	7.7364	7.7446	7.6897	7.7127
56054	2019-12-27 09:50:00+00	355	263	0.1504	0.1514	0.1504	0.1513
56230	2019-12-27 13:30:00+00	288	266	0.0070	0.0070	0.0070	0.0070
56403	2019-12-27 16:55:00+00	266	355	7.7993	7.8136	7.6897	7.7127
52380	2019-12-23 00:00:00+00	288	266	0.0071	0.0071	0.0070	0.0070
52381	2019-12-22 00:00:00+00	288	266	0.0070	0.0070	0.0070	0.0070
52382	2019-12-20 00:00:00+00	288	266	0.0070	0.0070	0.0070	0.0070
52383	2019-12-19 00:00:00+00	288	266	0.0070	0.0070	0.0069	0.0070
55576	2019-12-27 00:15:00+00	266	355	7.7080	7.7128	7.7040	7.7127
10988	2019-11-07 00:00:00+00	361	288	109.3080	109.4900	108.6200	108.9640
10989	2019-11-06 00:00:00+00	361	288	108.9620	109.1830	108.7900	109.1580
10990	2019-11-05 00:00:00+00	361	288	109.1600	109.2450	108.5600	108.5930
10991	2019-11-04 00:00:00+00	361	288	108.5950	108.6500	108.1700	108.2340
10992	2019-11-03 00:00:00+00	361	288	108.2340	108.2600	108.1500	108.1900
10993	2019-11-01 00:00:00+00	361	288	108.1500	108.3250	107.8700	108.0310
10994	2019-10-31 00:00:00+00	361	288	108.0310	108.8630	107.9000	108.8050
10995	2019-10-30 00:00:00+00	361	288	108.8050	109.2870	108.6900	108.8710
10996	2019-10-29 00:00:00+00	361	288	108.8700	109.0690	108.7400	108.9680
10997	2019-10-28 00:00:00+00	361	288	108.9600	109.0400	108.6300	108.7000
10998	2019-10-27 00:00:00+00	361	288	108.6930	108.7690	108.6500	108.6700
10999	2019-10-25 00:00:00+00	361	288	108.6600	108.7740	108.4800	108.6270
11000	2019-10-24 00:00:00+00	361	288	108.6260	108.7530	108.4700	108.6500
11001	2019-10-23 00:00:00+00	361	288	108.6500	108.7050	108.2200	108.4970
11002	2019-10-22 00:00:00+00	361	288	108.5000	108.7280	108.4000	108.6010
11003	2019-10-21 00:00:00+00	361	288	108.6000	108.6640	108.2900	108.3540
11004	2019-10-20 00:00:00+00	361	288	108.3530	108.5200	108.2890	108.4700
11005	2019-10-18 00:00:00+00	361	288	108.3500	108.7230	108.3400	108.5930
11006	2019-10-17 00:00:00+00	361	288	108.5890	108.9390	108.4500	108.7010
11007	2019-10-16 00:00:00+00	361	288	108.7010	108.8550	108.5500	108.8420
11008	2019-10-15 00:00:00+00	361	288	108.8440	108.9000	108.1200	108.3710
11009	2019-10-14 00:00:00+00	361	288	108.3710	108.5220	108.0200	108.5100
11010	2019-10-13 00:00:00+00	361	288	108.5100	108.5200	108.2300	108.2300
11011	2019-10-11 00:00:00+00	361	288	108.3600	108.6310	107.8200	107.9360
11012	2019-10-10 00:00:00+00	361	288	107.9380	108.0200	107.0200	107.0740
11013	2019-10-09 00:00:00+00	361	288	107.0720	107.6300	106.9000	107.0160
11014	2019-10-08 00:00:00+00	361	288	107.0140	107.4440	106.7800	107.2250
11015	2019-10-07 00:00:00+00	361	288	107.2200	107.4640	106.6600	106.8520
11016	2019-10-06 00:00:00+00	361	288	106.8500	107.0400	106.5400	106.8800
11017	2019-10-04 00:00:00+00	361	288	106.8800	107.1340	106.5290	106.8830
11018	2019-10-03 00:00:00+00	361	288	106.8820	107.3000	106.4700	107.1760
11019	2019-10-02 00:00:00+00	361	288	107.1760	107.8920	107.0300	107.7510
11020	2019-10-01 00:00:00+00	361	288	107.7510	108.4710	107.6000	108.0720
11021	2019-09-30 00:00:00+00	361	288	108.0690	108.1800	107.7100	107.8760
11022	2019-09-29 00:00:00+00	361	288	107.8780	108.0500	107.8200	108.0200
11023	2019-09-27 00:00:00+00	361	288	107.9200	108.1810	107.6200	107.8130
11024	2019-09-26 00:00:00+00	361	288	107.8130	107.9590	107.4000	107.7480
11025	2019-09-25 00:00:00+00	361	288	107.7480	107.8840	106.9700	107.1090
11026	2019-09-24 00:00:00+00	361	288	107.1090	107.8030	106.9300	107.4920
11027	2019-09-23 00:00:00+00	361	288	107.4920	107.7700	107.2800	107.6830
11028	2019-09-22 00:00:00+00	361	288	107.6820	107.7600	107.6100	107.6500
11029	2019-09-20 00:00:00+00	361	288	107.5150	108.0880	107.5000	108.0190
11030	2019-09-19 00:00:00+00	361	288	108.0190	108.4740	107.7500	108.4000
11031	2019-09-18 00:00:00+00	361	288	108.3980	108.4770	108.0500	108.1080
11032	2019-09-17 00:00:00+00	361	288	108.1080	108.3710	107.9900	108.1170
11033	2019-09-16 00:00:00+00	361	288	108.1200	108.1700	107.4600	107.8190
11034	2019-09-15 00:00:00+00	361	288	107.8190	107.9140	107.4410	107.6200
11035	2019-09-13 00:00:00+00	361	288	108.1000	108.2600	107.8800	108.1550
11036	2019-09-12 00:00:00+00	361	288	108.1550	108.1910	107.5000	107.8140
11037	2019-09-11 00:00:00+00	361	288	107.8150	107.8570	107.4700	107.5100
11038	2019-09-10 00:00:00+00	361	288	107.5120	107.5860	107.1700	107.2100
11039	2019-09-09 00:00:00+00	361	288	107.2100	107.2750	106.7400	106.8960
11040	2019-09-08 00:00:00+00	361	288	106.8940	106.9360	106.7600	106.8200
11041	2019-09-06 00:00:00+00	361	288	106.8900	107.1020	106.6000	107.0200
11042	2019-09-05 00:00:00+00	361	288	107.0180	107.2300	106.3000	106.3360
11043	2019-09-04 00:00:00+00	361	288	106.3370	106.4470	105.8000	105.9570
11044	2019-09-03 00:00:00+00	361	288	105.9570	106.3850	105.7100	106.2000
11045	2019-09-02 00:00:00+00	361	288	106.2020	106.4000	106.0300	106.1150
11046	2019-09-01 00:00:00+00	361	288	106.1160	106.2800	105.8900	106.2800
11047	2019-08-30 00:00:00+00	361	288	106.2800	106.5450	106.0700	106.5000
11048	2019-08-29 00:00:00+00	361	288	106.5000	106.6830	105.8000	106.0070
11049	2019-08-28 00:00:00+00	361	288	106.0050	106.2300	105.6200	105.7650
11050	2019-08-27 00:00:00+00	361	288	105.7570	106.1230	105.5600	106.0960
11051	2019-08-26 00:00:00+00	361	288	106.0980	106.4140	104.7800	104.8660
11052	2019-08-25 00:00:00+00	361	288	104.8640	105.1500	104.4460	105.1000
11053	2019-08-23 00:00:00+00	361	288	105.3900	106.7340	105.2300	106.4420
11054	2019-08-22 00:00:00+00	361	288	106.4400	106.6530	106.2300	106.5790
11055	2019-08-21 00:00:00+00	361	288	106.5800	106.6460	106.2200	106.2740
11056	2019-08-20 00:00:00+00	361	288	106.2700	106.6920	106.1400	106.6120
11057	2019-08-19 00:00:00+00	361	288	106.6130	106.6980	106.2200	106.4660
11058	2019-08-18 00:00:00+00	361	288	106.4590	106.4800	106.1800	106.3200
11059	2019-08-16 00:00:00+00	361	288	106.3600	106.4940	105.9900	106.1320
11060	2019-08-15 00:00:00+00	361	288	106.1300	106.7800	105.6800	105.7940
11061	2019-08-14 00:00:00+00	361	288	105.7920	106.6770	105.6480	106.6110
11062	2019-08-13 00:00:00+00	361	288	106.6070	106.9770	105.0400	105.2780
11063	2019-08-12 00:00:00+00	361	288	105.2700	105.6340	105.0200	105.6280
11064	2019-08-11 00:00:00+00	361	288	105.6250	105.7000	105.5100	105.5700
11065	2019-08-09 00:00:00+00	361	288	105.6600	106.0770	105.2400	105.8430
11066	2019-08-08 00:00:00+00	361	288	105.8430	106.3030	105.6900	106.1200
11067	2019-08-07 00:00:00+00	361	288	106.1100	106.4190	105.4900	106.3820
11068	2019-08-06 00:00:00+00	361	288	106.3840	107.0900	105.5200	105.6630
11069	2019-08-05 00:00:00+00	361	288	105.6630	106.6330	105.5000	106.6310
11070	2019-08-04 00:00:00+00	361	288	106.6320	106.6830	106.5000	106.5900
11071	2019-08-02 00:00:00+00	361	288	106.5800	107.5190	106.4800	107.5140
11072	2019-08-01 00:00:00+00	361	288	107.5140	109.3180	107.2000	108.7380
11073	2019-07-31 00:00:00+00	361	288	108.7320	109.0000	108.4600	108.5980
11074	2019-07-30 00:00:00+00	361	288	108.5900	108.9490	108.4300	108.8240
11075	2019-07-29 00:00:00+00	361	288	108.8210	108.9000	108.3900	108.6460
11076	2019-07-28 00:00:00+00	361	288	108.6430	108.7100	108.6000	108.6900
11077	2019-07-26 00:00:00+00	361	288	108.6600	108.8290	108.5300	108.6240
11078	2019-07-25 00:00:00+00	361	288	108.6230	108.7570	108.0100	108.1670
11079	2019-07-24 00:00:00+00	361	288	108.1650	108.2770	107.9200	108.2190
11080	2019-07-23 00:00:00+00	361	288	108.2190	108.2900	107.7900	107.8930
11081	2019-07-22 00:00:00+00	361	288	107.8900	108.0700	107.6800	107.8080
11082	2019-07-21 00:00:00+00	361	288	107.8080	107.8200	107.6700	107.7800
11083	2019-07-19 00:00:00+00	361	288	107.7000	107.9780	107.3000	107.4920
11084	2019-07-18 00:00:00+00	361	288	107.4880	108.0160	107.1800	107.9590
11085	2019-07-17 00:00:00+00	361	288	107.9580	108.3300	107.8300	108.2360
11086	2019-07-16 00:00:00+00	361	288	108.2320	108.3770	107.8100	107.8630
11087	2019-07-15 00:00:00+00	361	288	107.8630	108.1100	107.7700	107.8790
11088	2019-07-14 00:00:00+00	361	288	107.8790	107.9900	107.8000	107.8600
11089	2019-07-12 00:00:00+00	361	288	107.9300	108.6100	107.7700	108.4730
11090	2019-07-11 00:00:00+00	361	288	108.4700	108.5330	107.8300	108.3200
11091	2019-07-10 00:00:00+00	361	288	108.3200	108.9910	108.2800	108.8800
11092	2019-07-09 00:00:00+00	361	288	108.8850	108.9640	108.6700	108.7310
11093	2019-07-08 00:00:00+00	361	288	108.7290	108.8060	108.2500	108.5070
11094	2019-07-07 00:00:00+00	361	288	108.5070	108.5870	108.3200	108.4000
11095	2019-07-05 00:00:00+00	361	288	108.4600	108.6380	107.7500	107.7980
11096	2019-07-04 00:00:00+00	361	288	107.7980	107.8430	107.6800	107.7850
11097	2019-07-03 00:00:00+00	361	288	107.7850	107.9030	107.5000	107.8540
11098	2019-07-02 00:00:00+00	361	288	107.8550	108.4750	107.7400	108.3120
11099	2019-07-01 00:00:00+00	361	288	108.3160	108.5330	108.0700	108.4890
11100	2019-06-30 00:00:00+00	361	288	108.4900	108.5110	108.0800	108.1000
11101	2019-06-28 00:00:00+00	361	288	107.8200	107.9350	107.5400	107.7920
11102	2019-06-27 00:00:00+00	361	288	107.7860	108.1610	107.6200	107.7270
11103	2019-06-26 00:00:00+00	361	288	107.7270	107.8500	107.1000	107.2080
11104	2019-06-25 00:00:00+00	361	288	107.2000	107.4100	106.7500	107.3300
11105	2019-06-24 00:00:00+00	361	288	107.3300	107.5370	107.2200	107.3530
11106	2019-06-23 00:00:00+00	361	288	107.3580	107.4200	107.2600	107.3800
11107	2019-06-21 00:00:00+00	361	288	107.3100	107.7350	107.0200	107.3460
11108	2019-06-20 00:00:00+00	361	288	107.3490	108.1430	107.1900	108.0850
11109	2019-06-19 00:00:00+00	361	288	108.0840	108.6180	107.8900	108.5100
11110	2019-06-18 00:00:00+00	361	288	108.5110	108.6770	108.0400	108.5470
11111	2019-06-17 00:00:00+00	361	288	108.5470	108.7240	108.4900	108.5440
11112	2019-06-16 00:00:00+00	361	288	108.5440	108.5520	108.3500	108.3500
11113	2019-06-14 00:00:00+00	361	288	108.5500	108.5880	108.1300	108.3690
11114	2019-06-13 00:00:00+00	361	288	108.3670	108.5380	108.1300	108.4610
11115	2019-06-12 00:00:00+00	361	288	108.4620	108.5630	108.1900	108.5150
11116	2019-06-11 00:00:00+00	361	288	108.5160	108.8010	108.3200	108.4230
11117	2019-06-10 00:00:00+00	361	288	108.4220	108.7170	108.3000	108.4690
11118	2019-06-09 00:00:00+00	361	288	108.4670	108.6700	108.4000	108.5100
11119	2019-06-07 00:00:00+00	361	288	108.1800	108.6180	107.8500	108.3700
11120	2019-06-06 00:00:00+00	361	288	108.3670	108.5640	108.0000	108.2670
11121	2019-06-05 00:00:00+00	361	288	108.2650	108.4850	107.7900	108.2040
11122	2019-06-04 00:00:00+00	361	288	108.2020	108.3590	107.8200	107.9550
11123	2019-06-03 00:00:00+00	361	288	107.9550	108.4460	107.8500	108.1950
11124	2019-06-02 00:00:00+00	361	288	108.1950	108.3700	108.1400	108.3700
11125	2019-05-31 00:00:00+00	361	288	108.2700	109.5940	108.2250	109.5840
11126	2019-05-30 00:00:00+00	361	288	109.5830	109.9260	109.4400	109.5910
11127	2019-05-29 00:00:00+00	361	288	109.5910	109.6990	109.1200	109.3550
11128	2019-05-28 00:00:00+00	361	288	109.3600	109.6300	109.1800	109.5350
11129	2019-05-27 00:00:00+00	361	288	109.5360	109.5870	109.3300	109.4040
11130	2019-05-26 00:00:00+00	361	288	109.4040	109.4500	109.2500	109.4500
11131	2019-05-24 00:00:00+00	361	288	109.3000	109.7450	109.2420	109.5000
11132	2019-05-23 00:00:00+00	361	288	109.5000	110.3650	109.4300	110.3050
11133	2019-05-22 00:00:00+00	361	288	110.3020	110.6260	110.2100	110.5450
11134	2019-05-21 00:00:00+00	361	288	110.5450	110.6730	110.0100	110.0360
11135	2019-05-20 00:00:00+00	361	288	110.0370	110.3190	109.7800	110.0360
11136	2019-05-19 00:00:00+00	361	288	110.0350	110.2400	109.9800	110.0900
11137	2019-05-17 00:00:00+00	361	288	109.9500	110.1940	109.4700	109.8620
11138	2019-05-16 00:00:00+00	361	288	109.8620	109.9670	109.3100	109.5560
11139	2019-05-15 00:00:00+00	361	288	109.5550	109.7030	109.1300	109.6510
11140	2019-05-14 00:00:00+00	361	288	109.6500	109.7740	109.1200	109.2300
11141	2019-05-13 00:00:00+00	361	288	109.2290	109.8100	108.9900	109.7660
11142	2019-05-12 00:00:00+00	361	288	109.7660	109.8400	109.6400	109.7700
11143	2019-05-10 00:00:00+00	361	288	109.8910	110.0500	109.4700	109.7260
11144	2019-05-09 00:00:00+00	361	288	109.7200	110.0840	109.4400	110.0650
11145	2019-05-08 00:00:00+00	361	288	110.0660	110.2890	109.8700	110.2520
11146	2019-05-07 00:00:00+00	361	288	110.2510	110.8540	110.1400	110.7810
11147	2019-05-06 00:00:00+00	361	288	110.7800	110.9590	110.2700	110.8110
11148	2019-05-05 00:00:00+00	361	288	110.8110	110.9100	110.5200	110.7700
11149	2019-05-03 00:00:00+00	361	288	111.1100	111.6990	111.0400	111.5260
11150	2019-05-02 00:00:00+00	361	288	111.5260	111.6660	111.3400	111.3900
11151	2019-05-01 00:00:00+00	361	288	111.3890	111.6140	111.0200	111.4510
11152	2019-04-30 00:00:00+00	361	288	111.4490	111.6900	111.2000	111.6640
11153	2019-04-29 00:00:00+00	361	288	111.6640	111.8990	111.5500	111.5980
11154	2019-04-28 00:00:00+00	361	288	111.5980	111.6100	111.5100	111.5600
11155	2019-04-26 00:00:00+00	361	288	111.5900	112.0310	111.4000	111.5750
11156	2019-04-25 00:00:00+00	361	288	111.5740	112.2400	111.3600	112.0980
11157	2019-04-24 00:00:00+00	361	288	112.0970	112.4010	111.6500	111.8700
11158	2019-04-23 00:00:00+00	361	288	111.8710	112.0340	111.6400	111.9350
11159	2019-04-22 00:00:00+00	361	288	111.9360	111.9920	111.8700	111.9140
11160	2019-04-21 00:00:00+00	361	288	111.9170	111.9460	111.8300	111.8900
11161	2019-04-19 00:00:00+00	361	288	111.9100	112.0070	111.8550	111.9780
11162	2019-04-18 00:00:00+00	361	288	111.9780	112.0620	111.7300	112.0360
11163	2019-04-17 00:00:00+00	361	288	112.0360	112.1660	111.8900	111.9870
11164	2019-04-16 00:00:00+00	361	288	111.9850	112.0460	111.8100	111.9900
11165	2019-04-15 00:00:00+00	361	288	111.9890	112.0970	111.8600	111.9930
11166	2019-04-14 00:00:00+00	361	288	111.9920	112.0400	111.9200	111.9600
11167	2019-04-12 00:00:00+00	361	288	112.0200	112.0960	111.5500	111.6260
11168	2019-04-11 00:00:00+00	361	288	111.6250	111.6960	110.8900	110.9490
11169	2019-04-10 00:00:00+00	361	288	110.9490	111.2810	110.8100	111.1330
11170	2019-04-09 00:00:00+00	361	288	111.1320	111.5790	110.9500	111.4710
11171	2019-04-08 00:00:00+00	361	288	111.4730	111.7320	111.2500	111.6760
11172	2019-04-07 00:00:00+00	361	288	111.6760	111.7530	111.6300	111.6600
11173	2019-04-05 00:00:00+00	361	288	111.7300	111.8240	111.5260	111.6360
11174	2019-04-04 00:00:00+00	361	288	111.6360	111.6840	111.3100	111.4650
11175	2019-04-03 00:00:00+00	361	288	111.4650	111.5790	111.1800	111.3280
11176	2019-04-02 00:00:00+00	361	288	111.3310	111.4570	111.2200	111.4030
11177	2019-04-01 00:00:00+00	361	288	111.4010	111.4440	110.8000	110.9400
11178	2019-03-31 00:00:00+00	361	288	110.9410	111.0900	110.7500	110.7900
11179	2019-03-29 00:00:00+00	361	288	110.8200	110.9500	110.5100	110.6550
11180	2019-03-28 00:00:00+00	361	288	110.6550	110.8320	109.9900	110.4880
11181	2019-03-27 00:00:00+00	361	288	110.4880	110.7140	110.2000	110.5270
11182	2019-03-26 00:00:00+00	361	288	110.5270	110.6900	109.9700	110.0360
11183	2019-03-25 00:00:00+00	361	288	110.0360	110.2410	109.6900	110.0100
11184	2019-03-24 00:00:00+00	361	288	110.0100	110.0780	109.7400	109.7500
11185	2019-03-22 00:00:00+00	361	288	109.9100	110.8980	109.7200	110.7890
11186	2019-03-21 00:00:00+00	361	288	110.7880	110.9590	110.2700	110.7210
11187	2019-03-20 00:00:00+00	361	288	110.7200	111.6960	110.5000	111.3670
11188	2019-03-19 00:00:00+00	361	288	111.3660	111.4760	111.1300	111.4020
11189	2019-03-18 00:00:00+00	361	288	111.3990	111.6300	111.2700	111.4700
11190	2019-03-17 00:00:00+00	361	288	111.4820	111.5040	111.4100	111.4900
11191	2019-03-15 00:00:00+00	361	288	111.4200	111.9020	111.3600	111.6960
11192	2019-03-14 00:00:00+00	361	288	111.6910	111.8340	111.1100	111.2530
11193	2019-03-13 00:00:00+00	361	288	111.2550	111.4650	110.9800	111.3130
11194	2019-03-12 00:00:00+00	361	288	111.3130	111.4670	111.0800	111.3200
11195	2019-03-11 00:00:00+00	361	288	111.3270	111.3460	110.8500	111.0910
11196	2019-03-10 00:00:00+00	361	288	111.0890	111.1700	110.9100	111.1200
11197	2019-03-08 00:00:00+00	361	288	111.1000	111.6510	110.7460	111.6070
11198	2019-03-07 00:00:00+00	361	288	111.6100	111.8580	111.4500	111.7000
11199	2019-03-06 00:00:00+00	361	288	111.7010	111.9230	111.5900	111.8830
11200	2019-03-05 00:00:00+00	361	288	111.8870	112.1370	111.6900	111.7430
11201	2019-03-04 00:00:00+00	361	288	111.7440	112.0140	111.6100	111.8180
11202	2019-03-03 00:00:00+00	361	288	111.8180	111.9130	111.6900	111.7600
11203	2019-03-01 00:00:00+00	361	288	111.8780	112.0770	111.3000	111.3820
11204	2019-02-28 00:00:00+00	361	288	111.3830	111.4940	110.6300	110.9450
11205	2019-02-27 00:00:00+00	361	288	110.9450	111.0740	110.3200	110.5630
11206	2019-02-26 00:00:00+00	361	288	110.5620	111.0760	110.4000	111.0650
11207	2019-02-25 00:00:00+00	361	288	111.0680	111.2350	110.5500	110.7570
11208	2019-02-24 00:00:00+00	361	288	110.7620	110.7890	110.6000	110.7400
11209	2019-02-22 00:00:00+00	361	288	110.6200	110.9060	110.5300	110.6620
11210	2019-02-21 00:00:00+00	361	288	110.6630	110.8550	110.5500	110.8010
11211	2019-02-20 00:00:00+00	361	288	110.8010	110.9500	110.5300	110.5830
11212	2019-02-19 00:00:00+00	361	288	110.5800	110.8240	110.4200	110.6060
11213	2019-02-18 00:00:00+00	361	288	110.6120	110.6560	110.4300	110.5000
11214	2019-02-17 00:00:00+00	361	288	110.5000	110.5220	110.3980	110.4030
11215	2019-02-15 00:00:00+00	361	288	110.5350	110.6460	110.2300	110.4840
11216	2019-02-14 00:00:00+00	361	288	110.4810	111.1280	110.3800	111.0240
11217	2019-02-13 00:00:00+00	361	288	111.0310	111.0550	110.4000	110.4650
11218	2019-02-12 00:00:00+00	361	288	110.4620	110.6510	110.3100	110.3830
11219	2019-02-11 00:00:00+00	361	288	110.3870	110.4680	109.7400	109.7990
11220	2019-02-10 00:00:00+00	361	288	109.8040	109.8500	109.6600	109.7400
11221	2019-02-08 00:00:00+00	361	288	109.7220	109.8980	109.6200	109.7680
11222	2019-02-07 00:00:00+00	361	288	109.7710	110.0880	109.5800	109.9250
11223	2019-02-06 00:00:00+00	361	288	109.9240	110.0530	109.5300	109.9450
11224	2019-02-05 00:00:00+00	361	288	109.9470	110.0410	109.7500	109.9040
11225	2019-02-04 00:00:00+00	361	288	109.9050	110.1630	109.4000	109.4770
11226	2019-02-03 00:00:00+00	361	288	109.4770	109.5340	109.4400	109.4400
11227	2019-02-01 00:00:00+00	361	288	109.4800	109.5810	108.7000	108.8360
11228	2019-01-31 00:00:00+00	361	288	108.8360	109.0630	108.4700	109.0610
11229	2019-01-30 00:00:00+00	361	288	109.0590	109.7430	108.7800	109.3580
11230	2019-01-29 00:00:00+00	361	288	109.3580	109.5420	109.1000	109.3010
11231	2019-01-28 00:00:00+00	361	288	109.2980	109.5620	109.1300	109.5310
11232	2019-01-27 00:00:00+00	361	288	109.5310	109.5830	109.4600	109.5100
11233	2019-01-25 00:00:00+00	361	288	109.5360	109.9500	109.4300	109.5670
11234	2019-01-24 00:00:00+00	361	288	109.5650	109.8010	109.3900	109.5560
11235	2019-01-23 00:00:00+00	361	288	109.5570	109.9990	109.2900	109.3350
11236	2019-01-22 00:00:00+00	361	288	109.3340	109.6940	109.1200	109.6330
11237	2019-01-21 00:00:00+00	361	288	109.6330	109.7600	109.4500	109.7320
11238	2019-01-20 00:00:00+00	361	288	109.7320	109.7670	109.5700	109.7380
11239	2019-01-18 00:00:00+00	361	288	109.7720	109.8890	109.0300	109.1900
11240	2019-01-17 00:00:00+00	361	288	109.1900	109.4010	108.6600	109.1170
11241	2019-01-16 00:00:00+00	361	288	109.1170	109.1970	108.3400	108.6300
11242	2019-01-15 00:00:00+00	361	288	108.6300	108.7670	108.1100	108.1560
11243	2019-01-14 00:00:00+00	361	288	108.1530	108.5110	107.9700	108.5030
11244	2019-01-13 00:00:00+00	361	288	108.5020	108.5600	108.2990	108.4420
11245	2019-01-11 00:00:00+00	361	288	108.4720	108.5980	108.1200	108.4370
11246	2019-01-10 00:00:00+00	361	288	108.4350	108.5190	107.7400	108.1560
11247	2019-01-09 00:00:00+00	361	288	108.1560	109.0040	107.9600	108.7840
11248	2019-01-08 00:00:00+00	361	288	108.7810	109.0880	108.4200	108.6570
11249	2019-01-07 00:00:00+00	361	288	108.6530	108.7480	107.9900	108.4720
11250	2019-01-06 00:00:00+00	361	288	108.4700	108.7820	108.4000	108.4800
11251	2019-01-04 00:00:00+00	361	288	108.4800	108.5890	107.4800	107.6730
11252	2019-01-03 00:00:00+00	361	288	107.6750	108.3040	106.5510	106.7170
11253	2019-01-02 00:00:00+00	361	288	106.7110	109.7260	104.7070	109.6780
11254	2019-01-01 00:00:00+00	361	288	109.6780	109.9900	109.5800	109.9200
11255	2018-12-31 00:00:00+00	361	288	109.6300	110.4750	109.5220	110.2730
11256	2018-12-30 00:00:00+00	361	288	110.2810	110.4140	110.2400	110.3900
11257	2018-12-28 00:00:00+00	361	288	110.2510	110.9410	110.1200	110.9200
11258	2018-12-27 00:00:00+00	361	288	110.9190	111.3060	110.4200	111.3010
11259	2018-12-26 00:00:00+00	361	288	111.3020	111.4080	110.1200	110.2170
11260	2018-12-25 00:00:00+00	361	288	110.2170	110.4310	109.9800	110.4230
11261	2018-12-24 00:00:00+00	361	288	110.4200	111.1910	110.2400	111.0300
11262	2018-12-23 00:00:00+00	361	288	111.0300	111.1360	110.7900	110.9050
11263	2018-12-21 00:00:00+00	361	288	111.2100	111.4590	110.9100	111.2830
11264	2018-12-20 00:00:00+00	361	288	111.2830	112.6040	110.7800	112.4150
11265	2018-12-19 00:00:00+00	361	288	112.4150	112.6650	112.0500	112.4780
11266	2018-12-18 00:00:00+00	361	288	112.4740	112.8490	112.2200	112.8250
11267	2018-12-17 00:00:00+00	361	288	112.8200	113.5210	112.6500	113.3190
11268	2018-12-16 00:00:00+00	361	288	113.3200	113.3980	113.2500	113.2600
11269	2018-12-14 00:00:00+00	361	288	113.3500	113.6750	113.1800	113.5970
11270	2018-12-13 00:00:00+00	361	288	113.5950	113.7080	113.1700	113.2630
11271	2018-12-12 00:00:00+00	361	288	113.2690	113.5210	113.1100	113.3910
11272	2018-12-11 00:00:00+00	361	288	113.3910	113.4660	112.9800	113.2590
11273	2018-12-10 00:00:00+00	361	288	113.2600	113.3740	112.2100	112.6300
11274	2018-12-09 00:00:00+00	361	288	112.6280	112.6840	112.5100	112.5960
11275	2018-12-07 00:00:00+00	361	288	112.7200	112.9280	112.5200	112.7060
11276	2018-12-06 00:00:00+00	361	288	112.7140	113.1650	112.2000	113.1530
11277	2018-12-05 00:00:00+00	361	288	113.1580	113.2420	112.6200	112.7550
11278	2018-12-04 00:00:00+00	361	288	112.7550	113.6390	112.5400	113.6240
11279	2018-12-03 00:00:00+00	361	288	113.6240	113.8230	113.3400	113.7190
11280	2018-12-02 00:00:00+00	361	288	113.7190	113.8500	113.5690	113.7040
11281	2018-11-30 00:00:00+00	361	288	113.5450	113.7200	113.3100	113.4500
11282	2018-11-29 00:00:00+00	361	288	113.4520	113.6320	113.1700	113.6250
11283	2018-11-28 00:00:00+00	361	288	113.6210	114.0370	113.4300	113.7690
11284	2018-11-27 00:00:00+00	361	288	113.7670	113.8430	113.3800	113.5650
11285	2018-11-26 00:00:00+00	361	288	113.5650	113.6510	112.8500	112.9120
11286	2018-11-25 00:00:00+00	361	288	112.9120	112.9500	112.8500	112.9400
11287	2018-11-23 00:00:00+00	361	288	112.9400	113.0100	112.6300	112.9460
11288	2018-11-22 00:00:00+00	361	288	112.9430	113.1320	112.8500	113.1060
11289	2018-11-21 00:00:00+00	361	288	113.1070	113.2300	112.6100	112.7280
11290	2018-11-20 00:00:00+00	361	288	112.7280	112.8430	112.2700	112.4830
11291	2018-11-19 00:00:00+00	361	288	112.4840	112.8750	112.3900	112.7830
11292	2018-11-18 00:00:00+00	361	288	112.8050	112.8600	112.6600	112.8600
11293	2018-11-16 00:00:00+00	361	288	112.8120	113.6130	112.6200	113.5800
11294	2018-11-15 00:00:00+00	361	288	113.5800	113.7070	113.0700	113.5700
11295	2018-11-14 00:00:00+00	361	288	113.5700	114.0100	113.2700	113.8080
11296	2018-11-13 00:00:00+00	361	288	113.8040	114.1470	113.5600	113.7970
11297	2018-11-12 00:00:00+00	361	288	113.7980	114.2140	113.6300	113.8760
11298	2018-11-11 00:00:00+00	361	288	113.8620	113.8830	113.7000	113.7800
11299	2018-11-09 00:00:00+00	361	288	113.8200	114.0550	113.6200	114.0460
11300	2018-11-08 00:00:00+00	361	288	114.0450	114.0880	113.4800	113.5240
11301	2018-11-07 00:00:00+00	361	288	113.5250	113.8180	112.9200	113.4480
11302	2018-11-06 00:00:00+00	361	288	113.4500	113.5050	113.0700	113.2000
11303	2018-11-05 00:00:00+00	361	288	113.2000	113.3390	113.0500	113.1940
11304	2018-11-04 00:00:00+00	361	288	113.2090	113.2320	113.1000	113.1500
11305	2018-11-02 00:00:00+00	361	288	113.1600	113.3230	112.5900	112.6470
11306	2018-11-01 00:00:00+00	361	288	112.6480	113.0030	112.5300	112.9320
11307	2018-10-31 00:00:00+00	361	288	112.9320	113.3850	112.7700	113.0840
11308	2018-10-30 00:00:00+00	361	288	113.0840	113.1710	112.2700	112.3440
11309	2018-10-29 00:00:00+00	361	288	112.3440	112.5650	111.7500	111.8650
11310	2018-10-28 00:00:00+00	361	288	111.8650	112.0020	111.7800	112.0020
11311	2018-10-26 00:00:00+00	361	288	111.8300	112.4440	111.3500	112.4010
11312	2018-10-25 00:00:00+00	361	288	112.4020	112.6740	111.8000	112.0860
11313	2018-10-24 00:00:00+00	361	288	112.0870	112.7440	112.0100	112.3850
11314	2018-10-23 00:00:00+00	361	288	112.3850	112.8300	111.9400	112.8220
11315	2018-10-22 00:00:00+00	361	288	112.8220	112.8860	112.3200	112.4620
11316	2018-10-21 00:00:00+00	361	288	112.4600	112.6000	112.4000	112.4500
11317	2018-10-19 00:00:00+00	361	288	112.5310	112.6480	112.1100	112.1950
11318	2018-10-18 00:00:00+00	361	288	112.1950	112.7310	111.9360	112.6210
11319	2018-10-17 00:00:00+00	361	288	112.6210	112.7170	111.9800	112.3110
11320	2018-10-16 00:00:00+00	361	288	112.3110	112.3390	111.7300	111.7720
11321	2018-10-15 00:00:00+00	361	288	111.7720	112.2360	111.5900	112.1810
11322	2018-10-14 00:00:00+00	361	288	112.1810	112.2590	112.0150	112.0400
11323	2018-10-12 00:00:00+00	361	288	112.1980	112.4970	111.8500	112.1140
11324	2018-10-11 00:00:00+00	361	288	112.1150	112.5360	111.8100	112.2480
11325	2018-10-10 00:00:00+00	361	288	112.2480	113.2870	112.0900	113.0150
11326	2018-10-09 00:00:00+00	361	288	113.0130	113.3920	112.8400	113.1310
11327	2018-10-08 00:00:00+00	361	288	113.1340	113.9430	112.7900	113.7100
11328	2018-10-07 00:00:00+00	361	288	113.7100	113.8290	113.6200	113.6900
11329	2018-10-05 00:00:00+00	361	288	113.7090	114.1010	113.5300	113.8950
11330	2018-10-04 00:00:00+00	361	288	113.8930	114.5500	113.6000	114.4610
11331	2018-10-03 00:00:00+00	361	288	114.4610	114.5420	113.4900	113.6520
11332	2018-10-02 00:00:00+00	361	288	113.6520	114.0120	113.5000	113.9980
11333	2018-10-01 00:00:00+00	361	288	113.9980	114.0620	113.7000	113.7460
11334	2018-09-30 00:00:00+00	361	288	113.7450	113.7700	113.5400	113.6700
11335	2018-09-28 00:00:00+00	361	288	113.6600	113.7120	113.2900	113.4000
11336	2018-09-27 00:00:00+00	361	288	113.4000	113.4680	112.5300	112.7580
11337	2018-09-26 00:00:00+00	361	288	112.7560	113.1360	112.6000	112.9710
11338	2018-09-25 00:00:00+00	361	288	112.9710	112.9970	112.7100	112.7970
11339	2018-09-24 00:00:00+00	361	288	112.7920	112.8380	112.4100	112.5430
11340	2018-09-23 00:00:00+00	361	288	112.5430	112.5720	112.2650	112.5560
11341	2018-09-21 00:00:00+00	361	288	112.5670	112.8740	112.3860	112.4840
11342	2018-09-20 00:00:00+00	361	288	112.4840	112.5840	112.0300	112.2680
11343	2018-09-19 00:00:00+00	361	288	112.2700	112.4470	112.1300	112.3550
11344	2018-09-18 00:00:00+00	361	288	112.3500	112.3900	111.6400	111.6800
11345	2018-09-17 00:00:00+00	361	288	111.6820	112.1220	111.6400	111.9690
11346	2018-09-16 00:00:00+00	361	288	111.9690	112.0560	111.9100	111.9690
11347	2018-09-14 00:00:00+00	361	288	112.0490	112.1690	111.7300	112.0440
11348	2018-09-13 00:00:00+00	361	288	112.0420	112.0480	111.1400	111.2340
11349	2018-09-12 00:00:00+00	361	288	111.2340	111.6330	111.0900	111.6300
11350	2018-09-11 00:00:00+00	361	288	111.6300	111.6510	111.0400	111.1360
11351	2018-09-10 00:00:00+00	361	288	111.1360	111.2490	110.8300	110.9850
11352	2018-09-09 00:00:00+00	361	288	110.9880	111.0900	110.8900	110.9620
11353	2018-09-07 00:00:00+00	361	288	110.9880	111.2480	110.3600	110.6690
11354	2018-09-06 00:00:00+00	361	288	110.6670	111.5130	110.5000	111.4630
11355	2018-09-05 00:00:00+00	361	288	111.4640	111.7580	111.3700	111.4600
11356	2018-09-04 00:00:00+00	361	288	111.4610	111.5330	110.8700	111.0890
11357	2018-09-03 00:00:00+00	361	288	111.0890	111.1890	110.8370	111.1830
11358	2018-09-02 00:00:00+00	361	288	111.1690	111.1860	110.9980	111.0440
11359	2018-08-31 00:00:00+00	361	288	111.0200	111.1350	110.6600	111.0180
11360	2018-08-30 00:00:00+00	361	288	111.0180	111.7550	110.9300	111.7240
11361	2018-08-29 00:00:00+00	361	288	111.7250	111.8290	111.0900	111.1650
11362	2018-08-28 00:00:00+00	361	288	111.1810	111.3580	110.9300	111.0720
11363	2018-08-27 00:00:00+00	361	288	111.0740	111.3480	110.9000	111.2440
11364	2018-08-26 00:00:00+00	361	288	111.2470	111.3590	111.2000	111.2400
11365	2018-08-24 00:00:00+00	361	288	111.2160	111.4870	111.0700	111.3520
11366	2018-08-23 00:00:00+00	361	288	111.3520	111.3950	110.5100	110.5490
11367	2018-08-22 00:00:00+00	361	288	110.5490	110.6170	110.0000	110.0730
11368	2018-08-21 00:00:00+00	361	288	110.0780	110.5470	109.7400	109.9310
11369	2018-08-20 00:00:00+00	361	288	109.9300	110.6850	109.8900	110.5080
11370	2018-08-19 00:00:00+00	361	288	110.4990	110.6080	110.4600	110.4750
11371	2018-08-17 00:00:00+00	361	288	110.4900	111.0520	110.2800	110.9430
11372	2018-08-16 00:00:00+00	361	288	110.9450	111.1240	110.4400	110.6290
11373	2018-08-15 00:00:00+00	361	288	110.6300	111.4320	110.4100	111.1790
11374	2018-08-14 00:00:00+00	361	288	111.1800	111.3150	110.5600	110.7220
11375	2018-08-13 00:00:00+00	361	288	110.7220	110.9390	110.0800	110.5950
11376	2018-08-12 00:00:00+00	361	288	110.5950	110.7470	110.3000	110.5700
11377	2018-08-10 00:00:00+00	361	288	110.7970	111.1700	110.4900	111.1570
11378	2018-08-09 00:00:00+00	361	288	111.1580	111.1850	110.6800	110.8820
11379	2018-08-08 00:00:00+00	361	288	110.8820	111.4390	110.8100	111.3640
11380	2018-08-07 00:00:00+00	361	288	111.3640	111.4790	110.9600	111.3630
11381	2018-08-06 00:00:00+00	361	288	111.3620	111.5270	111.1400	111.2460
11382	2018-08-05 00:00:00+00	361	288	111.2460	111.2630	111.1200	111.2400
11383	2018-08-03 00:00:00+00	361	288	111.2050	111.8750	111.0700	111.6260
11384	2018-08-02 00:00:00+00	361	288	111.6190	111.7370	111.3050	111.6700
11385	2018-08-01 00:00:00+00	361	288	111.6700	112.1520	111.3700	111.7670
11386	2018-07-31 00:00:00+00	361	288	111.7670	111.9580	110.7380	111.0220
11387	2018-07-30 00:00:00+00	361	288	111.0210	111.1650	110.8600	110.9640
11388	2018-07-29 00:00:00+00	361	288	110.9640	111.0260	110.8700	110.9380
11389	2018-07-27 00:00:00+00	361	288	111.0210	111.2560	110.7700	111.2010
11390	2018-07-26 00:00:00+00	361	288	111.2010	111.2500	110.5700	110.9150
11391	2018-07-25 00:00:00+00	361	288	110.9150	111.3840	110.6400	111.2420
11392	2018-07-24 00:00:00+00	361	288	111.2400	111.5140	110.9300	111.3770
11393	2018-07-23 00:00:00+00	361	288	111.3760	111.5440	110.7400	111.3330
11394	2018-07-22 00:00:00+00	361	288	111.3340	111.5080	111.1600	111.3970
11395	2018-07-20 00:00:00+00	361	288	111.4160	112.6230	111.3500	112.4460
11396	2018-07-19 00:00:00+00	361	288	112.4430	113.1760	112.0430	112.8580
11397	2018-07-18 00:00:00+00	361	288	112.8580	113.1380	112.6900	112.9240
11398	2018-07-17 00:00:00+00	361	288	112.9240	112.9490	112.2000	112.3130
11399	2018-07-16 00:00:00+00	361	288	112.3080	112.5640	112.2000	112.3970
11400	2018-07-15 00:00:00+00	361	288	112.3950	112.4290	112.0900	112.3000
11401	2018-07-13 00:00:00+00	361	288	112.3300	112.8000	112.2400	112.6070
11402	2018-07-12 00:00:00+00	361	288	112.6070	112.6610	111.8900	111.9410
11403	2018-07-11 00:00:00+00	361	288	111.9420	112.1760	110.7400	110.8420
11404	2018-07-10 00:00:00+00	361	288	110.8410	111.3540	110.7700	110.8700
11405	2018-07-09 00:00:00+00	361	288	110.8700	110.9030	110.3300	110.4090
11406	2018-07-08 00:00:00+00	361	288	110.4080	110.4790	110.2800	110.4440
11407	2018-07-06 00:00:00+00	361	288	110.4640	110.7860	110.3500	110.6590
11408	2018-07-05 00:00:00+00	361	288	110.6590	110.7320	110.2700	110.4720
11409	2018-07-04 00:00:00+00	361	288	110.4710	110.5570	110.2500	110.5000
11410	2018-07-03 00:00:00+00	361	288	110.5000	111.1350	110.4500	110.8390
11411	2018-07-02 00:00:00+00	361	288	110.8380	111.0630	110.5700	110.7020
11412	2018-07-01 00:00:00+00	361	288	110.7020	110.8400	110.4800	110.7200
11413	2018-06-29 00:00:00+00	361	288	110.6700	110.9430	110.3500	110.4880
11414	2018-06-28 00:00:00+00	361	288	110.4900	110.6490	109.9400	110.2310
11415	2018-06-27 00:00:00+00	361	288	110.2310	110.4900	109.6500	110.0570
11416	2018-06-26 00:00:00+00	361	288	110.0580	110.2160	109.3500	109.6760
11417	2018-06-25 00:00:00+00	361	288	109.6770	110.0420	109.3500	109.9210
11418	2018-06-24 00:00:00+00	361	288	109.9210	110.0200	109.7200	109.8900
11419	2018-06-22 00:00:00+00	361	288	109.8550	110.2180	109.7800	109.9020
11420	2018-06-21 00:00:00+00	361	288	109.8990	110.7600	109.8100	110.3700
11421	2018-06-20 00:00:00+00	361	288	110.3760	110.4510	109.8200	110.0340
11422	2018-06-19 00:00:00+00	361	288	110.0340	110.5480	109.5300	110.5420
11423	2018-06-18 00:00:00+00	361	288	110.5420	110.6690	110.2700	110.6110
11424	2018-06-17 00:00:00+00	361	288	110.6140	110.7370	110.5600	110.6410
11425	2018-06-15 00:00:00+00	361	288	110.6350	110.9040	110.3600	110.5730
11426	2018-06-14 00:00:00+00	361	288	110.5710	110.6940	109.8900	110.1950
11427	2018-06-13 00:00:00+00	361	288	110.1900	110.8480	110.0600	110.4450
11428	2018-06-12 00:00:00+00	361	288	110.4430	110.5430	110.0700	110.1650
11429	2018-06-11 00:00:00+00	361	288	110.1650	110.1730	109.3400	109.4140
11430	2018-06-10 00:00:00+00	361	288	109.4180	109.5040	109.2000	109.4770
11431	2018-06-08 00:00:00+00	361	288	109.5150	109.8530	109.1700	109.6910
11432	2018-06-07 00:00:00+00	361	288	109.6920	110.2220	109.4700	110.1600
11433	2018-06-06 00:00:00+00	361	288	110.1600	110.2670	109.7600	109.8270
11434	2018-06-05 00:00:00+00	361	288	109.8260	110.0050	109.4500	109.9000
11435	2018-06-04 00:00:00+00	361	288	109.8910	109.9070	109.3500	109.5520
11436	2018-06-03 00:00:00+00	361	288	109.5520	109.5560	109.4100	109.4620
11437	2018-06-01 00:00:00+00	361	288	109.5180	109.7360	108.7000	108.7730
11438	2018-05-31 00:00:00+00	361	288	108.7730	109.0030	108.3700	108.8240
11439	2018-05-30 00:00:00+00	361	288	108.8240	109.0750	108.3200	108.6270
11440	2018-05-29 00:00:00+00	361	288	108.6290	109.4590	108.0800	109.4500
11441	2018-05-28 00:00:00+00	361	288	109.4500	109.7480	109.2200	109.6440
11442	2018-05-27 00:00:00+00	361	288	109.6410	109.8320	109.3730	109.4630
11443	2018-05-26 00:00:00+00	361	288	109.4250	109.4250	109.4250	109.4250
11444	2018-05-25 00:00:00+00	361	288	109.4250	109.7440	109.0900	109.2570
11445	2018-05-24 00:00:00+00	361	288	109.2590	110.0440	108.9300	109.9850
11446	2018-05-23 00:00:00+00	361	288	109.9890	110.8790	109.5400	110.8240
11447	2018-05-22 00:00:00+00	361	288	110.8240	111.1860	110.7500	110.9560
11448	2018-05-21 00:00:00+00	361	288	110.9570	111.3960	110.8000	110.8660
11449	2018-05-20 00:00:00+00	361	288	110.8660	111.0120	110.7200	110.8350
11450	2018-05-18 00:00:00+00	361	288	110.7760	111.0820	110.5800	110.7830
11451	2018-05-17 00:00:00+00	361	288	110.7830	110.8600	110.0600	110.2940
11452	2018-05-16 00:00:00+00	361	288	110.2940	110.4080	110.0100	110.2860
11453	2018-05-15 00:00:00+00	361	288	110.2850	110.4560	109.6300	109.7080
11454	2018-05-14 00:00:00+00	361	288	109.7050	109.7170	109.1800	109.3600
11455	2018-05-13 00:00:00+00	361	288	109.3640	109.4040	109.2400	109.3610
11456	2018-05-11 00:00:00+00	361	288	109.3800	109.5680	109.1200	109.4070
11457	2018-05-10 00:00:00+00	361	288	109.4060	110.0190	109.2900	109.7460
11458	2018-05-09 00:00:00+00	361	288	109.7450	109.8330	108.9700	109.1000
11459	2018-05-08 00:00:00+00	361	288	109.1000	109.3520	108.8100	109.1370
11460	2018-05-07 00:00:00+00	361	288	109.1350	109.3980	108.7300	109.0870
11461	2018-05-06 00:00:00+00	361	288	109.0770	109.1900	109.0000	109.1100
11462	2018-05-04 00:00:00+00	361	288	109.1010	109.2740	108.6200	109.1550
11463	2018-05-03 00:00:00+00	361	288	109.1570	109.8560	108.9000	109.8310
11464	2018-05-02 00:00:00+00	361	288	109.8290	110.0370	109.5600	109.9080
11465	2018-05-01 00:00:00+00	361	288	109.9080	109.9110	109.2200	109.2710
11466	2018-04-30 00:00:00+00	361	288	109.2670	109.4520	108.9900	109.1420
11467	2018-04-29 00:00:00+00	361	288	109.1440	109.1640	108.9650	109.1050
11468	2018-04-27 00:00:00+00	361	288	109.0330	109.5390	108.9600	109.3480
11469	2018-04-26 00:00:00+00	361	288	109.3500	109.4570	109.0300	109.4090
11470	2018-04-25 00:00:00+00	361	288	109.4090	109.4690	108.7600	108.8570
11471	2018-04-24 00:00:00+00	361	288	108.8560	109.2020	108.5200	108.6720
11472	2018-04-23 00:00:00+00	361	288	108.6720	108.7540	107.7000	107.7800
11473	2018-04-22 00:00:00+00	361	288	107.7800	107.8300	107.5990	107.6100
11474	2018-04-20 00:00:00+00	361	288	107.6470	107.8560	107.3400	107.4250
11475	2018-04-19 00:00:00+00	361	288	107.4230	107.5170	107.1800	107.2150
11476	2018-04-18 00:00:00+00	361	288	107.2130	107.3860	106.9800	107.0330
11477	2018-04-17 00:00:00+00	361	288	107.0330	107.2130	106.8500	107.1150
11478	2018-04-16 00:00:00+00	361	288	107.1140	107.5860	107.0100	107.5420
11479	2018-04-15 00:00:00+00	361	288	107.5410	107.6090	107.2630	107.3410
11480	2018-04-13 00:00:00+00	361	288	107.3200	107.7800	107.1800	107.2490
11481	2018-04-12 00:00:00+00	361	288	107.2490	107.4300	106.6700	106.7920
11482	2018-04-11 00:00:00+00	361	288	106.8000	107.2260	106.6200	107.2080
11483	2018-04-10 00:00:00+00	361	288	107.2070	107.3990	106.5900	106.7280
11484	2018-04-09 00:00:00+00	361	288	106.7340	107.2030	106.5900	106.8980
11485	2018-04-08 00:00:00+00	361	288	106.8940	107.0400	106.7600	106.8170
11486	2018-04-06 00:00:00+00	361	288	106.8920	107.4600	106.7500	107.1500
11487	2018-04-05 00:00:00+00	361	288	107.1500	107.4930	106.6800	106.7810
11488	2018-04-04 00:00:00+00	361	288	106.7800	106.8480	105.9700	106.5070
11489	2018-04-03 00:00:00+00	361	288	106.5040	106.6620	105.6600	105.8350
11490	2018-04-02 00:00:00+00	361	288	105.8330	106.4500	105.6300	106.3020
11491	2018-04-01 00:00:00+00	361	288	106.2920	106.4050	106.1670	106.2370
11492	2018-03-30 00:00:00+00	361	288	106.2480	106.5150	106.0900	106.4810
11493	2018-03-29 00:00:00+00	361	288	106.4810	106.9340	106.2300	106.8180
11494	2018-03-28 00:00:00+00	361	288	106.8200	107.0120	105.3400	105.4010
11495	2018-03-27 00:00:00+00	361	288	105.3980	105.9030	105.2900	105.4520
11496	2018-03-26 00:00:00+00	361	288	105.4520	105.5490	104.6900	104.7270
11497	2018-03-25 00:00:00+00	361	288	104.7270	104.8210	104.5400	104.6950
11498	2018-03-23 00:00:00+00	361	288	104.7290	105.2860	104.6200	104.8500
11499	2018-03-22 00:00:00+00	361	288	104.8480	105.9840	104.6100	105.9580
11500	2018-03-21 00:00:00+00	361	288	105.9630	106.6400	105.8500	106.5370
11501	2018-03-20 00:00:00+00	361	288	106.5380	106.6080	105.9000	106.0420
11502	2018-03-19 00:00:00+00	361	288	106.0400	106.3070	105.6500	105.9750
11503	2018-03-18 00:00:00+00	361	288	105.9770	106.0690	105.7800	105.9280
11504	2018-03-16 00:00:00+00	361	288	105.9760	106.3670	105.5700	106.2880
11505	2018-03-15 00:00:00+00	361	288	106.2880	106.4150	105.7600	106.3180
11506	2018-03-14 00:00:00+00	361	288	106.3190	106.7490	106.0400	106.4970
11507	2018-03-13 00:00:00+00	361	288	106.4870	107.2920	106.2200	106.4050
11508	2018-03-12 00:00:00+00	361	288	106.4040	106.9720	106.2900	106.9420
11509	2018-03-11 00:00:00+00	361	288	106.9420	106.9610	106.5600	106.7800
11510	2018-03-10 00:00:00+00	361	288	106.7700	106.7900	106.7700	106.7900
11511	2018-03-09 00:00:00+00	361	288	106.8060	107.0520	106.2490	106.2870
11512	2018-03-08 00:00:00+00	361	288	106.2860	106.3150	105.8800	106.1260
11513	2018-03-07 00:00:00+00	361	288	106.1250	106.2250	105.4300	105.6580
11514	2018-03-06 00:00:00+00	361	288	105.6600	106.4640	105.5400	106.2110
11515	2018-03-05 00:00:00+00	361	288	106.2140	106.2380	105.3200	105.6090
11516	2018-03-04 00:00:00+00	361	288	105.6090	105.7120	105.3980	105.6300
11517	2018-03-02 00:00:00+00	361	288	105.7160	106.2980	105.2300	106.0950
11518	2018-03-01 00:00:00+00	361	288	106.0950	107.2050	106.0500	106.6510
11519	2018-02-28 00:00:00+00	361	288	106.6540	107.5280	106.5400	107.3470
11520	2018-02-27 00:00:00+00	361	288	107.3480	107.6750	106.7600	107.0050
11521	2018-02-26 00:00:00+00	361	288	107.0030	107.1160	106.3500	107.0460
11522	2018-02-25 00:00:00+00	361	288	107.0540	107.2570	106.6950	106.7550
11523	2018-02-23 00:00:00+00	361	288	106.7960	107.1330	106.4800	106.7240
11524	2018-02-22 00:00:00+00	361	288	106.7230	107.7630	106.5700	107.7490
11525	2018-02-21 00:00:00+00	361	288	107.7480	107.9030	107.2600	107.3150
11526	2018-02-20 00:00:00+00	361	288	107.3160	107.3770	106.5700	106.6070
11527	2018-02-19 00:00:00+00	361	288	106.6050	106.7280	106.0700	106.3060
11528	2018-02-18 00:00:00+00	361	288	106.3090	106.4030	106.1790	106.2970
11529	2018-02-16 00:00:00+00	361	288	106.1260	106.3990	105.5200	106.1520
11530	2018-02-15 00:00:00+00	361	288	106.1500	106.9840	106.0090	106.9670
11531	2018-02-14 00:00:00+00	361	288	106.9710	107.9030	106.7000	107.8290
11532	2018-02-13 00:00:00+00	361	288	107.8280	108.7810	107.4000	108.7190
11533	2018-02-12 00:00:00+00	361	288	108.7170	108.8930	108.4100	108.8280
11534	2018-02-11 00:00:00+00	361	288	108.8490	108.9350	108.6690	108.7770
11535	2018-02-09 00:00:00+00	361	288	108.7770	109.3100	108.0200	108.7560
11536	2018-02-08 00:00:00+00	361	288	108.7450	109.7840	108.5600	109.3680
11537	2018-02-07 00:00:00+00	361	288	109.3720	109.7040	108.8890	109.7000
11538	2018-02-06 00:00:00+00	361	288	109.6990	109.7120	108.4400	109.1290
11539	2018-02-05 00:00:00+00	361	288	109.1300	110.2810	108.9830	110.2670
11540	2018-02-04 00:00:00+00	361	288	110.2690	110.2900	109.8720	110.1000
11541	2018-02-02 00:00:00+00	361	288	110.0300	110.4820	109.2600	109.4540
11542	2018-02-01 00:00:00+00	361	288	109.4520	109.7510	109.0700	109.1910
11543	2018-01-31 00:00:00+00	361	288	109.1930	109.4460	108.5700	108.7610
11544	2018-01-30 00:00:00+00	361	288	108.7580	109.2050	108.3890	108.9930
11545	2018-01-29 00:00:00+00	361	288	108.9920	109.2030	108.4800	108.6500
11546	2018-01-28 00:00:00+00	361	288	108.6540	108.7870	108.5600	108.5600
11547	2018-01-26 00:00:00+00	361	288	108.5160	109.7710	108.2600	109.6540
11548	2018-01-25 00:00:00+00	361	288	109.6530	109.7030	108.4700	109.1840
11549	2018-01-24 00:00:00+00	361	288	109.1850	110.3380	108.9400	110.2810
11550	2018-01-23 00:00:00+00	361	288	110.2760	111.1790	110.2070	110.9310
11551	2018-01-22 00:00:00+00	361	288	110.9310	111.2240	110.5300	110.6140
11552	2018-01-21 00:00:00+00	361	288	110.6160	110.6760	110.4840	110.6130
11553	2018-01-19 00:00:00+00	361	288	110.6150	111.1290	110.4690	111.0470
11554	2018-01-18 00:00:00+00	361	288	111.0470	111.4820	110.6700	111.3530
11555	2018-01-17 00:00:00+00	361	288	111.3480	111.3620	110.1600	110.4340
11556	2018-01-16 00:00:00+00	361	288	110.4370	110.9830	110.2200	110.5440
11557	2018-01-15 00:00:00+00	361	288	110.5450	111.1850	110.3000	111.0950
11558	2018-01-14 00:00:00+00	361	288	111.0930	111.1670	110.9420	111.0060
11559	2018-01-12 00:00:00+00	361	288	110.9410	111.6980	110.8800	111.2280
11560	2018-01-11 00:00:00+00	361	288	111.2280	111.8760	111.0100	111.3980
11561	2018-01-10 00:00:00+00	361	288	111.3900	112.7850	111.2500	112.6220
11562	2018-01-09 00:00:00+00	361	288	112.6230	113.1800	112.3300	113.1580
11563	2018-01-08 00:00:00+00	361	288	113.1460	113.3870	112.8500	113.1160
11564	2018-01-07 00:00:00+00	361	288	113.1120	113.1580	112.9640	113.0430
11565	2018-01-05 00:00:00+00	361	288	112.9850	113.3200	112.6990	112.7740
11566	2018-01-04 00:00:00+00	361	288	112.7750	112.8640	112.4600	112.5420
11567	2018-01-03 00:00:00+00	361	288	112.5430	112.6080	112.1400	112.2240
11568	2018-01-02 00:00:00+00	361	288	112.2270	112.7910	112.0300	112.5930
11569	2018-01-01 00:00:00+00	361	288	112.5860	112.7010	112.5550	112.6700
11572	2019-11-07 00:00:00+00	355	263	0.1569	0.1573	0.1563	0.1566
11573	2019-11-06 00:00:00+00	355	263	0.1566	0.1568	0.1559	0.1564
11574	2019-11-05 00:00:00+00	355	263	0.1564	0.1567	0.1558	0.1562
11575	2019-11-04 00:00:00+00	355	263	0.1562	0.1571	0.1558	0.1565
11576	2019-11-03 00:00:00+00	355	263	0.1565	0.1567	0.1563	0.1565
11577	2019-11-01 00:00:00+00	355	263	0.1566	0.1566	0.1557	0.1565
11578	2019-10-31 00:00:00+00	355	263	0.1566	0.1568	0.1561	0.1567
11579	2019-10-30 00:00:00+00	355	263	0.1567	0.1573	0.1554	0.1560
11580	2019-10-29 00:00:00+00	355	263	0.1560	0.1570	0.1560	0.1567
11581	2019-10-28 00:00:00+00	355	263	0.1568	0.1572	0.1557	0.1559
11582	2019-10-27 00:00:00+00	355	263	0.1561	0.1562	0.1557	0.1560
11583	2019-10-25 00:00:00+00	355	263	0.1558	0.1561	0.1551	0.1557
11584	2019-10-24 00:00:00+00	355	263	0.1557	0.1561	0.1551	0.1560
11585	2019-10-23 00:00:00+00	355	263	0.1560	0.1565	0.1542	0.1545
11586	2019-10-22 00:00:00+00	355	263	0.1546	0.1547	0.1525	0.1525
11587	2019-10-21 00:00:00+00	355	263	0.1525	0.1544	0.1525	0.1541
11588	2019-10-20 00:00:00+00	355	263	0.1541	0.1544	0.1539	0.1544
11589	2019-10-18 00:00:00+00	355	263	0.1538	0.1556	0.1538	0.1542
11590	2019-10-17 00:00:00+00	355	263	0.1542	0.1542	0.1511	0.1530
11591	2019-10-16 00:00:00+00	355	263	0.1530	0.1535	0.1523	0.1525
11592	2019-10-15 00:00:00+00	355	263	0.1525	0.1543	0.1524	0.1524
11593	2019-10-14 00:00:00+00	355	263	0.1524	0.1533	0.1523	0.1532
11594	2019-10-13 00:00:00+00	355	263	0.1532	0.1534	0.1531	0.1534
11595	2019-10-11 00:00:00+00	355	263	0.1535	0.1552	0.1531	0.1549
11596	2019-10-10 00:00:00+00	355	263	0.1549	0.1555	0.1532	0.1544
11597	2019-10-09 00:00:00+00	355	263	0.1544	0.1561	0.1544	0.1560
11598	2019-10-08 00:00:00+00	355	263	0.1560	0.1567	0.1552	0.1555
11599	2019-10-07 00:00:00+00	355	263	0.1555	0.1590	0.1554	0.1589
11600	2019-10-06 00:00:00+00	355	263	0.1589	0.1594	0.1588	0.1594
11601	2019-10-04 00:00:00+00	355	263	0.1593	0.1598	0.1591	0.1595
11602	2019-10-03 00:00:00+00	355	263	0.1595	0.1604	0.1591	0.1595
11603	2019-10-02 00:00:00+00	355	263	0.1595	0.1598	0.1587	0.1593
10519	2019-11-08 00:00:00+00	914	361	1309.0000	1316.8199	1302.4750	1301.5200
55686	2019-12-27 02:25:00+00	288	266	0.0070	0.0070	0.0070	0.0070
11604	2019-10-01 00:00:00+00	355	263	0.1593	0.1621	0.1592	0.1619
11605	2019-09-30 00:00:00+00	355	263	0.1619	0.1621	0.1606	0.1607
11606	2019-09-29 00:00:00+00	355	263	0.1607	0.1609	0.1605	0.1605
11607	2019-09-27 00:00:00+00	355	263	0.1607	0.1612	0.1603	0.1610
11608	2019-09-26 00:00:00+00	355	263	0.1610	0.1613	0.1598	0.1605
11609	2019-09-25 00:00:00+00	355	263	0.1604	0.1607	0.1587	0.1588
11610	2019-09-24 00:00:00+00	355	263	0.1587	0.1599	0.1585	0.1585
11611	2019-09-23 00:00:00+00	355	263	0.1585	0.1590	0.1575	0.1576
11612	2019-09-22 00:00:00+00	355	263	0.1577	0.1578	0.1575	0.1575
11613	2019-09-20 00:00:00+00	355	263	0.1576	0.1588	0.1574	0.1578
11614	2019-09-19 00:00:00+00	355	263	0.1578	0.1592	0.1577	0.1592
11615	2019-09-18 00:00:00+00	355	263	0.1592	0.1594	0.1578	0.1578
11616	2019-09-17 00:00:00+00	355	263	0.1578	0.1585	0.1577	0.1581
11617	2019-09-16 00:00:00+00	355	263	0.1581	0.1588	0.1568	0.1571
11618	2019-09-15 00:00:00+00	355	263	0.1571	0.1582	0.1571	0.1582
11619	2019-09-13 00:00:00+00	355	263	0.1583	0.1593	0.1579	0.1592
11620	2019-09-12 00:00:00+00	355	263	0.1592	0.1608	0.1570	0.1574
11621	2019-09-11 00:00:00+00	355	263	0.1574	0.1578	0.1558	0.1563
11622	2019-09-10 00:00:00+00	355	263	0.1564	0.1571	0.1560	0.1570
11623	2019-09-09 00:00:00+00	355	263	0.1570	0.1585	0.1564	0.1584
11624	2019-09-08 00:00:00+00	355	263	0.1584	0.1585	0.1583	0.1583
11625	2019-09-06 00:00:00+00	355	263	0.1582	0.1588	0.1575	0.1587
11626	2019-09-05 00:00:00+00	355	263	0.1586	0.1600	0.1582	0.1592
11627	2019-09-04 00:00:00+00	355	263	0.1592	0.1603	0.1584	0.1586
11628	2019-09-03 00:00:00+00	355	263	0.1586	0.1588	0.1565	0.1565
11629	2019-09-02 00:00:00+00	355	263	0.1565	0.1567	0.1553	0.1554
11630	2019-09-01 00:00:00+00	355	263	0.1554	0.1555	0.1553	0.1554
11631	2019-08-30 00:00:00+00	355	263	0.1555	0.1560	0.1543	0.1543
11632	2019-08-29 00:00:00+00	355	263	0.1543	0.1548	0.1539	0.1546
11633	2019-08-28 00:00:00+00	355	263	0.1546	0.1553	0.1540	0.1542
11634	2019-08-27 00:00:00+00	355	263	0.1542	0.1546	0.1533	0.1542
11635	2019-08-26 00:00:00+00	355	263	0.1542	0.1549	0.1533	0.1540
11636	2019-08-25 00:00:00+00	355	263	0.1537	0.1552	0.1486	0.1552
11637	2019-08-23 00:00:00+00	355	263	0.1553	0.1566	0.1549	0.1559
11638	2019-08-22 00:00:00+00	355	263	0.1558	0.1574	0.1551	0.1574
11639	2019-08-21 00:00:00+00	355	263	0.1570	0.1574	0.1566	0.1566
11640	2019-08-20 00:00:00+00	355	263	0.1566	0.1594	0.1564	0.1592
11641	2019-08-19 00:00:00+00	355	263	0.1593	0.1615	0.1583	0.1609
11642	2019-08-18 00:00:00+00	355	263	0.1608	0.1611	0.1607	0.1611
11643	2019-08-16 00:00:00+00	355	263	0.1611	0.1628	0.1609	0.1611
11644	2019-08-15 00:00:00+00	355	263	0.1611	0.1615	0.1593	0.1594
11645	2019-08-14 00:00:00+00	355	263	0.1594	0.1604	0.1589	0.1604
11646	2019-08-13 00:00:00+00	355	263	0.1603	0.1607	0.1576	0.1598
11647	2019-08-12 00:00:00+00	355	263	0.1597	0.1621	0.1597	0.1621
11648	2019-08-11 00:00:00+00	355	263	0.1619	0.1623	0.1619	0.1619
11649	2019-08-09 00:00:00+00	355	263	0.1616	0.1630	0.1613	0.1625
11650	2019-08-08 00:00:00+00	355	263	0.1625	0.1633	0.1614	0.1621
11651	2019-08-07 00:00:00+00	355	263	0.1620	0.1626	0.1607	0.1609
11652	2019-08-06 00:00:00+00	355	263	0.1609	0.1617	0.1585	0.1590
11653	2019-08-05 00:00:00+00	355	263	0.1590	0.1617	0.1589	0.1616
11654	2019-08-04 00:00:00+00	355	263	0.1615	0.1618	0.1613	0.1614
11655	2019-08-02 00:00:00+00	355	263	0.1614	0.1618	0.1602	0.1606
11656	2019-08-01 00:00:00+00	355	263	0.1606	0.1622	0.1600	0.1612
11657	2019-07-31 00:00:00+00	355	263	0.1613	0.1622	0.1602	0.1608
11658	2019-07-30 00:00:00+00	355	263	0.1608	0.1610	0.1591	0.1591
11659	2019-07-29 00:00:00+00	355	263	0.1591	0.1598	0.1580	0.1582
11660	2019-07-28 00:00:00+00	355	263	0.1583	0.1588	0.1580	0.1582
11661	2019-07-26 00:00:00+00	355	263	0.1579	0.1595	0.1568	0.1568
11662	2019-07-25 00:00:00+00	355	263	0.1568	0.1587	0.1560	0.1565
11663	2019-07-24 00:00:00+00	355	263	0.1565	0.1571	0.1561	0.1565
11664	2019-07-23 00:00:00+00	355	263	0.1564	0.1571	0.1562	0.1567
11665	2019-07-22 00:00:00+00	355	263	0.1567	0.1574	0.1562	0.1573
11666	2019-07-21 00:00:00+00	355	263	0.1570	0.1577	0.1569	0.1570
11667	2019-07-19 00:00:00+00	355	263	0.1571	0.1576	0.1565	0.1574
11668	2019-07-18 00:00:00+00	355	263	0.1574	0.1578	0.1554	0.1562
11669	2019-07-17 00:00:00+00	355	263	0.1561	0.1564	0.1555	0.1557
11670	2019-07-16 00:00:00+00	355	263	0.1557	0.1560	0.1547	0.1551
11671	2019-07-15 00:00:00+00	355	263	0.1551	0.1552	0.1543	0.1543
11672	2019-07-14 00:00:00+00	355	263	0.1543	0.1548	0.1543	0.1546
11673	2019-07-12 00:00:00+00	355	263	0.1547	0.1561	0.1535	0.1558
11674	2019-07-11 00:00:00+00	355	263	0.1560	0.1564	0.1554	0.1557
11675	2019-07-10 00:00:00+00	355	263	0.1557	0.1562	0.1543	0.1551
11676	2019-07-09 00:00:00+00	355	263	0.1551	0.1564	0.1548	0.1550
11677	2019-07-08 00:00:00+00	355	263	0.1550	0.1555	0.1536	0.1547
11678	2019-07-07 00:00:00+00	355	263	0.1547	0.1578	0.1532	0.1578
11679	2019-07-05 00:00:00+00	355	263	0.1578	0.1581	0.1573	0.1576
11680	2019-07-04 00:00:00+00	355	263	0.1578	0.1581	0.1570	0.1570
11681	2019-07-03 00:00:00+00	355	263	0.1570	0.1575	0.1561	0.1561
11682	2019-07-02 00:00:00+00	355	263	0.1561	0.1567	0.1549	0.1563
11683	2019-07-01 00:00:00+00	355	263	0.1563	0.1565	0.1527	0.1529
11684	2019-06-30 00:00:00+00	355	263	0.1530	0.1530	0.1529	0.1530
11685	2019-06-28 00:00:00+00	355	263	0.1514	0.1522	0.1512	0.1518
11686	2019-06-27 00:00:00+00	355	263	0.1518	0.1521	0.1514	0.1518
11687	2019-06-26 00:00:00+00	355	263	0.1518	0.1525	0.1510	0.1513
11688	2019-06-25 00:00:00+00	355	263	0.1513	0.1520	0.1502	0.1507
11689	2019-06-24 00:00:00+00	355	263	0.1507	0.1533	0.1503	0.1519
11690	2019-06-23 00:00:00+00	355	263	0.1519	0.1531	0.1515	0.1515
11691	2019-06-21 00:00:00+00	355	263	0.1505	0.1532	0.1504	0.1531
11692	2019-06-20 00:00:00+00	355	263	0.1531	0.1540	0.1526	0.1531
11693	2019-06-19 00:00:00+00	355	263	0.1531	0.1535	0.1508	0.1528
11694	2019-06-18 00:00:00+00	355	263	0.1526	0.1531	0.1510	0.1512
11695	2019-06-17 00:00:00+00	355	263	0.1512	0.1516	0.1499	0.1503
11696	2019-06-16 00:00:00+00	355	263	0.1503	0.1506	0.1502	0.1505
11697	2019-06-14 00:00:00+00	355	263	0.1508	0.1513	0.1490	0.1506
11698	2019-06-13 00:00:00+00	355	263	0.1506	0.1520	0.1499	0.1519
11699	2019-06-12 00:00:00+00	355	263	0.1519	0.1524	0.1508	0.1515
11700	2019-06-11 00:00:00+00	355	263	0.1517	0.1530	0.1509	0.1521
11701	2019-06-10 00:00:00+00	355	263	0.1521	0.1531	0.1504	0.1509
11702	2019-06-09 00:00:00+00	355	263	0.1509	0.1513	0.1506	0.1509
11703	2019-06-07 00:00:00+00	355	263	0.1508	0.1529	0.1507	0.1526
11704	2019-06-06 00:00:00+00	355	263	0.1526	0.1554	0.1525	0.1551
11705	2019-06-05 00:00:00+00	355	263	0.1551	0.1556	0.1529	0.1533
11706	2019-06-04 00:00:00+00	355	263	0.1533	0.1543	0.1511	0.1519
11707	2019-06-03 00:00:00+00	355	263	0.1519	0.1528	0.1513	0.1521
11708	2019-06-02 00:00:00+00	355	263	0.1521	0.1531	0.1521	0.1528
11709	2019-05-31 00:00:00+00	355	263	0.1528	0.1533	0.1512	0.1519
11710	2019-05-30 00:00:00+00	355	263	0.1520	0.1528	0.1485	0.1488
11711	2019-05-29 00:00:00+00	355	263	0.1488	0.1489	0.1475	0.1480
11712	2019-05-28 00:00:00+00	355	263	0.1480	0.1485	0.1465	0.1468
11713	2019-05-27 00:00:00+00	355	263	0.1468	0.1473	0.1460	0.1460
11714	2019-05-26 00:00:00+00	355	263	0.1460	0.1465	0.1454	0.1454
11715	2019-05-24 00:00:00+00	355	263	0.1462	0.1467	0.1454	0.1457
11716	2019-05-23 00:00:00+00	355	263	0.1457	0.1464	0.1453	0.1464
11717	2019-05-22 00:00:00+00	355	263	0.1464	0.1474	0.1460	0.1472
11718	2019-05-21 00:00:00+00	355	263	0.1472	0.1484	0.1470	0.1480
11719	2019-05-20 00:00:00+00	355	263	0.1480	0.1487	0.1470	0.1473
11720	2019-05-19 00:00:00+00	355	263	0.1472	0.1477	0.1472	0.1477
11721	2019-05-17 00:00:00+00	355	263	0.1475	0.1478	0.1464	0.1472
11722	2019-05-16 00:00:00+00	355	263	0.1473	0.1481	0.1472	0.1478
11723	2019-05-15 00:00:00+00	355	263	0.1478	0.1485	0.1461	0.1473
11724	2019-05-14 00:00:00+00	355	263	0.1474	0.1484	0.1452	0.1461
11725	2019-05-13 00:00:00+00	355	263	0.1461	0.1488	0.1447	0.1482
11726	2019-05-12 00:00:00+00	355	263	0.1480	0.1483	0.1477	0.1482
11727	2019-05-10 00:00:00+00	355	263	0.1484	0.1484	0.1441	0.1442
11728	2019-05-09 00:00:00+00	355	263	0.1441	0.1446	0.1420	0.1444
11729	2019-05-08 00:00:00+00	355	263	0.1444	0.1447	0.1436	0.1446
11730	2019-05-07 00:00:00+00	355	263	0.1446	0.1463	0.1437	0.1462
11731	2019-05-06 00:00:00+00	355	263	0.1462	0.1490	0.1454	0.1488
11732	2019-05-05 00:00:00+00	355	263	0.1488	0.1497	0.1487	0.1497
11733	2019-05-03 00:00:00+00	355	263	0.1495	0.1497	0.1490	0.1496
11734	2019-05-02 00:00:00+00	355	263	0.1496	0.1496	0.1488	0.1491
11735	2019-05-01 00:00:00+00	355	263	0.1491	0.1495	0.1486	0.1490
11736	2019-04-30 00:00:00+00	355	263	0.1490	0.1498	0.1488	0.1497
11737	2019-04-29 00:00:00+00	355	263	0.1498	0.1507	0.1497	0.1503
11738	2019-04-28 00:00:00+00	355	263	0.1503	0.1507	0.1503	0.1506
11739	2019-04-26 00:00:00+00	355	263	0.1503	0.1509	0.1499	0.1504
11740	2019-04-25 00:00:00+00	355	263	0.1506	0.1520	0.1499	0.1517
11741	2019-04-24 00:00:00+00	355	263	0.1517	0.1524	0.1512	0.1521
11742	2019-04-23 00:00:00+00	355	263	0.1521	0.1525	0.1516	0.1519
11743	2019-04-22 00:00:00+00	355	263	0.1519	0.1525	0.1515	0.1522
11744	2019-04-21 00:00:00+00	355	263	0.1522	0.1529	0.1520	0.1525
11745	2019-04-19 00:00:00+00	355	263	0.1525	0.1530	0.1520	0.1527
11746	2019-04-18 00:00:00+00	355	263	0.1527	0.1534	0.1515	0.1532
11747	2019-04-17 00:00:00+00	355	263	0.1531	0.1545	0.1524	0.1526
11748	2019-04-16 00:00:00+00	355	263	0.1526	0.1537	0.1514	0.1519
11749	2019-04-15 00:00:00+00	355	263	0.1519	0.1527	0.1515	0.1527
11750	2019-04-14 00:00:00+00	355	263	0.1527	0.1534	0.1527	0.1532
11751	2019-04-12 00:00:00+00	355	263	0.1529	0.1544	0.1512	0.1544
11752	2019-04-11 00:00:00+00	355	263	0.1543	0.1557	0.1537	0.1555
11753	2019-04-10 00:00:00+00	355	263	0.1555	0.1562	0.1547	0.1557
11754	2019-04-09 00:00:00+00	355	263	0.1556	0.1567	0.1550	0.1556
11755	2019-04-08 00:00:00+00	355	263	0.1556	0.1578	0.1547	0.1577
11756	2019-04-07 00:00:00+00	355	263	0.1578	0.1578	0.1576	0.1578
11757	2019-04-05 00:00:00+00	355	263	0.1580	0.1591	0.1574	0.1587
11758	2019-04-04 00:00:00+00	355	263	0.1586	0.1598	0.1567	0.1577
11759	2019-04-03 00:00:00+00	355	263	0.1577	0.1590	0.1572	0.1582
11760	2019-04-02 00:00:00+00	355	263	0.1583	0.1614	0.1572	0.1614
11761	2019-04-01 00:00:00+00	355	263	0.1613	0.1631	0.1558	0.1589
11762	2019-03-31 00:00:00+00	355	263	0.1589	0.1597	0.1583	0.1593
11763	2019-03-29 00:00:00+00	355	263	0.1593	0.1600	0.1565	0.1593
11764	2019-03-28 00:00:00+00	355	263	0.1593	0.1646	0.1576	0.1642
11765	2019-03-27 00:00:00+00	355	263	0.1642	0.1667	0.1620	0.1647
11766	2019-03-26 00:00:00+00	355	263	0.1643	0.1668	0.1576	0.1580
11767	2019-03-25 00:00:00+00	355	263	0.1580	0.1588	0.1535	0.1535
11768	2019-03-24 00:00:00+00	355	263	0.1536	0.1538	0.1529	0.1532
11769	2019-03-22 00:00:00+00	355	263	0.1530	0.1605	0.1509	0.1603
11770	2019-03-21 00:00:00+00	355	263	0.1603	0.1609	0.1601	0.1608
11771	2019-03-20 00:00:00+00	355	263	0.1608	0.1611	0.1601	0.1603
11772	2019-03-19 00:00:00+00	355	263	0.1603	0.1609	0.1602	0.1608
11773	2019-03-18 00:00:00+00	355	263	0.1608	0.1616	0.1606	0.1615
11774	2019-03-17 00:00:00+00	355	263	0.1614	0.1616	0.1614	0.1616
11775	2019-03-15 00:00:00+00	355	263	0.1616	0.1617	0.1606	0.1612
11776	2019-03-14 00:00:00+00	355	263	0.1612	0.1614	0.1609	0.1610
11777	2019-03-13 00:00:00+00	355	263	0.1610	0.1620	0.1610	0.1618
11778	2019-03-12 00:00:00+00	355	263	0.1618	0.1631	0.1616	0.1627
11779	2019-03-11 00:00:00+00	355	263	0.1627	0.1635	0.1625	0.1634
11780	2019-03-10 00:00:00+00	355	263	0.1634	0.1635	0.1629	0.1634
11781	2019-03-08 00:00:00+00	355	263	0.1633	0.1633	0.1621	0.1631
11782	2019-03-07 00:00:00+00	355	263	0.1632	0.1632	0.1617	0.1624
11783	2019-03-06 00:00:00+00	355	263	0.1624	0.1642	0.1618	0.1638
11784	2019-03-05 00:00:00+00	355	263	0.1638	0.1640	0.1630	0.1638
11785	2019-03-04 00:00:00+00	355	263	0.1637	0.1640	0.1628	0.1633
11786	2019-03-03 00:00:00+00	355	263	0.1633	0.1633	0.1630	0.1630
11787	2019-03-01 00:00:00+00	355	263	0.1632	0.1643	0.1620	0.1641
11788	2019-02-28 00:00:00+00	355	263	0.1641	0.1650	0.1641	0.1650
11789	2019-02-27 00:00:00+00	355	263	0.1650	0.1655	0.1646	0.1649
11790	2019-02-26 00:00:00+00	355	263	0.1649	0.1657	0.1648	0.1654
11791	2019-02-25 00:00:00+00	355	263	0.1654	0.1659	0.1650	0.1653
11792	2019-02-24 00:00:00+00	355	263	0.1653	0.1655	0.1650	0.1650
11793	2019-02-22 00:00:00+00	355	263	0.1655	0.1655	0.1647	0.1653
11794	2019-02-21 00:00:00+00	355	263	0.1653	0.1656	0.1646	0.1651
11795	2019-02-20 00:00:00+00	355	263	0.1650	0.1665	0.1647	0.1665
11796	2019-02-19 00:00:00+00	355	263	0.1664	0.1666	0.1656	0.1662
11797	2019-02-18 00:00:00+00	355	263	0.1661	0.1673	0.1658	0.1669
11798	2019-02-17 00:00:00+00	355	263	0.1669	0.1675	0.1669	0.1675
11799	2019-02-15 00:00:00+00	355	263	0.1674	0.1682	0.1668	0.1672
11800	2019-02-14 00:00:00+00	355	263	0.1672	0.1678	0.1663	0.1676
11801	2019-02-13 00:00:00+00	355	263	0.1676	0.1680	0.1671	0.1676
11802	2019-02-12 00:00:00+00	355	263	0.1676	0.1680	0.1673	0.1674
11803	2019-02-11 00:00:00+00	355	263	0.1674	0.1679	0.1671	0.1677
11804	2019-02-10 00:00:00+00	355	263	0.1677	0.1679	0.1677	0.1678
11805	2019-02-08 00:00:00+00	355	263	0.1678	0.1678	0.1666	0.1667
11806	2019-02-07 00:00:00+00	355	263	0.1669	0.1682	0.1661	0.1682
11807	2019-02-06 00:00:00+00	355	263	0.1682	0.1683	0.1674	0.1682
11808	2019-02-05 00:00:00+00	355	263	0.1681	0.1683	0.1670	0.1671
11809	2019-02-04 00:00:00+00	355	263	0.1671	0.1673	0.1663	0.1670
11810	2019-02-03 00:00:00+00	355	263	0.1670	0.1672	0.1667	0.1671
11811	2019-02-02 00:00:00+00	355	263	0.1671	0.1671	0.1671	0.1671
11812	2019-02-01 00:00:00+00	355	263	0.1671	0.1683	0.1662	0.1683
11813	2019-01-31 00:00:00+00	355	263	0.1683	0.1687	0.1655	0.1658
11814	2019-01-30 00:00:00+00	355	263	0.1658	0.1664	0.1637	0.1641
11815	2019-01-29 00:00:00+00	355	263	0.1641	0.1646	0.1626	0.1638
11816	2019-01-28 00:00:00+00	355	263	0.1638	0.1663	0.1633	0.1657
11817	2019-01-27 00:00:00+00	355	263	0.1657	0.1709	0.1655	0.1708
11818	2019-01-25 00:00:00+00	355	263	0.1661	0.1675	0.1657	0.1673
11819	2019-01-24 00:00:00+00	355	263	0.1672	0.1676	0.1652	0.1657
11820	2019-01-23 00:00:00+00	355	263	0.1659	0.1660	0.1638	0.1642
11821	2019-01-22 00:00:00+00	355	263	0.1642	0.1648	0.1636	0.1647
11822	2019-01-21 00:00:00+00	355	263	0.1647	0.1649	0.1636	0.1645
11823	2019-01-20 00:00:00+00	355	263	0.1648	0.1648	0.1641	0.1646
11824	2019-01-18 00:00:00+00	355	263	0.1650	0.1650	0.1628	0.1636
11825	2019-01-17 00:00:00+00	355	263	0.1637	0.1641	0.1625	0.1636
11826	2019-01-16 00:00:00+00	355	263	0.1636	0.1642	0.1603	0.1604
11827	2019-01-15 00:00:00+00	355	263	0.1606	0.1608	0.1588	0.1594
11828	2019-01-14 00:00:00+00	355	263	0.1596	0.1599	0.1568	0.1591
11829	2019-01-13 00:00:00+00	355	263	0.1589	0.1597	0.1589	0.1595
11830	2019-01-11 00:00:00+00	355	263	0.1594	0.1598	0.1575	0.1598
11831	2019-01-10 00:00:00+00	355	263	0.1598	0.1602	0.1568	0.1574
11832	2019-01-09 00:00:00+00	355	263	0.1574	0.1593	0.1570	0.1591
11833	2019-01-08 00:00:00+00	355	263	0.1590	0.1618	0.1581	0.1613
11834	2019-01-07 00:00:00+00	355	263	0.1613	0.1643	0.1606	0.1641
11835	2019-01-06 00:00:00+00	355	263	0.1641	0.1644	0.1638	0.1639
11836	2019-01-04 00:00:00+00	355	263	0.1641	0.1644	0.1598	0.1600
11837	2019-01-03 00:00:00+00	355	263	0.1597	0.1622	0.1540	0.1540
11838	2019-01-02 00:00:00+00	355	263	0.1574	0.1650	0.1561	0.1650
11839	2019-01-01 00:00:00+00	355	263	0.1644	0.1651	0.1638	0.1649
11840	2018-12-31 00:00:00+00	355	263	0.1643	0.1653	0.1638	0.1645
11841	2018-12-30 00:00:00+00	355	263	0.1645	0.1657	0.1643	0.1652
11842	2018-12-28 00:00:00+00	355	263	0.1652	0.1656	0.1641	0.1650
11843	2018-12-27 00:00:00+00	355	263	0.1648	0.1665	0.1648	0.1665
11844	2018-12-26 00:00:00+00	355	263	0.1664	0.1667	0.1646	0.1646
11845	2018-12-25 00:00:00+00	355	263	0.1647	0.1658	0.1635	0.1654
11846	2018-12-24 00:00:00+00	355	263	0.1655	0.1656	0.1645	0.1651
11847	2018-12-23 00:00:00+00	355	263	0.1650	0.1653	0.1649	0.1649
11848	2018-12-21 00:00:00+00	355	263	0.1649	0.1657	0.1642	0.1654
11849	2018-12-20 00:00:00+00	355	263	0.1655	0.1663	0.1646	0.1653
11850	2018-12-19 00:00:00+00	355	263	0.1653	0.1661	0.1635	0.1642
11851	2018-12-18 00:00:00+00	355	263	0.1642	0.1644	0.1631	0.1636
11852	2018-12-17 00:00:00+00	355	263	0.1635	0.1643	0.1631	0.1643
11853	2018-12-16 00:00:00+00	355	263	0.1642	0.1646	0.1642	0.1645
11854	2018-12-15 00:00:00+00	355	263	0.1644	0.1644	0.1644	0.1644
11855	2018-12-14 00:00:00+00	355	263	0.1644	0.1645	0.1629	0.1643
11856	2018-12-13 00:00:00+00	355	263	0.1642	0.1650	0.1627	0.1640
11857	2018-12-12 00:00:00+00	355	263	0.1640	0.1645	0.1631	0.1642
11858	2018-12-11 00:00:00+00	355	263	0.1643	0.1651	0.1621	0.1650
11859	2018-12-10 00:00:00+00	355	263	0.1649	0.1655	0.1637	0.1647
11860	2018-12-09 00:00:00+00	355	263	0.1647	0.1651	0.1646	0.1651
11861	2018-12-07 00:00:00+00	355	263	0.1650	0.1661	0.1638	0.1641
11862	2018-12-06 00:00:00+00	355	263	0.1641	0.1651	0.1629	0.1650
11863	2018-12-05 00:00:00+00	355	263	0.1650	0.1653	0.1615	0.1632
11864	2018-12-04 00:00:00+00	355	263	0.1631	0.1673	0.1611	0.1673
11865	2018-12-03 00:00:00+00	355	263	0.1674	0.1706	0.1664	0.1703
11866	2018-12-02 00:00:00+00	355	263	0.1702	0.1704	0.1696	0.1697
11867	2018-11-30 00:00:00+00	355	263	0.1693	0.1700	0.1679	0.1695
11868	2018-11-29 00:00:00+00	355	263	0.1695	0.1708	0.1677	0.1680
11869	2018-11-28 00:00:00+00	355	263	0.1680	0.1685	0.1674	0.1677
11870	2018-11-27 00:00:00+00	355	263	0.1683	0.1685	0.1669	0.1676
11871	2018-11-26 00:00:00+00	355	263	0.1678	0.1681	0.1659	0.1662
11872	2018-11-25 00:00:00+00	355	263	0.1662	0.1662	0.1658	0.1660
11873	2018-11-23 00:00:00+00	355	263	0.1663	0.1666	0.1644	0.1650
11874	2018-11-22 00:00:00+00	355	263	0.1649	0.1657	0.1638	0.1648
11875	2018-11-21 00:00:00+00	355	263	0.1647	0.1657	0.1624	0.1630
11876	2018-11-20 00:00:00+00	355	263	0.1630	0.1639	0.1610	0.1638
11877	2018-11-19 00:00:00+00	355	263	0.1638	0.1645	0.1629	0.1638
11878	2018-11-18 00:00:00+00	355	263	0.1637	0.1640	0.1631	0.1638
11879	2018-11-16 00:00:00+00	355	263	0.1641	0.1646	0.1631	0.1640
11880	2018-11-15 00:00:00+00	355	263	0.1640	0.1655	0.1608	0.1614
11881	2018-11-14 00:00:00+00	355	263	0.1614	0.1620	0.1604	0.1611
11882	2018-11-13 00:00:00+00	355	263	0.1612	0.1625	0.1605	0.1624
11883	2018-11-12 00:00:00+00	355	263	0.1624	0.1628	0.1603	0.1611
11884	2018-11-11 00:00:00+00	355	263	0.1611	0.1615	0.1610	0.1613
11885	2018-11-09 00:00:00+00	355	263	0.1613	0.1614	0.1587	0.1606
11886	2018-11-08 00:00:00+00	355	263	0.1606	0.1627	0.1593	0.1625
11887	2018-11-07 00:00:00+00	355	263	0.1625	0.1628	0.1607	0.1625
11888	2018-11-06 00:00:00+00	355	263	0.1625	0.1645	0.1612	0.1643
11889	2018-11-05 00:00:00+00	355	263	0.1643	0.1647	0.1600	0.1611
11890	2018-11-04 00:00:00+00	355	263	0.1611	0.1612	0.1609	0.1609
11891	2018-11-02 00:00:00+00	355	263	0.1612	0.1617	0.1581	0.1584
11892	2018-11-01 00:00:00+00	355	263	0.1585	0.1587	0.1555	0.1577
11893	2018-10-31 00:00:00+00	355	263	0.1577	0.1606	0.1565	0.1604
11894	2018-10-30 00:00:00+00	355	263	0.1604	0.1608	0.1575	0.1578
11895	2018-10-29 00:00:00+00	355	263	0.1578	0.1585	0.1564	0.1565
11896	2018-10-28 00:00:00+00	355	263	0.1565	0.1565	0.1560	0.1562
11897	2018-10-26 00:00:00+00	355	263	0.1563	0.1571	0.1549	0.1555
11898	2018-10-25 00:00:00+00	355	263	0.1555	0.1560	0.1522	0.1532
11899	2018-10-24 00:00:00+00	355	263	0.1532	0.1545	0.1505	0.1512
11900	2018-10-23 00:00:00+00	355	263	0.1512	0.1535	0.1480	0.1534
11901	2018-10-22 00:00:00+00	355	263	0.1534	0.1535	0.1528	0.1532
11902	2018-10-21 00:00:00+00	355	263	0.1532	0.1533	0.1531	0.1532
11903	2018-10-19 00:00:00+00	355	263	0.1534	0.1552	0.1523	0.1544
11904	2018-10-18 00:00:00+00	355	263	0.1544	0.1568	0.1527	0.1550
11905	2018-10-17 00:00:00+00	355	263	0.1549	0.1555	0.1511	0.1514
11906	2018-10-16 00:00:00+00	355	263	0.1514	0.1519	0.1482	0.1488
11907	2018-10-15 00:00:00+00	355	263	0.1489	0.1496	0.1462	0.1465
11908	2018-10-14 00:00:00+00	355	263	0.1465	0.1472	0.1463	0.1468
11909	2018-10-12 00:00:00+00	355	263	0.1468	0.1476	0.1437	0.1450
11910	2018-10-11 00:00:00+00	355	263	0.1452	0.1457	0.1418	0.1420
11911	2018-10-10 00:00:00+00	355	263	0.1420	0.1436	0.1415	0.1419
11912	2018-10-09 00:00:00+00	355	263	0.1419	0.1424	0.1414	0.1418
11913	2018-10-08 00:00:00+00	355	263	0.1416	0.1420	0.1401	0.1402
11914	2018-10-07 00:00:00+00	355	263	0.1402	0.1410	0.1402	0.1410
11915	2018-10-05 00:00:00+00	355	263	0.1410	0.1416	0.1394	0.1403
11916	2018-10-04 00:00:00+00	355	263	0.1402	0.1434	0.1393	0.1434
11917	2018-10-03 00:00:00+00	355	263	0.1433	0.1445	0.1418	0.1441
11918	2018-10-02 00:00:00+00	355	263	0.1441	0.1451	0.1430	0.1449
11919	2018-10-01 00:00:00+00	355	263	0.1450	0.1451	0.1419	0.1420
11920	2018-09-30 00:00:00+00	355	263	0.1420	0.1420	0.1415	0.1418
11921	2018-09-28 00:00:00+00	355	263	0.1414	0.1437	0.1408	0.1426
11922	2018-09-27 00:00:00+00	355	263	0.1425	0.1429	0.1387	0.1388
11923	2018-09-26 00:00:00+00	355	263	0.1388	0.1396	0.1366	0.1366
11924	2018-09-25 00:00:00+00	355	263	0.1366	0.1396	0.1359	0.1382
11925	2018-09-24 00:00:00+00	355	263	0.1380	0.1398	0.1341	0.1346
11926	2018-09-23 00:00:00+00	355	263	0.1346	0.1350	0.1345	0.1350
11927	2018-09-21 00:00:00+00	355	263	0.1347	0.1364	0.1344	0.1364
11928	2018-09-20 00:00:00+00	355	263	0.1364	0.1387	0.1338	0.1364
11929	2018-09-19 00:00:00+00	355	263	0.1364	0.1371	0.1331	0.1332
11930	2018-09-18 00:00:00+00	355	263	0.1334	0.1351	0.1321	0.1351
11931	2018-09-17 00:00:00+00	355	263	0.1351	0.1395	0.1348	0.1391
11932	2018-09-16 00:00:00+00	355	263	0.1391	0.1395	0.1389	0.1389
11933	2018-09-14 00:00:00+00	355	263	0.1389	0.1414	0.1383	0.1397
11934	2018-09-13 00:00:00+00	355	263	0.1398	0.1414	0.1312	0.1350
11935	2018-09-12 00:00:00+00	355	263	0.1350	0.1357	0.1331	0.1333
11936	2018-09-11 00:00:00+00	355	263	0.1333	0.1339	0.1323	0.1328
11937	2018-09-10 00:00:00+00	355	263	0.1328	0.1349	0.1326	0.1346
11938	2018-09-09 00:00:00+00	355	263	0.1346	0.1352	0.1345	0.1345
11939	2018-09-07 00:00:00+00	355	263	0.1351	0.1351	0.1297	0.1303
11940	2018-09-06 00:00:00+00	355	263	0.1303	0.1307	0.1291	0.1305
11941	2018-09-05 00:00:00+00	355	263	0.1305	0.1305	0.1283	0.1286
11942	2018-09-04 00:00:00+00	355	263	0.1289	0.1301	0.1281	0.1293
11943	2018-09-03 00:00:00+00	355	263	0.1293	0.1312	0.1280	0.1308
11944	2018-09-02 00:00:00+00	355	263	0.1309	0.1316	0.1304	0.1315
11945	2018-08-31 00:00:00+00	355	263	0.1317	0.1335	0.1259	0.1279
11946	2018-08-30 00:00:00+00	355	263	0.1279	0.1325	0.1252	0.1325
11947	2018-08-29 00:00:00+00	355	263	0.1325	0.1365	0.1313	0.1360
11948	2018-08-28 00:00:00+00	355	263	0.1358	0.1393	0.1353	0.1384
11949	2018-08-27 00:00:00+00	355	263	0.1386	0.1434	0.1364	0.1432
11950	2018-08-26 00:00:00+00	355	263	0.1432	0.1434	0.1425	0.1426
11951	2018-08-24 00:00:00+00	355	263	0.1427	0.1428	0.1406	0.1418
11952	2018-08-23 00:00:00+00	355	263	0.1420	0.1436	0.1404	0.1426
11953	2018-08-22 00:00:00+00	355	263	0.1426	0.1429	0.1411	0.1419
11954	2018-08-21 00:00:00+00	355	263	0.1421	0.1433	0.1406	0.1422
11955	2018-08-20 00:00:00+00	355	263	0.1422	0.1462	0.1407	0.1456
11956	2018-08-19 00:00:00+00	355	263	0.1456	0.1462	0.1445	0.1445
11957	2018-08-17 00:00:00+00	355	263	0.1449	0.1521	0.1398	0.1501
11958	2018-08-16 00:00:00+00	355	263	0.1502	0.1533	0.1456	0.1469
11959	2018-08-15 00:00:00+00	355	263	0.1469	0.1495	0.1339	0.1377
11960	2018-08-14 00:00:00+00	355	263	0.1380	0.1391	0.1255	0.1260
11961	2018-08-13 00:00:00+00	355	263	0.1261	0.1353	0.1246	0.1278
11962	2018-08-12 00:00:00+00	355	263	0.1283	0.1362	0.1232	0.1361
11963	2018-08-10 00:00:00+00	355	263	0.1358	0.1560	0.1316	0.1560
11964	2018-08-09 00:00:00+00	355	263	0.1559	0.1624	0.1550	0.1624
11965	2018-08-08 00:00:00+00	355	263	0.1624	0.1638	0.1616	0.1635
11966	2018-08-07 00:00:00+00	355	263	0.1633	0.1662	0.1611	0.1638
11967	2018-08-06 00:00:00+00	355	263	0.1637	0.1693	0.1606	0.1689
11968	2018-08-05 00:00:00+00	355	263	0.1690	0.1697	0.1688	0.1694
11969	2018-08-03 00:00:00+00	355	263	0.1696	0.1699	0.1683	0.1697
11970	2018-08-02 00:00:00+00	355	263	0.1697	0.1723	0.1686	0.1711
11971	2018-08-01 00:00:00+00	355	263	0.1711	0.1737	0.1705	0.1735
11972	2018-07-31 00:00:00+00	355	263	0.1734	0.1744	0.1728	0.1742
11973	2018-07-30 00:00:00+00	355	263	0.1743	0.1764	0.1740	0.1761
11974	2018-07-29 00:00:00+00	355	263	0.1761	0.1764	0.1760	0.1763
11975	2018-07-27 00:00:00+00	355	263	0.1764	0.1768	0.1756	0.1759
11976	2018-07-26 00:00:00+00	355	263	0.1759	0.1777	0.1758	0.1772
11977	2018-07-25 00:00:00+00	355	263	0.1772	0.1781	0.1747	0.1748
11978	2018-07-24 00:00:00+00	355	263	0.1747	0.1802	0.1725	0.1800
11979	2018-07-23 00:00:00+00	355	263	0.1800	0.1800	0.1777	0.1778
11980	2018-07-22 00:00:00+00	355	263	0.1778	0.1780	0.1768	0.1768
11981	2018-07-20 00:00:00+00	355	263	0.1775	0.1786	0.1772	0.1780
11982	2018-07-19 00:00:00+00	355	263	0.1780	0.1787	0.1776	0.1785
11983	2018-07-18 00:00:00+00	355	263	0.1785	0.1797	0.1774	0.1781
11984	2018-07-17 00:00:00+00	355	263	0.1781	0.1786	0.1752	0.1755
11985	2018-07-16 00:00:00+00	355	263	0.1755	0.1766	0.1752	0.1757
11986	2018-07-15 00:00:00+00	355	263	0.1758	0.1761	0.1753	0.1758
11987	2018-07-13 00:00:00+00	355	263	0.1757	0.1774	0.1751	0.1759
11988	2018-07-12 00:00:00+00	355	263	0.1758	0.1782	0.1741	0.1742
11989	2018-07-11 00:00:00+00	355	263	0.1742	0.1808	0.1731	0.1803
11990	2018-07-10 00:00:00+00	355	263	0.1802	0.1824	0.1794	0.1799
11991	2018-07-09 00:00:00+00	355	263	0.1799	0.1878	0.1786	0.1853
11992	2018-07-08 00:00:00+00	355	263	0.1853	0.1857	0.1853	0.1857
11993	2018-07-06 00:00:00+00	355	263	0.1856	0.1858	0.1845	0.1855
11994	2018-07-05 00:00:00+00	355	263	0.1856	0.1861	0.1824	0.1830
11995	2018-07-04 00:00:00+00	355	263	0.1831	0.1835	0.1813	0.1832
11996	2018-07-03 00:00:00+00	355	263	0.1832	0.1859	0.1827	0.1855
11997	2018-07-02 00:00:00+00	355	263	0.1859	0.1862	0.1848	0.1857
11998	2018-07-01 00:00:00+00	355	263	0.1857	0.1869	0.1855	0.1863
11999	2018-06-29 00:00:00+00	355	263	0.1860	0.1883	0.1853	0.1878
12000	2018-06-28 00:00:00+00	355	263	0.1878	0.1882	0.1859	0.1868
12001	2018-06-27 00:00:00+00	355	263	0.1867	0.1870	0.1840	0.1853
12002	2018-06-26 00:00:00+00	355	263	0.1852	0.1858	0.1810	0.1819
12003	2018-06-25 00:00:00+00	355	263	0.1819	0.1886	0.1812	0.1855
12004	2018-06-24 00:00:00+00	355	263	0.1856	0.1863	0.1829	0.1829
12005	2018-06-22 00:00:00+00	355	263	0.1829	0.1836	0.1806	0.1816
12006	2018-06-21 00:00:00+00	355	263	0.1816	0.1822	0.1811	0.1816
12007	2018-06-20 00:00:00+00	355	263	0.1818	0.1822	0.1808	0.1814
12008	2018-06-19 00:00:00+00	355	263	0.1816	0.1827	0.1809	0.1824
12009	2018-06-18 00:00:00+00	355	263	0.1824	0.1839	0.1812	0.1818
12010	2018-06-17 00:00:00+00	355	263	0.1816	0.1821	0.1816	0.1816
12011	2018-06-15 00:00:00+00	355	263	0.1816	0.1828	0.1808	0.1815
12012	2018-06-14 00:00:00+00	355	263	0.1816	0.1842	0.1804	0.1815
12013	2018-06-13 00:00:00+00	355	263	0.1813	0.1852	0.1810	0.1850
12014	2018-06-12 00:00:00+00	355	263	0.1850	0.1876	0.1847	0.1873
12015	2018-06-11 00:00:00+00	355	263	0.1873	0.1896	0.1864	0.1896
12016	2018-06-10 00:00:00+00	355	263	0.1894	0.1897	0.1888	0.1896
12017	2018-06-08 00:00:00+00	355	263	0.1896	0.1897	0.1868	0.1885
12018	2018-06-07 00:00:00+00	355	263	0.1885	0.1890	0.1840	0.1855
12019	2018-06-06 00:00:00+00	355	263	0.1854	0.1865	0.1833	0.1851
12020	2018-06-05 00:00:00+00	355	263	0.1852	0.1860	0.1842	0.1858
12021	2018-06-04 00:00:00+00	355	263	0.1858	0.1860	0.1826	0.1840
12022	2018-06-03 00:00:00+00	355	263	0.1840	0.1848	0.1838	0.1845
12023	2018-06-01 00:00:00+00	355	263	0.1839	0.1888	0.1837	0.1882
12024	2018-05-31 00:00:00+00	355	263	0.1881	0.1917	0.1880	0.1914
12025	2018-05-30 00:00:00+00	355	263	0.1914	0.1926	0.1894	0.1896
12026	2018-05-29 00:00:00+00	355	263	0.1895	0.1905	0.1863	0.1872
12027	2018-05-28 00:00:00+00	355	263	0.1873	0.1878	0.1807	0.1809
12028	2018-05-27 00:00:00+00	355	263	0.1811	0.1817	0.1809	0.1814
12029	2018-05-25 00:00:00+00	355	263	0.1818	0.1819	0.1774	0.1793
12030	2018-05-24 00:00:00+00	355	263	0.1793	0.1870	0.1772	0.1862
12031	2018-05-23 00:00:00+00	355	263	0.1865	0.1878	0.1735	0.1787
12032	2018-05-22 00:00:00+00	355	263	0.1781	0.1858	0.1766	0.1848
12033	2018-05-21 00:00:00+00	355	263	0.1848	0.1888	0.1845	0.1883
12034	2018-05-20 00:00:00+00	355	263	0.1883	0.1886	0.1882	0.1886
12035	2018-05-18 00:00:00+00	355	263	0.1885	0.1899	0.1883	0.1895
12036	2018-05-17 00:00:00+00	355	263	0.1895	0.1911	0.1892	0.1906
12037	2018-05-16 00:00:00+00	355	263	0.1906	0.1920	0.1875	0.1892
12038	2018-05-15 00:00:00+00	355	263	0.1891	0.1921	0.1880	0.1919
12039	2018-05-14 00:00:00+00	355	263	0.1918	0.1935	0.1912	0.1934
12040	2018-05-13 00:00:00+00	355	263	0.1934	0.1944	0.1933	0.1943
12041	2018-05-11 00:00:00+00	355	263	0.1935	0.1977	0.1934	0.1976
12042	2018-05-10 00:00:00+00	355	263	0.1975	0.1981	0.1953	0.1963
12043	2018-05-09 00:00:00+00	355	263	0.1963	0.1973	0.1928	0.1935
12044	2018-05-08 00:00:00+00	355	263	0.1938	0.1961	0.1938	0.1961
12045	2018-05-07 00:00:00+00	355	263	0.1961	0.1971	0.1959	0.1963
12046	2018-05-06 00:00:00+00	355	263	0.1963	0.1972	0.1962	0.1971
12047	2018-05-04 00:00:00+00	355	263	0.1971	0.1975	0.1944	0.1972
12048	2018-05-03 00:00:00+00	355	263	0.1972	0.2001	0.1966	0.1995
12049	2018-05-02 00:00:00+00	355	263	0.1995	0.2030	0.1993	0.2026
12050	2018-05-01 00:00:00+00	355	263	0.2027	0.2038	0.2019	0.2033
12051	2018-04-30 00:00:00+00	355	263	0.2033	0.2046	0.2024	0.2032
12052	2018-04-29 00:00:00+00	355	263	0.2032	0.2035	0.2027	0.2027
12053	2018-04-27 00:00:00+00	355	263	0.2034	0.2043	0.2021	0.2026
12054	2018-04-26 00:00:00+00	355	263	0.2025	0.2029	0.2004	0.2008
12055	2018-04-25 00:00:00+00	355	263	0.2009	0.2016	0.1993	0.1996
12056	2018-04-24 00:00:00+00	355	263	0.1996	0.2004	0.1988	0.1988
12057	2018-04-23 00:00:00+00	355	263	0.1988	0.2001	0.1984	0.1991
12058	2018-04-22 00:00:00+00	355	263	0.1990	0.1995	0.1988	0.1991
12059	2018-04-20 00:00:00+00	355	263	0.1991	0.2010	0.1991	0.2000
12060	2018-04-19 00:00:00+00	355	263	0.2000	0.2009	0.1994	0.2005
12061	2018-04-18 00:00:00+00	355	263	0.2005	0.2012	0.1963	0.1968
12062	2018-04-17 00:00:00+00	355	263	0.1968	0.1974	0.1953	0.1964
12063	2018-04-16 00:00:00+00	355	263	0.1965	0.1980	0.1958	0.1980
12064	2018-04-15 00:00:00+00	355	263	0.1980	0.1980	0.1971	0.1979
12065	2018-04-13 00:00:00+00	355	263	0.1974	0.1983	0.1965	0.1967
12066	2018-04-12 00:00:00+00	355	263	0.1967	0.1983	0.1939	0.1947
12067	2018-04-11 00:00:00+00	355	263	0.1947	0.1964	0.1922	0.1961
12068	2018-04-10 00:00:00+00	355	263	0.1961	0.1998	0.1951	0.1985
12069	2018-04-09 00:00:00+00	355	263	0.1987	0.2012	0.1986	0.2007
12070	2018-04-08 00:00:00+00	355	263	0.2007	0.2012	0.2005	0.2008
12071	2018-04-06 00:00:00+00	355	263	0.2007	0.2018	0.2005	0.2008
12072	2018-04-05 00:00:00+00	355	263	0.2009	0.2031	0.2009	0.2029
12073	2018-04-04 00:00:00+00	355	263	0.2029	0.2038	0.2017	0.2036
12074	2018-04-03 00:00:00+00	355	263	0.2036	0.2044	0.2033	0.2038
12075	2018-04-02 00:00:00+00	355	263	0.2039	0.2049	0.2037	0.2047
12076	2018-04-01 00:00:00+00	355	263	0.2047	0.2048	0.2045	0.2046
12077	2018-03-30 00:00:00+00	355	263	0.2046	0.2057	0.2044	0.2055
12078	2018-03-29 00:00:00+00	355	263	0.2055	0.2062	0.2016	0.2019
12079	2018-03-28 00:00:00+00	355	263	0.2019	0.2023	0.2010	0.2021
12080	2018-03-27 00:00:00+00	355	263	0.2019	0.2023	0.2012	0.2019
12081	2018-03-26 00:00:00+00	355	263	0.2020	0.2039	0.2010	0.2025
12082	2018-03-25 00:00:00+00	355	263	0.2025	0.2036	0.2025	0.2033
12083	2018-03-23 00:00:00+00	355	263	0.2028	0.2044	0.2021	0.2021
12084	2018-03-22 00:00:00+00	355	263	0.2018	0.2070	0.2012	0.2067
12085	2018-03-21 00:00:00+00	355	263	0.2068	0.2074	0.2062	0.2071
12086	2018-03-20 00:00:00+00	355	263	0.2071	0.2073	0.2049	0.2052
12087	2018-03-19 00:00:00+00	355	263	0.2053	0.2073	0.2050	0.2072
12088	2018-03-18 00:00:00+00	355	263	0.2071	0.2074	0.2069	0.2070
12089	2018-03-16 00:00:00+00	355	263	0.2071	0.2082	0.2066	0.2082
12090	2018-03-15 00:00:00+00	355	263	0.2081	0.2082	0.2070	0.2078
12091	2018-03-14 00:00:00+00	355	263	0.2079	0.2089	0.2074	0.2079
12092	2018-03-13 00:00:00+00	355	263	0.2079	0.2109	0.2077	0.2104
12093	2018-03-12 00:00:00+00	355	263	0.2104	0.2127	0.2101	0.2126
12094	2018-03-11 00:00:00+00	355	263	0.2126	0.2127	0.2123	0.2126
12095	2018-03-10 00:00:00+00	355	263	0.2127	0.2127	0.2127	0.2127
12096	2018-03-09 00:00:00+00	355	263	0.2126	0.2130	0.2117	0.2119
12097	2018-03-08 00:00:00+00	355	263	0.2119	0.2122	0.2105	0.2113
12098	2018-03-07 00:00:00+00	355	263	0.2113	0.2120	0.2109	0.2115
12099	2018-03-06 00:00:00+00	355	263	0.2116	0.2128	0.2115	0.2122
12100	2018-03-05 00:00:00+00	355	263	0.2123	0.2129	0.2117	0.2122
12101	2018-03-04 00:00:00+00	355	263	0.2121	0.2124	0.2118	0.2124
12102	2018-03-02 00:00:00+00	355	263	0.2128	0.2139	0.2118	0.2134
12103	2018-03-01 00:00:00+00	355	263	0.2134	0.2153	0.2134	0.2152
12104	2018-02-28 00:00:00+00	355	263	0.2151	0.2154	0.2137	0.2137
12105	2018-02-27 00:00:00+00	355	263	0.2138	0.2143	0.2134	0.2140
12106	2018-02-26 00:00:00+00	355	263	0.2140	0.2144	0.2137	0.2142
12107	2018-02-25 00:00:00+00	355	263	0.2142	0.2143	0.2137	0.2140
12108	2018-02-24 00:00:00+00	355	263	0.2140	0.2140	0.2140	0.2140
12109	2018-02-23 00:00:00+00	355	263	0.2140	0.2144	0.2137	0.2138
12110	2018-02-22 00:00:00+00	355	263	0.2137	0.2143	0.2132	0.2143
12111	2018-02-21 00:00:00+00	355	263	0.2143	0.2145	0.2124	0.2129
12112	2018-02-20 00:00:00+00	355	263	0.2128	0.2143	0.2121	0.2139
12113	2018-02-19 00:00:00+00	355	263	0.2139	0.2146	0.2136	0.2144
12114	2018-02-18 00:00:00+00	355	263	0.2144	0.2149	0.2144	0.2148
12115	2018-02-16 00:00:00+00	355	263	0.2146	0.2147	0.2110	0.2118
12116	2018-02-15 00:00:00+00	355	263	0.2119	0.2123	0.2114	0.2118
12117	2018-02-14 00:00:00+00	355	263	0.2118	0.2128	0.2113	0.2120
12118	2018-02-13 00:00:00+00	355	263	0.2120	0.2138	0.2118	0.2137
12119	2018-02-12 00:00:00+00	355	263	0.2137	0.2142	0.2128	0.2133
12120	2018-02-11 00:00:00+00	355	263	0.2133	0.2134	0.2129	0.2130
12121	2018-02-09 00:00:00+00	355	263	0.2130	0.2134	0.2124	0.2128
12122	2018-02-08 00:00:00+00	355	263	0.2128	0.2143	0.2125	0.2139
12123	2018-02-07 00:00:00+00	355	263	0.2139	0.2147	0.2132	0.2138
12124	2018-02-06 00:00:00+00	355	263	0.2139	0.2143	0.2119	0.2129
12125	2018-02-05 00:00:00+00	355	263	0.2128	0.2137	0.2121	0.2127
12126	2018-02-04 00:00:00+00	355	263	0.2127	0.2130	0.2125	0.2127
12127	2018-02-02 00:00:00+00	355	263	0.2123	0.2137	0.2121	0.2137
12128	2018-02-01 00:00:00+00	355	263	0.2138	0.2145	0.2133	0.2139
12129	2018-01-31 00:00:00+00	355	263	0.2139	0.2142	0.2125	0.2131
12130	2018-01-30 00:00:00+00	355	263	0.2129	0.2132	0.2121	0.2126
12131	2018-01-29 00:00:00+00	355	263	0.2126	0.2142	0.2124	0.2141
12132	2018-01-28 00:00:00+00	355	263	0.2141	0.2147	0.2140	0.2141
12133	2018-01-26 00:00:00+00	355	263	0.2138	0.2145	0.2135	0.2144
12134	2018-01-25 00:00:00+00	355	263	0.2144	0.2154	0.2132	0.2150
12135	2018-01-24 00:00:00+00	355	263	0.2150	0.2158	0.2146	0.2153
12136	2018-01-23 00:00:00+00	355	263	0.2153	0.2157	0.2145	0.2155
12137	2018-01-22 00:00:00+00	355	263	0.2154	0.2158	0.2122	0.2126
12138	2018-01-21 00:00:00+00	355	263	0.2126	0.2127	0.2113	0.2124
12139	2018-01-19 00:00:00+00	355	263	0.2144	0.2162	0.2138	0.2161
12140	2018-01-18 00:00:00+00	355	263	0.2161	0.2170	0.2140	0.2146
12141	2018-01-17 00:00:00+00	355	263	0.2145	0.2146	0.2131	0.2143
12142	2018-01-16 00:00:00+00	355	263	0.2143	0.2159	0.2126	0.2140
12143	2018-01-15 00:00:00+00	355	263	0.2139	0.2180	0.2138	0.2177
12144	2018-01-14 00:00:00+00	355	263	0.2177	0.2183	0.2175	0.2176
12145	2018-01-12 00:00:00+00	355	263	0.2182	0.2197	0.2180	0.2195
12146	2018-01-11 00:00:00+00	355	263	0.2195	0.2207	0.2184	0.2197
12147	2018-01-10 00:00:00+00	355	263	0.2197	0.2219	0.2184	0.2215
12148	2018-01-09 00:00:00+00	355	263	0.2215	0.2228	0.2214	0.2226
12149	2018-01-08 00:00:00+00	355	263	0.2225	0.2228	0.2214	0.2220
12150	2018-01-07 00:00:00+00	355	263	0.2220	0.2222	0.2216	0.2219
12151	2018-01-05 00:00:00+00	355	263	0.2220	0.2221	0.2200	0.2205
12152	2018-01-04 00:00:00+00	355	263	0.2205	0.2209	0.2193	0.2196
12153	2018-01-03 00:00:00+00	355	263	0.2196	0.2210	0.2190	0.2196
12154	2018-01-02 00:00:00+00	355	263	0.2197	0.2203	0.2189	0.2190
12155	2018-01-01 00:00:00+00	355	263	0.2190	0.2199	0.2187	0.2194
12157	2019-11-07 00:00:00+00	266	355	7.3676	7.4095	7.3496	7.3935
12158	2019-11-06 00:00:00+00	266	355	7.3987	7.4327	7.3833	7.4083
12159	2019-11-05 00:00:00+00	266	355	7.4066	7.4249	7.3643	7.3900
12160	2019-11-04 00:00:00+00	266	355	7.3881	7.4082	7.3417	7.3780
12161	2019-11-03 00:00:00+00	266	355	7.3789	7.3791	7.3387	7.3732
12162	2019-11-01 00:00:00+00	266	355	7.3749	7.4356	7.3720	7.3841
12163	2019-10-31 00:00:00+00	266	355	7.3811	7.4229	7.3482	7.3555
12164	2019-10-30 00:00:00+00	266	355	7.3591	7.4317	7.3253	7.3985
12165	2019-10-29 00:00:00+00	266	355	7.3967	7.4129	7.3439	7.3681
12166	2019-10-28 00:00:00+00	266	355	7.3669	7.4039	7.3358	7.3862
12167	2019-10-27 00:00:00+00	266	355	7.3939	7.4062	7.3725	7.3923
12168	2019-10-25 00:00:00+00	266	355	7.4080	7.4397	7.3822	7.4006
12169	2019-10-24 00:00:00+00	266	355	7.4017	7.4576	7.3801	7.4141
12170	2019-10-23 00:00:00+00	266	355	7.4141	7.4818	7.3689	7.4729
12171	2019-10-22 00:00:00+00	266	355	7.4686	7.6095	7.4547	7.5993
12172	2019-10-21 00:00:00+00	266	355	7.5986	7.6157	7.4357	7.4801
12173	2019-10-20 00:00:00+00	266	355	7.4783	7.5109	7.4348	7.4691
12174	2019-10-18 00:00:00+00	266	355	7.5147	7.5151	7.4081	7.4775
12175	2019-10-17 00:00:00+00	266	355	7.4798	7.6430	7.4657	7.5387
12176	2019-10-16 00:00:00+00	266	355	7.5479	7.5955	7.4628	7.5596
12177	2019-10-15 00:00:00+00	266	355	7.5592	7.5719	7.4147	7.4743
12178	2019-10-14 00:00:00+00	266	355	7.4697	7.5081	7.4142	7.4537
12179	2019-10-13 00:00:00+00	266	355	7.4550	7.4556	7.3801	7.4365
12180	2019-10-11 00:00:00+00	266	355	7.4418	7.4694	7.2475	7.2657
12181	2019-10-10 00:00:00+00	266	355	7.2620	7.2817	7.1660	7.1775
12182	2019-10-09 00:00:00+00	266	355	7.1850	7.1866	7.1101	7.1286
12183	2019-10-08 00:00:00+00	266	355	7.1280	7.1910	7.0635	7.1761
12184	2019-10-07 00:00:00+00	266	355	7.1772	7.1876	7.0213	7.0460
12185	2019-10-06 00:00:00+00	266	355	7.0224	7.0469	6.9839	7.0109
12186	2019-10-04 00:00:00+00	266	355	7.0288	7.0531	6.9876	7.0247
12187	2019-10-03 00:00:00+00	266	355	7.0245	7.0795	6.9617	7.0125
12188	2019-10-02 00:00:00+00	266	355	7.0182	7.0598	6.9976	7.0308
12189	2019-10-01 00:00:00+00	266	355	7.0264	7.0614	6.9338	6.9424
12190	2019-09-30 00:00:00+00	266	355	6.9411	6.9799	6.9284	6.9674
12191	2019-09-29 00:00:00+00	266	355	6.9603	6.9822	6.9202	6.9822
12192	2019-09-27 00:00:00+00	266	355	6.9688	6.9997	6.9521	6.9868
12193	2019-09-26 00:00:00+00	266	355	6.9864	7.0472	6.9691	7.0121
12194	2019-09-25 00:00:00+00	266	355	7.0181	7.1192	6.9973	7.1178
12195	2019-09-24 00:00:00+00	266	355	7.1187	7.1323	7.0535	7.1133
12196	2019-09-23 00:00:00+00	266	355	7.1091	7.1700	7.0950	7.1583
12197	2019-09-22 00:00:00+00	266	355	7.1350	7.1670	7.1187	7.1643
12198	2019-09-20 00:00:00+00	266	355	7.1649	7.1944	7.1031	7.1599
12199	2019-09-19 00:00:00+00	266	355	7.1580	7.1735	7.0764	7.0806
12200	2019-09-18 00:00:00+00	266	355	7.0842	7.1320	7.0531	7.1320
12201	2019-09-17 00:00:00+00	266	355	7.1231	7.1481	7.0845	7.1193
12202	2019-09-16 00:00:00+00	266	355	7.1193	7.1646	7.0853	7.1543
12203	2019-09-15 00:00:00+00	266	355	7.1507	7.1572	7.0910	7.1079
12204	2019-09-13 00:00:00+00	266	355	7.1103	7.1103	6.9641	6.9829
12205	2019-09-12 00:00:00+00	266	355	6.9771	7.1148	6.9527	7.0892
12206	2019-09-11 00:00:00+00	266	355	7.0898	7.1609	7.0745	7.1289
12207	2019-09-10 00:00:00+00	266	355	7.1285	7.1575	7.0810	7.0918
12208	2019-09-09 00:00:00+00	266	355	7.0910	7.1239	6.9933	7.0100
12209	2019-09-08 00:00:00+00	266	355	7.0102	7.0111	6.9588	7.0099
12210	2019-09-06 00:00:00+00	266	355	7.0136	7.0515	6.9922	7.0179
12211	2019-09-05 00:00:00+00	266	355	7.0165	7.0347	6.9130	6.9508
12212	2019-09-04 00:00:00+00	266	355	6.9574	6.9582	6.8667	6.9240
12213	2019-09-03 00:00:00+00	266	355	6.9225	7.0102	6.8881	7.0049
12214	2019-09-02 00:00:00+00	266	355	7.0050	7.1071	6.9934	7.0967
12215	2019-09-01 00:00:00+00	266	355	7.0967	7.0998	7.0354	7.0917
12216	2019-08-30 00:00:00+00	266	355	7.0884	7.1228	7.0621	7.1172
12217	2019-08-29 00:00:00+00	266	355	7.1128	7.1365	7.0815	7.1074
12218	2019-08-28 00:00:00+00	266	355	7.1048	7.1825	7.0639	7.1587
12219	2019-08-27 00:00:00+00	266	355	7.1705	7.1964	7.1030	7.1162
12220	2019-08-26 00:00:00+00	266	355	7.1157	7.1626	7.0787	7.1182
12221	2019-08-25 00:00:00+00	266	355	7.1143	7.4197	7.0375	7.0660
12222	2019-08-23 00:00:00+00	266	355	7.0787	7.0959	7.0029	7.0681
12223	2019-08-22 00:00:00+00	266	355	7.0717	7.0897	6.9262	6.9262
12224	2019-08-21 00:00:00+00	266	355	6.9382	6.9784	6.9174	6.9740
12225	2019-08-20 00:00:00+00	266	355	6.9704	6.9879	6.8389	6.8479
12226	2019-08-19 00:00:00+00	266	355	6.8481	6.8888	6.7544	6.7867
12227	2019-08-18 00:00:00+00	266	355	6.7891	6.7946	6.7458	6.7788
12228	2019-08-16 00:00:00+00	266	355	6.7774	6.7882	6.6979	6.7351
12229	2019-08-15 00:00:00+00	266	355	6.7349	6.7974	6.6963	6.7672
12230	2019-08-14 00:00:00+00	266	355	6.7736	6.7940	6.7057	6.7060
12231	2019-08-13 00:00:00+00	266	355	6.7120	6.8154	6.6840	6.7180
12232	2019-08-12 00:00:00+00	266	355	6.7150	6.7386	6.5918	6.6036
12233	2019-08-11 00:00:00+00	266	355	6.5978	6.6302	6.5921	6.6156
12234	2019-08-09 00:00:00+00	266	355	6.6080	6.6764	6.5837	6.6603
12235	2019-08-08 00:00:00+00	266	355	6.6561	6.7182	6.6100	6.6645
12236	2019-08-07 00:00:00+00	266	355	6.6747	6.7408	6.6360	6.7262
12237	2019-08-06 00:00:00+00	266	355	6.7266	6.8034	6.6836	6.7916
12238	2019-08-05 00:00:00+00	266	355	6.7878	6.8274	6.7146	6.7464
12239	2019-08-04 00:00:00+00	266	355	6.7473	6.7706	6.7111	6.7519
12240	2019-08-02 00:00:00+00	266	355	6.7622	6.8054	6.7292	6.7921
12241	2019-08-01 00:00:00+00	266	355	6.7925	6.8479	6.7308	6.7864
12242	2019-07-31 00:00:00+00	266	355	6.7847	6.8259	6.7095	6.7582
12243	2019-07-30 00:00:00+00	266	355	6.7601	6.8715	6.7427	6.8715
12244	2019-07-29 00:00:00+00	266	355	6.8697	7.0143	6.8475	7.0086
12245	2019-07-28 00:00:00+00	266	355	6.9735	7.0195	6.9593	7.0132
12246	2019-07-26 00:00:00+00	266	355	7.0231	7.1080	6.9710	7.1003
12247	2019-07-25 00:00:00+00	266	355	7.0982	7.2161	7.0586	7.1334
12248	2019-07-24 00:00:00+00	266	355	7.1402	7.1669	7.1003	7.1053
12249	2019-07-23 00:00:00+00	266	355	7.1049	7.1210	7.0626	7.0793
12250	2019-07-22 00:00:00+00	266	355	7.0756	7.1108	7.0596	7.0646
12251	2019-07-21 00:00:00+00	266	355	7.0596	7.0870	7.0249	7.0796
12252	2019-07-19 00:00:00+00	266	355	7.0683	7.0978	7.0391	7.0529
12253	2019-07-18 00:00:00+00	266	355	7.0380	7.1361	7.0094	7.0668
12254	2019-07-17 00:00:00+00	266	355	7.0745	7.1001	7.0391	7.0835
12255	2019-07-16 00:00:00+00	266	355	7.0842	7.1645	7.0680	7.1452
12256	2019-07-15 00:00:00+00	266	355	7.1460	7.2057	7.1367	7.2036
12257	2019-07-14 00:00:00+00	266	355	7.2010	7.2097	7.1523	7.1805
12258	2019-07-12 00:00:00+00	266	355	7.1900	7.2450	7.1066	7.1194
12259	2019-07-11 00:00:00+00	266	355	7.1105	7.1485	7.0878	7.1132
12260	2019-07-10 00:00:00+00	266	355	7.1253	7.1872	7.0786	7.1460
12261	2019-07-09 00:00:00+00	266	355	7.1441	7.1887	7.0786	7.1770
12262	2019-07-08 00:00:00+00	266	355	7.1756	7.2496	7.1481	7.1861
12263	2019-07-07 00:00:00+00	266	355	7.1849	7.2598	7.0453	7.0453
12264	2019-07-05 00:00:00+00	266	355	7.0469	7.0796	7.0182	7.0495
12265	2019-07-04 00:00:00+00	266	355	7.0499	7.0889	7.0115	7.0749
12266	2019-07-03 00:00:00+00	266	355	7.0771	7.1274	7.0423	7.1225
12267	2019-07-02 00:00:00+00	266	355	7.1184	7.2016	7.0910	7.1452
12268	2019-07-01 00:00:00+00	266	355	7.1509	7.3041	7.1228	7.2806
12269	2019-06-30 00:00:00+00	266	355	7.2815	7.2872	7.2232	7.2773
12270	2019-06-28 00:00:00+00	266	355	7.3498	7.3715	7.2935	7.3159
12271	2019-06-27 00:00:00+00	266	355	7.3213	7.3695	7.3044	7.3265
12272	2019-06-26 00:00:00+00	266	355	7.3345	7.3795	7.2929	7.3520
12273	2019-06-25 00:00:00+00	266	355	7.3511	7.4381	7.3260	7.3902
12274	2019-06-24 00:00:00+00	266	355	7.3885	7.4169	7.2836	7.3499
12275	2019-06-23 00:00:00+00	266	355	7.3498	7.3662	7.2608	7.3647
12276	2019-06-21 00:00:00+00	266	355	7.4179	7.4276	7.3050	7.3224
12277	2019-06-20 00:00:00+00	266	355	7.3205	7.4517	7.2813	7.3303
12278	2019-06-19 00:00:00+00	266	355	7.3382	7.4324	7.3076	7.3173
12279	2019-06-18 00:00:00+00	266	355	7.3196	7.3689	7.2895	7.3632
12280	2019-06-17 00:00:00+00	266	355	7.3640	7.4687	7.3535	7.4446
12281	2019-06-16 00:00:00+00	266	355	7.4458	7.4543	7.4085	7.4399
12282	2019-06-15 00:00:00+00	266	355	7.4290	7.4290	7.4290	7.4290
12283	2019-06-14 00:00:00+00	266	355	7.4290	7.5181	7.3796	7.4398
12284	2019-06-13 00:00:00+00	266	355	7.4392	7.5028	7.3706	7.3752
12285	2019-06-12 00:00:00+00	266	355	7.3829	7.4306	7.3396	7.3876
12286	2019-06-11 00:00:00+00	266	355	7.3843	7.4276	7.2970	7.3491
12287	2019-06-10 00:00:00+00	266	355	7.3435	7.4450	7.2940	7.4255
12288	2019-06-09 00:00:00+00	266	355	7.4228	7.4446	7.3896	7.4273
12289	2019-06-07 00:00:00+00	266	355	7.4270	7.4601	7.3382	7.3517
12290	2019-06-06 00:00:00+00	266	355	7.3475	7.3791	7.2478	7.2635
12291	2019-06-05 00:00:00+00	266	355	7.2692	7.3518	7.1869	7.3363
12292	2019-06-04 00:00:00+00	266	355	7.3309	7.4281	7.2695	7.3892
12293	2019-06-03 00:00:00+00	266	355	7.3852	7.4540	7.3480	7.4107
12294	2019-06-02 00:00:00+00	266	355	7.4078	7.4116	7.3325	7.3741
12295	2019-05-31 00:00:00+00	266	355	7.3737	7.4854	7.3350	7.4303
12296	2019-05-30 00:00:00+00	266	355	7.4404	7.6207	7.3919	7.5951
12297	2019-05-29 00:00:00+00	266	355	7.6040	7.6670	7.5507	7.6340
12298	2019-05-28 00:00:00+00	266	355	7.6348	7.7182	7.5955	7.6923
12299	2019-05-27 00:00:00+00	266	355	7.6943	7.7647	7.6656	7.7496
12300	2019-05-26 00:00:00+00	266	355	7.7061	7.7922	7.6977	7.7922
12301	2019-05-24 00:00:00+00	266	355	7.7336	7.7656	7.6715	7.7435
12302	2019-05-23 00:00:00+00	266	355	7.7444	7.7889	7.6813	7.7256
12303	2019-05-22 00:00:00+00	266	355	7.7372	7.7610	7.6782	7.7032
12304	2019-05-21 00:00:00+00	266	355	7.6981	7.7622	7.6312	7.6709
12305	2019-05-20 00:00:00+00	266	355	7.6619	7.7406	7.6103	7.7145
12306	2019-05-19 00:00:00+00	266	355	7.7172	7.7206	7.6942	7.7051
12307	2019-05-17 00:00:00+00	266	355	7.7007	7.7963	7.6826	7.7496
12308	2019-05-16 00:00:00+00	266	355	7.7480	7.7725	7.6949	7.7287
12309	2019-05-15 00:00:00+00	266	355	7.7370	7.8613	7.6588	7.7927
12310	2019-05-14 00:00:00+00	266	355	7.7792	7.9194	7.7372	7.8667
12311	2019-05-13 00:00:00+00	266	355	7.8632	7.9862	7.7469	7.7861
12312	2019-05-12 00:00:00+00	266	355	7.7871	7.8128	7.7502	7.7785
12313	2019-05-10 00:00:00+00	266	355	7.7700	8.0339	7.7328	8.0106
12314	2019-05-09 00:00:00+00	266	355	8.0096	8.1403	8.0077	8.0186
12315	2019-05-08 00:00:00+00	266	355	8.0301	8.0891	7.9979	8.0462
12316	2019-05-07 00:00:00+00	266	355	8.0432	8.1382	7.9645	7.9707
12317	2019-05-06 00:00:00+00	266	355	7.9708	8.0512	7.8437	7.8750
12318	2019-05-05 00:00:00+00	266	355	7.8723	7.8903	7.8267	7.8555
12319	2019-05-03 00:00:00+00	266	355	7.8449	7.8702	7.7520	7.7708
12320	2019-05-02 00:00:00+00	266	355	7.7722	7.8283	7.7602	7.7896
12321	2019-05-01 00:00:00+00	266	355	7.7994	7.8068	7.7603	7.7732
12322	2019-04-30 00:00:00+00	266	355	7.7702	7.7843	7.6833	7.6944
12323	2019-04-29 00:00:00+00	266	355	7.6903	7.7168	7.6583	7.6808
12324	2019-04-28 00:00:00+00	266	355	7.6856	7.6860	7.6604	7.6671
12325	2019-04-26 00:00:00+00	266	355	7.6808	7.7075	7.6287	7.6768
12326	2019-04-25 00:00:00+00	266	355	7.6694	7.7094	7.5735	7.5983
12327	2019-04-24 00:00:00+00	266	355	7.6021	7.6285	7.5441	7.5515
12328	2019-04-23 00:00:00+00	266	355	7.5499	7.6050	7.5290	7.5651
12329	2019-04-22 00:00:00+00	266	355	7.5622	7.6138	7.4952	7.5692
12330	2019-04-21 00:00:00+00	266	355	7.5639	7.5766	7.5158	7.5514
12331	2019-04-19 00:00:00+00	266	355	7.5526	7.5880	7.5191	7.5442
12332	2019-04-18 00:00:00+00	266	355	7.5397	7.6358	7.4977	7.5072
12333	2019-04-17 00:00:00+00	266	355	7.5212	7.5809	7.4505	7.5481
12334	2019-04-16 00:00:00+00	266	355	7.5704	7.6208	7.4815	7.6029
12335	2019-04-15 00:00:00+00	266	355	7.5994	7.6310	7.5439	7.5538
12336	2019-04-14 00:00:00+00	266	355	7.5481	7.5526	7.5087	7.5329
12337	2019-04-12 00:00:00+00	266	355	7.5424	7.6184	7.4631	7.4871
12338	2019-04-11 00:00:00+00	266	355	7.4820	7.5373	7.4335	7.4400
12339	2019-04-10 00:00:00+00	266	355	7.4467	7.4761	7.4094	7.4198
12340	2019-04-09 00:00:00+00	266	355	7.4167	7.4505	7.3716	7.4304
12341	2019-04-08 00:00:00+00	266	355	7.4323	7.4732	7.3314	7.3422
12342	2019-04-07 00:00:00+00	266	355	7.3389	7.3506	7.3250	7.3377
12343	2019-04-05 00:00:00+00	266	355	7.3355	7.3828	7.2740	7.3178
12344	2019-04-04 00:00:00+00	266	355	7.3095	7.4751	7.2680	7.4075
12345	2019-04-03 00:00:00+00	266	355	7.4212	7.4545	7.3283	7.3781
12346	2019-04-02 00:00:00+00	266	355	7.3866	7.4255	7.1860	7.2086
12347	2019-04-01 00:00:00+00	266	355	7.2131	7.4577	7.0619	7.2785
12348	2019-03-31 00:00:00+00	266	355	7.2877	7.3327	7.2416	7.2614
12349	2019-03-29 00:00:00+00	266	355	7.2753	7.4294	7.2269	7.2745
12350	2019-03-28 00:00:00+00	266	355	7.2751	7.5113	7.1632	7.2918
12351	2019-03-27 00:00:00+00	266	355	7.2918	7.4197	7.0027	7.0893
12352	2019-03-26 00:00:00+00	266	355	7.1243	7.3916	7.0062	7.3626
12353	2019-03-25 00:00:00+00	266	355	7.3743	7.5943	7.3226	7.5911
12354	2019-03-24 00:00:00+00	266	355	7.5936	7.6294	7.5586	7.6167
12355	2019-03-22 00:00:00+00	266	355	7.6163	7.7220	7.1709	7.1717
12356	2019-03-21 00:00:00+00	266	355	7.1758	7.2140	7.1209	7.1608
12357	2019-03-20 00:00:00+00	266	355	7.1690	7.2688	7.1433	7.2659
12358	2019-03-19 00:00:00+00	266	355	7.2668	7.2885	7.2426	7.2436
12359	2019-03-18 00:00:00+00	266	355	7.2443	7.2640	7.2030	7.2432
12360	2019-03-17 00:00:00+00	266	355	7.2414	7.2475	7.2384	7.2412
12361	2019-03-15 00:00:00+00	266	355	7.2434	7.2727	7.2216	7.2438
12362	2019-03-14 00:00:00+00	266	355	7.2443	7.3005	7.2232	7.2676
12363	2019-03-13 00:00:00+00	266	355	7.2765	7.3095	7.1219	7.1361
12364	2019-03-12 00:00:00+00	266	355	7.1352	7.2137	7.0951	7.1974
12365	2019-03-11 00:00:00+00	266	355	7.2002	7.2280	7.0395	7.0489
12366	2019-03-10 00:00:00+00	266	355	7.0495	7.0704	7.0406	7.0603
12367	2019-03-08 00:00:00+00	266	355	7.0747	7.1944	7.0690	7.1438
12368	2019-03-07 00:00:00+00	266	355	7.1460	7.1937	7.1180	7.1487
12369	2019-03-06 00:00:00+00	266	355	7.1593	7.1662	7.0544	7.0814
12370	2019-03-05 00:00:00+00	266	355	7.0789	7.1141	7.0550	7.0756
12371	2019-03-04 00:00:00+00	266	355	7.0723	7.1509	7.0715	7.1014
12372	2019-03-03 00:00:00+00	266	355	7.0926	7.1273	7.0923	7.1273
12373	2019-03-01 00:00:00+00	266	355	7.0970	7.1609	7.0719	7.0850
12374	2019-02-28 00:00:00+00	266	355	7.0874	7.1107	7.0608	7.0723
12375	2019-02-27 00:00:00+00	266	355	7.0802	7.1008	7.0139	7.0332
12376	2019-02-26 00:00:00+00	266	355	7.0331	7.0574	6.9590	6.9614
12377	2019-02-25 00:00:00+00	266	355	6.9640	6.9743	6.9170	6.9469
12378	2019-02-24 00:00:00+00	266	355	6.9445	6.9602	6.9437	6.9588
12379	2019-02-22 00:00:00+00	266	355	6.9335	6.9681	6.9065	6.9345
12380	2019-02-21 00:00:00+00	266	355	6.9355	6.9835	6.9232	6.9444
12381	2019-02-20 00:00:00+00	266	355	6.9488	6.9745	6.8949	6.8970
12382	2019-02-19 00:00:00+00	266	355	6.8972	6.9117	6.8247	6.8450
12383	2019-02-18 00:00:00+00	266	355	6.8449	6.8749	6.8041	6.8237
12384	2019-02-17 00:00:00+00	266	355	6.8215	6.8257	6.8009	6.8131
12385	2019-02-15 00:00:00+00	266	355	6.7973	6.8274	6.7303	6.7569
12386	2019-02-14 00:00:00+00	266	355	6.7471	6.8381	6.7344	6.7904
12387	2019-02-13 00:00:00+00	266	355	6.7980	6.8169	6.7648	6.7704
12388	2019-02-12 00:00:00+00	266	355	6.7655	6.7978	6.7577	6.7916
12389	2019-02-11 00:00:00+00	266	355	6.7821	6.8197	6.7742	6.7904
12390	2019-02-10 00:00:00+00	266	355	6.7835	6.7962	6.7797	6.7924
12391	2019-02-08 00:00:00+00	266	355	6.7879	6.8338	6.7795	6.8291
12392	2019-02-07 00:00:00+00	266	355	6.8288	6.8729	6.7418	6.7442
12393	2019-02-06 00:00:00+00	266	355	6.7538	6.7907	6.7242	6.7328
12394	2019-02-05 00:00:00+00	266	355	6.7288	6.8099	6.7229	6.8028
12395	2019-02-04 00:00:00+00	266	355	6.7977	6.8530	6.7945	6.8157
12396	2019-02-03 00:00:00+00	266	355	6.7988	6.8220	6.7982	6.8040
12397	2019-02-01 00:00:00+00	266	355	6.8122	6.8466	6.7672	6.7818
12398	2019-01-31 00:00:00+00	266	355	6.7759	6.8897	6.7624	6.8665
12399	2019-01-30 00:00:00+00	266	355	6.8750	6.9736	6.8309	6.9483
12400	2019-01-29 00:00:00+00	266	355	6.9489	7.0499	6.9304	7.0016
12401	2019-01-28 00:00:00+00	266	355	7.0021	7.0310	6.9285	6.9664
12402	2019-01-27 00:00:00+00	266	355	6.9577	6.9693	6.7448	6.7448
12403	2019-01-25 00:00:00+00	266	355	6.9441	6.9646	6.8840	6.8920
12404	2019-01-24 00:00:00+00	266	355	6.8888	6.9371	6.8452	6.9125
12405	2019-01-23 00:00:00+00	266	355	6.9150	6.9373	6.8902	6.9227
12406	2019-01-22 00:00:00+00	266	355	6.9183	6.9384	6.8518	6.8653
12407	2019-01-21 00:00:00+00	266	355	6.8629	6.8882	6.8370	6.8588
12408	2019-01-20 00:00:00+00	266	355	6.8507	6.8705	6.8359	6.8560
12409	2019-01-18 00:00:00+00	266	355	6.8455	6.9680	6.8387	6.9483
12410	2019-01-17 00:00:00+00	266	355	6.9239	6.9663	6.8747	6.8870
12411	2019-01-16 00:00:00+00	266	355	6.8759	7.0153	6.8476	7.0079
12412	2019-01-15 00:00:00+00	266	355	7.0043	7.0599	6.9035	7.0136
12413	2019-01-14 00:00:00+00	266	355	7.0097	7.1226	6.9783	7.0286
12414	2019-01-13 00:00:00+00	266	355	7.0340	7.0402	7.0058	7.0066
12415	2019-01-11 00:00:00+00	266	355	7.0072	7.0515	6.8964	6.9176
12416	2019-01-10 00:00:00+00	266	355	6.8980	7.0412	6.8913	7.0163
12417	2019-01-09 00:00:00+00	266	355	7.0202	7.0666	6.9422	6.9631
12418	2019-01-08 00:00:00+00	266	355	6.9565	7.0189	6.8653	6.8823
12419	2019-01-07 00:00:00+00	266	355	6.8831	6.9085	6.7592	6.7790
12420	2019-01-06 00:00:00+00	266	355	6.7663	6.7912	6.7493	6.7895
12421	2019-01-05 00:00:00+00	266	355	6.7899	6.7899	6.7899	6.7899
12422	2019-01-04 00:00:00+00	266	355	6.7821	6.9149	6.7515	6.9069
12423	2019-01-03 00:00:00+00	266	355	6.9148	7.1872	6.7601	7.1332
12424	2019-01-02 00:00:00+00	266	355	7.1479	7.3485	6.6702	6.7186
12425	2019-01-01 00:00:00+00	266	355	6.7292	6.7498	6.6337	6.7153
12426	2018-12-31 00:00:00+00	266	355	6.7210	6.8068	6.6771	6.7265
12427	2018-12-30 00:00:00+00	266	355	6.7090	6.7778	6.6694	6.6991
12428	2018-12-28 00:00:00+00	266	355	6.6958	6.7175	6.6517	6.6836
12429	2018-12-27 00:00:00+00	266	355	6.6902	6.7818	6.6560	6.6635
12430	2018-12-26 00:00:00+00	266	355	6.6561	6.8050	6.5935	6.7247
12431	2018-12-25 00:00:00+00	266	355	6.7250	6.7770	6.6625	6.7160
12432	2018-12-24 00:00:00+00	266	355	6.7163	6.8111	6.6253	6.7130
12433	2018-12-23 00:00:00+00	266	355	6.7073	6.7260	6.7036	6.7230
12434	2018-12-21 00:00:00+00	266	355	6.7176	6.7476	6.6369	6.6626
12435	2018-12-20 00:00:00+00	266	355	6.6580	6.7312	6.6309	6.6869
12436	2018-12-19 00:00:00+00	266	355	6.6946	6.7736	6.5821	6.7535
12437	2018-12-18 00:00:00+00	266	355	6.7455	6.8053	6.7358	6.7752
12438	2018-12-17 00:00:00+00	266	355	6.7749	6.8060	6.7431	6.7525
12439	2018-12-16 00:00:00+00	266	355	6.7559	6.8025	6.7248	6.7558
12440	2018-12-14 00:00:00+00	266	355	6.7501	6.8299	6.7351	6.7599
12441	2018-12-13 00:00:00+00	266	355	6.7569	6.8440	6.7196	6.7529
12442	2018-12-12 00:00:00+00	266	355	6.7627	6.7864	6.6824	6.6968
12443	2018-12-11 00:00:00+00	266	355	6.6921	6.8193	6.6756	6.6873
12444	2018-12-10 00:00:00+00	266	355	6.6871	6.7831	6.6715	6.7518
12445	2018-12-09 00:00:00+00	266	355	6.7477	6.7583	6.7192	6.7403
12446	2018-12-07 00:00:00+00	266	355	6.7507	6.8330	6.7151	6.8215
12447	2018-12-06 00:00:00+00	266	355	6.8149	6.8849	6.7768	6.7851
12448	2018-12-05 00:00:00+00	266	355	6.7859	6.9225	6.7666	6.8495
12449	2018-12-04 00:00:00+00	266	355	6.8504	6.9661	6.6580	6.6785
12450	2018-12-03 00:00:00+00	266	355	6.6581	6.7295	6.5661	6.5816
12451	2018-12-02 00:00:00+00	266	355	6.5691	6.6141	6.5504	6.6128
12452	2018-11-30 00:00:00+00	266	355	6.6321	6.7078	6.5796	6.6013
12453	2018-11-29 00:00:00+00	266	355	6.6052	6.7156	6.5545	6.6938
12454	2018-11-28 00:00:00+00	266	355	6.6996	6.7380	6.6700	6.7055
12455	2018-11-27 00:00:00+00	266	355	6.6940	6.7516	6.6635	6.7281
12456	2018-11-26 00:00:00+00	266	355	6.7256	6.7915	6.7052	6.7815
12457	2018-11-25 00:00:00+00	266	355	6.7828	6.7992	6.7697	6.7943
12458	2018-11-23 00:00:00+00	266	355	6.7794	6.8490	6.7465	6.8236
12459	2018-11-22 00:00:00+00	266	355	6.8028	6.8543	6.7641	6.7837
12460	2018-11-21 00:00:00+00	266	355	6.7873	6.9038	6.7381	6.8805
12461	2018-11-20 00:00:00+00	266	355	6.8757	6.9775	6.8217	6.8347
12462	2018-11-19 00:00:00+00	266	355	6.8344	6.8908	6.8028	6.8427
12463	2018-11-18 00:00:00+00	266	355	6.8382	6.8757	6.8214	6.8456
12464	2018-11-16 00:00:00+00	266	355	6.8267	6.8969	6.8098	6.8507
12465	2018-11-15 00:00:00+00	266	355	6.8515	7.1278	6.7771	7.0913
12466	2018-11-14 00:00:00+00	266	355	7.0965	7.1633	7.0424	7.1381
12467	2018-11-13 00:00:00+00	266	355	7.1404	7.1712	7.0176	7.0284
12468	2018-11-12 00:00:00+00	266	355	7.0273	7.1073	6.9821	7.0656
12469	2018-11-11 00:00:00+00	266	355	7.0584	7.0690	7.0433	7.0546
12470	2018-11-09 00:00:00+00	266	355	7.0696	7.2108	7.0292	7.1370
12471	2018-11-08 00:00:00+00	266	355	7.1222	7.2029	7.0390	7.0451
12472	2018-11-07 00:00:00+00	266	355	7.0574	7.1045	7.0035	7.0326
12473	2018-11-06 00:00:00+00	266	355	7.0074	7.0842	6.9262	6.9448
12474	2018-11-05 00:00:00+00	266	355	6.9317	7.1240	6.9123	7.0644
12475	2018-11-04 00:00:00+00	266	355	7.0546	7.0849	7.0484	7.0822
12476	2018-11-02 00:00:00+00	266	355	7.0441	7.1870	7.0170	7.1705
12477	2018-11-01 00:00:00+00	266	355	7.1513	7.2831	7.1261	7.1341
12478	2018-10-31 00:00:00+00	266	355	7.1362	7.1995	6.9440	6.9605
12479	2018-10-30 00:00:00+00	266	355	6.9536	7.1199	6.9346	7.1102
12480	2018-10-29 00:00:00+00	266	355	7.1046	7.1844	7.0641	7.1685
12481	2018-10-28 00:00:00+00	266	355	7.1561	7.1908	7.1550	7.1766
12482	2018-10-26 00:00:00+00	266	355	7.1740	7.2507	7.1316	7.2262
12483	2018-10-25 00:00:00+00	266	355	7.2183	7.4178	7.2035	7.3439
12484	2018-10-24 00:00:00+00	266	355	7.3513	7.4964	7.2961	7.4613
12485	2018-10-23 00:00:00+00	266	355	7.4491	7.6305	7.3366	7.3493
12486	2018-10-22 00:00:00+00	266	355	7.3490	7.4029	7.3305	7.3830
12487	2018-10-21 00:00:00+00	266	355	7.3833	7.3910	7.3620	7.3799
12488	2018-10-19 00:00:00+00	266	355	7.3736	7.4371	7.2926	7.3355
12489	2018-10-18 00:00:00+00	266	355	7.3322	7.4576	7.2383	7.3270
12490	2018-10-17 00:00:00+00	266	355	7.3245	7.5290	7.2499	7.4994
12491	2018-10-16 00:00:00+00	266	355	7.4970	7.6716	7.4658	7.6032
12492	2018-10-15 00:00:00+00	266	355	7.6025	7.7355	7.5651	7.7142
12493	2018-10-14 00:00:00+00	266	355	7.7115	7.7403	7.6770	7.7261
12494	2018-10-12 00:00:00+00	266	355	7.7216	7.9316	7.6868	7.8481
12495	2018-10-11 00:00:00+00	266	355	7.8345	8.0512	7.8044	8.0316
12496	2018-10-10 00:00:00+00	266	355	8.0380	8.0728	7.9127	8.0266
12497	2018-10-09 00:00:00+00	266	355	8.0176	8.0454	7.9618	8.0033
12498	2018-10-08 00:00:00+00	266	355	8.0039	8.0983	7.9749	8.0953
12499	2018-10-07 00:00:00+00	266	355	8.0931	8.0970	8.0372	8.0441
12500	2018-10-05 00:00:00+00	266	355	8.0431	8.0837	7.9761	8.0327
12501	2018-10-04 00:00:00+00	266	355	8.0203	8.1145	7.8315	7.8347
12502	2018-10-03 00:00:00+00	266	355	7.8435	7.9267	7.7571	7.7711
12503	2018-10-02 00:00:00+00	266	355	7.7642	7.8584	7.7363	7.7471
12504	2018-10-01 00:00:00+00	266	355	7.7425	7.8920	7.6912	7.8783
12505	2018-09-30 00:00:00+00	266	355	7.8725	7.9084	7.8595	7.8954
12506	2018-09-28 00:00:00+00	266	355	7.9086	7.9476	7.7893	7.8509
12507	2018-09-27 00:00:00+00	266	355	7.8489	8.0697	7.8203	8.0482
12508	2018-09-26 00:00:00+00	266	355	8.0401	8.1706	7.9841	8.1693
12509	2018-09-25 00:00:00+00	266	355	8.1646	8.1926	7.9404	8.0452
12510	2018-09-24 00:00:00+00	266	355	8.0458	8.2789	7.9375	8.2406
12511	2018-09-23 00:00:00+00	266	355	8.2405	8.3670	8.2157	8.2169
12512	2018-09-21 00:00:00+00	266	355	8.2239	8.3247	8.1834	8.2282
12513	2018-09-20 00:00:00+00	266	355	8.2227	8.4510	8.0888	8.2227
12514	2018-09-19 00:00:00+00	266	355	8.2245	8.4380	8.1768	8.4240
12515	2018-09-18 00:00:00+00	266	355	8.4237	8.4934	8.2944	8.3099
12516	2018-09-17 00:00:00+00	266	355	8.3058	8.3281	8.0338	8.0553
12517	2018-09-16 00:00:00+00	266	355	8.0500	8.0645	8.0257	8.0488
12518	2018-09-14 00:00:00+00	266	355	8.0643	8.0906	7.8897	7.9996
12519	2018-09-13 00:00:00+00	266	355	8.0014	8.5655	7.8488	8.2822
12520	2018-09-12 00:00:00+00	266	355	8.2817	8.4163	8.2248	8.3835
12521	2018-09-11 00:00:00+00	266	355	8.3567	8.4603	8.3438	8.4292
12522	2018-09-10 00:00:00+00	266	355	8.4188	8.4427	8.2608	8.2789
12523	2018-09-09 00:00:00+00	266	355	8.2700	8.2847	8.2335	8.2560
12524	2018-09-07 00:00:00+00	266	355	8.2463	8.5412	8.2290	8.5023
12525	2018-09-06 00:00:00+00	266	355	8.5005	8.5799	8.4574	8.4738
12526	2018-09-05 00:00:00+00	266	355	8.4988	8.6257	8.4607	8.5990
12527	2018-09-04 00:00:00+00	266	355	8.5916	8.6261	8.4527	8.5385
12528	2018-09-03 00:00:00+00	266	355	8.5333	8.7007	8.4158	8.4905
12529	2018-09-02 00:00:00+00	266	355	8.4919	8.5863	8.4450	8.4568
12530	2018-08-31 00:00:00+00	266	355	8.4471	8.8231	8.3109	8.6884
12531	2018-08-30 00:00:00+00	266	355	8.6816	8.9105	8.3629	8.3629
12532	2018-08-29 00:00:00+00	266	355	8.4038	8.4458	8.0226	8.0511
12533	2018-08-28 00:00:00+00	266	355	8.0677	8.1090	7.8896	7.9499
12534	2018-08-27 00:00:00+00	266	355	7.9429	8.0870	7.6576	7.6920
12535	2018-08-26 00:00:00+00	266	355	7.6881	7.7218	7.6702	7.7194
12536	2018-08-24 00:00:00+00	266	355	7.7138	7.8657	7.6861	7.7995
12537	2018-08-23 00:00:00+00	266	355	7.7925	7.9194	7.7011	7.7824
12538	2018-08-22 00:00:00+00	266	355	7.7735	7.8708	7.7276	7.8273
12539	2018-08-21 00:00:00+00	266	355	7.8000	7.9910	7.7054	7.8057
12540	2018-08-20 00:00:00+00	266	355	7.7984	7.9128	7.5882	7.6276
12541	2018-08-19 00:00:00+00	266	355	7.6168	7.6865	7.5917	7.6865
12542	2018-08-17 00:00:00+00	266	355	7.6705	8.0821	7.3253	7.4201
12543	2018-08-16 00:00:00+00	266	355	7.4515	7.6875	7.2403	7.5906
12544	2018-08-15 00:00:00+00	266	355	7.6139	8.3433	7.4388	8.1118
12545	2018-08-14 00:00:00+00	266	355	8.1147	8.8819	7.9866	8.8417
12546	2018-08-13 00:00:00+00	266	355	8.8338	9.0453	8.2171	8.7261
12547	2018-08-12 00:00:00+00	266	355	8.7228	9.0571	8.2065	8.2150
12548	2018-08-10 00:00:00+00	266	355	8.2079	8.7319	7.1078	7.1115
12549	2018-08-09 00:00:00+00	266	355	7.1148	7.1588	6.8081	6.8097
12550	2018-08-08 00:00:00+00	266	355	6.8080	6.8503	6.7605	6.8025
12551	2018-08-07 00:00:00+00	266	355	6.7943	6.9425	6.7153	6.8154
12552	2018-08-06 00:00:00+00	266	355	6.8153	7.0229	6.6111	6.6362
12553	2018-08-05 00:00:00+00	266	355	6.6351	6.6376	6.5921	6.5921
12554	2018-08-03 00:00:00+00	266	355	6.6067	6.6629	6.5834	6.6016
12555	2018-08-02 00:00:00+00	266	355	6.5923	6.6698	6.5053	6.5578
12556	2018-08-01 00:00:00+00	266	355	6.5618	6.5778	6.4362	6.4487
12557	2018-07-31 00:00:00+00	266	355	6.4438	6.4717	6.3495	6.4214
12558	2018-07-30 00:00:00+00	266	355	6.4166	6.4370	6.3538	6.3653
12559	2018-07-29 00:00:00+00	266	355	6.3618	6.3680	6.3241	6.3420
12560	2018-07-27 00:00:00+00	266	355	6.3522	6.3941	6.3399	6.3816
12561	2018-07-26 00:00:00+00	266	355	6.3819	6.4146	6.3136	6.3282
12562	2018-07-25 00:00:00+00	266	355	6.3336	6.4241	6.2881	6.4176
12563	2018-07-24 00:00:00+00	266	355	6.4155	6.4828	6.2009	6.2085
12564	2018-07-23 00:00:00+00	266	355	6.2076	6.2875	6.1959	6.2794
12565	2018-07-22 00:00:00+00	266	355	6.2784	6.3113	6.2583	6.2698
12566	2018-07-20 00:00:00+00	266	355	6.2944	6.3120	6.2394	6.2609
12567	2018-07-19 00:00:00+00	266	355	6.2567	6.3041	6.2463	6.2703
12568	2018-07-18 00:00:00+00	266	355	6.2751	6.3113	6.2208	6.2964
12569	2018-07-17 00:00:00+00	266	355	6.2969	6.4345	6.2691	6.4221
12570	2018-07-16 00:00:00+00	266	355	6.4246	6.4658	6.3894	6.4259
12571	2018-07-15 00:00:00+00	266	355	6.4246	6.4438	6.3829	6.4219
12572	2018-07-13 00:00:00+00	266	355	6.4257	6.4563	6.3463	6.4065
12573	2018-07-12 00:00:00+00	266	355	6.4161	6.4797	6.3274	6.4744
12574	2018-07-11 00:00:00+00	266	355	6.4783	6.5953	6.2257	6.2490
12575	2018-07-10 00:00:00+00	266	355	6.2494	6.2853	6.1499	6.2489
12576	2018-07-09 00:00:00+00	266	355	6.2502	6.2976	6.0174	6.0894
12577	2018-07-08 00:00:00+00	266	355	6.0911	6.1123	6.0738	6.0738
12578	2018-07-06 00:00:00+00	266	355	6.0773	6.1132	6.0618	6.0773
12579	2018-07-05 00:00:00+00	266	355	6.0688	6.2040	6.0557	6.1805
12580	2018-07-04 00:00:00+00	266	355	6.1796	6.2338	6.1571	6.1593
12581	2018-07-03 00:00:00+00	266	355	6.1593	6.1738	6.0279	6.0683
12582	2018-07-02 00:00:00+00	266	355	6.0609	6.1146	6.0410	6.0725
12583	2018-07-01 00:00:00+00	266	355	6.0720	6.0812	6.0372	6.0552
12584	2018-06-29 00:00:00+00	266	355	6.0590	6.0864	5.9680	6.0054
12585	2018-06-28 00:00:00+00	266	355	6.0033	6.0868	5.9819	6.0598
12586	2018-06-27 00:00:00+00	266	355	6.0679	6.1472	6.0450	6.1075
12587	2018-06-26 00:00:00+00	266	355	6.1033	6.2595	6.0855	6.2198
12588	2018-06-25 00:00:00+00	266	355	6.2215	6.2589	6.0105	6.1123
12589	2018-06-24 00:00:00+00	266	355	6.1091	6.2014	6.0616	6.1851
12590	2018-06-22 00:00:00+00	266	355	6.2019	6.2980	6.1706	6.2636
12591	2018-06-21 00:00:00+00	266	355	6.2386	6.2970	6.2279	6.2475
12592	2018-06-20 00:00:00+00	266	355	6.2497	6.2757	6.2273	6.2472
12593	2018-06-19 00:00:00+00	266	355	6.2399	6.2944	6.2110	6.2301
12594	2018-06-18 00:00:00+00	266	355	6.2320	6.2982	6.2064	6.2856
12595	2018-06-17 00:00:00+00	266	355	6.2855	6.2880	6.2367	6.2693
12596	2018-06-15 00:00:00+00	266	355	6.2798	6.3100	6.2455	6.2947
12597	2018-06-14 00:00:00+00	266	355	6.2932	6.2967	6.1687	6.2290
12598	2018-06-13 00:00:00+00	266	355	6.2305	6.2674	6.1280	6.1360
12599	2018-06-12 00:00:00+00	266	355	6.1410	6.1568	6.0401	6.0477
12600	2018-06-11 00:00:00+00	266	355	6.0498	6.0707	5.9832	5.9885
12601	2018-06-10 00:00:00+00	266	355	5.9917	6.0152	5.9540	5.9906
12602	2018-06-08 00:00:00+00	266	355	5.9904	6.0902	5.9839	6.0191
12603	2018-06-07 00:00:00+00	266	355	6.0157	6.1762	5.9758	6.1225
12604	2018-06-06 00:00:00+00	266	355	6.1216	6.2114	6.0843	6.1602
12605	2018-06-05 00:00:00+00	266	355	6.1505	6.2026	6.1020	6.1082
12606	2018-06-04 00:00:00+00	266	355	6.1086	6.2548	6.1034	6.2024
12607	2018-06-03 00:00:00+00	266	355	6.2010	6.2087	6.1440	6.1875
12608	2018-06-01 00:00:00+00	266	355	6.2078	6.2176	6.0009	6.0205
12609	2018-05-31 00:00:00+00	266	355	6.0159	6.0503	5.9228	5.9336
12610	2018-05-30 00:00:00+00	266	355	5.9362	6.0483	5.9137	6.0413
12611	2018-05-29 00:00:00+00	266	355	6.0396	6.1416	5.9952	6.0991
12612	2018-05-28 00:00:00+00	266	355	6.0993	6.2764	6.0726	6.2743
12613	2018-05-27 00:00:00+00	266	355	6.2702	6.2810	6.2221	6.2411
12614	2018-05-25 00:00:00+00	266	355	6.2649	6.4185	6.2364	6.3506
12615	2018-05-24 00:00:00+00	266	355	6.3480	6.4315	6.0777	6.1114
12616	2018-05-23 00:00:00+00	266	355	6.1115	6.5915	6.0588	6.3632
12617	2018-05-22 00:00:00+00	266	355	6.3601	6.5329	6.1124	6.1459
12618	2018-05-21 00:00:00+00	266	355	6.1459	6.1768	6.0457	6.0647
12619	2018-05-20 00:00:00+00	266	355	6.0589	6.0679	6.0388	6.0501
12620	2018-05-18 00:00:00+00	266	355	6.0540	6.0707	6.0030	6.0300
12621	2018-05-17 00:00:00+00	266	355	6.0290	6.0494	5.9821	5.9890
12622	2018-05-16 00:00:00+00	266	355	5.9941	6.0685	5.9314	6.0184
12623	2018-05-15 00:00:00+00	266	355	6.0186	6.0431	5.8967	5.9064
12624	2018-05-14 00:00:00+00	266	355	5.9074	5.9277	5.8370	5.8469
12625	2018-05-13 00:00:00+00	266	355	5.8432	5.8512	5.7877	5.8365
12626	2018-05-11 00:00:00+00	266	355	5.8403	5.8523	5.7233	5.7252
12627	2018-05-10 00:00:00+00	266	355	5.7258	5.8488	5.7068	5.8067
12628	2018-05-09 00:00:00+00	266	355	5.8074	5.9165	5.7780	5.8859
12629	2018-05-08 00:00:00+00	266	355	5.8852	5.8867	5.7802	5.7826
12630	2018-05-07 00:00:00+00	266	355	5.7815	5.7985	5.7086	5.7501
12631	2018-05-06 00:00:00+00	266	355	5.7481	5.7522	5.6912	5.7243
12632	2018-05-04 00:00:00+00	266	355	5.7129	5.8178	5.7129	5.7247
12633	2018-05-03 00:00:00+00	266	355	5.7267	5.7590	5.6534	5.6768
12634	2018-05-02 00:00:00+00	266	355	5.6811	5.6900	5.5659	5.5873
12635	2018-05-01 00:00:00+00	266	355	5.5827	5.6287	5.5668	5.5917
12636	2018-04-30 00:00:00+00	266	355	5.5920	5.6069	5.5453	5.5765
12637	2018-04-29 00:00:00+00	266	355	5.5757	5.5921	5.5539	5.5737
12638	2018-04-27 00:00:00+00	266	355	5.5698	5.6791	5.5639	5.6592
12639	2018-04-26 00:00:00+00	266	355	5.6589	5.7029	5.6468	5.6867
12640	2018-04-25 00:00:00+00	266	355	5.6909	5.7314	5.6244	5.7106
12641	2018-04-24 00:00:00+00	266	355	5.7085	5.7328	5.6861	5.7257
12642	2018-04-23 00:00:00+00	266	355	5.7272	5.7437	5.6917	5.7132
12643	2018-04-22 00:00:00+00	266	355	5.7143	5.7192	5.6941	5.7091
12644	2018-04-20 00:00:00+00	266	355	5.7056	5.7160	5.6594	5.6896
12645	2018-04-19 00:00:00+00	266	355	5.6884	5.7549	5.6833	5.7087
12646	2018-04-18 00:00:00+00	266	355	5.7157	5.8768	5.6877	5.8554
12647	2018-04-17 00:00:00+00	266	355	5.8561	5.9293	5.8471	5.8793
12648	2018-04-16 00:00:00+00	266	355	5.8796	5.9022	5.8161	5.8161
12649	2018-04-15 00:00:00+00	266	355	5.8198	5.8457	5.7938	5.8281
12650	2018-04-13 00:00:00+00	266	355	5.8320	5.8633	5.8132	5.8528
12651	2018-04-12 00:00:00+00	266	355	5.8522	5.9078	5.8008	5.8746
12652	2018-04-11 00:00:00+00	266	355	5.8764	5.9452	5.8242	5.8343
12653	2018-04-10 00:00:00+00	266	355	5.8330	5.8687	5.7326	5.7630
12654	2018-04-09 00:00:00+00	266	355	5.7597	5.7611	5.6904	5.7049
12655	2018-04-08 00:00:00+00	266	355	5.7043	5.7070	5.6846	5.6871
12656	2018-04-06 00:00:00+00	266	355	5.6999	5.7099	5.6551	5.6793
12657	2018-04-05 00:00:00+00	266	355	5.6793	5.6857	5.6280	5.6395
12658	2018-04-04 00:00:00+00	266	355	5.6395	5.6592	5.6105	5.6137
12659	2018-04-03 00:00:00+00	266	355	5.6139	5.6186	5.5798	5.5882
12660	2018-04-02 00:00:00+00	266	355	5.5841	5.5909	5.5456	5.5501
12661	2018-04-01 00:00:00+00	266	355	5.5473	5.5532	5.5139	5.5139
12662	2018-03-30 00:00:00+00	266	355	5.5434	5.5681	5.5239	5.5361
12663	2018-03-29 00:00:00+00	266	355	5.5361	5.6589	5.5170	5.6484
12664	2018-03-28 00:00:00+00	266	355	5.6557	5.6769	5.6348	5.6358
12665	2018-03-27 00:00:00+00	266	355	5.6441	5.6538	5.6164	5.6456
12666	2018-03-26 00:00:00+00	266	355	5.6454	5.6839	5.6022	5.6374
12667	2018-03-25 00:00:00+00	266	355	5.6381	5.6382	5.5851	5.5865
12668	2018-03-23 00:00:00+00	266	355	5.6299	5.6554	5.5823	5.6545
12669	2018-03-22 00:00:00+00	266	355	5.6515	5.7068	5.5220	5.5264
12670	2018-03-21 00:00:00+00	266	355	5.5303	5.5413	5.5007	5.5076
12671	2018-03-20 00:00:00+00	266	355	5.5068	5.5467	5.4904	5.5260
12672	2018-03-19 00:00:00+00	266	355	5.5256	5.5640	5.4601	5.4644
12673	2018-03-18 00:00:00+00	266	355	5.4632	5.4686	5.4333	5.4641
12674	2018-03-16 00:00:00+00	266	355	5.4658	5.4746	5.4223	5.4260
12675	2018-03-15 00:00:00+00	266	355	5.4270	5.4556	5.4151	5.4186
12676	2018-03-14 00:00:00+00	266	355	5.4181	5.4312	5.3837	5.4069
12677	2018-03-13 00:00:00+00	266	355	5.4087	5.4169	5.3265	5.3440
12678	2018-03-12 00:00:00+00	266	355	5.3439	5.3525	5.2759	5.2802
12679	2018-03-11 00:00:00+00	266	355	5.2813	5.2857	5.2438	5.2559
12680	2018-03-10 00:00:00+00	266	355	5.2795	5.2795	5.2781	5.2781
12681	2018-03-09 00:00:00+00	266	355	5.2797	5.2985	5.2648	5.2814
12682	2018-03-08 00:00:00+00	266	355	5.2749	5.3091	5.2583	5.2865
12683	2018-03-07 00:00:00+00	266	355	5.2899	5.2931	5.2561	5.2759
12684	2018-03-06 00:00:00+00	266	355	5.2769	5.2827	5.2587	5.2749
12685	2018-03-05 00:00:00+00	266	355	5.2736	5.2980	5.2474	5.2560
12686	2018-03-04 00:00:00+00	266	355	5.2546	5.2644	5.2045	5.2401
12687	2018-03-02 00:00:00+00	266	355	5.2516	5.2740	5.2360	5.2458
12688	2018-03-01 00:00:00+00	266	355	5.2396	5.2597	5.2248	5.2305
12689	2018-02-28 00:00:00+00	266	355	5.2324	5.3092	5.2189	5.3059
12690	2018-02-27 00:00:00+00	266	355	5.3075	5.3086	5.2701	5.2866
12691	2018-02-26 00:00:00+00	266	355	5.2869	5.3171	5.2791	5.2920
12692	2018-02-25 00:00:00+00	266	355	5.2904	5.3103	5.2706	5.2835
12693	2018-02-23 00:00:00+00	266	355	5.2926	5.3076	5.2724	5.2809
12694	2018-02-22 00:00:00+00	266	355	5.2816	5.3002	5.2665	5.2739
12695	2018-02-21 00:00:00+00	266	355	5.2782	5.3265	5.2617	5.3166
12696	2018-02-20 00:00:00+00	266	355	5.3166	5.3330	5.2537	5.2600
12697	2018-02-19 00:00:00+00	266	355	5.2610	5.2761	5.2463	5.2570
12698	2018-02-18 00:00:00+00	266	355	5.2565	5.2580	5.2264	5.2459
12699	2018-02-16 00:00:00+00	266	355	5.2524	5.3355	5.2403	5.3091
12700	2018-02-15 00:00:00+00	266	355	5.3010	5.3227	5.2896	5.2948
12701	2018-02-14 00:00:00+00	266	355	5.3003	5.3073	5.2575	5.2914
12702	2018-02-13 00:00:00+00	266	355	5.2869	5.2966	5.2529	5.2546
12703	2018-02-12 00:00:00+00	266	355	5.2540	5.2910	5.2456	5.2775
12704	2018-02-11 00:00:00+00	266	355	5.2768	5.2848	5.2601	5.2642
12705	2018-02-09 00:00:00+00	266	355	5.2853	5.3386	5.2642	5.3277
12706	2018-02-08 00:00:00+00	266	355	5.3252	5.3677	5.2681	5.2783
12707	2018-02-07 00:00:00+00	266	355	5.2824	5.2856	5.2446	5.2585
12708	2018-02-06 00:00:00+00	266	355	5.2544	5.2990	5.2329	5.2880
12709	2018-02-05 00:00:00+00	266	355	5.2890	5.3302	5.2672	5.3179
12710	2018-02-04 00:00:00+00	266	355	5.3169	5.3242	5.2881	5.3117
12711	2018-02-02 00:00:00+00	266	355	5.3243	5.3489	5.3089	5.3239
12712	2018-02-01 00:00:00+00	266	355	5.3223	5.3670	5.3126	5.3325
12713	2018-01-31 00:00:00+00	266	355	5.3367	5.3574	5.3023	5.3387
12714	2018-01-30 00:00:00+00	266	355	5.3364	5.3578	5.3038	5.3304
12715	2018-01-29 00:00:00+00	266	355	5.3307	5.3493	5.3010	5.3075
12716	2018-01-28 00:00:00+00	266	355	5.3032	5.3080	5.2669	5.3009
12717	2018-01-26 00:00:00+00	266	355	5.3139	5.3505	5.2971	5.3060
12718	2018-01-25 00:00:00+00	266	355	5.3026	5.3614	5.2937	5.3269
12719	2018-01-24 00:00:00+00	266	355	5.3304	5.3335	5.2693	5.2748
12720	2018-01-23 00:00:00+00	266	355	5.2752	5.3047	5.2651	5.2799
12721	2018-01-22 00:00:00+00	266	355	5.2809	5.3249	5.2609	5.3152
12722	2018-01-21 00:00:00+00	266	355	5.3140	5.3451	5.2545	5.2545
12723	2018-01-19 00:00:00+00	266	355	5.2735	5.2884	5.2299	5.2381
12724	2018-01-18 00:00:00+00	266	355	5.2319	5.2874	5.2164	5.2761
12725	2018-01-17 00:00:00+00	266	355	5.2787	5.2974	5.2303	5.2362
12726	2018-01-16 00:00:00+00	266	355	5.2303	5.2848	5.2089	5.2423
12727	2018-01-15 00:00:00+00	266	355	5.2423	5.2526	5.1501	5.1598
12728	2018-01-14 00:00:00+00	266	355	5.1560	5.1644	5.1322	5.1371
12729	2018-01-12 00:00:00+00	266	355	5.1431	5.1611	5.1030	5.1109
12730	2018-01-11 00:00:00+00	266	355	5.1086	5.1411	5.0982	5.1328
12731	2018-01-10 00:00:00+00	266	355	5.1352	5.1530	5.0961	5.1083
12732	2018-01-09 00:00:00+00	266	355	5.1056	5.1119	5.0751	5.0810
12733	2018-01-08 00:00:00+00	266	355	5.0800	5.0946	5.0643	5.0687
12734	2018-01-07 00:00:00+00	266	355	5.0658	5.0743	5.0443	5.0495
12735	2018-01-05 00:00:00+00	266	355	5.0674	5.1001	5.0495	5.0785
12736	2018-01-04 00:00:00+00	266	355	5.0798	5.1228	5.0678	5.1098
12737	2018-01-03 00:00:00+00	266	355	5.1128	5.1421	5.0805	5.1188
12738	2018-01-02 00:00:00+00	266	355	5.1164	5.1268	5.0895	5.1244
12739	2018-01-01 00:00:00+00	266	355	5.1082	5.1319	5.0742	5.1125
12741	2019-11-07 00:00:00+00	266	361	1.2813	1.2878	1.2793	1.2853
12742	2019-11-06 00:00:00+00	266	361	1.2853	1.2897	1.2842	1.2875
12743	2019-11-05 00:00:00+00	266	361	1.2875	1.2917	1.2857	1.2881
12744	2019-11-04 00:00:00+00	266	361	1.2881	1.2943	1.2874	1.2934
12745	2019-11-03 00:00:00+00	266	361	1.2934	1.2940	1.2924	1.2939
12746	2019-11-01 00:00:00+00	266	361	1.2935	1.2973	1.2925	1.2932
12747	2019-10-31 00:00:00+00	266	361	1.2932	1.2976	1.2898	1.2902
12748	2019-10-30 00:00:00+00	266	361	1.2902	1.2907	1.2843	1.2864
12749	2019-10-29 00:00:00+00	266	361	1.2863	1.2905	1.2806	1.2856
12750	2019-10-28 00:00:00+00	266	361	1.2855	1.2876	1.2809	1.2831
12751	2019-10-27 00:00:00+00	266	361	1.2831	1.2834	1.2810	1.2821
12752	2019-10-25 00:00:00+00	266	361	1.2823	1.2863	1.2802	1.2838
12753	2019-10-24 00:00:00+00	266	361	1.2838	1.2950	1.2787	1.2914
12754	2019-10-23 00:00:00+00	266	361	1.2915	1.2922	1.2839	1.2895
12755	2019-10-22 00:00:00+00	266	361	1.2895	1.3000	1.2860	1.2964
12756	2019-10-21 00:00:00+00	266	361	1.2964	1.3013	1.2886	1.2906
12757	2019-10-20 00:00:00+00	266	361	1.2906	1.2957	1.2871	1.2909
12758	2019-10-18 00:00:00+00	266	361	1.2972	1.2986	1.2838	1.2873
12759	2019-10-17 00:00:00+00	266	361	1.2873	1.2990	1.2748	1.2818
12760	2019-10-16 00:00:00+00	266	361	1.2818	1.2878	1.2656	1.2764
12761	2019-10-15 00:00:00+00	266	361	1.2764	1.2801	1.2601	1.2607
12762	2019-10-14 00:00:00+00	266	361	1.2607	1.2650	1.2514	1.2639
12763	2019-10-13 00:00:00+00	266	361	1.2639	1.2652	1.2603	1.2623
12764	2019-10-11 00:00:00+00	266	361	1.2642	1.2707	1.2407	1.2429
12765	2019-10-10 00:00:00+00	266	361	1.2429	1.2469	1.2206	1.2214
12766	2019-10-09 00:00:00+00	266	361	1.2213	1.2291	1.2197	1.2224
12767	2019-10-08 00:00:00+00	266	361	1.2224	1.2303	1.2193	1.2288
12768	2019-10-07 00:00:00+00	266	361	1.2287	1.2337	1.2282	1.2332
12769	2019-10-06 00:00:00+00	266	361	1.2333	1.2336	1.2286	1.2311
12770	2019-10-04 00:00:00+00	266	361	1.2332	1.2357	1.2274	1.2337
12771	2019-10-03 00:00:00+00	266	361	1.2336	1.2413	1.2264	1.2298
12772	2019-10-02 00:00:00+00	266	361	1.2298	1.2324	1.2225	1.2286
12773	2019-10-01 00:00:00+00	266	361	1.2286	1.2340	1.2204	1.2288
12774	2019-09-30 00:00:00+00	266	361	1.2288	1.2346	1.2274	1.2291
12775	2019-09-29 00:00:00+00	266	361	1.2291	1.2307	1.2283	1.2288
12776	2019-09-27 00:00:00+00	266	361	1.2288	1.2336	1.2270	1.2326
12777	2019-09-26 00:00:00+00	266	361	1.2325	1.2380	1.2301	1.2358
12778	2019-09-25 00:00:00+00	266	361	1.2357	1.2493	1.2344	1.2492
12779	2019-09-24 00:00:00+00	266	361	1.2492	1.2503	1.2412	1.2436
12780	2019-09-23 00:00:00+00	266	361	1.2436	1.2491	1.2411	1.2472
12781	2019-09-22 00:00:00+00	266	361	1.2472	1.2478	1.2461	1.2471
12782	2019-09-20 00:00:00+00	266	361	1.2478	1.2582	1.2459	1.2524
12783	2019-09-19 00:00:00+00	266	361	1.2524	1.2560	1.2437	1.2476
12784	2019-09-18 00:00:00+00	266	361	1.2475	1.2512	1.2438	1.2502
12785	2019-09-17 00:00:00+00	266	361	1.2502	1.2527	1.2391	1.2428
12786	2019-09-16 00:00:00+00	266	361	1.2427	1.2503	1.2398	1.2495
12787	2019-09-15 00:00:00+00	266	361	1.2494	1.2504	1.2474	1.2500
12788	2019-09-13 00:00:00+00	266	361	1.2505	1.2506	1.2326	1.2333
12789	2019-09-12 00:00:00+00	266	361	1.2333	1.2367	1.2282	1.2329
12790	2019-09-11 00:00:00+00	266	361	1.2329	1.2371	1.2310	1.2355
12791	2019-09-10 00:00:00+00	266	361	1.2355	1.2380	1.2305	1.2345
12792	2019-09-09 00:00:00+00	266	361	1.2345	1.2385	1.2231	1.2285
12793	2019-09-08 00:00:00+00	266	361	1.2285	1.2289	1.2260	1.2289
12794	2019-09-06 00:00:00+00	266	361	1.2278	1.2343	1.2277	1.2327
12795	2019-09-05 00:00:00+00	266	361	1.2327	1.2354	1.2208	1.2246
12796	2019-09-04 00:00:00+00	266	361	1.2246	1.2259	1.2084	1.2090
12797	2019-09-03 00:00:00+00	266	361	1.2089	1.2106	1.1957	1.2065
12798	2019-09-02 00:00:00+00	266	361	1.2065	1.2175	1.2035	1.2159
12799	2019-09-01 00:00:00+00	266	361	1.2159	1.2164	1.2138	1.2158
12800	2019-08-30 00:00:00+00	266	361	1.2159	1.2226	1.2137	1.2183
12801	2019-08-29 00:00:00+00	266	361	1.2183	1.2233	1.2170	1.2218
12802	2019-08-28 00:00:00+00	266	361	1.2218	1.2288	1.2155	1.2285
12803	2019-08-27 00:00:00+00	266	361	1.2285	1.2310	1.2207	1.2222
12804	2019-08-26 00:00:00+00	266	361	1.2222	1.2285	1.2206	1.2269
12805	2019-08-25 00:00:00+00	266	361	1.2269	1.2286	1.2253	1.2273
12806	2019-08-23 00:00:00+00	266	361	1.2288	1.2294	1.2193	1.2250
12807	2019-08-22 00:00:00+00	266	361	1.2250	1.2273	1.2106	1.2129
12808	2019-08-21 00:00:00+00	266	361	1.2128	1.2175	1.2111	1.2165
12809	2019-08-20 00:00:00+00	266	361	1.2165	1.2180	1.2063	1.2124
12810	2019-08-19 00:00:00+00	266	361	1.2124	1.2172	1.2103	1.2155
12811	2019-08-18 00:00:00+00	266	361	1.2155	1.2164	1.2141	1.2150
12812	2019-08-16 00:00:00+00	266	361	1.2144	1.2175	1.2080	1.2091
12813	2019-08-15 00:00:00+00	266	361	1.2091	1.2150	1.2049	1.2060
12814	2019-08-14 00:00:00+00	266	361	1.2060	1.2101	1.2043	1.2059
12815	2019-08-13 00:00:00+00	266	361	1.2058	1.2098	1.2041	1.2078
12816	2019-08-12 00:00:00+00	266	361	1.2077	1.2107	1.2013	1.2030
12817	2019-08-11 00:00:00+00	266	361	1.2030	1.2073	1.2022	1.2050
12818	2019-08-09 00:00:00+00	266	361	1.2034	1.2148	1.2021	1.2141
12819	2019-08-08 00:00:00+00	266	361	1.2142	1.2183	1.2094	1.2142
12820	2019-08-07 00:00:00+00	266	361	1.2142	1.2191	1.2119	1.2165
12821	2019-08-06 00:00:00+00	266	361	1.2165	1.2209	1.2136	1.2157
12822	2019-08-05 00:00:00+00	266	361	1.2156	1.2188	1.2100	1.2148
12823	2019-08-04 00:00:00+00	266	361	1.2148	1.2162	1.2132	1.2144
12824	2019-08-02 00:00:00+00	266	361	1.2161	1.2169	1.2088	1.2121
12825	2019-08-01 00:00:00+00	266	361	1.2121	1.2171	1.2078	1.2159
12826	2019-07-31 00:00:00+00	266	361	1.2159	1.2249	1.2133	1.2161
12827	2019-07-30 00:00:00+00	266	361	1.2161	1.2225	1.2117	1.2225
12828	2019-07-29 00:00:00+00	266	361	1.2225	1.2381	1.2211	1.2380
12829	2019-07-28 00:00:00+00	266	361	1.2380	1.2387	1.2372	1.2385
12830	2019-07-26 00:00:00+00	266	361	1.2380	1.2460	1.2374	1.2454
12831	2019-07-25 00:00:00+00	266	361	1.2454	1.2518	1.2435	1.2484
12832	2019-07-24 00:00:00+00	266	361	1.2484	1.2522	1.2426	1.2438
12833	2019-07-23 00:00:00+00	266	361	1.2437	1.2482	1.2416	1.2476
12834	2019-07-22 00:00:00+00	266	361	1.2476	1.2514	1.2454	1.2505
12835	2019-07-21 00:00:00+00	266	361	1.2506	1.2519	1.2488	1.2504
12836	2019-07-19 00:00:00+00	266	361	1.2499	1.2555	1.2475	1.2530
12837	2019-07-18 00:00:00+00	266	361	1.2530	1.2558	1.2426	1.2433
12838	2019-07-17 00:00:00+00	266	361	1.2432	1.2456	1.2380	1.2409
12839	2019-07-16 00:00:00+00	266	361	1.2409	1.2520	1.2395	1.2519
12840	2019-07-15 00:00:00+00	266	361	1.2518	1.2576	1.2508	1.2573
12841	2019-07-14 00:00:00+00	266	361	1.2573	1.2578	1.2555	1.2563
12842	2019-07-12 00:00:00+00	266	361	1.2573	1.2579	1.2518	1.2528
12843	2019-07-11 00:00:00+00	266	361	1.2528	1.2571	1.2504	1.2510
12844	2019-07-10 00:00:00+00	266	361	1.2510	1.2521	1.2442	1.2461
12845	2019-07-09 00:00:00+00	266	361	1.2460	1.2518	1.2438	1.2518
12846	2019-07-08 00:00:00+00	266	361	1.2518	1.2540	1.2498	1.2527
12847	2019-07-07 00:00:00+00	266	361	1.2527	1.2530	1.2507	1.2516
12848	2019-07-05 00:00:00+00	266	361	1.2523	1.2588	1.2480	1.2580
12849	2019-07-04 00:00:00+00	266	361	1.2580	1.2591	1.2567	1.2580
12850	2019-07-03 00:00:00+00	266	361	1.2579	1.2600	1.2555	1.2597
12851	2019-07-02 00:00:00+00	266	361	1.2597	1.2647	1.2583	1.2646
12852	2019-07-01 00:00:00+00	266	361	1.2646	1.2706	1.2630	1.2699
12853	2019-06-30 00:00:00+00	266	361	1.2699	1.2705	1.2688	1.2695
12854	2019-06-28 00:00:00+00	266	361	1.2696	1.2735	1.2663	1.2670
12855	2019-06-27 00:00:00+00	266	361	1.2669	1.2725	1.2659	1.2692
12856	2019-06-26 00:00:00+00	266	361	1.2692	1.2708	1.2661	1.2688
12857	2019-06-25 00:00:00+00	266	361	1.2688	1.2784	1.2670	1.2734
12858	2019-06-24 00:00:00+00	266	361	1.2734	1.2767	1.2706	1.2745
12859	2019-06-23 00:00:00+00	266	361	1.2744	1.2746	1.2721	1.2721
12860	2019-06-21 00:00:00+00	266	361	1.2738	1.2747	1.2641	1.2705
12861	2019-06-20 00:00:00+00	266	361	1.2704	1.2727	1.2649	1.2652
12862	2019-06-19 00:00:00+00	266	361	1.2651	1.2674	1.2540	1.2556
12863	2019-06-18 00:00:00+00	266	361	1.2556	1.2565	1.2505	1.2538
12864	2019-06-17 00:00:00+00	266	361	1.2538	1.2606	1.2524	1.2592
12865	2019-06-16 00:00:00+00	266	361	1.2591	1.2600	1.2575	1.2595
12866	2019-06-14 00:00:00+00	266	361	1.2590	1.2682	1.2578	1.2679
12867	2019-06-13 00:00:00+00	266	361	1.2678	1.2708	1.2661	1.2692
12868	2019-06-12 00:00:00+00	266	361	1.2691	1.2759	1.2680	1.2723
12869	2019-06-11 00:00:00+00	266	361	1.2722	1.2732	1.2668	1.2688
12870	2019-06-10 00:00:00+00	266	361	1.2687	1.2728	1.2652	1.2721
12871	2019-06-09 00:00:00+00	266	361	1.2721	1.2746	1.2719	1.2723
12872	2019-06-08 00:00:00+00	266	361	1.2734	1.2734	1.2734	1.2734
12873	2019-06-07 00:00:00+00	266	361	1.2736	1.2763	1.2687	1.2697
12874	2019-06-06 00:00:00+00	266	361	1.2697	1.2742	1.2667	1.2690
12875	2019-06-05 00:00:00+00	266	361	1.2690	1.2744	1.2678	1.2699
12876	2019-06-04 00:00:00+00	266	361	1.2699	1.2715	1.2640	1.2666
12877	2019-06-03 00:00:00+00	266	361	1.2666	1.2674	1.2608	1.2634
12878	2019-06-02 00:00:00+00	266	361	1.2635	1.2638	1.2615	1.2632
12879	2019-05-31 00:00:00+00	266	361	1.2626	1.2645	1.2558	1.2610
12880	2019-05-30 00:00:00+00	266	361	1.2611	1.2640	1.2579	1.2628
12881	2019-05-29 00:00:00+00	266	361	1.2628	1.2672	1.2610	1.2657
12882	2019-05-28 00:00:00+00	266	361	1.2657	1.2702	1.2648	1.2682
12883	2019-05-27 00:00:00+00	266	361	1.2682	1.2748	1.2665	1.2727
12884	2019-05-26 00:00:00+00	266	361	1.2727	1.2751	1.2714	1.2718
12885	2019-05-24 00:00:00+00	266	361	1.2711	1.2733	1.2646	1.2663
12886	2019-05-23 00:00:00+00	266	361	1.2662	1.2684	1.2603	1.2664
12887	2019-05-22 00:00:00+00	266	361	1.2664	1.2719	1.2623	1.2702
12888	2019-05-21 00:00:00+00	266	361	1.2702	1.2814	1.2683	1.2728
12889	2019-05-20 00:00:00+00	266	361	1.2728	1.2757	1.2713	1.2727
12890	2019-05-19 00:00:00+00	266	361	1.2727	1.2742	1.2719	1.2719
12891	2019-05-17 00:00:00+00	266	361	1.2718	1.2798	1.2711	1.2796
12892	2019-05-16 00:00:00+00	266	361	1.2796	1.2852	1.2786	1.2846
12893	2019-05-15 00:00:00+00	266	361	1.2846	1.2923	1.2825	1.2911
12894	2019-05-14 00:00:00+00	266	361	1.2910	1.2970	1.2897	1.2951
12895	2019-05-13 00:00:00+00	266	361	1.2950	1.3041	1.2940	1.3006
12896	2019-05-12 00:00:00+00	266	361	1.3006	1.3009	1.2990	1.2997
12897	2019-05-10 00:00:00+00	266	361	1.2999	1.3047	1.2989	1.3011
12898	2019-05-09 00:00:00+00	266	361	1.3011	1.3036	1.2966	1.3012
12899	2019-05-08 00:00:00+00	266	361	1.3011	1.3080	1.2985	1.3071
12900	2019-05-07 00:00:00+00	266	361	1.3071	1.3131	1.3037	1.3093
12901	2019-05-06 00:00:00+00	266	361	1.3092	1.3170	1.3080	1.3166
12902	2019-05-05 00:00:00+00	266	361	1.3164	1.3171	1.3104	1.3104
12903	2019-05-03 00:00:00+00	266	361	1.3173	1.3177	1.2986	1.3032
12904	2019-05-02 00:00:00+00	266	361	1.3031	1.3082	1.3016	1.3055
12905	2019-05-01 00:00:00+00	266	361	1.3055	1.3102	1.3028	1.3032
12906	2019-04-30 00:00:00+00	266	361	1.3032	1.3049	1.2924	1.2931
12907	2019-04-29 00:00:00+00	266	361	1.2930	1.2947	1.2903	1.2920
12908	2019-04-28 00:00:00+00	266	361	1.2920	1.2928	1.2913	1.2924
12909	2019-04-26 00:00:00+00	266	361	1.2917	1.2944	1.2873	1.2899
12910	2019-04-25 00:00:00+00	266	361	1.2899	1.2917	1.2864	1.2906
12911	2019-04-24 00:00:00+00	266	361	1.2906	1.2963	1.2887	1.2935
12912	2019-04-23 00:00:00+00	266	361	1.2935	1.3019	1.2926	1.2982
12913	2019-04-22 00:00:00+00	266	361	1.2981	1.2998	1.2974	1.2993
12914	2019-04-21 00:00:00+00	266	361	1.2993	1.3000	1.2983	1.2994
12915	2019-04-19 00:00:00+00	266	361	1.2994	1.3009	1.2980	1.2988
12916	2019-04-18 00:00:00+00	266	361	1.2988	1.3053	1.2977	1.3039
12917	2019-04-17 00:00:00+00	266	361	1.3038	1.3067	1.3027	1.3041
12918	2019-04-16 00:00:00+00	266	361	1.3041	1.3101	1.3037	1.3097
12919	2019-04-15 00:00:00+00	266	361	1.3097	1.3119	1.3076	1.3079
12920	2019-04-14 00:00:00+00	266	361	1.3079	1.3088	1.3067	1.3078
12921	2019-04-12 00:00:00+00	266	361	1.3071	1.3133	1.3049	1.3056
12922	2019-04-11 00:00:00+00	266	361	1.3056	1.3109	1.3049	1.3088
12923	2019-04-10 00:00:00+00	266	361	1.3088	1.3120	1.3046	1.3055
12924	2019-04-09 00:00:00+00	266	361	1.3055	1.3121	1.3028	1.3060
12925	2019-04-08 00:00:00+00	266	361	1.3060	1.3074	1.3031	1.3035
12926	2019-04-07 00:00:00+00	266	361	1.3035	1.3041	1.3022	1.3028
12927	2019-04-05 00:00:00+00	266	361	1.3036	1.3122	1.2985	1.3071
12928	2019-04-04 00:00:00+00	266	361	1.3071	1.3191	1.3059	1.3176
12929	2019-04-03 00:00:00+00	266	361	1.3175	1.3196	1.3120	1.3128
12930	2019-04-02 00:00:00+00	266	361	1.3128	1.3150	1.3012	1.3078
12931	2019-04-01 00:00:00+00	266	361	1.3079	1.3150	1.3008	1.3019
12932	2019-03-31 00:00:00+00	266	361	1.3019	1.3047	1.3016	1.3036
12933	2019-03-29 00:00:00+00	266	361	1.3043	1.3137	1.2976	1.3055
12934	2019-03-28 00:00:00+00	266	361	1.3055	1.3198	1.3034	1.3154
12935	2019-03-27 00:00:00+00	266	361	1.3153	1.3269	1.3150	1.3207
12936	2019-03-26 00:00:00+00	266	361	1.3207	1.3261	1.3157	1.3209
12937	2019-03-25 00:00:00+00	266	361	1.3209	1.3247	1.3158	1.3210
12938	2019-03-24 00:00:00+00	266	361	1.3210	1.3225	1.3194	1.3218
12939	2019-03-22 00:00:00+00	266	361	1.3214	1.3224	1.3079	1.3123
12940	2019-03-21 00:00:00+00	266	361	1.3122	1.3227	1.3003	1.3195
12941	2019-03-20 00:00:00+00	266	361	1.3194	1.3272	1.3145	1.3266
12942	2019-03-19 00:00:00+00	266	361	1.3267	1.3311	1.3239	1.3243
12943	2019-03-18 00:00:00+00	266	361	1.3243	1.3300	1.3183	1.3291
12944	2019-03-17 00:00:00+00	266	361	1.3291	1.3298	1.3287	1.3287
12945	2019-03-15 00:00:00+00	266	361	1.3296	1.3300	1.3201	1.3247
12946	2019-03-14 00:00:00+00	266	361	1.3247	1.3331	1.3207	1.3308
12947	2019-03-13 00:00:00+00	266	361	1.3308	1.3381	1.3060	1.3078
12948	2019-03-12 00:00:00+00	266	361	1.3078	1.3263	1.3004	1.3232
12949	2019-03-11 00:00:00+00	266	361	1.3232	1.3289	1.2959	1.2984
12950	2019-03-10 00:00:00+00	266	361	1.2983	1.3017	1.2947	1.3017
12951	2019-03-08 00:00:00+00	266	361	1.3015	1.3108	1.2988	1.3079
12952	2019-03-07 00:00:00+00	266	361	1.3078	1.3185	1.3067	1.3172
12953	2019-03-06 00:00:00+00	266	361	1.3171	1.3181	1.3123	1.3147
12954	2019-03-05 00:00:00+00	266	361	1.3147	1.3199	1.3097	1.3175
12955	2019-03-04 00:00:00+00	266	361	1.3175	1.3254	1.3165	1.3232
12956	2019-03-03 00:00:00+00	266	361	1.3232	1.3272	1.3229	1.3234
12957	2019-03-01 00:00:00+00	266	361	1.3203	1.3286	1.3170	1.3263
12958	2019-02-28 00:00:00+00	266	361	1.3262	1.3319	1.3252	1.3308
12959	2019-02-27 00:00:00+00	266	361	1.3308	1.3350	1.3231	1.3254
12960	2019-02-26 00:00:00+00	266	361	1.3255	1.3288	1.3115	1.3120
12961	2019-02-25 00:00:00+00	266	361	1.3120	1.3149	1.3049	1.3055
12962	2019-02-24 00:00:00+00	266	361	1.3055	1.3076	1.3048	1.3062
12963	2019-02-22 00:00:00+00	266	361	1.3049	1.3080	1.2967	1.3031
12964	2019-02-21 00:00:00+00	266	361	1.3030	1.3095	1.3024	1.3048
12965	2019-02-20 00:00:00+00	266	361	1.3048	1.3109	1.3011	1.3059
12966	2019-02-19 00:00:00+00	266	361	1.3059	1.3073	1.2893	1.2918
12967	2019-02-18 00:00:00+00	266	361	1.2918	1.2939	1.2890	1.2901
12968	2019-02-17 00:00:00+00	266	361	1.2901	1.2933	1.2899	1.2900
12969	2019-02-15 00:00:00+00	266	361	1.2893	1.2898	1.2783	1.2799
12970	2019-02-14 00:00:00+00	266	361	1.2799	1.2878	1.2771	1.2847
12971	2019-02-13 00:00:00+00	266	361	1.2847	1.2959	1.2841	1.2892
12972	2019-02-12 00:00:00+00	266	361	1.2892	1.2909	1.2831	1.2859
12973	2019-02-11 00:00:00+00	266	361	1.2858	1.2939	1.2844	1.2931
12974	2019-02-10 00:00:00+00	266	361	1.2932	1.2948	1.2924	1.2948
12975	2019-02-08 00:00:00+00	266	361	1.2937	1.2976	1.2920	1.2950
12976	2019-02-07 00:00:00+00	266	361	1.2951	1.2996	1.2853	1.2932
12977	2019-02-06 00:00:00+00	266	361	1.2932	1.2979	1.2924	1.2954
12978	2019-02-05 00:00:00+00	266	361	1.2955	1.3052	1.2924	1.3036
12979	2019-02-04 00:00:00+00	266	361	1.3036	1.3103	1.3028	1.3073
12980	2019-02-03 00:00:00+00	266	361	1.3078	1.3084	1.3056	1.3084
12981	2019-02-01 00:00:00+00	266	361	1.3079	1.3115	1.3042	1.3107
12982	2019-01-31 00:00:00+00	266	361	1.3107	1.3161	1.3096	1.3114
12983	2019-01-30 00:00:00+00	266	361	1.3113	1.3146	1.3053	1.3078
12984	2019-01-29 00:00:00+00	266	361	1.3078	1.3200	1.3055	1.3148
12985	2019-01-28 00:00:00+00	266	361	1.3148	1.3210	1.3136	1.3209
12986	2019-01-27 00:00:00+00	266	361	1.3209	1.3212	1.3172	1.3189
12987	2019-01-25 00:00:00+00	266	361	1.3199	1.3218	1.3061	1.3066
12988	2019-01-24 00:00:00+00	266	361	1.3067	1.3094	1.3010	1.3077
12989	2019-01-23 00:00:00+00	266	361	1.3077	1.3081	1.2941	1.2958
12990	2019-01-22 00:00:00+00	266	361	1.2957	1.2975	1.2854	1.2895
12991	2019-01-21 00:00:00+00	266	361	1.2896	1.2911	1.2829	1.2865
12992	2019-01-20 00:00:00+00	266	361	1.2866	1.2895	1.2857	1.2863
12993	2019-01-18 00:00:00+00	266	361	1.2872	1.2993	1.2855	1.2984
12994	2019-01-17 00:00:00+00	266	361	1.2983	1.3001	1.2831	1.2878
12995	2019-01-16 00:00:00+00	266	361	1.2878	1.2897	1.2823	1.2864
12996	2019-01-15 00:00:00+00	266	361	1.2863	1.2916	1.2668	1.2864
12997	2019-01-14 00:00:00+00	266	361	1.2864	1.2931	1.2817	1.2861
12998	2019-01-13 00:00:00+00	266	361	1.2859	1.2863	1.2837	1.2847
12999	2019-01-11 00:00:00+00	266	361	1.2839	1.2866	1.2708	1.2745
13000	2019-01-10 00:00:00+00	266	361	1.2749	1.2801	1.2726	1.2797
13001	2019-01-09 00:00:00+00	266	361	1.2797	1.2804	1.2710	1.2711
13002	2019-01-08 00:00:00+00	266	361	1.2713	1.2797	1.2705	1.2783
13003	2019-01-07 00:00:00+00	266	361	1.2784	1.2789	1.2719	1.2720
13004	2019-01-06 00:00:00+00	266	361	1.2723	1.2729	1.2711	1.2727
13005	2019-01-05 00:00:00+00	266	361	1.2727	1.2727	1.2727	1.2727
13006	2019-01-04 00:00:00+00	266	361	1.2720	1.2745	1.2615	1.2633
13007	2019-01-03 00:00:00+00	266	361	1.2633	1.2648	1.2467	1.2472
13008	2019-01-02 00:00:00+00	266	361	1.2472	1.2773	1.2437	1.2739
13009	2019-01-01 00:00:00+00	266	361	1.2739	1.2756	1.2721	1.2739
13010	2018-12-31 00:00:00+00	266	361	1.2750	1.2815	1.2678	1.2695
13011	2018-12-30 00:00:00+00	266	361	1.2694	1.2707	1.2685	1.2686
13012	2018-12-28 00:00:00+00	266	361	1.2698	1.2708	1.2633	1.2641
13013	2018-12-27 00:00:00+00	266	361	1.2642	1.2675	1.2614	1.2639
13014	2018-12-26 00:00:00+00	266	361	1.2639	1.2719	1.2627	1.2671
13015	2018-12-25 00:00:00+00	266	361	1.2672	1.2710	1.2660	1.2694
13016	2018-12-24 00:00:00+00	266	361	1.2701	1.2738	1.2634	1.2642
13017	2018-12-23 00:00:00+00	266	361	1.2642	1.2657	1.2628	1.2631
13018	2018-12-21 00:00:00+00	266	361	1.2630	1.2698	1.2616	1.2656
13019	2018-12-20 00:00:00+00	266	361	1.2655	1.2707	1.2611	1.2616
13020	2018-12-19 00:00:00+00	266	361	1.2615	1.2679	1.2605	1.2645
13021	2018-12-18 00:00:00+00	266	361	1.2645	1.2706	1.2608	1.2614
13022	2018-12-17 00:00:00+00	266	361	1.2613	1.2647	1.2573	1.2580
13023	2018-12-16 00:00:00+00	266	361	1.2580	1.2605	1.2572	1.2588
13024	2018-12-14 00:00:00+00	266	361	1.2585	1.2662	1.2528	1.2653
13025	2018-12-13 00:00:00+00	266	361	1.2653	1.2687	1.2608	1.2634
13026	2018-12-12 00:00:00+00	266	361	1.2629	1.2672	1.2476	1.2487
13027	2018-12-11 00:00:00+00	266	361	1.2487	1.2639	1.2478	1.2560
13028	2018-12-10 00:00:00+00	266	361	1.2560	1.2760	1.2506	1.2713
13029	2018-12-09 00:00:00+00	266	361	1.2713	1.2742	1.2699	1.2731
13030	2018-12-07 00:00:00+00	266	361	1.2729	1.2790	1.2709	1.2779
13031	2018-12-06 00:00:00+00	266	361	1.2779	1.2812	1.2697	1.2732
13032	2018-12-05 00:00:00+00	266	361	1.2733	1.2798	1.2671	1.2713
13033	2018-12-04 00:00:00+00	266	361	1.2715	1.2840	1.2658	1.2724
13034	2018-12-03 00:00:00+00	266	361	1.2724	1.2825	1.2698	1.2736
13035	2018-12-02 00:00:00+00	266	361	1.2735	1.2788	1.2729	1.2767
13036	2018-11-30 00:00:00+00	266	361	1.2751	1.2810	1.2734	1.2779
13037	2018-11-29 00:00:00+00	266	361	1.2777	1.2850	1.2754	1.2824
13038	2018-11-28 00:00:00+00	266	361	1.2823	1.2847	1.2731	1.2737
13039	2018-11-27 00:00:00+00	266	361	1.2737	1.2820	1.2724	1.2811
13040	2018-11-26 00:00:00+00	266	361	1.2811	1.2864	1.2794	1.2816
13041	2018-11-25 00:00:00+00	266	361	1.2816	1.2841	1.2813	1.2840
13042	2018-11-23 00:00:00+00	266	361	1.2819	1.2883	1.2797	1.2876
13043	2018-11-22 00:00:00+00	266	361	1.2875	1.2928	1.2768	1.2770
13044	2018-11-21 00:00:00+00	266	361	1.2769	1.2820	1.2762	1.2786
13045	2018-11-20 00:00:00+00	266	361	1.2786	1.2883	1.2775	1.2860
13046	2018-11-19 00:00:00+00	266	361	1.2860	1.2884	1.2794	1.2832
13047	2018-11-18 00:00:00+00	266	361	1.2831	1.2848	1.2821	1.2829
13048	2018-11-16 00:00:00+00	266	361	1.2828	1.2877	1.2760	1.2762
13049	2018-11-15 00:00:00+00	266	361	1.2762	1.3030	1.2723	1.2988
13050	2018-11-14 00:00:00+00	266	361	1.2987	1.3072	1.2879	1.3034
13051	2018-11-13 00:00:00+00	266	361	1.3033	1.3047	1.2847	1.2851
13052	2018-11-12 00:00:00+00	266	361	1.2851	1.2947	1.2826	1.2925
13053	2018-11-11 00:00:00+00	266	361	1.2926	1.2959	1.2908	1.2959
13054	2018-11-09 00:00:00+00	266	361	1.2969	1.3069	1.2957	1.3065
13055	2018-11-08 00:00:00+00	266	361	1.3065	1.3150	1.3043	1.3126
13056	2018-11-07 00:00:00+00	266	361	1.3126	1.3175	1.3072	1.3091
13057	2018-11-06 00:00:00+00	266	361	1.3091	1.3107	1.3019	1.3059
13058	2018-11-05 00:00:00+00	266	361	1.3059	1.3068	1.2963	1.3007
13059	2018-11-04 00:00:00+00	266	361	1.3007	1.3061	1.2995	1.3029
13060	2018-11-02 00:00:00+00	266	361	1.2971	1.3041	1.2949	1.2997
13061	2018-11-01 00:00:00+00	266	361	1.2997	1.3035	1.2763	1.2771
13062	2018-10-31 00:00:00+00	266	361	1.2771	1.2831	1.2699	1.2706
13063	2018-10-30 00:00:00+00	266	361	1.2706	1.2813	1.2694	1.2798
13064	2018-10-29 00:00:00+00	266	361	1.2798	1.2853	1.2790	1.2833
13065	2018-10-28 00:00:00+00	266	361	1.2833	1.2834	1.2814	1.2827
13066	2018-10-26 00:00:00+00	266	361	1.2829	1.2841	1.2775	1.2821
13067	2018-10-25 00:00:00+00	266	361	1.2821	1.2920	1.2796	1.2886
13068	2018-10-24 00:00:00+00	266	361	1.2886	1.2991	1.2865	1.2983
13069	2018-10-23 00:00:00+00	266	361	1.2982	1.3044	1.2936	1.2967
13070	2018-10-22 00:00:00+00	266	361	1.2967	1.3090	1.2954	1.3065
13071	2018-10-21 00:00:00+00	266	361	1.3065	1.3076	1.3044	1.3064
13072	2018-10-19 00:00:00+00	266	361	1.3066	1.3104	1.3010	1.3021
13073	2018-10-18 00:00:00+00	266	361	1.3021	1.3131	1.3013	1.3102
13074	2018-10-17 00:00:00+00	266	361	1.3101	1.3193	1.3088	1.3185
13075	2018-10-16 00:00:00+00	266	361	1.3184	1.3236	1.3139	1.3154
13076	2018-10-15 00:00:00+00	266	361	1.3154	1.3182	1.3097	1.3098
13077	2018-10-14 00:00:00+00	266	361	1.3097	1.3161	1.3081	1.3151
13078	2018-10-12 00:00:00+00	266	361	1.3151	1.3258	1.3146	1.3234
13079	2018-10-11 00:00:00+00	266	361	1.3234	1.3247	1.3180	1.3205
13080	2018-10-10 00:00:00+00	266	361	1.3204	1.3216	1.3135	1.3144
13081	2018-10-09 00:00:00+00	266	361	1.3144	1.3150	1.3031	1.3090
13082	2018-10-08 00:00:00+00	266	361	1.3090	1.3133	1.3027	1.3126
13083	2018-10-07 00:00:00+00	266	361	1.3126	1.3134	1.3104	1.3104
13084	2018-10-05 00:00:00+00	266	361	1.3117	1.3123	1.3002	1.3023
13085	2018-10-04 00:00:00+00	266	361	1.3023	1.3041	1.2921	1.2946
13086	2018-10-03 00:00:00+00	266	361	1.2945	1.3023	1.2923	1.2981
13087	2018-10-02 00:00:00+00	266	361	1.2981	1.3049	1.2939	1.3042
13088	2018-10-01 00:00:00+00	266	361	1.3041	1.3115	1.3011	1.3031
13089	2018-09-30 00:00:00+00	266	361	1.3031	1.3059	1.3024	1.3031
13090	2018-09-28 00:00:00+00	266	361	1.3026	1.3090	1.2999	1.3075
13091	2018-09-27 00:00:00+00	266	361	1.3075	1.3178	1.3071	1.3172
13092	2018-09-26 00:00:00+00	266	361	1.3172	1.3218	1.3137	1.3177
13093	2018-09-25 00:00:00+00	266	361	1.3178	1.3194	1.3094	1.3115
13094	2018-09-24 00:00:00+00	266	361	1.3115	1.3167	1.3061	1.3077
13095	2018-09-23 00:00:00+00	266	361	1.3077	1.3084	1.3057	1.3069
13096	2018-09-21 00:00:00+00	266	361	1.3067	1.3277	1.3054	1.3271
13097	2018-09-20 00:00:00+00	266	361	1.3271	1.3299	1.3135	1.3138
13098	2018-09-19 00:00:00+00	266	361	1.3138	1.3215	1.3097	1.3164
13099	2018-09-18 00:00:00+00	266	361	1.3164	1.3175	1.3118	1.3150
13100	2018-09-17 00:00:00+00	266	361	1.3149	1.3165	1.3068	1.3076
13101	2018-09-16 00:00:00+00	266	361	1.3076	1.3077	1.3065	1.3067
13102	2018-09-14 00:00:00+00	266	361	1.3066	1.3144	1.3055	1.3109
13103	2018-09-13 00:00:00+00	266	361	1.3109	1.3124	1.3025	1.3047
13104	2018-09-12 00:00:00+00	266	361	1.3047	1.3082	1.2979	1.3020
13105	2018-09-11 00:00:00+00	266	361	1.3020	1.3087	1.2962	1.3026
13106	2018-09-10 00:00:00+00	266	361	1.3026	1.3052	1.2895	1.2925
13107	2018-09-09 00:00:00+00	266	361	1.2925	1.2929	1.2912	1.2927
13108	2018-09-07 00:00:00+00	266	361	1.2918	1.3028	1.2907	1.2928
13109	2018-09-06 00:00:00+00	266	361	1.2928	1.2962	1.2894	1.2910
13110	2018-09-05 00:00:00+00	266	361	1.2910	1.2983	1.2784	1.2857
13111	2018-09-04 00:00:00+00	266	361	1.2857	1.2874	1.2809	1.2874
13112	2018-09-03 00:00:00+00	266	361	1.2873	1.2934	1.2853	1.2925
13113	2018-09-02 00:00:00+00	266	361	1.2925	1.2969	1.2893	1.2969
13114	2018-08-31 00:00:00+00	266	361	1.2956	1.3029	1.2943	1.3009
13115	2018-08-30 00:00:00+00	266	361	1.3008	1.3043	1.2984	1.3024
13116	2018-08-29 00:00:00+00	266	361	1.3024	1.3033	1.2844	1.2870
13117	2018-08-28 00:00:00+00	266	361	1.2870	1.2932	1.2859	1.2895
13118	2018-08-27 00:00:00+00	266	361	1.2895	1.2901	1.2827	1.2851
13119	2018-08-26 00:00:00+00	266	361	1.2851	1.2852	1.2831	1.2848
13120	2018-08-24 00:00:00+00	266	361	1.2839	1.2881	1.2797	1.2810
13121	2018-08-23 00:00:00+00	266	361	1.2809	1.2917	1.2801	1.2915
13122	2018-08-22 00:00:00+00	266	361	1.2915	1.2936	1.2867	1.2907
13123	2018-08-21 00:00:00+00	266	361	1.2907	1.2925	1.2793	1.2801
13124	2018-08-20 00:00:00+00	266	361	1.2801	1.2801	1.2727	1.2746
13125	2018-08-19 00:00:00+00	266	361	1.2746	1.2751	1.2738	1.2739
13126	2018-08-17 00:00:00+00	266	361	1.2754	1.2754	1.2696	1.2714
13127	2018-08-16 00:00:00+00	266	361	1.2714	1.2754	1.2684	1.2696
13128	2018-08-15 00:00:00+00	266	361	1.2696	1.2735	1.2661	1.2723
13129	2018-08-14 00:00:00+00	266	361	1.2723	1.2827	1.2703	1.2761
13130	2018-08-13 00:00:00+00	266	361	1.2763	1.2791	1.2729	1.2767
13131	2018-08-12 00:00:00+00	266	361	1.2767	1.2780	1.2742	1.2762
13132	2018-08-10 00:00:00+00	266	361	1.2765	1.2837	1.2722	1.2820
13133	2018-08-09 00:00:00+00	266	361	1.2820	1.2912	1.2817	1.2883
13134	2018-08-08 00:00:00+00	266	361	1.2883	1.2960	1.2852	1.2942
13135	2018-08-07 00:00:00+00	266	361	1.2942	1.2974	1.2922	1.2943
13136	2018-08-06 00:00:00+00	266	361	1.2943	1.3006	1.2918	1.3000
13137	2018-08-05 00:00:00+00	266	361	1.3001	1.3012	1.2995	1.3010
13138	2018-08-03 00:00:00+00	266	361	1.2997	1.3043	1.2974	1.3017
13139	2018-08-02 00:00:00+00	266	361	1.3018	1.3129	1.3011	1.3126
13140	2018-08-01 00:00:00+00	266	361	1.3126	1.3144	1.3094	1.3116
13141	2018-07-31 00:00:00+00	266	361	1.3116	1.3173	1.3089	1.3136
13142	2018-07-30 00:00:00+00	266	361	1.3135	1.3152	1.3095	1.3110
13143	2018-07-29 00:00:00+00	266	361	1.3109	1.3120	1.3093	1.3094
13144	2018-07-27 00:00:00+00	266	361	1.3098	1.3131	1.3081	1.3107
13145	2018-07-26 00:00:00+00	266	361	1.3107	1.3213	1.3101	1.3193
13146	2018-07-25 00:00:00+00	266	361	1.3192	1.3201	1.3131	1.3143
13147	2018-07-24 00:00:00+00	266	361	1.3143	1.3159	1.3070	1.3101
13148	2018-07-23 00:00:00+00	266	361	1.3102	1.3158	1.3081	1.3139
13149	2018-07-22 00:00:00+00	266	361	1.3140	1.3141	1.3115	1.3123
13150	2018-07-20 00:00:00+00	266	361	1.3132	1.3140	1.2993	1.3014
13151	2018-07-19 00:00:00+00	266	361	1.3014	1.3083	1.2956	1.3074
13152	2018-07-18 00:00:00+00	266	361	1.3074	1.3117	1.3009	1.3112
13153	2018-07-17 00:00:00+00	266	361	1.3111	1.3269	1.3068	1.3237
13154	2018-07-16 00:00:00+00	266	361	1.3236	1.3293	1.3216	1.3230
13155	2018-07-15 00:00:00+00	266	361	1.3230	1.3235	1.3218	1.3234
13156	2018-07-13 00:00:00+00	266	361	1.3232	1.3239	1.3101	1.3187
13157	2018-07-12 00:00:00+00	266	361	1.3186	1.3245	1.3177	1.3206
13158	2018-07-11 00:00:00+00	266	361	1.3206	1.3285	1.3198	1.3259
13159	2018-07-10 00:00:00+00	266	361	1.3260	1.3301	1.3222	1.3250
13160	2018-07-09 00:00:00+00	266	361	1.3250	1.3363	1.3189	1.3300
13161	2018-07-08 00:00:00+00	266	361	1.3299	1.3325	1.3285	1.3304
13162	2018-07-06 00:00:00+00	266	361	1.3285	1.3290	1.3201	1.3220
13163	2018-07-05 00:00:00+00	266	361	1.3220	1.3275	1.3202	1.3229
13164	2018-07-04 00:00:00+00	266	361	1.3228	1.3250	1.3169	1.3192
13165	2018-07-03 00:00:00+00	266	361	1.3191	1.3207	1.3113	1.3141
13166	2018-07-02 00:00:00+00	266	361	1.3141	1.3209	1.3094	1.3204
13167	2018-07-01 00:00:00+00	266	361	1.3203	1.3208	1.3162	1.3180
13168	2018-06-29 00:00:00+00	266	361	1.3207	1.3214	1.3067	1.3077
13169	2018-06-28 00:00:00+00	266	361	1.3077	1.3121	1.3049	1.3119
13170	2018-06-27 00:00:00+00	266	361	1.3119	1.3234	1.3105	1.3223
13171	2018-06-26 00:00:00+00	266	361	1.3223	1.3292	1.3191	1.3282
13172	2018-06-25 00:00:00+00	266	361	1.3281	1.3291	1.3219	1.3269
13173	2018-06-24 00:00:00+00	266	361	1.3268	1.3272	1.3246	1.3272
13174	2018-06-22 00:00:00+00	266	361	1.3263	1.3315	1.3243	1.3246
13175	2018-06-21 00:00:00+00	266	361	1.3246	1.3270	1.3101	1.3172
13176	2018-06-20 00:00:00+00	266	361	1.3172	1.3217	1.3146	1.3172
13177	2018-06-19 00:00:00+00	266	361	1.3171	1.3273	1.3149	1.3245
13178	2018-06-18 00:00:00+00	266	361	1.3245	1.3276	1.3224	1.3271
13179	2018-06-17 00:00:00+00	266	361	1.3271	1.3281	1.3251	1.3273
13180	2018-06-15 00:00:00+00	266	361	1.3275	1.3298	1.3209	1.3271
13181	2018-06-14 00:00:00+00	266	361	1.3270	1.3447	1.3254	1.3379
13182	2018-06-13 00:00:00+00	266	361	1.3378	1.3389	1.3306	1.3370
13183	2018-06-12 00:00:00+00	266	361	1.3369	1.3425	1.3340	1.3377
13184	2018-06-11 00:00:00+00	266	361	1.3377	1.3441	1.3343	1.3405
13185	2018-06-10 00:00:00+00	266	361	1.3405	1.3414	1.3397	1.3402
13186	2018-06-08 00:00:00+00	266	361	1.3401	1.3439	1.3353	1.3422
13187	2018-06-07 00:00:00+00	266	361	1.3421	1.3473	1.3371	1.3419
13188	2018-06-06 00:00:00+00	266	361	1.3419	1.3443	1.3396	1.3401
13189	2018-06-05 00:00:00+00	266	361	1.3402	1.3409	1.3300	1.3314
13190	2018-06-04 00:00:00+00	266	361	1.3314	1.3399	1.3293	1.3351
13191	2018-06-03 00:00:00+00	266	361	1.3351	1.3351	1.3336	1.3342
13192	2018-06-01 00:00:00+00	266	361	1.3346	1.3362	1.3252	1.3299
13193	2018-05-31 00:00:00+00	266	361	1.3299	1.3348	1.3276	1.3284
13194	2018-05-30 00:00:00+00	266	361	1.3284	1.3307	1.3240	1.3256
13195	2018-05-29 00:00:00+00	266	361	1.3256	1.3325	1.3204	1.3312
13196	2018-05-28 00:00:00+00	266	361	1.3311	1.3341	1.3294	1.3310
13197	2018-05-27 00:00:00+00	266	361	1.3310	1.3322	1.3296	1.3312
13198	2018-05-25 00:00:00+00	266	361	1.3307	1.3385	1.3292	1.3385
13199	2018-05-24 00:00:00+00	266	361	1.3384	1.3422	1.3348	1.3355
13200	2018-05-23 00:00:00+00	266	361	1.3355	1.3442	1.3304	1.3434
13201	2018-05-22 00:00:00+00	266	361	1.3434	1.3492	1.3411	1.3433
13202	2018-05-21 00:00:00+00	266	361	1.3432	1.3479	1.3389	1.3475
13203	2018-05-20 00:00:00+00	266	361	1.3475	1.3483	1.3458	1.3472
13204	2018-05-18 00:00:00+00	266	361	1.3466	1.3528	1.3453	1.3517
13205	2018-05-17 00:00:00+00	266	361	1.3515	1.3569	1.3472	1.3525
13206	2018-05-16 00:00:00+00	266	361	1.3525	1.3527	1.3454	1.3495
13207	2018-05-15 00:00:00+00	266	361	1.3495	1.3572	1.3450	1.3559
13208	2018-05-14 00:00:00+00	266	361	1.3559	1.3608	1.3542	1.3547
13209	2018-05-13 00:00:00+00	266	361	1.3546	1.3547	1.3537	1.3545
13210	2018-05-11 00:00:00+00	266	361	1.3540	1.3596	1.3500	1.3519
13211	2018-05-10 00:00:00+00	266	361	1.3518	1.3618	1.3459	1.3548
13212	2018-05-09 00:00:00+00	266	361	1.3549	1.3607	1.3497	1.3545
13213	2018-05-08 00:00:00+00	266	361	1.3545	1.3593	1.3483	1.3559
13214	2018-05-07 00:00:00+00	266	361	1.3559	1.3576	1.3514	1.3536
13215	2018-05-06 00:00:00+00	266	361	1.3537	1.3540	1.3523	1.3533
13216	2018-05-04 00:00:00+00	266	361	1.3526	1.3586	1.3485	1.3570
13217	2018-05-03 00:00:00+00	266	361	1.3570	1.3630	1.3536	1.3574
13218	2018-05-02 00:00:00+00	266	361	1.3573	1.3666	1.3553	1.3609
13219	2018-05-01 00:00:00+00	266	361	1.3609	1.3773	1.3587	1.3768
13220	2018-04-30 00:00:00+00	266	361	1.3768	1.3792	1.3711	1.3775
13221	2018-04-29 00:00:00+00	266	361	1.3774	1.3779	1.3764	1.3774
13222	2018-04-27 00:00:00+00	266	361	1.3774	1.3935	1.3746	1.3914
13223	2018-04-26 00:00:00+00	266	361	1.3915	1.3998	1.3894	1.3933
13224	2018-04-25 00:00:00+00	266	361	1.3931	1.3997	1.3920	1.3980
13225	2018-04-24 00:00:00+00	266	361	1.3980	1.3987	1.3916	1.3939
13226	2018-04-23 00:00:00+00	266	361	1.3938	1.4031	1.3924	1.4005
13227	2018-04-22 00:00:00+00	266	361	1.4004	1.4015	1.3991	1.4011
13228	2018-04-20 00:00:00+00	266	361	1.3997	1.4088	1.3992	1.4080
13229	2018-04-19 00:00:00+00	266	361	1.4080	1.4246	1.4068	1.4206
13230	2018-04-18 00:00:00+00	266	361	1.4206	1.4315	1.4172	1.4294
13231	2018-04-17 00:00:00+00	266	361	1.4294	1.4377	1.4281	1.4338
13232	2018-04-16 00:00:00+00	266	361	1.4337	1.4344	1.4235	1.4238
13233	2018-04-15 00:00:00+00	266	361	1.4238	1.4254	1.4227	1.4250
13234	2018-04-13 00:00:00+00	266	361	1.4236	1.4297	1.4219	1.4230
13235	2018-04-12 00:00:00+00	266	361	1.4229	1.4247	1.4144	1.4180
13236	2018-04-11 00:00:00+00	266	361	1.4180	1.4223	1.4159	1.4176
13237	2018-04-10 00:00:00+00	266	361	1.4177	1.4188	1.4118	1.4132
13238	2018-04-09 00:00:00+00	266	361	1.4131	1.4165	1.4077	1.4091
13239	2018-04-08 00:00:00+00	266	361	1.4090	1.4099	1.4080	1.4095
13240	2018-04-06 00:00:00+00	266	361	1.4089	1.4105	1.3981	1.4004
13241	2018-04-05 00:00:00+00	266	361	1.4003	1.4097	1.3964	1.4086
13242	2018-04-04 00:00:00+00	266	361	1.4086	1.4097	1.4014	1.4064
13243	2018-04-03 00:00:00+00	266	361	1.4064	1.4089	1.4020	1.4049
13244	2018-04-02 00:00:00+00	266	361	1.4049	1.4078	1.4024	1.4033
13245	2018-04-01 00:00:00+00	266	361	1.4033	1.4035	1.4016	1.4024
13246	2018-03-30 00:00:00+00	266	361	1.4010	1.4060	1.4008	1.4034
13247	2018-03-29 00:00:00+00	266	361	1.4034	1.4097	1.4009	1.4077
13248	2018-03-28 00:00:00+00	266	361	1.4078	1.4201	1.4069	1.4165
13249	2018-03-27 00:00:00+00	266	361	1.4165	1.4244	1.4064	1.4234
13250	2018-03-26 00:00:00+00	266	361	1.4233	1.4245	1.4143	1.4152
13251	2018-03-25 00:00:00+00	266	361	1.4152	1.4158	1.4129	1.4139
13252	2018-03-23 00:00:00+00	266	361	1.4134	1.4172	1.4084	1.4114
13253	2018-03-22 00:00:00+00	266	361	1.4114	1.4220	1.4074	1.4138
13254	2018-03-21 00:00:00+00	266	361	1.4138	1.4150	1.3997	1.4001
13255	2018-03-20 00:00:00+00	266	361	1.4001	1.4067	1.3982	1.4024
13256	2018-03-19 00:00:00+00	266	361	1.4024	1.4088	1.3911	1.3943
13257	2018-03-18 00:00:00+00	266	361	1.3943	1.3949	1.3933	1.3943
13258	2018-03-16 00:00:00+00	266	361	1.3941	1.3981	1.3888	1.3936
13259	2018-03-15 00:00:00+00	266	361	1.3935	1.3989	1.3921	1.3963
13260	2018-03-14 00:00:00+00	266	361	1.3963	1.3996	1.3924	1.3970
13261	2018-03-13 00:00:00+00	266	361	1.3969	1.3995	1.3873	1.3904
13262	2018-03-12 00:00:00+00	266	361	1.3903	1.3918	1.3840	1.3853
13263	2018-03-11 00:00:00+00	266	361	1.3853	1.3858	1.3844	1.3851
13264	2018-03-10 00:00:00+00	266	361	1.3851	1.3852	1.3850	1.3852
13265	2018-03-09 00:00:00+00	266	361	1.3847	1.3889	1.3786	1.3813
13266	2018-03-08 00:00:00+00	266	361	1.3813	1.3910	1.3780	1.3901
13267	2018-03-07 00:00:00+00	266	361	1.3900	1.3913	1.3844	1.3898
13268	2018-03-06 00:00:00+00	266	361	1.3896	1.3929	1.3815	1.3843
13269	2018-03-05 00:00:00+00	266	361	1.3843	1.3878	1.3766	1.3804
13270	2018-03-04 00:00:00+00	266	361	1.3802	1.3815	1.3786	1.3793
13271	2018-03-02 00:00:00+00	266	361	1.3799	1.3817	1.3754	1.3777
13272	2018-03-01 00:00:00+00	266	361	1.3777	1.3785	1.3710	1.3756
13273	2018-02-28 00:00:00+00	266	361	1.3756	1.3917	1.3752	1.3909
13274	2018-02-27 00:00:00+00	266	361	1.3910	1.3996	1.3857	1.3964
13275	2018-02-26 00:00:00+00	266	361	1.3964	1.4070	1.3927	1.3966
13276	2018-02-25 00:00:00+00	266	361	1.3967	1.3991	1.3962	1.3973
13277	2018-02-23 00:00:00+00	266	361	1.3965	1.4006	1.3904	1.3955
13278	2018-02-22 00:00:00+00	266	361	1.3955	1.3989	1.3855	1.3908
13279	2018-02-21 00:00:00+00	266	361	1.3908	1.4009	1.3902	1.3996
13280	2018-02-20 00:00:00+00	266	361	1.3996	1.4025	1.3930	1.3996
13281	2018-02-19 00:00:00+00	266	361	1.3996	1.4050	1.3957	1.4031
13282	2018-02-18 00:00:00+00	266	361	1.4031	1.4034	1.4004	1.4024
13283	2018-02-16 00:00:00+00	266	361	1.4025	1.4145	1.3995	1.4091
13284	2018-02-15 00:00:00+00	266	361	1.4090	1.4105	1.3992	1.4004
13285	2018-02-14 00:00:00+00	266	361	1.4004	1.4017	1.3799	1.3886
13286	2018-02-13 00:00:00+00	266	361	1.3886	1.3924	1.3830	1.3836
13287	2018-02-12 00:00:00+00	266	361	1.3835	1.3876	1.3795	1.3826
13288	2018-02-11 00:00:00+00	266	361	1.3827	1.3827	1.3804	1.3818
13289	2018-02-09 00:00:00+00	266	361	1.3828	1.3987	1.3763	1.3919
13290	2018-02-08 00:00:00+00	266	361	1.3920	1.4067	1.3844	1.3871
13291	2018-02-07 00:00:00+00	266	361	1.3871	1.3994	1.3847	1.3956
13292	2018-02-06 00:00:00+00	266	361	1.3956	1.4000	1.3835	1.3967
13293	2018-02-05 00:00:00+00	266	361	1.3967	1.4151	1.3953	1.4092
13294	2018-02-04 00:00:00+00	266	361	1.4094	1.4134	1.4091	1.4121
13295	2018-02-02 00:00:00+00	266	361	1.4120	1.4278	1.4100	1.4262
13296	2018-02-01 00:00:00+00	266	361	1.4262	1.4278	1.4158	1.4196
13297	2018-01-31 00:00:00+00	266	361	1.4196	1.4233	1.4121	1.4150
13298	2018-01-30 00:00:00+00	266	361	1.4150	1.4167	1.3979	1.4070
13299	2018-01-29 00:00:00+00	266	361	1.4069	1.4159	1.4024	1.4142
13300	2018-01-28 00:00:00+00	266	361	1.4142	1.4157	1.4126	1.4157
13301	2018-01-26 00:00:00+00	266	361	1.4154	1.4285	1.4108	1.4109
13302	2018-01-25 00:00:00+00	266	361	1.4108	1.4345	1.4082	1.4240
13303	2018-01-24 00:00:00+00	266	361	1.4240	1.4263	1.3995	1.4001
13304	2018-01-23 00:00:00+00	266	361	1.4001	1.4027	1.3915	1.3983
13305	2018-01-22 00:00:00+00	266	361	1.3983	1.3991	1.3855	1.3888
13306	2018-01-21 00:00:00+00	266	361	1.3888	1.3896	1.3871	1.3875
13307	2018-01-19 00:00:00+00	266	361	1.3854	1.3945	1.3838	1.3893
13308	2018-01-18 00:00:00+00	266	361	1.3893	1.3913	1.3803	1.3807
13309	2018-01-17 00:00:00+00	266	361	1.3807	1.3943	1.3755	1.3787
13310	2018-01-16 00:00:00+00	266	361	1.3787	1.3806	1.3740	1.3796
13311	2018-01-15 00:00:00+00	266	361	1.3796	1.3820	1.3728	1.3739
13312	2018-01-14 00:00:00+00	266	361	1.3739	1.3739	1.3723	1.3726
13313	2018-01-12 00:00:00+00	266	361	1.3725	1.3744	1.3535	1.3537
13314	2018-01-11 00:00:00+00	266	361	1.3536	1.3555	1.3456	1.3506
13315	2018-01-10 00:00:00+00	266	361	1.3506	1.3562	1.3481	1.3541
13316	2018-01-09 00:00:00+00	266	361	1.3540	1.3582	1.3504	1.3569
13317	2018-01-08 00:00:00+00	266	361	1.3569	1.3585	1.3522	1.3569
13318	2018-01-07 00:00:00+00	266	361	1.3569	1.3573	1.3552	1.3570
13319	2018-01-05 00:00:00+00	266	361	1.3564	1.3583	1.3522	1.3548
13320	2018-01-04 00:00:00+00	266	361	1.3548	1.3560	1.3503	1.3511
13321	2018-01-03 00:00:00+00	266	361	1.3511	1.3613	1.3494	1.3590
13322	2018-01-02 00:00:00+00	266	361	1.3590	1.3600	1.3504	1.3512
13323	2018-01-01 00:00:00+00	266	361	1.3514	1.3521	1.3491	1.3498
55582	2019-12-27 00:20:00+00	355	263	0.1513	0.1513	0.1513	0.1513
13328	2019-11-07 00:00:00+00	263	361	1.1049	1.1092	1.1035	1.1067
13329	2019-11-06 00:00:00+00	263	361	1.1067	1.1093	1.1063	1.1075
13330	2019-11-05 00:00:00+00	263	361	1.1075	1.1140	1.1062	1.1122
13331	2019-11-04 00:00:00+00	263	361	1.1122	1.1176	1.1120	1.1165
13332	2019-11-03 00:00:00+00	263	361	1.1165	1.1170	1.1162	1.1165
13333	2019-11-01 00:00:00+00	263	361	1.1164	1.1172	1.1127	1.1152
13334	2019-10-31 00:00:00+00	263	361	1.1151	1.1176	1.1130	1.1153
13335	2019-10-30 00:00:00+00	263	361	1.1153	1.1155	1.1079	1.1112
13336	2019-10-29 00:00:00+00	263	361	1.1112	1.1119	1.1072	1.1098
13337	2019-10-28 00:00:00+00	263	361	1.1098	1.1107	1.1071	1.1082
13338	2019-10-27 00:00:00+00	263	361	1.1081	1.1085	1.1074	1.1085
13339	2019-10-25 00:00:00+00	263	361	1.1080	1.1123	1.1071	1.1102
13340	2019-10-24 00:00:00+00	263	361	1.1103	1.1163	1.1091	1.1133
13341	2019-10-23 00:00:00+00	263	361	1.1132	1.1140	1.1105	1.1131
13342	2019-10-22 00:00:00+00	263	361	1.1131	1.1157	1.1116	1.1150
13343	2019-10-21 00:00:00+00	263	361	1.1150	1.1179	1.1138	1.1157
13344	2019-10-20 00:00:00+00	263	361	1.1157	1.1165	1.1135	1.1145
13345	2019-10-18 00:00:00+00	263	361	1.1182	1.1183	1.1113	1.1125
13346	2019-10-17 00:00:00+00	263	361	1.1124	1.1140	1.1063	1.1075
13347	2019-10-16 00:00:00+00	263	361	1.1075	1.1086	1.1021	1.1033
13348	2019-10-15 00:00:00+00	263	361	1.1033	1.1046	1.0989	1.1028
13349	2019-10-14 00:00:00+00	263	361	1.1028	1.1043	1.1012	1.1030
13350	2019-10-13 00:00:00+00	263	361	1.1030	1.1045	1.1028	1.1045
13351	2019-10-11 00:00:00+00	263	361	1.1035	1.1063	1.1000	1.1007
13352	2019-10-10 00:00:00+00	263	361	1.1007	1.1034	1.0978	1.0984
13353	2019-10-09 00:00:00+00	263	361	1.0985	1.0991	1.0953	1.0958
13354	2019-10-08 00:00:00+00	263	361	1.0958	1.0996	1.0939	1.0970
13355	2019-10-07 00:00:00+00	263	361	1.0972	1.1001	1.0960	1.0981
13356	2019-10-06 00:00:00+00	263	361	1.0981	1.0984	1.0967	1.0982
13357	2019-10-04 00:00:00+00	263	361	1.0975	1.0999	1.0956	1.0972
13358	2019-10-03 00:00:00+00	263	361	1.0972	1.0999	1.0939	1.0959
13359	2019-10-02 00:00:00+00	263	361	1.0959	1.0964	1.0903	1.0931
13360	2019-10-01 00:00:00+00	263	361	1.0931	1.0943	1.0878	1.0898
13361	2019-09-30 00:00:00+00	263	361	1.0898	1.0948	1.0884	1.0944
13362	2019-09-29 00:00:00+00	263	361	1.0944	1.0946	1.0938	1.0938
13363	2019-09-27 00:00:00+00	263	361	1.0939	1.0959	1.0904	1.0920
13364	2019-09-26 00:00:00+00	263	361	1.0920	1.0967	1.0908	1.0949
13365	2019-09-25 00:00:00+00	263	361	1.0949	1.1020	1.0936	1.1019
13366	2019-09-24 00:00:00+00	263	361	1.1019	1.1024	1.0982	1.0995
13367	2019-09-23 00:00:00+00	263	361	1.0995	1.1025	1.0964	1.1018
13368	2019-09-22 00:00:00+00	263	361	1.1018	1.1020	1.1009	1.1011
13369	2019-09-20 00:00:00+00	263	361	1.1017	1.1068	1.0995	1.1045
13370	2019-09-19 00:00:00+00	263	361	1.1045	1.1074	1.1021	1.1031
13371	2019-09-18 00:00:00+00	263	361	1.1031	1.1076	1.1012	1.1071
13372	2019-09-17 00:00:00+00	263	361	1.1071	1.1075	1.0989	1.1005
13373	2019-09-16 00:00:00+00	263	361	1.1005	1.1086	1.0992	1.1079
13374	2019-09-15 00:00:00+00	263	361	1.1079	1.1087	1.1068	1.1076
13375	2019-09-13 00:00:00+00	263	361	1.1071	1.1110	1.1054	1.1058
13376	2019-09-12 00:00:00+00	263	361	1.1058	1.1087	1.0926	1.1010
13377	2019-09-11 00:00:00+00	263	361	1.1010	1.1056	1.0983	1.1049
13378	2019-09-10 00:00:00+00	263	361	1.1048	1.1059	1.1029	1.1049
13379	2019-09-09 00:00:00+00	263	361	1.1049	1.1068	1.1014	1.1025
13380	2019-09-08 00:00:00+00	263	361	1.1025	1.1028	1.1022	1.1025
13381	2019-09-06 00:00:00+00	263	361	1.1029	1.1057	1.1018	1.1036
13382	2019-09-05 00:00:00+00	263	361	1.1035	1.1085	1.1016	1.1034
13383	2019-09-04 00:00:00+00	263	361	1.1034	1.1038	1.0967	1.0970
13384	2019-09-03 00:00:00+00	263	361	1.0971	1.0979	1.0924	1.0966
13385	2019-09-02 00:00:00+00	263	361	1.0966	1.0994	1.0956	1.0992
13386	2019-09-01 00:00:00+00	263	361	1.0991	1.0998	1.0981	1.0987
13387	2019-08-30 00:00:00+00	263	361	1.0989	1.1060	1.0961	1.1058
13388	2019-08-29 00:00:00+00	263	361	1.1058	1.1093	1.1041	1.1084
13389	2019-08-28 00:00:00+00	263	361	1.1083	1.1098	1.1072	1.1092
13390	2019-08-27 00:00:00+00	263	361	1.1091	1.1116	1.1084	1.1100
13391	2019-08-26 00:00:00+00	263	361	1.1099	1.1154	1.1093	1.1154
13392	2019-08-25 00:00:00+00	263	361	1.1154	1.1164	1.1139	1.1145
13393	2019-08-23 00:00:00+00	263	361	1.1143	1.1153	1.1050	1.1082
13394	2019-08-22 00:00:00+00	263	361	1.1082	1.1113	1.1062	1.1091
13395	2019-08-21 00:00:00+00	263	361	1.1091	1.1107	1.1079	1.1099
13396	2019-08-20 00:00:00+00	263	361	1.1099	1.1107	1.1064	1.1082
13397	2019-08-19 00:00:00+00	263	361	1.1081	1.1114	1.1075	1.1095
13398	2019-08-18 00:00:00+00	263	361	1.1095	1.1101	1.1087	1.1095
13399	2019-08-16 00:00:00+00	263	361	1.1090	1.1112	1.1065	1.1110
13400	2019-08-15 00:00:00+00	263	361	1.1110	1.1159	1.1090	1.1144
13401	2019-08-14 00:00:00+00	263	361	1.1144	1.1191	1.1129	1.1175
13402	2019-08-13 00:00:00+00	263	361	1.1174	1.1229	1.1168	1.1214
13403	2019-08-12 00:00:00+00	263	361	1.1214	1.1231	1.1161	1.1202
13404	2019-08-11 00:00:00+00	263	361	1.1202	1.1204	1.1194	1.1200
13405	2019-08-09 00:00:00+00	263	361	1.1197	1.1223	1.1182	1.1185
13406	2019-08-08 00:00:00+00	263	361	1.1185	1.1233	1.1176	1.1205
13407	2019-08-07 00:00:00+00	263	361	1.1205	1.1242	1.1178	1.1202
13408	2019-08-06 00:00:00+00	263	361	1.1201	1.1250	1.1166	1.1225
13409	2019-08-05 00:00:00+00	263	361	1.1224	1.1226	1.1104	1.1106
13410	2019-08-04 00:00:00+00	263	361	1.1106	1.1114	1.1101	1.1110
13411	2019-08-02 00:00:00+00	263	361	1.1108	1.1116	1.1068	1.1078
13412	2019-08-01 00:00:00+00	263	361	1.1078	1.1096	1.1025	1.1079
13413	2019-07-31 00:00:00+00	263	361	1.1079	1.1162	1.1059	1.1158
13414	2019-07-30 00:00:00+00	263	361	1.1158	1.1161	1.1131	1.1147
13415	2019-07-29 00:00:00+00	263	361	1.1146	1.1151	1.1112	1.1132
13416	2019-07-28 00:00:00+00	263	361	1.1132	1.1132	1.1121	1.1126
13417	2019-07-26 00:00:00+00	263	361	1.1128	1.1151	1.1111	1.1146
13418	2019-07-25 00:00:00+00	263	361	1.1146	1.1188	1.1100	1.1142
13419	2019-07-24 00:00:00+00	263	361	1.1140	1.1156	1.1126	1.1152
13420	2019-07-23 00:00:00+00	263	361	1.1152	1.1209	1.1144	1.1208
13421	2019-07-22 00:00:00+00	263	361	1.1208	1.1225	1.1205	1.1218
13422	2019-07-21 00:00:00+00	263	361	1.1218	1.1220	1.1212	1.1215
13423	2019-07-19 00:00:00+00	263	361	1.1221	1.1268	1.1202	1.1249
13424	2019-07-18 00:00:00+00	263	361	1.1249	1.1282	1.1204	1.1227
13425	2019-07-17 00:00:00+00	263	361	1.1227	1.1234	1.1198	1.1210
13426	2019-07-16 00:00:00+00	263	361	1.1211	1.1263	1.1200	1.1261
13427	2019-07-15 00:00:00+00	263	361	1.1261	1.1284	1.1252	1.1272
13428	2019-07-14 00:00:00+00	263	361	1.1272	1.1275	1.1262	1.1267
13429	2019-07-12 00:00:00+00	263	361	1.1270	1.1275	1.1237	1.1256
13430	2019-07-11 00:00:00+00	263	361	1.1256	1.1286	1.1244	1.1259
13431	2019-07-10 00:00:00+00	263	361	1.1259	1.1264	1.1200	1.1206
13432	2019-07-09 00:00:00+00	263	361	1.1206	1.1219	1.1192	1.1216
13433	2019-07-08 00:00:00+00	263	361	1.1216	1.1234	1.1205	1.1229
13434	2019-07-07 00:00:00+00	263	361	1.1229	1.1229	1.1216	1.1222
13435	2019-07-05 00:00:00+00	263	361	1.1224	1.1287	1.1206	1.1286
13436	2019-07-04 00:00:00+00	263	361	1.1286	1.1295	1.1271	1.1287
13437	2019-07-03 00:00:00+00	263	361	1.1287	1.1312	1.1267	1.1290
13438	2019-07-02 00:00:00+00	263	361	1.1290	1.1322	1.1273	1.1286
13439	2019-07-01 00:00:00+00	263	361	1.1286	1.1371	1.1279	1.1368
13440	2019-06-30 00:00:00+00	263	361	1.1368	1.1370	1.1355	1.1370
13441	2019-06-28 00:00:00+00	263	361	1.1373	1.1394	1.1349	1.1368
13442	2019-06-27 00:00:00+00	263	361	1.1368	1.1382	1.1346	1.1373
13443	2019-06-26 00:00:00+00	263	361	1.1373	1.1391	1.1346	1.1366
13444	2019-06-25 00:00:00+00	263	361	1.1365	1.1412	1.1343	1.1397
13445	2019-06-24 00:00:00+00	263	361	1.1397	1.1404	1.1369	1.1375
13446	2019-06-23 00:00:00+00	263	361	1.1375	1.1378	1.1360	1.1360
13447	2019-06-21 00:00:00+00	263	361	1.1368	1.1378	1.1281	1.1292
13448	2019-06-20 00:00:00+00	263	361	1.1291	1.1317	1.1233	1.1236
13449	2019-06-19 00:00:00+00	263	361	1.1236	1.1254	1.1185	1.1195
13450	2019-06-18 00:00:00+00	263	361	1.1195	1.1243	1.1180	1.1221
13451	2019-06-17 00:00:00+00	263	361	1.1221	1.1247	1.1202	1.1215
13452	2019-06-16 00:00:00+00	263	361	1.1215	1.1216	1.1203	1.1211
13453	2019-06-14 00:00:00+00	263	361	1.1209	1.1289	1.1201	1.1278
13454	2019-06-13 00:00:00+00	263	361	1.1278	1.1304	1.1267	1.1293
13455	2019-06-12 00:00:00+00	263	361	1.1293	1.1343	1.1281	1.1328
13456	2019-06-11 00:00:00+00	263	361	1.1328	1.1338	1.1300	1.1315
13457	2019-06-10 00:00:00+00	263	361	1.1315	1.1324	1.1289	1.1317
13458	2019-06-09 00:00:00+00	263	361	1.1317	1.1331	1.1307	1.1320
13459	2019-06-07 00:00:00+00	263	361	1.1333	1.1348	1.1250	1.1278
13460	2019-06-06 00:00:00+00	263	361	1.1277	1.1309	1.1200	1.1228
13461	2019-06-05 00:00:00+00	263	361	1.1228	1.1307	1.1218	1.1253
13462	2019-06-04 00:00:00+00	263	361	1.1252	1.1277	1.1225	1.1245
13463	2019-06-03 00:00:00+00	263	361	1.1245	1.1262	1.1159	1.1172
13464	2019-06-02 00:00:00+00	263	361	1.1172	1.1174	1.1152	1.1167
13465	2019-05-31 00:00:00+00	263	361	1.1169	1.1180	1.1124	1.1133
13466	2019-05-30 00:00:00+00	263	361	1.1133	1.1143	1.1115	1.1137
13467	2019-05-29 00:00:00+00	263	361	1.1137	1.1173	1.1122	1.1165
13468	2019-05-28 00:00:00+00	263	361	1.1165	1.1198	1.1158	1.1193
13469	2019-05-27 00:00:00+00	263	361	1.1193	1.1215	1.1185	1.1210
13470	2019-05-26 00:00:00+00	263	361	1.1210	1.1212	1.1189	1.1190
13471	2019-05-24 00:00:00+00	263	361	1.1202	1.1212	1.1175	1.1182
13472	2019-05-23 00:00:00+00	263	361	1.1182	1.1188	1.1106	1.1156
13473	2019-05-22 00:00:00+00	263	361	1.1156	1.1180	1.1147	1.1164
13474	2019-05-21 00:00:00+00	263	361	1.1163	1.1188	1.1140	1.1168
13475	2019-05-20 00:00:00+00	263	361	1.1168	1.1175	1.1148	1.1163
13476	2019-05-19 00:00:00+00	263	361	1.1163	1.1167	1.1150	1.1161
13477	2019-05-17 00:00:00+00	263	361	1.1158	1.1184	1.1154	1.1174
13478	2019-05-16 00:00:00+00	263	361	1.1174	1.1224	1.1164	1.1206
13479	2019-05-15 00:00:00+00	263	361	1.1206	1.1225	1.1176	1.1207
13480	2019-05-14 00:00:00+00	263	361	1.1207	1.1244	1.1200	1.1231
13481	2019-05-13 00:00:00+00	263	361	1.1231	1.1264	1.1217	1.1235
13482	2019-05-12 00:00:00+00	263	361	1.1235	1.1241	1.1229	1.1234
13483	2019-05-10 00:00:00+00	263	361	1.1238	1.1254	1.1216	1.1219
13484	2019-05-09 00:00:00+00	263	361	1.1219	1.1251	1.1172	1.1197
13485	2019-05-08 00:00:00+00	263	361	1.1197	1.1214	1.1181	1.1193
13486	2019-05-07 00:00:00+00	263	361	1.1193	1.1218	1.1165	1.1198
13487	2019-05-06 00:00:00+00	263	361	1.1198	1.1209	1.1177	1.1194
13488	2019-05-05 00:00:00+00	263	361	1.1194	1.1200	1.1157	1.1165
13489	2019-05-03 00:00:00+00	263	361	1.1193	1.1205	1.1134	1.1175
13490	2019-05-02 00:00:00+00	263	361	1.1175	1.1219	1.1168	1.1203
13491	2019-05-01 00:00:00+00	263	361	1.1203	1.1265	1.1186	1.1211
13492	2019-04-30 00:00:00+00	263	361	1.1211	1.1229	1.1174	1.1184
13493	2019-04-29 00:00:00+00	263	361	1.1184	1.1187	1.1143	1.1151
13494	2019-04-28 00:00:00+00	263	361	1.1150	1.1158	1.1140	1.1154
13495	2019-04-26 00:00:00+00	263	361	1.1149	1.1174	1.1109	1.1137
13496	2019-04-25 00:00:00+00	263	361	1.1137	1.1162	1.1117	1.1158
13497	2019-04-24 00:00:00+00	263	361	1.1158	1.1224	1.1139	1.1222
13498	2019-04-23 00:00:00+00	263	361	1.1222	1.1261	1.1191	1.1260
13499	2019-04-22 00:00:00+00	263	361	1.1260	1.1262	1.1234	1.1242
13500	2019-04-21 00:00:00+00	263	361	1.1242	1.1248	1.1237	1.1244
13501	2019-04-19 00:00:00+00	263	361	1.1245	1.1248	1.1230	1.1237
13502	2019-04-18 00:00:00+00	263	361	1.1237	1.1304	1.1224	1.1298
13503	2019-04-17 00:00:00+00	263	361	1.1298	1.1324	1.1279	1.1281
13504	2019-04-16 00:00:00+00	263	361	1.1280	1.1314	1.1277	1.1302
13505	2019-04-15 00:00:00+00	263	361	1.1302	1.1321	1.1297	1.1305
13506	2019-04-14 00:00:00+00	263	361	1.1304	1.1306	1.1293	1.1299
13507	2019-04-12 00:00:00+00	263	361	1.1298	1.1324	1.1256	1.1258
13508	2019-04-11 00:00:00+00	263	361	1.1258	1.1287	1.1248	1.1276
13509	2019-04-10 00:00:00+00	263	361	1.1275	1.1288	1.1228	1.1266
13510	2019-04-09 00:00:00+00	263	361	1.1266	1.1284	1.1254	1.1257
13511	2019-04-08 00:00:00+00	263	361	1.1256	1.1275	1.1213	1.1219
13512	2019-04-07 00:00:00+00	263	361	1.1218	1.1222	1.1210	1.1218
13513	2019-04-05 00:00:00+00	263	361	1.1212	1.1247	1.1209	1.1221
13514	2019-04-04 00:00:00+00	263	361	1.1221	1.1248	1.1205	1.1242
13515	2019-04-03 00:00:00+00	263	361	1.1242	1.1255	1.1200	1.1204
13516	2019-04-02 00:00:00+00	263	361	1.1204	1.1216	1.1182	1.1206
13517	2019-04-01 00:00:00+00	263	361	1.1206	1.1250	1.1197	1.1222
13518	2019-03-31 00:00:00+00	263	361	1.1222	1.1241	1.1219	1.1224
13519	2019-03-29 00:00:00+00	263	361	1.1217	1.1247	1.1208	1.1228
13520	2019-03-28 00:00:00+00	263	361	1.1228	1.1261	1.1212	1.1249
13521	2019-03-27 00:00:00+00	263	361	1.1249	1.1286	1.1241	1.1276
13522	2019-03-26 00:00:00+00	263	361	1.1275	1.1326	1.1261	1.1314
13523	2019-03-25 00:00:00+00	263	361	1.1314	1.1332	1.1288	1.1295
13524	2019-03-24 00:00:00+00	263	361	1.1295	1.1301	1.1282	1.1284
13525	2019-03-22 00:00:00+00	263	361	1.1300	1.1391	1.1272	1.1377
13526	2019-03-21 00:00:00+00	263	361	1.1375	1.1437	1.1341	1.1421
13527	2019-03-20 00:00:00+00	263	361	1.1420	1.1448	1.1334	1.1354
13528	2019-03-19 00:00:00+00	263	361	1.1353	1.1362	1.1332	1.1335
13529	2019-03-18 00:00:00+00	263	361	1.1334	1.1359	1.1317	1.1326
13530	2019-03-17 00:00:00+00	263	361	1.1326	1.1328	1.1315	1.1323
13531	2019-03-15 00:00:00+00	263	361	1.1324	1.1344	1.1299	1.1306
13532	2019-03-14 00:00:00+00	263	361	1.1306	1.1338	1.1293	1.1337
13533	2019-03-13 00:00:00+00	263	361	1.1337	1.1339	1.1276	1.1290
13534	2019-03-12 00:00:00+00	263	361	1.1289	1.1305	1.1248	1.1263
13535	2019-03-11 00:00:00+00	263	361	1.1263	1.1274	1.1220	1.1234
13536	2019-03-10 00:00:00+00	263	361	1.1234	1.1244	1.1229	1.1238
13537	2019-03-08 00:00:00+00	263	361	1.1235	1.1246	1.1184	1.1191
13538	2019-03-07 00:00:00+00	263	361	1.1191	1.1320	1.1175	1.1308
13539	2019-03-06 00:00:00+00	263	361	1.1308	1.1325	1.1284	1.1299
13540	2019-03-05 00:00:00+00	263	361	1.1299	1.1339	1.1288	1.1335
13541	2019-03-04 00:00:00+00	263	361	1.1336	1.1381	1.1308	1.1377
13542	2019-03-03 00:00:00+00	263	361	1.1378	1.1389	1.1370	1.1370
13543	2019-03-01 00:00:00+00	263	361	1.1362	1.1409	1.1350	1.1371
13544	2019-02-28 00:00:00+00	263	361	1.1371	1.1420	1.1357	1.1372
13545	2019-02-27 00:00:00+00	263	361	1.1372	1.1404	1.1361	1.1393
13546	2019-02-26 00:00:00+00	263	361	1.1393	1.1403	1.1344	1.1359
13547	2019-02-25 00:00:00+00	263	361	1.1359	1.1368	1.1333	1.1336
13548	2019-02-24 00:00:00+00	263	361	1.1336	1.1348	1.1324	1.1331
13549	2019-02-22 00:00:00+00	263	361	1.1334	1.1356	1.1315	1.1336
13550	2019-02-21 00:00:00+00	263	361	1.1336	1.1366	1.1319	1.1345
13551	2019-02-20 00:00:00+00	263	361	1.1345	1.1371	1.1324	1.1339
13552	2019-02-19 00:00:00+00	263	361	1.1339	1.1358	1.1274	1.1310
13553	2019-02-18 00:00:00+00	263	361	1.1310	1.1334	1.1288	1.1291
13554	2019-02-17 00:00:00+00	263	361	1.1290	1.1301	1.1281	1.1286
13555	2019-02-15 00:00:00+00	263	361	1.1294	1.1306	1.1233	1.1294
13556	2019-02-14 00:00:00+00	263	361	1.1295	1.1310	1.1248	1.1257
13557	2019-02-13 00:00:00+00	263	361	1.1256	1.1342	1.1247	1.1329
13558	2019-02-12 00:00:00+00	263	361	1.1329	1.1340	1.1256	1.1277
13559	2019-02-11 00:00:00+00	263	361	1.1277	1.1330	1.1265	1.1318
13560	2019-02-10 00:00:00+00	263	361	1.1318	1.1330	1.1312	1.1326
13561	2019-02-08 00:00:00+00	263	361	1.1321	1.1351	1.1317	1.1342
13562	2019-02-07 00:00:00+00	263	361	1.1342	1.1368	1.1323	1.1366
13563	2019-02-06 00:00:00+00	263	361	1.1368	1.1409	1.1359	1.1405
13564	2019-02-05 00:00:00+00	263	361	1.1404	1.1441	1.1400	1.1435
13565	2019-02-04 00:00:00+00	263	361	1.1435	1.1460	1.1422	1.1456
13566	2019-02-03 00:00:00+00	263	361	1.1456	1.1462	1.1444	1.1462
13567	2019-02-02 00:00:00+00	263	361	1.1454	1.1454	1.1454	1.1454
13568	2019-02-01 00:00:00+00	263	361	1.1454	1.1488	1.1433	1.1446
13569	2019-01-31 00:00:00+00	263	361	1.1446	1.1514	1.1434	1.1480
13570	2019-01-30 00:00:00+00	263	361	1.1480	1.1502	1.1405	1.1435
13571	2019-01-29 00:00:00+00	263	361	1.1434	1.1450	1.1410	1.1427
13572	2019-01-28 00:00:00+00	263	361	1.1427	1.1444	1.1389	1.1409
13573	2019-01-27 00:00:00+00	263	361	1.1409	1.1411	1.1399	1.1408
13574	2019-01-25 00:00:00+00	263	361	1.1405	1.1418	1.1300	1.1301
13575	2019-01-24 00:00:00+00	263	361	1.1301	1.1391	1.1288	1.1380
13576	2019-01-23 00:00:00+00	263	361	1.1380	1.1394	1.1349	1.1363
13577	2019-01-22 00:00:00+00	263	361	1.1363	1.1374	1.1335	1.1370
13578	2019-01-21 00:00:00+00	263	361	1.1370	1.1391	1.1355	1.1365
13579	2019-01-20 00:00:00+00	263	361	1.1365	1.1368	1.1359	1.1362
13580	2019-01-18 00:00:00+00	263	361	1.1360	1.1410	1.1352	1.1387
13581	2019-01-17 00:00:00+00	263	361	1.1387	1.1407	1.1369	1.1395
13582	2019-01-16 00:00:00+00	263	361	1.1395	1.1425	1.1376	1.1406
13583	2019-01-15 00:00:00+00	263	361	1.1406	1.1490	1.1380	1.1466
13584	2019-01-14 00:00:00+00	263	361	1.1466	1.1482	1.1449	1.1465
13585	2019-01-13 00:00:00+00	263	361	1.1464	1.1466	1.1439	1.1461
13586	2019-01-11 00:00:00+00	263	361	1.1464	1.1541	1.1456	1.1497
13587	2019-01-10 00:00:00+00	263	361	1.1497	1.1570	1.1483	1.1548
13588	2019-01-09 00:00:00+00	263	361	1.1548	1.1558	1.1437	1.1440
13589	2019-01-08 00:00:00+00	263	361	1.1440	1.1485	1.1421	1.1476
13590	2019-01-07 00:00:00+00	263	361	1.1475	1.1483	1.1402	1.1405
13591	2019-01-06 00:00:00+00	263	361	1.1404	1.1407	1.1393	1.1397
13592	2019-01-04 00:00:00+00	263	361	1.1394	1.1419	1.1344	1.1393
13593	2019-01-03 00:00:00+00	263	361	1.1393	1.1411	1.1308	1.1333
13594	2019-01-02 00:00:00+00	263	361	1.1337	1.1497	1.1311	1.1461
13595	2019-01-01 00:00:00+00	263	361	1.1461	1.1545	1.1446	1.1465
13596	2018-12-31 00:00:00+00	263	361	1.1466	1.1467	1.1420	1.1439
13597	2018-12-30 00:00:00+00	263	361	1.1439	1.1450	1.1433	1.1445
13598	2018-12-28 00:00:00+00	263	361	1.1442	1.1473	1.1426	1.1429
13599	2018-12-27 00:00:00+00	263	361	1.1429	1.1454	1.1354	1.1355
13600	2018-12-26 00:00:00+00	263	361	1.1355	1.1420	1.1341	1.1411
13601	2018-12-25 00:00:00+00	263	361	1.1406	1.1418	1.1364	1.1401
13602	2018-12-24 00:00:00+00	263	361	1.1400	1.1439	1.1364	1.1368
13603	2018-12-23 00:00:00+00	263	361	1.1368	1.1387	1.1355	1.1370
13604	2018-12-21 00:00:00+00	263	361	1.1367	1.1474	1.1354	1.1449
13605	2018-12-20 00:00:00+00	263	361	1.1448	1.1486	1.1375	1.1380
13606	2018-12-19 00:00:00+00	263	361	1.1380	1.1439	1.1364	1.1370
13607	2018-12-18 00:00:00+00	263	361	1.1370	1.1402	1.1335	1.1347
13608	2018-12-17 00:00:00+00	263	361	1.1347	1.1358	1.1302	1.1305
13609	2018-12-16 00:00:00+00	263	361	1.1305	1.1308	1.1297	1.1303
13610	2018-12-14 00:00:00+00	263	361	1.1307	1.1365	1.1268	1.1357
13611	2018-12-13 00:00:00+00	263	361	1.1357	1.1393	1.1330	1.1372
13612	2018-12-12 00:00:00+00	263	361	1.1371	1.1387	1.1314	1.1319
13613	2018-12-11 00:00:00+00	263	361	1.1319	1.1400	1.1305	1.1350
13614	2018-12-10 00:00:00+00	263	361	1.1350	1.1443	1.1348	1.1398
13615	2018-12-09 00:00:00+00	263	361	1.1398	1.1402	1.1380	1.1395
13616	2018-12-07 00:00:00+00	263	361	1.1389	1.1424	1.1359	1.1377
13617	2018-12-06 00:00:00+00	263	361	1.1377	1.1413	1.1320	1.1348
13618	2018-12-05 00:00:00+00	263	361	1.1347	1.1361	1.1310	1.1340
13619	2018-12-04 00:00:00+00	263	361	1.1341	1.1419	1.1317	1.1354
13620	2018-12-03 00:00:00+00	263	361	1.1354	1.1380	1.1318	1.1332
13621	2018-12-02 00:00:00+00	263	361	1.1332	1.1367	1.1330	1.1346
13622	2018-11-30 00:00:00+00	263	361	1.1319	1.1401	1.1304	1.1388
13623	2018-11-29 00:00:00+00	263	361	1.1388	1.1402	1.1347	1.1368
13624	2018-11-28 00:00:00+00	263	361	1.1368	1.1387	1.1265	1.1294
13625	2018-11-27 00:00:00+00	263	361	1.1294	1.1344	1.1276	1.1330
13626	2018-11-26 00:00:00+00	263	361	1.1330	1.1384	1.1322	1.1336
13627	2018-11-25 00:00:00+00	263	361	1.1334	1.1348	1.1331	1.1341
13628	2018-11-23 00:00:00+00	263	361	1.1337	1.1421	1.1326	1.1403
13629	2018-11-22 00:00:00+00	263	361	1.1403	1.1434	1.1382	1.1384
13630	2018-11-21 00:00:00+00	263	361	1.1384	1.1425	1.1363	1.1366
13631	2018-11-20 00:00:00+00	263	361	1.1367	1.1472	1.1356	1.1453
13632	2018-11-19 00:00:00+00	263	361	1.1452	1.1465	1.1393	1.1416
13633	2018-11-18 00:00:00+00	263	361	1.1416	1.1420	1.1397	1.1408
13634	2018-11-16 00:00:00+00	263	361	1.1418	1.1420	1.1318	1.1323
13635	2018-11-15 00:00:00+00	263	361	1.1323	1.1362	1.1270	1.1314
13636	2018-11-14 00:00:00+00	263	361	1.1313	1.1348	1.1262	1.1299
13637	2018-11-13 00:00:00+00	263	361	1.1299	1.1300	1.1218	1.1220
13638	2018-11-12 00:00:00+00	263	361	1.1219	1.1331	1.1214	1.1317
13639	2018-11-11 00:00:00+00	263	361	1.1317	1.1332	1.1310	1.1332
13640	2018-11-09 00:00:00+00	263	361	1.1333	1.1369	1.1315	1.1364
13641	2018-11-08 00:00:00+00	263	361	1.1364	1.1447	1.1350	1.1430
13642	2018-11-07 00:00:00+00	263	361	1.1430	1.1500	1.1393	1.1419
13643	2018-11-06 00:00:00+00	263	361	1.1419	1.1438	1.1390	1.1408
13644	2018-11-05 00:00:00+00	263	361	1.1408	1.1424	1.1353	1.1391
13645	2018-11-04 00:00:00+00	263	361	1.1391	1.1407	1.1385	1.1395
13646	2018-11-02 00:00:00+00	263	361	1.1387	1.1456	1.1371	1.1404
13647	2018-11-01 00:00:00+00	263	361	1.1404	1.1424	1.1311	1.1317
13648	2018-10-31 00:00:00+00	263	361	1.1317	1.1360	1.1300	1.1343
13649	2018-10-30 00:00:00+00	263	361	1.1343	1.1388	1.1337	1.1373
13650	2018-10-29 00:00:00+00	263	361	1.1373	1.1416	1.1359	1.1404
13651	2018-10-28 00:00:00+00	263	361	1.1403	1.1409	1.1385	1.1406
13652	2018-10-26 00:00:00+00	263	361	1.1400	1.1421	1.1334	1.1374
13653	2018-10-25 00:00:00+00	263	361	1.1374	1.1433	1.1355	1.1399
13654	2018-10-24 00:00:00+00	263	361	1.1399	1.1477	1.1378	1.1469
13655	2018-10-23 00:00:00+00	263	361	1.1469	1.1494	1.1438	1.1466
13656	2018-10-22 00:00:00+00	263	361	1.1465	1.1550	1.1454	1.1512
13657	2018-10-21 00:00:00+00	263	361	1.1511	1.1518	1.1507	1.1510
13658	2018-10-19 00:00:00+00	263	361	1.1513	1.1535	1.1432	1.1456
13659	2018-10-18 00:00:00+00	263	361	1.1455	1.1527	1.1448	1.1498
13660	2018-10-17 00:00:00+00	263	361	1.1497	1.1580	1.1495	1.1574
13661	2018-10-16 00:00:00+00	263	361	1.1574	1.1622	1.1563	1.1584
13662	2018-10-15 00:00:00+00	263	361	1.1584	1.1606	1.1541	1.1551
13663	2018-10-14 00:00:00+00	263	361	1.1551	1.1563	1.1534	1.1559
13664	2018-10-12 00:00:00+00	263	361	1.1559	1.1610	1.1533	1.1592
13665	2018-10-11 00:00:00+00	263	361	1.1592	1.1599	1.1527	1.1535
13666	2018-10-10 00:00:00+00	263	361	1.1536	1.1545	1.1477	1.1495
13667	2018-10-09 00:00:00+00	263	361	1.1495	1.1503	1.1429	1.1493
13668	2018-10-08 00:00:00+00	263	361	1.1492	1.1530	1.1458	1.1525
13669	2018-10-07 00:00:00+00	263	361	1.1525	1.1533	1.1516	1.1516
13670	2018-10-05 00:00:00+00	263	361	1.1523	1.1550	1.1483	1.1516
13671	2018-10-04 00:00:00+00	263	361	1.1516	1.1543	1.1462	1.1484
13672	2018-10-03 00:00:00+00	263	361	1.1484	1.1594	1.1463	1.1551
13673	2018-10-02 00:00:00+00	263	361	1.1550	1.1580	1.1504	1.1576
13674	2018-10-01 00:00:00+00	263	361	1.1575	1.1625	1.1562	1.1605
13675	2018-09-30 00:00:00+00	263	361	1.1604	1.1627	1.1601	1.1607
13676	2018-09-28 00:00:00+00	263	361	1.1600	1.1651	1.1569	1.1634
13677	2018-09-27 00:00:00+00	263	361	1.1635	1.1757	1.1632	1.1749
13678	2018-09-26 00:00:00+00	263	361	1.1749	1.1798	1.1725	1.1766
13679	2018-09-25 00:00:00+00	263	361	1.1766	1.1792	1.1730	1.1749
13680	2018-09-24 00:00:00+00	263	361	1.1750	1.1815	1.1722	1.1746
13681	2018-09-23 00:00:00+00	263	361	1.1746	1.1752	1.1737	1.1749
13682	2018-09-21 00:00:00+00	263	361	1.1747	1.1803	1.1731	1.1779
13683	2018-09-20 00:00:00+00	263	361	1.1779	1.1784	1.1668	1.1671
13684	2018-09-19 00:00:00+00	263	361	1.1671	1.1715	1.1649	1.1679
13685	2018-09-18 00:00:00+00	263	361	1.1679	1.1724	1.1651	1.1671
13686	2018-09-17 00:00:00+00	263	361	1.1670	1.1698	1.1617	1.1625
13687	2018-09-16 00:00:00+00	263	361	1.1625	1.1632	1.1616	1.1620
13688	2018-09-14 00:00:00+00	263	361	1.1625	1.1722	1.1619	1.1690
13689	2018-09-13 00:00:00+00	263	361	1.1690	1.1701	1.1607	1.1628
13690	2018-09-12 00:00:00+00	263	361	1.1627	1.1650	1.1568	1.1602
13691	2018-09-11 00:00:00+00	263	361	1.1602	1.1644	1.1564	1.1594
13692	2018-09-10 00:00:00+00	263	361	1.1594	1.1616	1.1525	1.1555
13693	2018-09-09 00:00:00+00	263	361	1.1555	1.1560	1.1546	1.1549
13694	2018-09-07 00:00:00+00	263	361	1.1552	1.1649	1.1549	1.1624
13695	2018-09-06 00:00:00+00	263	361	1.1624	1.1659	1.1604	1.1632
13696	2018-09-05 00:00:00+00	263	361	1.1632	1.1640	1.1542	1.1583
13697	2018-09-04 00:00:00+00	263	361	1.1583	1.1618	1.1529	1.1617
13698	2018-09-03 00:00:00+00	263	361	1.1617	1.1628	1.1588	1.1597
13699	2018-09-02 00:00:00+00	263	361	1.1597	1.1608	1.1587	1.1595
13700	2018-08-31 00:00:00+00	263	361	1.1599	1.1690	1.1583	1.1663
13701	2018-08-30 00:00:00+00	263	361	1.1663	1.1718	1.1639	1.1706
13702	2018-08-29 00:00:00+00	263	361	1.1706	1.1710	1.1651	1.1695
13703	2018-08-28 00:00:00+00	263	361	1.1693	1.1733	1.1661	1.1681
13704	2018-08-27 00:00:00+00	263	361	1.1680	1.1694	1.1593	1.1628
13705	2018-08-26 00:00:00+00	263	361	1.1628	1.1630	1.1610	1.1630
13706	2018-08-24 00:00:00+00	263	361	1.1621	1.1640	1.1537	1.1540
13707	2018-08-23 00:00:00+00	263	361	1.1540	1.1598	1.1528	1.1597
13708	2018-08-22 00:00:00+00	263	361	1.1597	1.1623	1.1552	1.1574
13709	2018-08-21 00:00:00+00	263	361	1.1574	1.1601	1.1484	1.1492
13710	2018-08-20 00:00:00+00	263	361	1.1492	1.1492	1.1393	1.1438
13711	2018-08-19 00:00:00+00	263	361	1.1438	1.1441	1.1431	1.1436
13712	2018-08-17 00:00:00+00	263	361	1.1437	1.1445	1.1364	1.1374
13713	2018-08-16 00:00:00+00	263	361	1.1374	1.1409	1.1334	1.1345
13714	2018-08-15 00:00:00+00	263	361	1.1345	1.1355	1.1300	1.1350
13715	2018-08-14 00:00:00+00	263	361	1.1350	1.1429	1.1329	1.1405
13716	2018-08-13 00:00:00+00	263	361	1.1405	1.1433	1.1364	1.1398
13717	2018-08-12 00:00:00+00	263	361	1.1398	1.1400	1.1367	1.1386
13718	2018-08-10 00:00:00+00	263	361	1.1412	1.1537	1.1386	1.1521
13719	2018-08-09 00:00:00+00	263	361	1.1520	1.1620	1.1518	1.1612
13720	2018-08-08 00:00:00+00	263	361	1.1612	1.1628	1.1571	1.1600
13721	2018-08-07 00:00:00+00	263	361	1.1600	1.1608	1.1549	1.1556
13722	2018-08-06 00:00:00+00	263	361	1.1556	1.1570	1.1528	1.1561
13723	2018-08-05 00:00:00+00	263	361	1.1561	1.1572	1.1559	1.1565
13724	2018-08-03 00:00:00+00	263	361	1.1565	1.1611	1.1559	1.1586
13725	2018-08-02 00:00:00+00	263	361	1.1585	1.1668	1.1580	1.1663
13726	2018-08-01 00:00:00+00	263	361	1.1663	1.1700	1.1656	1.1686
13727	2018-07-31 00:00:00+00	263	361	1.1686	1.1746	1.1682	1.1708
13728	2018-07-30 00:00:00+00	263	361	1.1708	1.1720	1.1646	1.1660
13729	2018-07-29 00:00:00+00	263	361	1.1660	1.1662	1.1650	1.1657
13730	2018-07-27 00:00:00+00	263	361	1.1659	1.1664	1.1619	1.1641
13731	2018-07-26 00:00:00+00	263	361	1.1641	1.1744	1.1636	1.1731
13732	2018-07-25 00:00:00+00	263	361	1.1731	1.1739	1.1663	1.1682
13733	2018-07-24 00:00:00+00	263	361	1.1682	1.1717	1.1653	1.1691
13734	2018-07-23 00:00:00+00	263	361	1.1691	1.1751	1.1682	1.1734
13735	2018-07-22 00:00:00+00	263	361	1.1734	1.1735	1.1720	1.1722
13736	2018-07-20 00:00:00+00	263	361	1.1718	1.1739	1.1625	1.1645
13737	2018-07-19 00:00:00+00	263	361	1.1644	1.1679	1.1574	1.1643
13738	2018-07-18 00:00:00+00	263	361	1.1643	1.1665	1.1600	1.1658
13739	2018-07-17 00:00:00+00	263	361	1.1658	1.1745	1.1649	1.1710
13740	2018-07-16 00:00:00+00	263	361	1.1710	1.1725	1.1674	1.1683
13741	2018-07-15 00:00:00+00	263	361	1.1683	1.1692	1.1677	1.1682
13742	2018-07-13 00:00:00+00	263	361	1.1684	1.1687	1.1611	1.1664
13743	2018-07-12 00:00:00+00	263	361	1.1664	1.1696	1.1648	1.1676
13744	2018-07-11 00:00:00+00	263	361	1.1676	1.1760	1.1664	1.1736
13745	2018-07-10 00:00:00+00	263	361	1.1736	1.1763	1.1689	1.1750
13746	2018-07-09 00:00:00+00	263	361	1.1749	1.1791	1.1731	1.1750
13747	2018-07-08 00:00:00+00	263	361	1.1750	1.1754	1.1735	1.1743
13748	2018-07-06 00:00:00+00	263	361	1.1746	1.1768	1.1679	1.1691
13749	2018-07-05 00:00:00+00	263	361	1.1691	1.1720	1.1648	1.1659
13750	2018-07-04 00:00:00+00	263	361	1.1659	1.1682	1.1628	1.1660
13751	2018-07-03 00:00:00+00	263	361	1.1659	1.1673	1.1619	1.1640
13752	2018-07-02 00:00:00+00	263	361	1.1639	1.1682	1.1590	1.1674
13753	2018-07-01 00:00:00+00	263	361	1.1674	1.1691	1.1629	1.1651
13754	2018-06-29 00:00:00+00	263	361	1.1684	1.1690	1.1560	1.1564
13755	2018-06-28 00:00:00+00	263	361	1.1564	1.1601	1.1526	1.1559
13756	2018-06-27 00:00:00+00	263	361	1.1560	1.1672	1.1539	1.1650
13757	2018-06-26 00:00:00+00	263	361	1.1650	1.1721	1.1634	1.1702
13758	2018-06-25 00:00:00+00	263	361	1.1702	1.1713	1.1627	1.1669
13759	2018-06-24 00:00:00+00	263	361	1.1669	1.1669	1.1654	1.1657
13760	2018-06-22 00:00:00+00	263	361	1.1654	1.1675	1.1598	1.1610
13761	2018-06-21 00:00:00+00	263	361	1.1609	1.1634	1.1507	1.1575
13762	2018-06-20 00:00:00+00	263	361	1.1577	1.1600	1.1536	1.1588
13763	2018-06-19 00:00:00+00	263	361	1.1588	1.1644	1.1530	1.1621
13764	2018-06-18 00:00:00+00	263	361	1.1621	1.1627	1.1564	1.1595
13765	2018-06-17 00:00:00+00	263	361	1.1595	1.1610	1.1583	1.1606
13766	2018-06-15 00:00:00+00	263	361	1.1609	1.1627	1.1542	1.1583
13767	2018-06-14 00:00:00+00	263	361	1.1582	1.1852	1.1562	1.1799
13768	2018-06-13 00:00:00+00	263	361	1.1799	1.1803	1.1725	1.1746
13769	2018-06-12 00:00:00+00	263	361	1.1746	1.1810	1.1732	1.1775
13770	2018-06-11 00:00:00+00	263	361	1.1775	1.1821	1.1769	1.1771
13771	2018-06-10 00:00:00+00	263	361	1.1771	1.1777	1.1752	1.1764
13772	2018-06-08 00:00:00+00	263	361	1.1768	1.1810	1.1725	1.1797
13773	2018-06-07 00:00:00+00	263	361	1.1797	1.1840	1.1777	1.1782
13774	2018-06-06 00:00:00+00	263	361	1.1782	1.1796	1.1711	1.1720
13775	2018-06-05 00:00:00+00	263	361	1.1720	1.1732	1.1651	1.1699
13776	2018-06-04 00:00:00+00	263	361	1.1699	1.1744	1.1661	1.1662
13777	2018-06-03 00:00:00+00	263	361	1.1662	1.1669	1.1651	1.1654
13778	2018-06-01 00:00:00+00	263	361	1.1659	1.1718	1.1616	1.1705
13779	2018-05-31 00:00:00+00	263	361	1.1705	1.1724	1.1640	1.1665
13780	2018-05-30 00:00:00+00	263	361	1.1664	1.1676	1.1517	1.1541
13781	2018-05-29 00:00:00+00	263	361	1.1541	1.1640	1.1509	1.1626
13782	2018-05-28 00:00:00+00	263	361	1.1626	1.1730	1.1605	1.1689
13783	2018-05-27 00:00:00+00	263	361	1.1689	1.1691	1.1648	1.1654
13784	2018-05-25 00:00:00+00	263	361	1.1650	1.1734	1.1644	1.1721
13785	2018-05-24 00:00:00+00	263	361	1.1721	1.1750	1.1689	1.1705
13786	2018-05-23 00:00:00+00	263	361	1.1704	1.1790	1.1674	1.1782
13787	2018-05-22 00:00:00+00	263	361	1.1782	1.1830	1.1755	1.1795
13788	2018-05-21 00:00:00+00	263	361	1.1795	1.1797	1.1715	1.1766
13789	2018-05-20 00:00:00+00	263	361	1.1766	1.1779	1.1760	1.1760
13790	2018-05-18 00:00:00+00	263	361	1.1770	1.1822	1.1749	1.1797
13791	2018-05-17 00:00:00+00	263	361	1.1797	1.1837	1.1775	1.1816
13792	2018-05-16 00:00:00+00	263	361	1.1815	1.1854	1.1762	1.1818
13793	2018-05-15 00:00:00+00	263	361	1.1818	1.1940	1.1816	1.1928
13794	2018-05-14 00:00:00+00	263	361	1.1928	1.1996	1.1920	1.1947
13795	2018-05-13 00:00:00+00	263	361	1.1947	1.1950	1.1937	1.1944
13796	2018-05-11 00:00:00+00	263	361	1.1942	1.1970	1.1890	1.1918
13797	2018-05-10 00:00:00+00	263	361	1.1918	1.1947	1.1842	1.1853
13798	2018-05-09 00:00:00+00	263	361	1.1853	1.1897	1.1821	1.1859
13799	2018-05-08 00:00:00+00	263	361	1.1860	1.1939	1.1837	1.1922
13800	2018-05-07 00:00:00+00	263	361	1.1922	1.1978	1.1896	1.1960
13801	2018-05-06 00:00:00+00	263	361	1.1960	1.1966	1.1946	1.1952
13802	2018-05-04 00:00:00+00	263	361	1.1959	1.1996	1.1909	1.1986
13803	2018-05-03 00:00:00+00	263	361	1.1986	1.2010	1.1946	1.1954
13804	2018-05-02 00:00:00+00	263	361	1.1954	1.2032	1.1936	1.1989
13805	2018-05-01 00:00:00+00	263	361	1.1989	1.2084	1.1979	1.2081
13806	2018-04-30 00:00:00+00	263	361	1.2081	1.2140	1.2062	1.2121
13807	2018-04-29 00:00:00+00	263	361	1.2121	1.2130	1.2117	1.2125
13808	2018-04-27 00:00:00+00	263	361	1.2125	1.2133	1.2053	1.2104
13809	2018-04-26 00:00:00+00	263	361	1.2104	1.2210	1.2093	1.2169
13810	2018-04-25 00:00:00+00	263	361	1.2169	1.2239	1.2158	1.2233
13811	2018-04-24 00:00:00+00	263	361	1.2233	1.2245	1.2180	1.2210
13812	2018-04-23 00:00:00+00	263	361	1.2210	1.2290	1.2196	1.2280
13813	2018-04-22 00:00:00+00	263	361	1.2279	1.2288	1.2263	1.2286
13814	2018-04-20 00:00:00+00	263	361	1.2286	1.2353	1.2249	1.2342
13815	2018-04-19 00:00:00+00	263	361	1.2342	1.2400	1.2328	1.2379
13816	2018-04-18 00:00:00+00	263	361	1.2379	1.2397	1.2341	1.2372
13817	2018-04-17 00:00:00+00	263	361	1.2372	1.2414	1.2335	1.2382
13818	2018-04-16 00:00:00+00	263	361	1.2381	1.2395	1.2323	1.2329
13819	2018-04-15 00:00:00+00	263	361	1.2328	1.2337	1.2321	1.2327
13820	2018-04-13 00:00:00+00	263	361	1.2328	1.2346	1.2306	1.2329
13821	2018-04-12 00:00:00+00	263	361	1.2329	1.2380	1.2298	1.2370
13822	2018-04-11 00:00:00+00	263	361	1.2370	1.2396	1.2346	1.2357
13823	2018-04-10 00:00:00+00	263	361	1.2356	1.2378	1.2301	1.2322
13824	2018-04-09 00:00:00+00	263	361	1.2321	1.2331	1.2259	1.2274
13825	2018-04-08 00:00:00+00	263	361	1.2274	1.2287	1.2271	1.2278
13826	2018-04-06 00:00:00+00	263	361	1.2283	1.2291	1.2214	1.2244
13827	2018-04-05 00:00:00+00	263	361	1.2244	1.2290	1.2217	1.2285
13828	2018-04-04 00:00:00+00	263	361	1.2285	1.2315	1.2255	1.2272
13829	2018-04-03 00:00:00+00	263	361	1.2272	1.2336	1.2252	1.2301
13830	2018-04-02 00:00:00+00	263	361	1.2301	1.2345	1.2281	1.2317
13831	2018-04-01 00:00:00+00	263	361	1.2317	1.2330	1.2312	1.2321
13832	2018-03-30 00:00:00+00	263	361	1.2323	1.2331	1.2289	1.2304
13833	2018-03-29 00:00:00+00	263	361	1.2303	1.2336	1.2282	1.2309
13834	2018-03-28 00:00:00+00	263	361	1.2309	1.2422	1.2298	1.2406
13835	2018-03-27 00:00:00+00	263	361	1.2406	1.2476	1.2371	1.2451
13836	2018-03-26 00:00:00+00	263	361	1.2451	1.2462	1.2350	1.2367
13837	2018-03-25 00:00:00+00	263	361	1.2367	1.2367	1.2341	1.2348
13838	2018-03-23 00:00:00+00	263	361	1.2352	1.2373	1.2315	1.2320
13839	2018-03-22 00:00:00+00	263	361	1.2319	1.2390	1.2284	1.2342
13840	2018-03-21 00:00:00+00	263	361	1.2342	1.2350	1.2242	1.2245
13841	2018-03-20 00:00:00+00	263	361	1.2245	1.2355	1.2237	1.2335
13842	2018-03-19 00:00:00+00	263	361	1.2335	1.2359	1.2257	1.2285
13843	2018-03-18 00:00:00+00	263	361	1.2285	1.2300	1.2280	1.2283
13844	2018-03-16 00:00:00+00	263	361	1.2285	1.2336	1.2259	1.2306
13845	2018-03-15 00:00:00+00	263	361	1.2306	1.2384	1.2299	1.2368
13846	2018-03-14 00:00:00+00	263	361	1.2368	1.2413	1.2346	1.2393
13847	2018-03-13 00:00:00+00	263	361	1.2392	1.2410	1.2313	1.2333
13848	2018-03-12 00:00:00+00	263	361	1.2333	1.2346	1.2289	1.2310
13849	2018-03-11 00:00:00+00	263	361	1.2310	1.2315	1.2305	1.2308
13850	2018-03-10 00:00:00+00	263	361	1.2305	1.2305	1.2305	1.2305
13851	2018-03-09 00:00:00+00	263	361	1.2305	1.2334	1.2272	1.2312
13852	2018-03-08 00:00:00+00	263	361	1.2313	1.2446	1.2297	1.2410
13853	2018-03-07 00:00:00+00	263	361	1.2410	1.2445	1.2383	1.2421
13854	2018-03-06 00:00:00+00	263	361	1.2421	1.2424	1.2327	1.2335
13855	2018-03-05 00:00:00+00	263	361	1.2334	1.2350	1.2267	1.2345
13856	2018-03-04 00:00:00+00	263	361	1.2346	1.2364	1.2318	1.2322
13857	2018-03-02 00:00:00+00	263	361	1.2317	1.2336	1.2250	1.2274
13858	2018-03-01 00:00:00+00	263	361	1.2274	1.2275	1.2153	1.2192
13859	2018-02-28 00:00:00+00	263	361	1.2192	1.2242	1.2186	1.2235
13860	2018-02-27 00:00:00+00	263	361	1.2235	1.2346	1.2220	1.2312
13861	2018-02-26 00:00:00+00	263	361	1.2312	1.2355	1.2276	1.2288
13862	2018-02-25 00:00:00+00	263	361	1.2288	1.2301	1.2281	1.2295
13863	2018-02-23 00:00:00+00	263	361	1.2294	1.2337	1.2278	1.2330
13864	2018-02-22 00:00:00+00	263	361	1.2330	1.2352	1.2258	1.2275
13865	2018-02-21 00:00:00+00	263	361	1.2275	1.2360	1.2272	1.2335
13866	2018-02-20 00:00:00+00	263	361	1.2333	1.2412	1.2319	1.2406
13867	2018-02-19 00:00:00+00	263	361	1.2406	1.2435	1.2367	1.2415
13868	2018-02-18 00:00:00+00	263	361	1.2414	1.2416	1.2394	1.2404
13869	2018-02-16 00:00:00+00	263	361	1.2411	1.2556	1.2392	1.2500
13870	2018-02-15 00:00:00+00	263	361	1.2500	1.2510	1.2446	1.2454
13871	2018-02-14 00:00:00+00	263	361	1.2454	1.2465	1.2275	1.2350
13872	2018-02-13 00:00:00+00	263	361	1.2350	1.2371	1.2283	1.2291
13873	2018-02-12 00:00:00+00	263	361	1.2291	1.2298	1.2233	1.2252
13874	2018-02-11 00:00:00+00	263	361	1.2252	1.2254	1.2239	1.2252
13875	2018-02-09 00:00:00+00	263	361	1.2251	1.2287	1.2204	1.2247
13876	2018-02-08 00:00:00+00	263	361	1.2247	1.2295	1.2210	1.2254
13877	2018-02-07 00:00:00+00	263	361	1.2253	1.2406	1.2244	1.2380
13878	2018-02-06 00:00:00+00	263	361	1.2380	1.2435	1.2312	1.2375
13879	2018-02-05 00:00:00+00	263	361	1.2375	1.2475	1.2362	1.2431
13880	2018-02-04 00:00:00+00	263	361	1.2431	1.2459	1.2423	1.2452
13881	2018-02-02 00:00:00+00	263	361	1.2457	1.2520	1.2408	1.2505
13882	2018-02-01 00:00:00+00	263	361	1.2505	1.2523	1.2384	1.2412
13883	2018-01-31 00:00:00+00	263	361	1.2412	1.2475	1.2386	1.2405
13884	2018-01-30 00:00:00+00	263	361	1.2404	1.2454	1.2334	1.2383
13885	2018-01-29 00:00:00+00	263	361	1.2382	1.2432	1.2335	1.2415
13886	2018-01-28 00:00:00+00	263	361	1.2415	1.2434	1.2411	1.2427
13887	2018-01-26 00:00:00+00	263	361	1.2422	1.2494	1.2372	1.2372
13888	2018-01-25 00:00:00+00	263	361	1.2371	1.2538	1.2363	1.2404
13889	2018-01-24 00:00:00+00	263	361	1.2403	1.2415	1.2290	1.2297
13890	2018-01-23 00:00:00+00	263	361	1.2297	1.2306	1.2222	1.2260
13891	2018-01-22 00:00:00+00	263	361	1.2260	1.2267	1.2213	1.2259
13892	2018-01-21 00:00:00+00	263	361	1.2257	1.2274	1.2254	1.2261
13893	2018-01-19 00:00:00+00	263	361	1.2220	1.2295	1.2213	1.2240
13894	2018-01-18 00:00:00+00	263	361	1.2240	1.2265	1.2164	1.2165
13895	2018-01-17 00:00:00+00	263	361	1.2165	1.2323	1.2164	1.2256
13896	2018-01-16 00:00:00+00	263	361	1.2255	1.2284	1.2194	1.2264
13897	2018-01-15 00:00:00+00	263	361	1.2264	1.2297	1.2186	1.2203
13898	2018-01-14 00:00:00+00	263	361	1.2201	1.2208	1.2186	1.2198
13899	2018-01-12 00:00:00+00	263	361	1.2199	1.2219	1.2029	1.2038
13900	2018-01-11 00:00:00+00	263	361	1.2038	1.2060	1.1928	1.1949
13901	2018-01-10 00:00:00+00	263	361	1.1949	1.2018	1.1922	1.1936
13902	2018-01-09 00:00:00+00	263	361	1.1935	1.1976	1.1914	1.1968
13903	2018-01-08 00:00:00+00	263	361	1.1968	1.2052	1.1954	1.2031
13904	2018-01-07 00:00:00+00	263	361	1.2031	1.2036	1.2014	1.2027
13905	2018-01-05 00:00:00+00	263	361	1.2026	1.2083	1.2019	1.2072
13906	2018-01-04 00:00:00+00	263	361	1.2071	1.2090	1.2003	1.2009
13907	2018-01-03 00:00:00+00	263	361	1.2010	1.2066	1.2000	1.2057
13908	2018-01-02 00:00:00+00	263	361	1.2057	1.2081	1.2001	1.2014
13909	2018-01-01 00:00:00+00	263	361	1.2014	1.2017	1.1991	1.2002
55584	2019-12-27 00:20:00+00	288	266	0.0070	0.0070	0.0070	0.0070
13911	2019-11-07 00:00:00+00	263	355	6.3499	6.3834	6.3346	6.3650
13912	2019-11-06 00:00:00+00	263	355	6.3716	6.3980	6.3567	6.3730
13913	2019-11-05 00:00:00+00	263	355	6.3673	6.4010	6.3596	6.3809
13914	2019-11-04 00:00:00+00	263	355	6.3772	6.3981	6.3392	6.3683
13915	2019-11-03 00:00:00+00	263	355	6.3671	6.3818	6.3541	6.3776
13916	2019-11-01 00:00:00+00	263	355	6.3644	6.4039	6.3530	6.3664
13917	2019-10-31 00:00:00+00	263	355	6.3664	6.3919	6.3553	6.3610
13918	2019-10-30 00:00:00+00	263	355	6.3587	6.4157	6.3305	6.3900
13919	2019-10-29 00:00:00+00	263	355	6.3889	6.3930	6.3236	6.3614
13920	2019-10-28 00:00:00+00	263	355	6.3614	6.3993	6.3342	6.3840
13921	2019-10-27 00:00:00+00	263	355	6.3882	6.4010	6.3677	6.4010
13922	2019-10-25 00:00:00+00	263	355	6.3983	6.4357	6.3656	6.4042
13923	2019-10-24 00:00:00+00	263	355	6.4040	6.4344	6.3826	6.3931
13924	2019-10-23 00:00:00+00	263	355	6.3922	6.4669	6.3622	6.4524
13925	2019-10-22 00:00:00+00	263	355	6.4501	6.5375	6.4383	6.5363
13926	2019-10-21 00:00:00+00	263	355	6.5358	6.5420	6.4302	6.4650
13927	2019-10-20 00:00:00+00	263	355	6.4648	6.4802	6.3892	6.3935
13928	2019-10-18 00:00:00+00	263	355	6.4775	6.4848	6.4018	6.4677
13929	2019-10-17 00:00:00+00	263	355	6.4676	6.6044	6.4459	6.5171
13930	2019-10-16 00:00:00+00	263	355	6.5169	6.5506	6.4843	6.5357
13931	2019-10-15 00:00:00+00	263	355	6.5348	6.5446	6.4556	6.5338
13932	2019-10-14 00:00:00+00	263	355	6.5338	6.5522	6.4842	6.5042
13933	2019-10-13 00:00:00+00	263	355	6.5057	6.5096	6.4801	6.4801
13934	2019-10-11 00:00:00+00	263	355	6.4941	6.5160	6.4130	6.4333
13935	2019-10-10 00:00:00+00	263	355	6.4333	6.5163	6.4073	6.4642
13936	2019-10-09 00:00:00+00	263	355	6.4643	6.4653	6.3814	6.3925
13937	2019-10-08 00:00:00+00	263	355	6.3915	6.4259	6.3541	6.4088
13938	2019-10-07 00:00:00+00	263	355	6.4089	6.4159	6.2563	6.2735
13939	2019-10-06 00:00:00+00	263	355	6.2726	6.2806	6.2363	6.2558
13940	2019-10-04 00:00:00+00	263	355	6.2559	6.2691	6.2137	6.2474
13941	2019-10-03 00:00:00+00	263	355	6.2459	6.2745	6.2095	6.2549
13942	2019-10-02 00:00:00+00	263	355	6.2529	6.2840	6.2346	6.2543
13943	2019-10-01 00:00:00+00	263	355	6.2543	6.2664	6.1494	6.1567
13944	2019-09-30 00:00:00+00	263	355	6.1548	6.2095	6.1446	6.1993
13945	2019-09-29 00:00:00+00	263	355	6.1993	6.2088	6.1726	6.1985
13946	2019-09-27 00:00:00+00	263	355	6.2034	6.2210	6.1582	6.1897
13947	2019-09-26 00:00:00+00	263	355	6.1907	6.2453	6.1760	6.2153
13948	2019-09-25 00:00:00+00	263	355	6.2154	6.2842	6.2016	6.2782
13949	2019-09-24 00:00:00+00	263	355	6.2778	6.2911	6.2318	6.2890
13950	2019-09-23 00:00:00+00	263	355	6.2860	6.3301	6.2681	6.3230
13951	2019-09-22 00:00:00+00	263	355	6.3210	6.3296	6.2824	6.3139
13952	2019-09-21 00:00:00+00	263	355	6.3222	6.3222	6.3222	6.3222
13953	2019-09-20 00:00:00+00	263	355	6.3247	6.3344	6.2754	6.3140
13954	2019-09-19 00:00:00+00	263	355	6.3149	6.3295	6.2605	6.2659
13955	2019-09-18 00:00:00+00	263	355	6.2678	6.3174	6.2508	6.3110
13956	2019-09-17 00:00:00+00	263	355	6.3125	6.3265	6.2822	6.3069
13957	2019-09-16 00:00:00+00	263	355	6.3036	6.3603	6.2728	6.3433
13958	2019-09-15 00:00:00+00	263	355	6.3431	6.3462	6.3000	6.3207
13959	2019-09-13 00:00:00+00	263	355	6.2950	6.3164	6.2475	6.2605
13960	2019-09-12 00:00:00+00	263	355	6.2585	6.3600	6.1965	6.3345
13961	2019-09-11 00:00:00+00	263	355	6.3331	6.4005	6.3132	6.3764
13962	2019-09-10 00:00:00+00	263	355	6.3767	6.3940	6.3398	6.3483
13963	2019-09-09 00:00:00+00	263	355	6.3483	6.3764	6.2789	6.2906
13964	2019-09-08 00:00:00+00	263	355	6.2926	6.3640	6.2760	6.3640
13965	2019-09-06 00:00:00+00	263	355	6.2987	6.3304	6.2736	6.2819
13966	2019-09-05 00:00:00+00	263	355	6.2851	6.3129	6.2297	6.2625
13967	2019-09-04 00:00:00+00	263	355	6.2700	6.2943	6.2073	6.2875
13968	2019-09-03 00:00:00+00	263	355	6.2850	6.3728	6.2735	6.3666
13969	2019-09-02 00:00:00+00	263	355	6.3689	6.4210	6.3611	6.4145
13970	2019-09-01 00:00:00+00	263	355	6.4164	6.4203	6.3917	6.4061
13971	2019-08-30 00:00:00+00	263	355	6.4084	6.4597	6.3762	6.4595
13972	2019-08-29 00:00:00+00	263	355	6.4560	6.4832	6.4364	6.4472
13973	2019-08-28 00:00:00+00	263	355	6.4455	6.4877	6.4186	6.4630
13974	2019-08-27 00:00:00+00	263	355	6.4755	6.5083	6.4415	6.4625
13975	2019-08-26 00:00:00+00	263	355	6.4648	6.5049	6.4246	6.4696
13976	2019-08-25 00:00:00+00	263	355	6.4681	7.1036	6.4117	6.4156
13977	2019-08-23 00:00:00+00	263	355	6.4183	6.4373	6.3595	6.3937
13978	2019-08-22 00:00:00+00	263	355	6.3972	6.4382	6.3328	6.3420
13979	2019-08-21 00:00:00+00	263	355	6.3470	6.3679	6.3274	6.3625
13980	2019-08-20 00:00:00+00	263	355	6.3593	6.3771	6.2501	6.2611
13981	2019-08-19 00:00:00+00	263	355	6.2598	6.2977	6.1699	6.1943
13982	2019-08-18 00:00:00+00	263	355	6.1948	6.2074	6.1759	6.2019
13983	2019-08-16 00:00:00+00	263	355	6.1865	6.1990	6.1224	6.1880
13984	2019-08-15 00:00:00+00	263	355	6.1888	6.2631	6.1707	6.2627
13985	2019-08-14 00:00:00+00	263	355	6.2548	6.2783	6.2136	6.2192
13986	2019-08-13 00:00:00+00	263	355	6.2213	6.3241	6.1925	6.2378
13987	2019-08-12 00:00:00+00	263	355	6.2344	6.2475	6.1246	6.1488
13988	2019-08-11 00:00:00+00	263	355	6.1480	6.1579	6.1148	6.1530
13989	2019-08-09 00:00:00+00	263	355	6.1692	6.1840	6.1106	6.1342
13990	2019-08-08 00:00:00+00	263	355	6.1341	6.1955	6.1042	6.1495
13991	2019-08-07 00:00:00+00	263	355	6.1659	6.2077	6.1141	6.1929
13992	2019-08-06 00:00:00+00	263	355	6.1941	6.2916	6.1589	6.2716
13993	2019-08-05 00:00:00+00	263	355	6.2681	6.2777	6.1579	6.1688
13994	2019-08-04 00:00:00+00	263	355	6.1688	6.1915	6.1334	6.1887
13995	2019-08-02 00:00:00+00	263	355	6.1758	6.2254	6.1501	6.2097
13996	2019-08-01 00:00:00+00	263	355	6.2094	6.2480	6.1451	6.1807
13997	2019-07-31 00:00:00+00	263	355	6.1893	6.2261	6.1342	6.2004
13998	2019-07-30 00:00:00+00	263	355	6.2019	6.2672	6.1873	6.2649
13999	2019-07-29 00:00:00+00	263	355	6.2646	6.3120	6.2256	6.3016
14000	2019-07-28 00:00:00+00	263	355	6.2948	6.3076	6.2572	6.3058
14001	2019-07-26 00:00:00+00	263	355	6.3114	6.3646	6.2495	6.3558
14002	2019-07-25 00:00:00+00	263	355	6.3513	6.4426	6.2812	6.3661
14003	2019-07-24 00:00:00+00	263	355	6.3741	6.3919	6.3363	6.3680
14004	2019-07-23 00:00:00+00	263	355	6.3687	6.3857	6.3427	6.3598
14005	2019-07-22 00:00:00+00	263	355	6.3598	6.3888	6.3166	6.3369
14006	2019-07-21 00:00:00+00	263	355	6.3439	6.3540	6.3005	6.3185
14007	2019-07-19 00:00:00+00	263	355	6.3443	6.3744	6.2966	6.3201
14008	2019-07-18 00:00:00+00	263	355	6.3262	6.4269	6.3034	6.3892
14009	2019-07-17 00:00:00+00	263	355	6.3891	6.4133	6.3669	6.3987
14010	2019-07-16 00:00:00+00	263	355	6.3987	6.4493	6.3882	6.4280
14011	2019-07-15 00:00:00+00	263	355	6.4280	6.4625	6.4175	6.4574
14012	2019-07-14 00:00:00+00	263	355	6.4570	6.4692	6.4241	6.4267
14013	2019-07-12 00:00:00+00	263	355	6.4438	6.4989	6.3838	6.3929
14014	2019-07-11 00:00:00+00	263	355	6.3942	6.4307	6.3725	6.4159
14015	2019-07-10 00:00:00+00	263	355	6.4139	6.4629	6.3737	6.4262
14016	2019-07-09 00:00:00+00	263	355	6.4265	6.4477	6.3664	6.4304
14017	2019-07-08 00:00:00+00	263	355	6.4312	6.4970	6.4063	6.4410
14018	2019-07-07 00:00:00+00	263	355	6.4428	6.5364	6.3171	6.4844
14019	2019-07-05 00:00:00+00	263	355	6.3152	6.3511	6.2787	6.3242
14020	2019-07-04 00:00:00+00	263	355	6.3243	6.3593	6.2912	6.3471
14021	2019-07-03 00:00:00+00	263	355	6.3555	6.3949	6.3217	6.3834
14022	2019-07-02 00:00:00+00	263	355	6.3813	6.4437	6.3594	6.3842
14023	2019-07-01 00:00:00+00	263	355	6.3819	6.5301	6.3638	6.5175
14024	2019-06-30 00:00:00+00	263	355	6.5152	6.5298	6.4943	6.5298
14025	2019-06-28 00:00:00+00	263	355	6.5832	6.6033	6.5458	6.5708
14026	2019-06-27 00:00:00+00	263	355	6.5641	6.5991	6.5501	6.5718
14027	2019-06-26 00:00:00+00	263	355	6.5724	6.6079	6.5353	6.5868
14028	2019-06-25 00:00:00+00	263	355	6.5869	6.6492	6.5544	6.6143
14029	2019-06-24 00:00:00+00	263	355	6.6125	6.6412	6.4982	6.5616
14030	2019-06-23 00:00:00+00	263	355	6.5599	6.6198	6.4768	6.6107
14031	2019-06-21 00:00:00+00	263	355	6.6197	6.6301	6.5004	6.5084
14032	2019-06-20 00:00:00+00	263	355	6.5067	6.7240	6.4709	6.5181
14033	2019-06-19 00:00:00+00	263	355	6.5169	6.6261	6.4891	6.5272
14034	2019-06-18 00:00:00+00	263	355	6.5234	6.6086	6.5107	6.5902
14035	2019-06-17 00:00:00+00	263	355	6.5902	6.6530	6.5738	6.6303
14036	2019-06-16 00:00:00+00	263	355	6.6312	6.6402	6.5842	6.5842
14037	2019-06-14 00:00:00+00	263	355	6.6082	6.6996	6.5727	6.6174
14038	2019-06-13 00:00:00+00	263	355	6.6167	6.6709	6.5579	6.5680
14039	2019-06-12 00:00:00+00	263	355	6.5668	6.6143	6.5353	6.5785
14040	2019-06-11 00:00:00+00	263	355	6.5760	6.6169	6.5117	6.5512
14041	2019-06-10 00:00:00+00	263	355	6.5514	6.6272	6.4920	6.6054
14042	2019-06-09 00:00:00+00	263	355	6.6058	6.6247	6.5558	6.6177
14043	2019-06-07 00:00:00+00	263	355	6.6087	6.6259	6.5162	6.5319
14044	2019-06-06 00:00:00+00	263	355	6.5290	6.5497	6.4143	6.4265
14045	2019-06-05 00:00:00+00	263	355	6.4335	6.5218	6.3816	6.4993
14046	2019-06-04 00:00:00+00	263	355	6.4976	6.6003	6.4520	6.5589
14047	2019-06-03 00:00:00+00	263	355	6.5570	6.5887	6.5197	6.5522
14048	2019-06-02 00:00:00+00	263	355	6.5523	6.5554	6.4751	6.5425
14049	2019-05-31 00:00:00+00	263	355	6.5202	6.6091	6.5011	6.5709
14050	2019-05-30 00:00:00+00	263	355	6.5705	6.7228	6.5233	6.6982
14051	2019-05-29 00:00:00+00	263	355	6.7068	6.7615	6.6228	6.7352
14052	2019-05-28 00:00:00+00	263	355	6.7356	6.8055	6.7058	6.7904
14053	2019-05-27 00:00:00+00	263	355	6.7904	6.8466	6.7597	6.8255
14054	2019-05-26 00:00:00+00	263	355	6.8063	6.8999	6.7945	6.8855
14055	2019-05-24 00:00:00+00	263	355	6.8139	6.8572	6.7783	6.8365
14056	2019-05-23 00:00:00+00	263	355	6.8368	6.8728	6.8032	6.8057
14057	2019-05-22 00:00:00+00	263	355	6.8188	6.8323	6.7527	6.7718
14058	2019-05-21 00:00:00+00	263	355	6.7706	6.7964	6.7046	6.7322
14059	2019-05-20 00:00:00+00	263	355	6.7322	6.7853	6.7023	6.7662
14060	2019-05-19 00:00:00+00	263	355	6.7687	6.7720	6.7392	6.7444
14061	2019-05-17 00:00:00+00	263	355	6.7552	6.8169	6.7171	6.7688
14062	2019-05-16 00:00:00+00	263	355	6.7688	6.7843	6.7280	6.7516
14063	2019-05-15 00:00:00+00	263	355	6.7487	6.8277	6.7053	6.7642
14064	2019-05-14 00:00:00+00	263	355	6.7568	6.8715	6.7124	6.8221
14065	2019-05-13 00:00:00+00	263	355	6.8224	6.8942	6.6611	6.7275
14066	2019-05-12 00:00:00+00	263	355	6.7275	6.7840	6.6975	6.7660
14067	2019-05-10 00:00:00+00	263	355	6.7165	6.9300	6.6789	6.9091
14068	2019-05-09 00:00:00+00	263	355	6.9088	7.0321	6.8897	6.9003
14069	2019-05-08 00:00:00+00	263	355	6.9094	6.9422	6.8777	6.8899
14070	2019-05-07 00:00:00+00	263	355	6.8909	6.9518	6.8073	6.8203
14071	2019-05-06 00:00:00+00	263	355	6.8187	6.8951	6.6825	6.6952
14072	2019-05-05 00:00:00+00	263	355	6.6955	6.7068	6.6477	6.6703
14073	2019-05-03 00:00:00+00	263	355	6.6645	6.6906	6.6511	6.6630
14074	2019-05-02 00:00:00+00	263	355	6.6630	6.7142	6.6531	6.6921
14075	2019-05-01 00:00:00+00	263	355	6.6927	6.7098	6.6654	6.6865
14076	2019-04-30 00:00:00+00	263	355	6.6875	6.7012	6.6483	6.6550
14077	2019-04-29 00:00:00+00	263	355	6.6567	6.6625	6.6103	6.6284
14078	2019-04-28 00:00:00+00	263	355	6.6294	6.6349	6.5382	6.5382
14079	2019-04-26 00:00:00+00	263	355	6.6281	6.6556	6.5764	6.6174
14080	2019-04-25 00:00:00+00	263	355	6.6366	6.6626	6.5538	6.5778
14081	2019-04-24 00:00:00+00	263	355	6.5775	6.5988	6.5340	6.5477
14082	2019-04-23 00:00:00+00	263	355	6.5477	6.5786	6.5200	6.5611
14083	2019-04-22 00:00:00+00	263	355	6.5659	6.5910	6.5166	6.5474
14084	2019-04-21 00:00:00+00	263	355	6.5445	6.5583	6.5099	6.5273
14085	2019-04-19 00:00:00+00	263	355	6.5347	6.5652	6.5125	6.5259
14086	2019-04-18 00:00:00+00	263	355	6.5186	6.6085	6.4964	6.5047
14087	2019-04-17 00:00:00+00	263	355	6.5187	6.5629	6.4515	6.5297
14088	2019-04-16 00:00:00+00	263	355	6.5483	6.5891	6.4723	6.5627
14089	2019-04-15 00:00:00+00	263	355	6.5627	6.5851	6.5244	6.5282
14090	2019-04-14 00:00:00+00	263	355	6.5276	6.5319	6.4957	6.5072
14091	2019-04-12 00:00:00+00	263	355	6.5185	6.5927	6.4502	6.4558
14092	2019-04-11 00:00:00+00	263	355	6.4570	6.4976	6.4011	6.4193
14093	2019-04-10 00:00:00+00	263	355	6.4208	6.4514	6.3782	6.4024
14094	2019-04-09 00:00:00+00	263	355	6.4046	6.4380	6.3549	6.4041
14095	2019-04-08 00:00:00+00	263	355	6.4061	6.4542	6.3123	6.3183
14096	2019-04-07 00:00:00+00	263	355	6.3196	6.3277	6.3094	6.3095
14097	2019-04-05 00:00:00+00	263	355	6.3094	6.3417	6.2581	6.2782
14098	2019-04-04 00:00:00+00	263	355	6.2782	6.3748	6.2362	6.3320
14099	2019-04-03 00:00:00+00	263	355	6.3304	6.3599	6.2599	6.3062
14100	2019-04-02 00:00:00+00	263	355	6.3062	6.3616	6.1634	6.1762
14101	2019-04-01 00:00:00+00	263	355	6.1844	6.4144	6.0621	6.2735
14102	2019-03-31 00:00:00+00	263	355	6.2768	6.3235	6.2303	6.2593
14103	2019-03-29 00:00:00+00	263	355	6.2559	6.3858	6.2059	6.2560
14104	2019-03-28 00:00:00+00	263	355	6.2661	6.4151	6.0163	6.2069
14105	2019-03-27 00:00:00+00	263	355	6.2066	6.3916	5.9565	6.0519
14106	2019-03-26 00:00:00+00	263	355	6.0906	6.3420	5.9774	6.3063
14107	2019-03-25 00:00:00+00	263	355	6.3172	6.4950	6.2708	6.4906
14108	2019-03-24 00:00:00+00	263	355	6.4941	6.5245	6.4344	6.5033
14109	2019-03-22 00:00:00+00	263	355	6.5132	6.6065	6.2096	6.2215
14110	2019-03-21 00:00:00+00	263	355	6.2212	6.2381	6.1961	6.1978
14111	2019-03-20 00:00:00+00	263	355	6.2060	6.2302	6.1761	6.2207
14112	2019-03-19 00:00:00+00	263	355	6.2207	6.2278	6.1946	6.1993
14113	2019-03-18 00:00:00+00	263	355	6.1984	6.2112	6.1591	6.1722
14114	2019-03-17 00:00:00+00	263	355	6.1751	6.1760	6.1547	6.1665
14115	2019-03-15 00:00:00+00	263	355	6.1694	6.2103	6.1606	6.1869
14116	2019-03-14 00:00:00+00	263	355	6.1849	6.2088	6.1731	6.1908
14117	2019-03-13 00:00:00+00	263	355	6.2002	6.2014	6.1500	6.1599
14118	2019-03-12 00:00:00+00	263	355	6.1627	6.1718	6.1069	6.1256
14119	2019-03-11 00:00:00+00	263	355	6.1295	6.1404	6.0869	6.0989
14120	2019-03-10 00:00:00+00	263	355	6.1005	6.1211	6.0888	6.1069
14121	2019-03-08 00:00:00+00	263	355	6.1058	6.1549	6.0873	6.1129
14122	2019-03-07 00:00:00+00	263	355	6.1147	6.1812	6.0800	6.1478
14123	2019-03-06 00:00:00+00	263	355	6.1478	6.1651	6.0626	6.0860
14124	2019-03-05 00:00:00+00	263	355	6.0892	6.1215	6.0769	6.0866
14125	2019-03-04 00:00:00+00	263	355	6.0895	6.1326	6.0762	6.1063
14126	2019-03-03 00:00:00+00	263	355	6.1085	6.1203	6.0744	6.1131
14127	2019-03-01 00:00:00+00	263	355	6.1074	6.1586	6.0677	6.0743
14128	2019-02-28 00:00:00+00	263	355	6.0755	6.0879	6.0336	6.0428
14129	2019-02-27 00:00:00+00	263	355	6.0524	6.0602	6.0200	6.0479
14130	2019-02-26 00:00:00+00	263	355	6.0479	6.0529	6.0119	6.0265
14131	2019-02-25 00:00:00+00	263	355	6.0295	6.0451	6.0049	6.0338
14132	2019-02-24 00:00:00+00	263	355	6.0314	6.0439	6.0230	6.0241
14133	2019-02-22 00:00:00+00	263	355	6.0217	6.0585	6.0115	6.0346
14134	2019-02-21 00:00:00+00	263	355	6.0355	6.0693	6.0207	6.0454
14135	2019-02-20 00:00:00+00	263	355	6.0455	6.0615	5.9847	5.9920
14136	2019-02-19 00:00:00+00	263	355	5.9920	6.0223	5.9788	5.9991
14137	2019-02-18 00:00:00+00	263	355	5.9967	6.0175	5.9573	5.9713
14138	2019-02-17 00:00:00+00	263	355	5.9700	5.9733	5.9399	5.9592
14139	2019-02-15 00:00:00+00	263	355	5.9543	5.9845	5.9227	5.9558
14140	2019-02-14 00:00:00+00	263	355	5.9605	6.0135	5.9424	5.9607
14141	2019-02-13 00:00:00+00	263	355	5.9593	5.9787	5.9304	5.9515
14142	2019-02-12 00:00:00+00	263	355	5.9512	5.9650	5.9292	5.9553
14143	2019-02-11 00:00:00+00	263	355	5.9563	5.9711	5.9285	5.9428
14144	2019-02-10 00:00:00+00	263	355	5.9424	5.9463	5.9291	5.9330
14145	2019-02-08 00:00:00+00	263	355	5.9400	5.9914	5.9252	5.9805
14146	2019-02-07 00:00:00+00	263	355	5.9790	6.0201	5.9196	5.9377
14147	2019-02-06 00:00:00+00	263	355	5.9363	5.9622	5.9163	5.9259
14148	2019-02-05 00:00:00+00	263	355	5.9314	5.9723	5.8842	5.9664
14149	2019-02-04 00:00:00+00	263	355	5.9679	6.0008	5.9553	5.9667
14150	2019-02-03 00:00:00+00	263	355	5.9657	5.9785	5.9435	5.9600
14151	2019-02-02 00:00:00+00	263	355	5.9646	5.9647	5.9646	5.9647
14152	2019-02-01 00:00:00+00	263	355	5.9647	6.0039	5.9095	5.9155
14153	2019-01-31 00:00:00+00	263	355	5.9168	6.0372	5.9026	6.0180
14154	2019-01-30 00:00:00+00	263	355	6.0197	6.0939	5.9770	6.0767
14155	2019-01-29 00:00:00+00	263	355	6.0767	6.1360	6.0532	6.0876
14156	2019-01-28 00:00:00+00	263	355	6.0875	6.1150	5.9874	6.0199
14157	2019-01-27 00:00:00+00	263	355	6.0199	6.0301	5.8351	5.9977
14158	2019-01-25 00:00:00+00	263	355	5.9997	6.0212	5.9485	5.9613
14159	2019-01-24 00:00:00+00	263	355	5.9580	6.0455	5.9439	6.0184
14160	2019-01-23 00:00:00+00	263	355	6.0184	6.0891	6.0035	6.0718
14161	2019-01-22 00:00:00+00	263	355	6.0680	6.0993	6.0439	6.0517
14162	2019-01-21 00:00:00+00	263	355	6.0527	6.0963	6.0399	6.0484
14163	2019-01-20 00:00:00+00	263	355	6.0500	6.0751	6.0336	6.0420
14164	2019-01-18 00:00:00+00	263	355	6.0414	6.1295	6.0344	6.0867
14165	2019-01-17 00:00:00+00	263	355	6.0867	6.1498	6.0681	6.0946
14166	2019-01-16 00:00:00+00	263	355	6.0912	6.2236	6.0551	6.2117
14167	2019-01-15 00:00:00+00	263	355	6.2117	6.2784	6.1932	6.2485
14168	2019-01-14 00:00:00+00	263	355	6.2485	6.3614	6.2269	6.2655
14169	2019-01-13 00:00:00+00	263	355	6.2661	6.2777	6.2145	6.2577
14170	2019-01-11 00:00:00+00	263	355	6.2518	6.3339	6.2273	6.2359
14171	2019-01-10 00:00:00+00	263	355	6.2263	6.3731	6.2221	6.3358
14172	2019-01-09 00:00:00+00	263	355	6.3284	6.3544	6.2439	6.2647
14173	2019-01-08 00:00:00+00	263	355	6.2597	6.3130	6.1570	6.1798
14174	2019-01-07 00:00:00+00	263	355	6.1787	6.2096	6.0613	6.0743
14175	2019-01-06 00:00:00+00	263	355	6.0766	6.1198	6.0005	6.0025
14176	2019-01-04 00:00:00+00	263	355	6.0748	6.2424	6.0527	6.2253
14177	2019-01-03 00:00:00+00	263	355	6.2439	6.5923	6.1249	6.4696
14178	2019-01-02 00:00:00+00	263	355	6.4598	6.4861	6.0332	6.0460
14179	2019-01-01 00:00:00+00	263	355	6.0460	6.0850	6.0020	6.0439
14180	2018-12-31 00:00:00+00	263	355	6.0679	6.0944	6.0140	6.0599
14181	2018-12-30 00:00:00+00	263	355	6.0596	6.0977	5.9878	5.9878
14182	2018-12-28 00:00:00+00	263	355	6.0341	6.0793	6.0046	6.0491
14183	2018-12-27 00:00:00+00	263	355	6.0427	6.0953	5.9820	5.9967
14184	2018-12-26 00:00:00+00	263	355	5.9987	6.0555	5.9313	6.0555
14185	2018-12-25 00:00:00+00	263	355	6.0370	6.1006	6.0106	6.0281
14186	2018-12-24 00:00:00+00	263	355	6.0112	6.0785	6.0063	6.0356
14187	2018-12-23 00:00:00+00	263	355	6.0367	6.0498	6.0173	6.0307
14188	2018-12-21 00:00:00+00	263	355	6.0460	6.0819	6.0054	6.0301
14189	2018-12-20 00:00:00+00	263	355	6.0301	6.0684	5.9944	6.0385
14190	2018-12-19 00:00:00+00	263	355	6.0385	6.1022	5.9456	6.0724
14191	2018-12-18 00:00:00+00	263	355	6.0701	6.1187	6.0569	6.0945
14192	2018-12-17 00:00:00+00	263	355	6.0957	6.1179	6.0594	6.0670
14193	2018-12-16 00:00:00+00	263	355	6.0723	6.1404	6.0514	6.0667
14194	2018-12-15 00:00:00+00	263	355	6.0641	6.0641	6.0641	6.0641
14195	2018-12-14 00:00:00+00	263	355	6.0641	6.1280	6.0203	6.0707
14196	2018-12-13 00:00:00+00	263	355	6.0707	6.1440	6.0388	6.0783
14197	2018-12-12 00:00:00+00	263	355	6.0881	6.1244	6.0535	6.0678
14198	2018-12-11 00:00:00+00	263	355	6.0685	6.1577	6.0314	6.0445
14199	2018-12-10 00:00:00+00	263	355	6.0442	6.0958	6.0156	6.0542
14200	2018-12-09 00:00:00+00	263	355	6.0537	6.0597	6.0217	6.0427
14201	2018-12-07 00:00:00+00	263	355	6.0401	6.0931	5.9972	6.0739
14202	2018-12-06 00:00:00+00	263	355	6.0739	6.1369	6.0387	6.0489
14203	2018-12-05 00:00:00+00	263	355	6.0489	6.1811	6.0224	6.1110
14204	2018-12-04 00:00:00+00	263	355	6.1110	6.2168	5.9404	5.9517
14205	2018-12-03 00:00:00+00	263	355	5.9501	5.9983	5.8254	5.8537
14206	2018-12-02 00:00:00+00	263	355	5.8582	5.9039	5.8419	5.8854
14207	2018-11-30 00:00:00+00	263	355	5.8871	5.9546	5.8638	5.8821
14208	2018-11-29 00:00:00+00	263	355	5.8861	5.9548	5.8368	5.9333
14209	2018-11-28 00:00:00+00	263	355	5.9409	5.9600	5.9093	5.9283
14210	2018-11-27 00:00:00+00	263	355	5.9283	5.9886	5.9098	5.9499
14211	2018-11-26 00:00:00+00	263	355	5.9441	6.0078	5.9257	5.9998
14212	2018-11-25 00:00:00+00	263	355	6.0003	6.0140	5.9792	6.0035
14213	2018-11-23 00:00:00+00	263	355	5.9946	6.0706	5.9714	6.0372
14214	2018-11-22 00:00:00+00	263	355	6.0372	6.1025	6.0127	6.0467
14215	2018-11-21 00:00:00+00	263	355	6.0563	6.1429	6.0083	6.1162
14216	2018-11-20 00:00:00+00	263	355	6.1143	6.2021	6.0778	6.0907
14217	2018-11-19 00:00:00+00	263	355	6.0902	6.1261	6.0573	6.0896
14218	2018-11-18 00:00:00+00	263	355	6.0901	6.1119	6.0659	6.0706
14219	2018-11-16 00:00:00+00	263	355	6.0742	6.1184	6.0380	6.0777
14220	2018-11-15 00:00:00+00	263	355	6.0812	6.2135	6.0073	6.1816
14221	2018-11-14 00:00:00+00	263	355	6.1825	6.2242	6.1460	6.1912
14222	2018-11-13 00:00:00+00	263	355	6.1905	6.2209	6.1263	6.1374
14223	2018-11-12 00:00:00+00	263	355	6.1365	6.2240	6.1171	6.1867
14224	2018-11-11 00:00:00+00	263	355	6.1867	6.2022	6.1595	6.1830
14225	2018-11-09 00:00:00+00	263	355	6.1772	6.2853	6.1526	6.2053
14226	2018-11-08 00:00:00+00	263	355	6.2052	6.2724	6.1262	6.1455
14227	2018-11-07 00:00:00+00	263	355	6.1455	6.2100	6.1017	6.1332
14228	2018-11-06 00:00:00+00	263	355	6.1238	6.1917	6.0514	6.0663
14229	2018-11-05 00:00:00+00	263	355	6.0632	6.2376	6.0504	6.1853
14230	2018-11-04 00:00:00+00	263	355	6.1830	6.1932	6.1631	6.1853
14231	2018-11-02 00:00:00+00	263	355	6.1834	6.3094	6.1481	6.2902
14232	2018-11-01 00:00:00+00	263	355	6.2902	6.4263	6.2637	6.3213
14233	2018-10-31 00:00:00+00	263	355	6.3264	6.3775	6.2014	6.2136
14234	2018-10-30 00:00:00+00	263	355	6.2141	6.3297	6.1923	6.3177
14235	2018-10-29 00:00:00+00	263	355	6.3179	6.3818	6.2788	6.3708
14236	2018-10-28 00:00:00+00	263	355	6.3715	6.3891	6.2950	6.3771
14237	2018-10-26 00:00:00+00	263	355	6.3769	6.4326	6.3331	6.4050
14238	2018-10-25 00:00:00+00	263	355	6.4064	6.5612	6.3881	6.4959
14239	2018-10-24 00:00:00+00	263	355	6.5098	6.6252	6.4444	6.5935
14240	2018-10-23 00:00:00+00	263	355	6.5926	6.7403	6.4860	6.4977
14241	2018-10-22 00:00:00+00	263	355	6.4989	6.5293	6.4810	6.5048
14242	2018-10-21 00:00:00+00	263	355	6.5058	6.5343	6.4844	6.5176
14243	2018-10-19 00:00:00+00	263	355	6.4968	6.5501	6.4154	6.4532
14244	2018-10-18 00:00:00+00	263	355	6.4535	6.5666	6.3545	6.4393
14245	2018-10-17 00:00:00+00	263	355	6.4355	6.6136	6.3716	6.5831
14246	2018-10-16 00:00:00+00	263	355	6.5859	6.7271	6.5578	6.6969
14247	2018-10-15 00:00:00+00	263	355	6.6969	6.8241	6.6520	6.8027
14248	2018-10-14 00:00:00+00	263	355	6.8008	6.8486	6.7714	6.7878
14249	2018-10-12 00:00:00+00	263	355	6.7883	6.9469	6.7344	6.8678
14250	2018-10-11 00:00:00+00	263	355	6.8690	7.0518	6.8231	7.0163
14251	2018-10-10 00:00:00+00	263	355	7.0252	7.0493	6.9034	7.0195
14252	2018-10-09 00:00:00+00	263	355	7.0206	7.0530	6.9830	7.0257
14253	2018-10-08 00:00:00+00	263	355	7.0310	7.1236	7.0033	7.1071
14254	2018-10-07 00:00:00+00	263	355	7.1094	7.1180	7.0510	7.1052
14255	2018-10-05 00:00:00+00	263	355	7.0650	7.1460	7.0247	7.1031
14256	2018-10-04 00:00:00+00	263	355	7.1012	7.1796	6.9465	6.9495
14257	2018-10-03 00:00:00+00	263	355	6.9619	7.0667	6.8859	6.9151
14258	2018-10-02 00:00:00+00	263	355	6.9151	6.9800	6.8651	6.8767
14259	2018-10-01 00:00:00+00	263	355	6.8767	7.0249	6.8541	7.0152
14260	2018-09-30 00:00:00+00	263	355	7.0198	7.0446	6.9644	6.9913
14261	2018-09-28 00:00:00+00	263	355	7.0463	7.0798	6.9292	6.9872
14262	2018-09-27 00:00:00+00	263	355	6.9866	7.2021	6.9525	7.1785
14263	2018-09-26 00:00:00+00	263	355	7.1751	7.2977	7.1243	7.2939
14264	2018-09-25 00:00:00+00	263	355	7.2959	7.3411	7.1163	7.2075
14265	2018-09-24 00:00:00+00	263	355	7.2138	7.4823	7.1090	7.4017
14266	2018-09-23 00:00:00+00	263	355	7.4058	7.4174	7.3331	7.3331
14267	2018-09-21 00:00:00+00	263	355	7.3932	7.4258	7.2897	7.3055
14268	2018-09-20 00:00:00+00	263	355	7.3057	7.4818	7.1629	7.3037
14269	2018-09-19 00:00:00+00	263	355	7.3109	7.5011	7.2664	7.4743
14270	2018-09-18 00:00:00+00	263	355	7.4746	7.5547	7.3633	7.3767
14271	2018-09-17 00:00:00+00	263	355	7.3762	7.3976	7.1433	7.1615
14272	2018-09-16 00:00:00+00	263	355	7.1536	7.1855	7.1394	7.1855
14273	2018-09-14 00:00:00+00	263	355	7.1733	7.2210	7.0387	7.1334
14274	2018-09-13 00:00:00+00	263	355	7.1400	7.6229	6.9777	7.3799
14275	2018-09-12 00:00:00+00	263	355	7.3880	7.4991	7.3264	7.4718
14276	2018-09-11 00:00:00+00	263	355	7.4719	7.5322	7.4343	7.5022
14277	2018-09-10 00:00:00+00	263	355	7.5020	7.5232	7.3825	7.4010
14278	2018-09-09 00:00:00+00	263	355	7.3921	7.4051	7.3669	7.3954
14279	2018-09-07 00:00:00+00	263	355	7.3737	7.6833	7.3388	7.6534
14280	2018-09-06 00:00:00+00	263	355	7.6471	7.7290	7.6073	7.6571
14281	2018-09-05 00:00:00+00	263	355	7.6515	7.7743	7.6294	7.7467
14282	2018-09-04 00:00:00+00	263	355	7.7486	7.7786	7.6271	7.6933
14283	2018-09-03 00:00:00+00	263	355	7.6919	7.8190	7.5502	7.6181
14284	2018-09-02 00:00:00+00	263	355	7.6189	7.6446	7.5557	7.5847
14285	2018-08-31 00:00:00+00	263	355	7.5633	7.9143	7.4441	7.7906
14286	2018-08-30 00:00:00+00	263	355	7.7906	8.0029	7.5166	7.5449
14287	2018-08-29 00:00:00+00	263	355	7.5400	7.5941	7.2868	7.3180
14288	2018-08-28 00:00:00+00	263	355	7.3328	7.3755	7.1508	7.2018
14289	2018-08-27 00:00:00+00	263	355	7.2018	7.3178	6.9316	6.9597
14290	2018-08-26 00:00:00+00	263	355	6.9618	7.0052	6.9301	7.0049
14291	2018-08-24 00:00:00+00	263	355	6.9802	7.0944	6.9402	7.0325
14292	2018-08-23 00:00:00+00	263	355	7.0320	7.1112	6.9309	6.9808
14293	2018-08-22 00:00:00+00	263	355	6.9847	7.0713	6.9388	7.0190
14294	2018-08-21 00:00:00+00	263	355	7.0178	7.0959	6.9012	6.9884
14295	2018-08-20 00:00:00+00	263	355	6.9897	7.0902	6.8175	6.8443
14296	2018-08-19 00:00:00+00	263	355	6.8347	6.9980	6.8138	6.8693
14297	2018-08-17 00:00:00+00	263	355	6.8782	7.2321	6.5531	6.6378
14298	2018-08-16 00:00:00+00	263	355	6.6464	6.8730	6.4721	6.7816
14299	2018-08-15 00:00:00+00	263	355	6.7964	7.4527	6.6235	7.2360
14300	2018-08-14 00:00:00+00	263	355	7.2165	7.9353	7.1251	7.9005
14301	2018-08-13 00:00:00+00	263	355	7.9053	8.0749	7.3450	7.7903
14302	2018-08-12 00:00:00+00	263	355	7.7816	8.2113	7.3094	7.3143
14303	2018-08-10 00:00:00+00	263	355	7.3356	7.8287	6.3885	6.3904
14304	2018-08-09 00:00:00+00	263	355	6.3908	6.4398	6.1312	6.1424
14305	2018-08-08 00:00:00+00	263	355	6.1425	6.1763	6.0709	6.0966
14306	2018-08-07 00:00:00+00	263	355	6.0939	6.2065	5.9921	6.0848
14307	2018-08-06 00:00:00+00	263	355	6.0866	6.2705	5.8797	5.9012
14308	2018-08-05 00:00:00+00	263	355	5.9032	5.9114	5.8347	5.8559
14309	2018-08-03 00:00:00+00	263	355	5.8766	5.9330	5.8642	5.8753
14310	2018-08-02 00:00:00+00	263	355	5.8724	5.9244	5.7834	5.8268
14311	2018-08-01 00:00:00+00	263	355	5.8306	5.8518	5.7357	5.7437
14312	2018-07-31 00:00:00+00	263	355	5.7437	5.7732	5.6583	5.7232
14313	2018-07-30 00:00:00+00	263	355	5.7199	5.7361	5.6421	5.6613
14314	2018-07-29 00:00:00+00	263	355	5.6603	5.6636	5.6103	5.6425
14315	2018-07-27 00:00:00+00	263	355	5.6527	5.6830	5.6391	5.6679
14316	2018-07-26 00:00:00+00	263	355	5.6683	5.6993	5.6098	5.6270
14317	2018-07-25 00:00:00+00	263	355	5.6321	5.7117	5.5920	5.7036
14318	2018-07-24 00:00:00+00	263	355	5.7048	5.7821	5.5327	5.5397
14319	2018-07-23 00:00:00+00	263	355	5.5406	5.6255	5.5301	5.6073
14320	2018-07-22 00:00:00+00	263	355	5.6084	5.6409	5.5927	5.6279
14321	2018-07-20 00:00:00+00	263	355	5.6172	5.6341	5.5810	5.6023
14322	2018-07-19 00:00:00+00	263	355	5.6068	5.6281	5.5753	5.5840
14323	2018-07-18 00:00:00+00	263	355	5.5891	5.6257	5.5458	5.5982
14324	2018-07-17 00:00:00+00	263	355	5.5998	5.6952	5.5816	5.6812
14325	2018-07-16 00:00:00+00	263	355	5.6842	5.7123	5.6321	5.6744
14326	2018-07-15 00:00:00+00	263	355	5.6738	5.6890	5.6296	5.6725
14327	2018-07-13 00:00:00+00	263	355	5.6735	5.7037	5.6155	5.6731
14328	2018-07-12 00:00:00+00	263	355	5.6721	5.7342	5.5933	5.7238
14329	2018-07-11 00:00:00+00	263	355	5.7294	5.8218	5.5053	5.5305
14330	2018-07-10 00:00:00+00	263	355	5.5321	5.5636	5.4555	5.5411
14331	2018-07-09 00:00:00+00	263	355	5.5407	5.5842	5.3019	5.3822
14332	2018-07-08 00:00:00+00	263	355	5.3813	5.3899	5.3308	5.3704
14333	2018-07-06 00:00:00+00	263	355	5.3722	5.4100	5.3648	5.3740
14334	2018-07-05 00:00:00+00	263	355	5.3649	5.4869	5.3551	5.4470
14335	2018-07-04 00:00:00+00	263	355	5.4416	5.5064	5.4323	5.4431
14336	2018-07-03 00:00:00+00	263	355	5.4443	5.4615	5.3437	5.3747
14337	2018-07-02 00:00:00+00	263	355	5.3678	5.4044	5.3474	5.3685
14338	2018-07-01 00:00:00+00	263	355	5.3678	5.3856	5.3264	5.3731
14339	2018-06-29 00:00:00+00	263	355	5.3601	5.3861	5.2956	5.3090
14340	2018-06-28 00:00:00+00	263	355	5.3073	5.3716	5.2975	5.3390
14341	2018-06-27 00:00:00+00	263	355	5.3465	5.4231	5.3220	5.3806
14342	2018-06-26 00:00:00+00	263	355	5.3801	5.5165	5.3559	5.4800
14343	2018-06-25 00:00:00+00	263	355	5.4838	5.5063	5.2765	5.3732
14344	2018-06-24 00:00:00+00	263	355	5.3732	5.4970	5.3276	5.4415
14345	2018-06-22 00:00:00+00	263	355	5.4503	5.5231	5.4040	5.4895
14346	2018-06-21 00:00:00+00	263	355	5.4827	5.5141	5.4496	5.4903
14347	2018-06-20 00:00:00+00	263	355	5.4928	5.5211	5.4721	5.4963
14348	2018-06-19 00:00:00+00	263	355	5.4940	5.5175	5.4568	5.4659
14349	2018-06-18 00:00:00+00	263	355	5.4683	5.5100	5.4165	5.4720
14350	2018-06-17 00:00:00+00	263	355	5.4708	5.4944	5.4479	5.4838
14351	2018-06-15 00:00:00+00	263	355	5.4913	5.5191	5.4535	5.4944
14352	2018-06-14 00:00:00+00	263	355	5.4936	5.5338	5.4077	5.4932
14353	2018-06-13 00:00:00+00	263	355	5.4945	5.5252	5.3838	5.3906
14354	2018-06-12 00:00:00+00	263	355	5.3978	5.4098	5.3116	5.3221
14355	2018-06-11 00:00:00+00	263	355	5.3251	5.3530	5.2520	5.2585
14356	2018-06-10 00:00:00+00	263	355	5.2602	5.2846	5.2186	5.2577
14357	2018-06-08 00:00:00+00	263	355	5.2599	5.3429	5.2527	5.2903
14358	2018-06-07 00:00:00+00	263	355	5.2877	5.4309	5.2739	5.3751
14359	2018-06-06 00:00:00+00	263	355	5.3788	5.4430	5.3425	5.3871
14360	2018-06-05 00:00:00+00	263	355	5.3817	5.4197	5.3596	5.3670
14361	2018-06-04 00:00:00+00	263	355	5.3686	5.4695	5.3570	5.4178
14362	2018-06-03 00:00:00+00	263	355	5.4180	5.4267	5.3867	5.4046
14363	2018-06-01 00:00:00+00	263	355	5.4227	5.4335	5.2804	5.2986
14364	2018-05-31 00:00:00+00	263	355	5.2995	5.3116	5.1981	5.2099
14365	2018-05-30 00:00:00+00	263	355	5.2127	5.2707	5.1752	5.2597
14366	2018-05-29 00:00:00+00	263	355	5.2602	5.3549	5.2184	5.3267
14367	2018-05-28 00:00:00+00	263	355	5.3265	5.5196	5.3106	5.5098
14368	2018-05-27 00:00:00+00	263	355	5.5050	5.5139	5.4542	5.4968
14369	2018-05-25 00:00:00+00	263	355	5.4847	5.6214	5.4678	5.5610
14370	2018-05-24 00:00:00+00	263	355	5.5467	5.6415	5.3240	5.3563
14371	2018-05-23 00:00:00+00	263	355	5.3607	5.7698	5.3086	5.5807
14372	2018-05-22 00:00:00+00	263	355	5.5802	5.6791	5.3636	5.3959
14373	2018-05-21 00:00:00+00	263	355	5.3976	5.4133	5.2742	5.2955
14374	2018-05-20 00:00:00+00	263	355	5.2906	5.2994	5.2768	5.2850
14375	2018-05-18 00:00:00+00	263	355	5.2874	5.3041	5.2508	5.2622
14376	2018-05-17 00:00:00+00	263	355	5.2604	5.2775	5.2171	5.2317
14377	2018-05-16 00:00:00+00	263	355	5.2370	5.3241	5.1825	5.2710
14378	2018-05-15 00:00:00+00	263	355	5.2710	5.3082	5.1869	5.1957
14379	2018-05-14 00:00:00+00	263	355	5.1983	5.2189	5.1433	5.1564
14380	2018-05-13 00:00:00+00	263	355	5.1533	5.1631	5.1030	5.1457
14381	2018-05-11 00:00:00+00	263	355	5.1520	5.1589	5.0420	5.0472
14382	2018-05-10 00:00:00+00	263	355	5.0478	5.1145	5.0332	5.0795
14383	2018-05-09 00:00:00+00	263	355	5.0781	5.1789	5.0544	5.1530
14384	2018-05-08 00:00:00+00	263	355	5.1538	5.1552	5.0718	5.0843
14385	2018-05-07 00:00:00+00	263	355	5.0844	5.0944	5.0298	5.0802
14386	2018-05-06 00:00:00+00	263	355	5.0791	5.0848	5.0341	5.0591
14387	2018-05-04 00:00:00+00	263	355	5.0582	5.1329	5.0469	5.0560
14388	2018-05-03 00:00:00+00	263	355	5.0570	5.0809	4.9828	4.9994
14389	2018-05-02 00:00:00+00	263	355	5.0020	5.0065	4.9123	4.9220
14390	2018-05-01 00:00:00+00	263	355	4.9240	4.9447	4.8940	4.9061
14391	2018-04-30 00:00:00+00	263	355	4.9066	4.9300	4.8750	4.9070
14392	2018-04-29 00:00:00+00	263	355	4.9107	4.9307	4.8836	4.9307
14393	2018-04-27 00:00:00+00	263	355	4.9021	4.9404	4.8807	4.9228
14394	2018-04-26 00:00:00+00	263	355	4.9228	4.9802	4.9126	4.9664
14395	2018-04-25 00:00:00+00	263	355	4.9703	5.0095	4.9145	4.9966
14396	2018-04-24 00:00:00+00	263	355	4.9969	5.0198	4.9766	5.0167
14397	2018-04-23 00:00:00+00	263	355	5.0171	5.0296	4.9746	5.0091
14398	2018-04-22 00:00:00+00	263	355	5.0113	5.0205	4.9805	4.9805
14399	2018-04-20 00:00:00+00	263	355	5.0082	5.0105	4.9602	4.9872
14400	2018-04-19 00:00:00+00	263	355	4.9854	5.0085	4.9640	4.9744
14401	2018-04-18 00:00:00+00	263	355	4.9812	5.0835	4.9557	5.0678
14402	2018-04-17 00:00:00+00	263	355	5.0690	5.1173	5.0508	5.0769
14403	2018-04-16 00:00:00+00	263	355	5.0778	5.0942	5.0317	5.0358
14404	2018-04-15 00:00:00+00	263	355	5.0385	5.0628	5.0185	5.0195
14405	2018-04-13 00:00:00+00	263	355	5.0508	5.0811	5.0252	5.0703
14406	2018-04-12 00:00:00+00	263	355	5.0705	5.1493	5.0302	5.1264
14407	2018-04-11 00:00:00+00	263	355	5.1264	5.1935	5.0764	5.0856
14408	2018-04-10 00:00:00+00	263	355	5.0854	5.1174	4.9925	5.0244
14409	2018-04-09 00:00:00+00	263	355	5.0235	5.0247	4.9448	4.9691
14410	2018-04-08 00:00:00+00	263	355	4.9688	4.9758	4.9520	4.9571
14411	2018-04-06 00:00:00+00	263	355	4.9688	4.9772	4.9414	4.9660
14412	2018-04-05 00:00:00+00	263	355	4.9662	4.9730	4.9093	4.9142
14413	2018-04-04 00:00:00+00	263	355	4.9176	4.9476	4.8928	4.8991
14414	2018-04-03 00:00:00+00	263	355	4.8991	4.9121	4.8755	4.8927
14415	2018-04-02 00:00:00+00	263	355	4.8936	4.8987	4.8533	4.8695
14416	2018-04-01 00:00:00+00	263	355	4.8728	4.8813	4.8477	4.8599
14417	2018-03-30 00:00:00+00	263	355	4.8746	4.8853	4.8465	4.8537
14418	2018-03-29 00:00:00+00	263	355	4.8514	4.9553	4.8362	4.9460
14419	2018-03-28 00:00:00+00	263	355	4.9460	4.9710	4.9291	4.9358
14420	2018-03-27 00:00:00+00	263	355	4.9436	4.9585	4.9303	4.9384
14421	2018-03-26 00:00:00+00	263	355	4.9379	4.9639	4.8819	4.9258
14422	2018-03-25 00:00:00+00	263	355	4.9265	4.9670	4.8776	4.9670
14423	2018-03-23 00:00:00+00	263	355	4.9173	4.9411	4.8791	4.9358
14424	2018-03-22 00:00:00+00	263	355	4.9330	4.9749	4.8188	4.8241
14425	2018-03-21 00:00:00+00	263	355	4.8287	4.8397	4.8029	4.8169
14426	2018-03-20 00:00:00+00	263	355	4.8168	4.8702	4.8029	4.8604
14427	2018-03-19 00:00:00+00	263	355	4.8613	4.8689	4.8103	4.8143
14428	2018-03-18 00:00:00+00	263	355	4.8138	4.8258	4.7306	4.8220
14429	2018-03-16 00:00:00+00	263	355	4.8162	4.8311	4.7911	4.7913
14430	2018-03-15 00:00:00+00	263	355	4.7927	4.8246	4.7883	4.8006
14431	2018-03-14 00:00:00+00	263	355	4.8003	4.8125	4.7732	4.7985
14432	2018-03-13 00:00:00+00	263	355	4.7985	4.8052	4.7290	4.7403
14433	2018-03-12 00:00:00+00	263	355	4.7412	4.7493	4.6811	4.6920
14434	2018-03-11 00:00:00+00	263	355	4.6931	4.6978	4.6735	4.6810
14435	2018-03-10 00:00:00+00	263	355	4.6904	4.6904	4.6893	4.6893
14436	2018-03-09 00:00:00+00	263	355	4.6917	4.7167	4.6822	4.7035
14437	2018-03-08 00:00:00+00	263	355	4.7072	4.7439	4.6883	4.7221
14438	2018-03-07 00:00:00+00	263	355	4.7234	4.7340	4.7042	4.7165
14439	2018-03-06 00:00:00+00	263	355	4.7169	4.7202	4.6860	4.6983
14440	2018-03-05 00:00:00+00	263	355	4.6984	4.7140	4.6749	4.7007
14441	2018-03-04 00:00:00+00	263	355	4.7016	4.7103	4.6548	4.6832
14442	2018-03-02 00:00:00+00	263	355	4.6865	4.7116	4.6641	4.6757
14443	2018-03-01 00:00:00+00	263	355	4.6746	4.6796	4.6323	4.6389
14444	2018-02-28 00:00:00+00	263	355	4.6381	4.6698	4.6256	4.6670
14445	2018-02-27 00:00:00+00	263	355	4.6686	4.6776	4.6524	4.6626
14446	2018-02-26 00:00:00+00	263	355	4.6617	4.6705	4.6390	4.6556
14447	2018-02-25 00:00:00+00	263	355	4.6546	4.6679	4.6455	4.6543
14448	2018-02-24 00:00:00+00	263	355	4.6600	4.6601	4.6600	4.6601
14449	2018-02-23 00:00:00+00	263	355	4.6600	4.6728	4.6505	4.6660
14450	2018-02-22 00:00:00+00	263	355	4.6676	4.6846	4.6534	4.6596
14451	2018-02-21 00:00:00+00	263	355	4.6595	4.6982	4.6457	4.6858
14452	2018-02-20 00:00:00+00	263	355	4.6861	4.7066	4.6530	4.6621
14453	2018-02-19 00:00:00+00	263	355	4.6625	4.6735	4.6475	4.6514
14454	2018-02-18 00:00:00+00	263	355	4.6506	4.6550	4.6285	4.6464
14455	2018-02-16 00:00:00+00	263	355	4.6482	4.7369	4.6402	4.7088
14456	2018-02-15 00:00:00+00	263	355	4.7088	4.7265	4.6990	4.7137
14457	2018-02-14 00:00:00+00	263	355	4.7128	4.7237	4.6790	4.7056
14458	2018-02-13 00:00:00+00	263	355	4.7064	4.7109	4.6655	4.6681
14459	2018-02-12 00:00:00+00	263	355	4.6679	4.6903	4.6569	4.6760
14460	2018-02-11 00:00:00+00	263	355	4.6763	4.6926	4.6625	4.6625
14461	2018-02-09 00:00:00+00	263	355	4.6828	4.6995	4.6680	4.6869
14462	2018-02-08 00:00:00+00	263	355	4.6855	4.6998	4.6533	4.6672
14463	2018-02-07 00:00:00+00	263	355	4.6666	4.6803	4.6457	4.6633
14464	2018-02-06 00:00:00+00	263	355	4.6615	4.7099	4.6527	4.6850
14465	2018-02-05 00:00:00+00	263	355	4.6871	4.7050	4.6673	4.6902
14466	2018-02-04 00:00:00+00	263	355	4.6904	4.6952	4.6646	4.6937
14467	2018-02-02 00:00:00+00	263	355	4.6974	4.7074	4.6644	4.6666
14468	2018-02-01 00:00:00+00	263	355	4.6666	4.6823	4.6503	4.6665
14469	2018-01-31 00:00:00+00	263	355	4.6665	4.6977	4.6546	4.6830
14470	2018-01-30 00:00:00+00	263	355	4.6807	4.7067	4.6706	4.6915
14471	2018-01-29 00:00:00+00	263	355	4.6919	4.7001	4.6378	4.6592
14472	2018-01-28 00:00:00+00	263	355	4.6557	4.6650	4.6189	4.6505
14473	2018-01-26 00:00:00+00	263	355	4.6643	4.6759	4.6477	4.6509
14474	2018-01-25 00:00:00+00	263	355	4.6499	4.6840	4.6293	4.6396
14475	2018-01-24 00:00:00+00	263	355	4.6431	4.6509	4.6193	4.6328
14476	2018-01-23 00:00:00+00	263	355	4.6337	4.6539	4.6250	4.6275
14477	2018-01-22 00:00:00+00	263	355	4.6304	4.7000	4.6212	4.6906
14478	2018-01-21 00:00:00+00	263	355	4.6905	4.7198	4.6448	4.6989
14479	2018-01-19 00:00:00+00	263	355	4.6519	4.6696	4.6066	4.6149
14480	2018-01-18 00:00:00+00	263	355	4.6129	4.6646	4.5970	4.6524
14481	2018-01-17 00:00:00+00	263	355	4.6521	4.6844	4.6476	4.6546
14482	2018-01-16 00:00:00+00	263	355	4.6522	4.6962	4.6197	4.6600
14483	2018-01-15 00:00:00+00	263	355	4.6616	4.6687	4.5659	4.5809
14484	2018-01-14 00:00:00+00	263	355	4.5803	4.5884	4.5631	4.5836
14485	2018-01-12 00:00:00+00	263	355	4.5715	4.5762	4.5383	4.5427
14486	2018-01-11 00:00:00+00	263	355	4.5426	4.5755	4.5193	4.5408
14487	2018-01-10 00:00:00+00	263	355	4.5433	4.5703	4.4940	4.5027
14488	2018-01-09 00:00:00+00	263	355	4.5008	4.5058	4.4761	4.4819
14489	2018-01-08 00:00:00+00	263	355	4.4814	4.5079	4.4773	4.4923
14490	2018-01-07 00:00:00+00	263	355	4.4918	4.5028	4.4747	4.4863
14491	2018-01-05 00:00:00+00	263	355	4.4927	4.5383	4.4868	4.5256
14492	2018-01-04 00:00:00+00	263	355	4.5260	4.5545	4.5150	4.5419
14493	2018-01-03 00:00:00+00	263	355	4.5453	4.5568	4.5122	4.5395
14494	2018-01-02 00:00:00+00	263	355	4.5361	4.5579	4.5239	4.5549
14495	2018-01-01 00:00:00+00	263	355	4.5446	4.5602	4.4984	4.5461
55585	2019-12-27 00:25:00+00	266	355	7.7097	7.7128	7.7040	7.7127
14499	2019-11-07 00:00:00+00	361	355	5.7467	5.7626	5.7258	5.7500
14500	2019-11-06 00:00:00+00	361	355	5.7499	5.7712	5.7380	5.7529
14501	2019-11-05 00:00:00+00	361	355	5.7493	5.7630	5.7100	5.7337
14502	2019-11-04 00:00:00+00	361	355	5.7322	5.7408	5.6745	5.7018
14503	2019-11-03 00:00:00+00	361	355	5.7008	5.7130	5.6930	5.6989
14504	2019-11-01 00:00:00+00	361	355	5.6989	5.7401	5.6920	5.7090
14505	2019-10-31 00:00:00+00	361	355	5.7074	5.7261	5.6910	5.7000
14506	2019-10-30 00:00:00+00	361	355	5.7007	5.7701	5.6915	5.7496
14507	2019-10-29 00:00:00+00	361	355	5.7482	5.7533	5.7105	5.7302
14508	2019-10-28 00:00:00+00	361	355	5.7291	5.7759	5.7110	5.7609
14509	2019-10-27 00:00:00+00	361	355	5.7585	5.7738	5.7569	5.7640
14510	2019-10-25 00:00:00+00	361	355	5.7738	5.7912	5.7505	5.7646
14511	2019-10-24 00:00:00+00	361	355	5.7637	5.7783	5.7220	5.7381
14512	2019-10-23 00:00:00+00	361	355	5.7375	5.8097	5.7205	5.7943
14513	2019-10-22 00:00:00+00	361	355	5.7932	5.8613	5.7815	5.8605
14514	2019-10-21 00:00:00+00	361	355	5.8608	5.8671	5.7740	5.7937
14515	2019-10-20 00:00:00+00	361	355	5.7957	5.8060	5.7873	5.7909
14516	2019-10-18 00:00:00+00	361	355	5.7900	5.8243	5.7425	5.8136
14517	2019-10-17 00:00:00+00	361	355	5.8089	5.9310	5.8047	5.8825
14518	2019-10-16 00:00:00+00	361	355	5.8796	5.9318	5.8670	5.9215
14519	2019-10-15 00:00:00+00	361	355	5.9194	5.9315	5.8510	5.9233
14520	2019-10-14 00:00:00+00	361	355	5.9274	5.9385	5.8850	5.8960
14521	2019-10-13 00:00:00+00	361	355	5.8960	5.8988	5.8827	5.8833
14522	2019-10-11 00:00:00+00	361	355	5.8833	5.9043	5.8219	5.8439
14523	2019-10-10 00:00:00+00	361	355	5.8414	5.8984	5.8122	5.8759
14524	2019-10-09 00:00:00+00	361	355	5.8770	5.8778	5.8130	5.8316
14525	2019-10-08 00:00:00+00	361	355	5.8301	5.8458	5.7710	5.8394
14526	2019-10-07 00:00:00+00	361	355	5.8383	5.8447	5.6930	5.7100
14527	2019-10-06 00:00:00+00	361	355	5.7100	5.7159	5.6947	5.6952
14528	2019-10-05 00:00:00+00	361	355	5.6952	5.6952	5.6952	5.6952
14529	2019-10-04 00:00:00+00	361	355	5.6960	5.7122	5.6740	5.6936
14530	2019-10-03 00:00:00+00	361	355	5.6903	5.7130	5.6600	5.7016
14531	2019-10-02 00:00:00+00	361	355	5.7003	5.7577	5.6890	5.7205
14532	2019-10-01 00:00:00+00	361	355	5.7196	5.7317	5.6424	5.6455
14533	2019-09-30 00:00:00+00	361	355	5.6455	5.6764	5.6280	5.6639
14534	2019-09-29 00:00:00+00	361	355	5.6673	5.6719	5.6600	5.6698
14535	2019-09-27 00:00:00+00	361	355	5.6698	5.6889	5.6405	5.6669
14536	2019-09-26 00:00:00+00	361	355	5.6672	5.6952	5.6400	5.6714
14537	2019-09-25 00:00:00+00	361	355	5.6728	5.7115	5.6630	5.6937
14538	2019-09-24 00:00:00+00	361	355	5.6937	5.7211	5.6610	5.7160
14539	2019-09-23 00:00:00+00	361	355	5.7194	5.7439	5.7050	5.7352
14540	2019-09-22 00:00:00+00	361	355	5.7357	5.7429	5.7296	5.7429
14541	2019-09-21 00:00:00+00	361	355	5.7429	5.7429	5.7429	5.7429
14542	2019-09-20 00:00:00+00	361	355	5.7409	5.7504	5.6740	5.7175
14543	2019-09-19 00:00:00+00	361	355	5.7168	5.7215	5.6640	5.6745
14544	2019-09-18 00:00:00+00	361	355	5.6745	5.7078	5.6500	5.6995
14545	2019-09-17 00:00:00+00	361	355	5.7046	5.7404	5.6835	5.7287
14546	2019-09-16 00:00:00+00	361	355	5.7268	5.7422	5.6965	5.7229
14547	2019-09-15 00:00:00+00	361	355	5.7229	5.7273	5.6847	5.6851
14548	2019-09-13 00:00:00+00	361	355	5.6851	5.6932	5.6430	5.6602
14549	2019-09-12 00:00:00+00	361	355	5.6615	5.7687	5.6479	5.7467
14550	2019-09-11 00:00:00+00	361	355	5.7464	5.7917	5.7380	5.7689
14551	2019-09-10 00:00:00+00	361	355	5.7686	5.7881	5.7355	5.7439
14552	2019-09-09 00:00:00+00	361	355	5.7435	5.7650	5.6920	5.7037
14553	2019-09-08 00:00:00+00	361	355	5.7060	5.7145	5.6977	5.7145
14554	2019-09-07 00:00:00+00	361	355	5.7145	5.7145	5.7145	5.7145
14555	2019-09-06 00:00:00+00	361	355	5.7145	5.7290	5.6740	5.6937
14556	2019-09-05 00:00:00+00	361	355	5.6916	5.7009	5.6380	5.6746
14557	2019-09-04 00:00:00+00	361	355	5.6748	5.7337	5.6390	5.7275
14558	2019-09-03 00:00:00+00	361	355	5.7257	5.8230	5.7155	5.8060
14559	2019-09-02 00:00:00+00	361	355	5.8046	5.8395	5.7880	5.8339
14560	2019-09-01 00:00:00+00	361	355	5.8351	5.8368	5.8250	5.8295
14561	2019-08-30 00:00:00+00	361	355	5.8295	5.8502	5.8120	5.8402
14562	2019-08-29 00:00:00+00	361	355	5.8405	5.8486	5.7990	5.8165
14563	2019-08-28 00:00:00+00	361	355	5.8159	5.8370	5.7840	5.8257
14564	2019-08-27 00:00:00+00	361	355	5.8245	5.8581	5.7925	5.8221
14565	2019-08-26 00:00:00+00	361	355	5.8203	5.8355	5.7740	5.7989
14566	2019-08-25 00:00:00+00	361	355	5.7977	6.2995	5.7547	5.7589
14567	2019-08-23 00:00:00+00	361	355	5.7589	5.7770	5.7317	5.7694
14568	2019-08-22 00:00:00+00	361	355	5.7687	5.7897	5.7085	5.7164
14569	2019-08-21 00:00:00+00	361	355	5.7088	5.7387	5.7010	5.7284
14570	2019-08-20 00:00:00+00	361	355	5.7316	5.7488	5.6380	5.6473
14571	2019-08-19 00:00:00+00	361	355	5.6469	5.6731	5.5530	5.5841
14572	2019-08-18 00:00:00+00	361	355	5.5819	5.5950	5.5690	5.5775
14573	2019-08-16 00:00:00+00	361	355	5.5775	5.5861	5.5206	5.5690
14574	2019-08-15 00:00:00+00	361	355	5.5667	5.6145	5.5355	5.6124
14575	2019-08-14 00:00:00+00	361	355	5.6103	5.6294	5.5584	5.5648
14576	2019-08-13 00:00:00+00	361	355	5.5600	5.6352	5.5449	5.5625
14577	2019-08-12 00:00:00+00	361	355	5.5618	5.5741	5.4851	5.4922
14578	2019-08-11 00:00:00+00	361	355	5.4870	5.4966	5.4824	5.4900
14579	2019-08-09 00:00:00+00	361	355	5.4890	5.5137	5.4510	5.4816
14580	2019-08-08 00:00:00+00	361	355	5.4816	5.5159	5.4420	5.4859
14581	2019-08-07 00:00:00+00	361	355	5.4859	5.5329	5.4612	5.5290
14582	2019-08-06 00:00:00+00	361	355	5.5273	5.5925	5.5028	5.5841
14583	2019-08-05 00:00:00+00	361	355	5.5839	5.6227	5.5230	5.5546
14584	2019-08-04 00:00:00+00	361	355	5.5524	5.5720	5.5434	5.5587
14585	2019-08-03 00:00:00+00	361	355	5.5587	5.5587	5.5587	5.5587
14586	2019-08-02 00:00:00+00	361	355	5.5587	5.6153	5.5408	5.6029
14587	2019-08-01 00:00:00+00	361	355	5.6029	5.6300	5.5480	5.5775
14588	2019-07-31 00:00:00+00	361	355	5.5799	5.6201	5.5030	5.5583
14589	2019-07-30 00:00:00+00	361	355	5.5560	5.6206	5.5395	5.6200
14590	2019-07-29 00:00:00+00	361	355	5.6204	5.6699	5.5905	5.6570
14591	2019-07-28 00:00:00+00	361	355	5.6605	5.6666	5.6412	5.6635
14592	2019-07-27 00:00:00+00	361	355	5.6708	5.6708	5.6708	5.6708
14593	2019-07-26 00:00:00+00	361	355	5.6708	5.7036	5.6007	5.7002
14594	2019-07-25 00:00:00+00	361	355	5.6992	5.7750	5.6385	5.7134
14595	2019-07-24 00:00:00+00	361	355	5.7135	5.7395	5.6905	5.7117
14596	2019-07-23 00:00:00+00	361	355	5.7101	5.7252	5.6600	5.6711
14597	2019-07-22 00:00:00+00	361	355	5.6716	5.6942	5.6427	5.6438
14598	2019-07-21 00:00:00+00	361	355	5.6480	5.6638	5.6296	5.6531
14599	2019-07-19 00:00:00+00	361	355	5.6530	5.6776	5.6060	5.6251
14600	2019-07-18 00:00:00+00	361	355	5.6252	5.7091	5.5977	5.6830
14601	2019-07-17 00:00:00+00	361	355	5.6842	5.7174	5.6650	5.7121
14602	2019-07-16 00:00:00+00	361	355	5.7087	5.7244	5.6835	5.7058
14603	2019-07-15 00:00:00+00	361	355	5.7069	5.7317	5.6936	5.7237
14604	2019-07-14 00:00:00+00	361	355	5.7284	5.7328	5.7122	5.7189
14605	2019-07-13 00:00:00+00	361	355	5.7081	5.7081	5.7081	5.7081
14606	2019-07-12 00:00:00+00	361	355	5.7081	5.7787	5.6545	5.6787
14607	2019-07-11 00:00:00+00	361	355	5.6814	5.6913	5.6440	5.6858
14608	2019-07-10 00:00:00+00	361	355	5.6851	5.7590	5.6620	5.7336
14609	2019-07-09 00:00:00+00	361	355	5.7329	5.7466	5.6735	5.7311
14610	2019-07-08 00:00:00+00	361	355	5.7311	5.7871	5.6940	5.7353
14611	2019-07-07 00:00:00+00	361	355	5.7353	5.7939	5.6275	5.6275
14612	2019-07-05 00:00:00+00	361	355	5.6275	5.6472	5.5830	5.6004
14613	2019-07-04 00:00:00+00	361	355	5.6024	5.6262	5.5730	5.6213
14614	2019-07-03 00:00:00+00	361	355	5.6209	5.6646	5.5945	5.6519
14615	2019-07-02 00:00:00+00	361	355	5.6518	5.7004	5.6150	5.6509
14616	2019-07-01 00:00:00+00	361	355	5.6488	5.7483	5.6120	5.7315
14617	2019-06-30 00:00:00+00	361	355	5.7315	5.7393	5.7259	5.7347
14618	2019-06-29 00:00:00+00	361	355	5.7873	5.7873	5.7873	5.7873
14619	2019-06-28 00:00:00+00	361	355	5.7873	5.7987	5.7390	5.7739
14620	2019-06-27 00:00:00+00	361	355	5.7727	5.7934	5.7495	5.7705
14621	2019-06-26 00:00:00+00	361	355	5.7705	5.8154	5.7410	5.7933
14622	2019-06-25 00:00:00+00	361	355	5.7921	5.8316	5.7440	5.8010
14623	2019-06-24 00:00:00+00	361	355	5.8017	5.8319	5.6980	5.7649
14624	2019-06-23 00:00:00+00	361	355	5.7653	5.8204	5.7231	5.8204
14625	2019-06-21 00:00:00+00	361	355	5.8204	5.8385	5.7465	5.7607
14626	2019-06-20 00:00:00+00	361	355	5.7597	5.8259	5.7185	5.7914
14627	2019-06-19 00:00:00+00	361	355	5.7905	5.9172	5.7795	5.8257
14628	2019-06-18 00:00:00+00	361	355	5.8280	5.8784	5.8070	5.8713
14629	2019-06-17 00:00:00+00	361	355	5.8713	5.9274	5.8430	5.9114
14630	2019-06-16 00:00:00+00	361	355	5.9119	5.9182	5.8946	5.8946
14631	2019-06-15 00:00:00+00	361	355	5.8946	5.8946	5.8946	5.8946
14632	2019-06-14 00:00:00+00	361	355	5.8965	5.9326	5.8450	5.8647
14633	2019-06-13 00:00:00+00	361	355	5.8666	5.9040	5.7985	5.8080
14634	2019-06-12 00:00:00+00	361	355	5.8073	5.8294	5.7580	5.8035
14635	2019-06-11 00:00:00+00	361	355	5.8035	5.8429	5.7430	5.7897
14636	2019-06-10 00:00:00+00	361	355	5.7881	5.8586	5.7500	5.8357
14637	2019-06-09 00:00:00+00	361	355	5.8357	5.8473	5.8103	5.8300
14638	2019-06-07 00:00:00+00	361	355	5.8300	5.8685	5.7740	5.7902
14639	2019-06-06 00:00:00+00	361	355	5.7865	5.8062	5.7103	5.7218
14640	2019-06-05 00:00:00+00	361	355	5.7204	5.7883	5.6569	5.7766
14641	2019-06-04 00:00:00+00	361	355	5.7753	5.8632	5.7416	5.8326
14642	2019-06-03 00:00:00+00	361	355	5.8327	5.8929	5.8203	5.8643
14643	2019-06-02 00:00:00+00	361	355	5.8646	5.8659	5.8276	5.8460
14644	2019-05-31 00:00:00+00	361	355	5.8312	5.9219	5.8120	5.8884
14645	2019-05-30 00:00:00+00	361	355	5.8910	6.0262	5.8475	6.0142
14646	2019-05-29 00:00:00+00	361	355	6.0128	6.0557	5.9870	6.0303
14647	2019-05-28 00:00:00+00	361	355	6.0301	6.0821	5.9775	6.0671
14648	2019-05-27 00:00:00+00	361	355	6.0639	6.1058	6.0210	6.0899
14649	2019-05-26 00:00:00+00	361	355	6.0894	6.1175	6.0626	6.0820
14650	2019-05-25 00:00:00+00	361	355	6.0820	6.0820	6.0820	6.0820
14651	2019-05-24 00:00:00+00	361	355	6.0820	6.1285	6.0440	6.1143
14652	2019-05-23 00:00:00+00	361	355	6.1153	6.1516	6.0835	6.0985
14653	2019-05-22 00:00:00+00	361	355	6.1000	6.1215	6.0450	6.0634
14654	2019-05-21 00:00:00+00	361	355	6.0619	6.0919	6.0061	6.0252
14655	2019-05-20 00:00:00+00	361	355	6.0248	6.0797	5.9907	6.0611
14656	2019-05-19 00:00:00+00	361	355	6.0611	6.0630	6.0408	6.0530
14657	2019-05-17 00:00:00+00	361	355	6.0530	6.0943	6.0200	6.0551
14658	2019-05-16 00:00:00+00	361	355	6.0542	6.0555	5.9860	6.0137
14659	2019-05-15 00:00:00+00	361	355	6.0145	6.0866	5.9863	6.0300
14660	2019-05-14 00:00:00+00	361	355	6.0352	6.1120	5.9730	6.0687
14661	2019-05-13 00:00:00+00	361	355	6.0733	6.1316	5.9530	5.9841
14662	2019-05-12 00:00:00+00	361	355	5.9841	6.0063	5.9682	5.9757
14663	2019-05-10 00:00:00+00	361	355	5.9757	6.1734	5.9504	6.1562
14664	2019-05-09 00:00:00+00	361	355	6.1563	6.2458	6.1490	6.1624
14665	2019-05-08 00:00:00+00	361	355	6.1619	6.1983	6.1365	6.1543
14666	2019-05-07 00:00:00+00	361	355	6.1531	6.1983	6.0724	6.0848
14667	2019-05-06 00:00:00+00	361	355	6.0863	6.1501	5.9740	5.9801
14668	2019-05-05 00:00:00+00	361	355	5.9781	5.9949	5.9531	5.9531
14669	2019-05-03 00:00:00+00	361	355	5.9531	5.9826	5.9500	5.9606
14670	2019-05-02 00:00:00+00	361	355	5.9616	5.9834	5.9425	5.9654
14671	2019-05-01 00:00:00+00	361	355	5.9651	5.9729	5.9325	5.9635
14672	2019-04-30 00:00:00+00	361	355	5.9628	5.9848	5.9220	5.9479
14673	2019-04-29 00:00:00+00	361	355	5.9503	5.9607	5.9100	5.9425
14674	2019-04-28 00:00:00+00	361	355	5.9426	5.9462	5.9259	5.9372
14675	2019-04-26 00:00:00+00	361	355	5.9372	5.9713	5.9077	5.9477
14676	2019-04-25 00:00:00+00	361	355	5.9477	5.9804	5.8686	5.8862
14677	2019-04-24 00:00:00+00	361	355	5.8858	5.8918	5.8284	5.8361
14678	2019-04-23 00:00:00+00	361	355	5.8341	5.8532	5.8065	5.8299
14679	2019-04-22 00:00:00+00	361	355	5.8255	5.8617	5.8010	5.8234
14680	2019-04-21 00:00:00+00	361	355	5.8234	5.8328	5.7924	5.8102
14681	2019-04-20 00:00:00+00	361	355	5.8102	5.8102	5.8102	5.8102
14682	2019-04-19 00:00:00+00	361	355	5.8102	5.8342	5.7710	5.8088
14683	2019-04-18 00:00:00+00	361	355	5.8072	5.8529	5.7427	5.7540
14684	2019-04-17 00:00:00+00	361	355	5.7537	5.7954	5.6950	5.7879
14685	2019-04-16 00:00:00+00	361	355	5.7878	5.8288	5.7335	5.8030
14686	2019-04-15 00:00:00+00	361	355	5.8029	5.8212	5.7687	5.7741
14687	2019-04-14 00:00:00+00	361	355	5.7741	5.7759	5.7485	5.7551
14688	2019-04-12 00:00:00+00	361	355	5.7683	5.8235	5.7215	5.7334
14689	2019-04-11 00:00:00+00	361	355	5.7333	5.7574	5.6605	5.6830
14690	2019-04-10 00:00:00+00	361	355	5.6832	5.7228	5.6570	5.6812
14691	2019-04-09 00:00:00+00	361	355	5.6810	5.7043	5.6320	5.6894
14692	2019-04-08 00:00:00+00	361	355	5.6884	5.7297	5.6103	5.6314
14693	2019-04-07 00:00:00+00	361	355	5.6314	5.6375	5.6250	5.6250
14694	2019-04-06 00:00:00+00	361	355	5.6250	5.6250	5.6250	5.6250
14695	2019-04-05 00:00:00+00	361	355	5.6250	5.6506	5.5580	5.5899
14696	2019-04-04 00:00:00+00	361	355	5.5970	5.6618	5.5395	5.6223
14697	2019-04-03 00:00:00+00	361	355	5.6209	5.6630	5.5735	5.6181
14698	2019-04-02 00:00:00+00	361	355	5.6161	5.6800	5.5042	5.5103
14699	2019-04-01 00:00:00+00	361	355	5.5103	5.7020	5.4309	5.5881
14700	2019-03-31 00:00:00+00	361	355	5.5881	5.6090	5.5405	5.5405
14701	2019-03-30 00:00:00+00	361	355	5.5405	5.5405	5.5405	5.5405
14702	2019-03-29 00:00:00+00	361	355	5.5748	5.6764	5.5420	5.5697
14703	2019-03-28 00:00:00+00	361	355	5.5687	5.6296	5.3729	5.3935
14704	2019-03-27 00:00:00+00	361	355	5.3934	5.4666	5.3021	5.3671
14705	2019-03-26 00:00:00+00	361	355	5.3663	5.5926	5.2984	5.5723
14706	2019-03-25 00:00:00+00	361	355	5.5724	5.7456	5.5402	5.7444
14707	2019-03-24 00:00:00+00	361	355	5.7452	5.7716	5.7284	5.7610
14708	2019-03-22 00:00:00+00	361	355	5.7617	5.8440	5.4460	5.4657
14709	2019-03-21 00:00:00+00	361	355	5.4657	5.4780	5.4185	5.4244
14710	2019-03-20 00:00:00+00	361	355	5.4250	5.4835	5.4054	5.4751
14711	2019-03-19 00:00:00+00	361	355	5.4756	5.4879	5.4505	5.4678
14712	2019-03-18 00:00:00+00	361	355	5.4683	5.4729	5.4415	5.4474
14713	2019-03-17 00:00:00+00	361	355	5.4484	5.4501	5.4403	5.4457
14714	2019-03-16 00:00:00+00	361	355	5.4457	5.4457	5.4457	5.4457
14715	2019-03-15 00:00:00+00	361	355	5.4457	5.4758	5.4388	5.4684
14716	2019-03-14 00:00:00+00	361	355	5.4672	5.4760	5.4550	5.4596
14717	2019-03-13 00:00:00+00	361	355	5.4587	5.4811	5.4455	5.4562
14718	2019-03-12 00:00:00+00	361	355	5.4553	5.4668	5.4205	5.4387
14719	2019-03-11 00:00:00+00	361	355	5.4387	5.4609	5.4218	5.4279
14720	2019-03-10 00:00:00+00	361	355	5.4275	5.4463	5.4246	5.4260
14721	2019-03-09 00:00:00+00	361	355	5.4260	5.4260	5.4260	5.4260
14722	2019-03-08 00:00:00+00	361	355	5.4312	5.4886	5.4160	5.4608
14723	2019-03-07 00:00:00+00	361	355	5.4607	5.4812	5.4165	5.4266
14724	2019-03-06 00:00:00+00	361	355	5.4266	5.4458	5.3560	5.3856
14725	2019-03-05 00:00:00+00	361	355	5.3848	5.4019	5.3565	5.3696
14726	2019-03-04 00:00:00+00	361	355	5.3696	5.4015	5.3615	5.3641
14727	2019-03-03 00:00:00+00	361	355	5.3653	5.3731	5.3607	5.3731
14728	2019-03-02 00:00:00+00	361	355	5.3732	5.3732	5.3732	5.3732
14729	2019-03-01 00:00:00+00	361	355	5.3732	5.4053	5.3260	5.3403
14730	2019-02-28 00:00:00+00	361	355	5.3410	5.3424	5.3020	5.3125
14731	2019-02-27 00:00:00+00	361	355	5.3125	5.3226	5.2790	5.3036
14732	2019-02-26 00:00:00+00	361	355	5.3045	5.3176	5.2850	5.3034
14733	2019-02-25 00:00:00+00	361	355	5.3034	5.3264	5.2892	5.3247
14734	2019-02-24 00:00:00+00	361	355	5.3177	5.3262	5.3105	5.3176
14735	2019-02-23 00:00:00+00	361	355	5.3176	5.3176	5.3176	5.3176
14736	2019-02-22 00:00:00+00	361	355	5.3116	5.3410	5.3020	5.3186
14737	2019-02-21 00:00:00+00	361	355	5.3173	5.3418	5.2945	5.3202
14738	2019-02-20 00:00:00+00	361	355	5.3202	5.3358	5.2715	5.2805
14739	2019-02-19 00:00:00+00	361	355	5.2797	5.3229	5.2762	5.3040
14740	2019-02-18 00:00:00+00	361	355	5.3035	5.3164	5.2692	5.2893
14741	2019-02-17 00:00:00+00	361	355	5.2852	5.2889	5.2697	5.2705
14742	2019-02-16 00:00:00+00	361	355	5.2705	5.2705	5.2705	5.2705
14743	2019-02-15 00:00:00+00	361	355	5.2705	5.3108	5.2440	5.2754
14744	2019-02-14 00:00:00+00	361	355	5.2768	5.3235	5.2550	5.2829
14745	2019-02-13 00:00:00+00	361	355	5.2830	5.2940	5.2320	5.2507
14746	2019-02-12 00:00:00+00	361	355	5.2506	5.2895	5.2415	5.2778
14747	2019-02-11 00:00:00+00	361	355	5.2778	5.2904	5.2320	5.2466
14748	2019-02-10 00:00:00+00	361	355	5.2466	5.2508	5.2414	5.2464
14749	2019-02-08 00:00:00+00	361	355	5.2430	5.2771	5.2310	5.2704
14750	2019-02-07 00:00:00+00	361	355	5.2708	5.2956	5.2050	5.2142
14751	2019-02-06 00:00:00+00	361	355	5.2113	5.2332	5.1890	5.1955
14752	2019-02-05 00:00:00+00	361	355	5.1950	5.2207	5.1750	5.2158
14753	2019-02-04 00:00:00+00	361	355	5.2158	5.2412	5.2000	5.2092
14754	2019-02-03 00:00:00+00	361	355	5.2092	5.2124	5.2000	5.2070
14755	2019-02-01 00:00:00+00	361	355	5.2075	5.2309	5.1656	5.1723
14756	2019-01-31 00:00:00+00	361	355	5.1723	5.2410	5.1543	5.2333
14757	2019-01-30 00:00:00+00	361	355	5.2334	5.3247	5.2080	5.3108
14758	2019-01-29 00:00:00+00	361	355	5.3090	5.3628	5.2935	5.3247
14759	2019-01-28 00:00:00+00	361	355	5.3245	5.3448	5.2493	5.2750
14760	2019-01-27 00:00:00+00	361	355	5.2713	5.2788	5.1154	5.2590
14761	2019-01-25 00:00:00+00	361	355	5.2590	5.2931	5.2480	5.2710
14762	2019-01-24 00:00:00+00	361	355	5.2740	5.2990	5.2430	5.2835
14763	2019-01-23 00:00:00+00	361	355	5.2827	5.3556	5.2705	5.3395
14764	2019-01-22 00:00:00+00	361	355	5.3395	5.3665	5.3139	5.3199
14765	2019-01-21 00:00:00+00	361	355	5.3193	5.3558	5.3118	5.3295
14766	2019-01-20 00:00:00+00	361	355	5.3293	5.3314	5.3156	5.3161
14767	2019-01-18 00:00:00+00	361	355	5.3161	5.3772	5.3142	5.3437
14768	2019-01-17 00:00:00+00	361	355	5.3499	5.3879	5.3285	5.3305
14769	2019-01-16 00:00:00+00	361	355	5.3464	5.4520	5.3230	5.4434
14770	2019-01-15 00:00:00+00	361	355	5.4466	5.4669	5.4185	5.4478
14771	2019-01-14 00:00:00+00	361	355	5.4472	5.5426	5.4200	5.4625
14772	2019-01-13 00:00:00+00	361	355	5.4613	5.4760	5.4520	5.4520
14773	2019-01-12 00:00:00+00	361	355	5.4520	5.4520	5.4520	5.4520
14774	2019-01-11 00:00:00+00	361	355	5.4520	5.5023	5.4118	5.4165
14775	2019-01-10 00:00:00+00	361	355	5.4212	5.5058	5.3940	5.4735
14776	2019-01-09 00:00:00+00	361	355	5.4812	5.5453	5.4335	5.4649
14777	2019-01-08 00:00:00+00	361	355	5.4747	5.5153	5.3731	5.3807
14778	2019-01-07 00:00:00+00	361	355	5.3798	5.4120	5.3128	5.3210
14779	2019-01-06 00:00:00+00	361	355	5.3231	5.3353	5.3103	5.3340
14780	2019-01-05 00:00:00+00	361	355	5.3325	5.3325	5.3325	5.3325
14781	2019-01-04 00:00:00+00	361	355	5.3319	5.4762	5.3048	5.4703
14782	2019-01-03 00:00:00+00	361	355	5.4632	5.7309	5.3999	5.7047
14783	2019-01-02 00:00:00+00	361	355	5.7048	5.7386	5.2674	5.2808
14784	2019-01-01 00:00:00+00	361	355	5.2682	5.2938	5.2650	5.2700
14785	2018-12-31 00:00:00+00	361	355	5.2700	5.3215	5.2565	5.2938
14786	2018-12-30 00:00:00+00	361	355	5.2951	5.3057	5.2520	5.2715
14787	2018-12-29 00:00:00+00	361	355	5.2715	5.2715	5.2715	5.2715
14788	2018-12-28 00:00:00+00	361	355	5.2715	5.3004	5.2427	5.2911
14789	2018-12-27 00:00:00+00	361	355	5.2850	5.3146	5.2600	5.2711
14790	2018-12-26 00:00:00+00	361	355	5.2702	5.3061	5.2648	5.3061
14791	2018-12-25 00:00:00+00	361	355	5.3061	5.3403	5.2710	5.2859
14792	2018-12-24 00:00:00+00	361	355	5.2864	5.3243	5.2710	5.3096
14793	2018-12-23 00:00:00+00	361	355	5.3076	5.3174	5.2999	5.3150
14794	2018-12-22 00:00:00+00	361	355	5.3170	5.3170	5.3170	5.3170
14795	2018-12-21 00:00:00+00	361	355	5.3170	5.3218	5.2320	5.2596
14796	2018-12-20 00:00:00+00	361	355	5.2629	5.3210	5.2220	5.2954
14797	2018-12-19 00:00:00+00	361	355	5.2980	5.3515	5.1975	5.3399
14798	2018-12-18 00:00:00+00	361	355	5.3386	5.3903	5.3297	5.3689
14799	2018-12-17 00:00:00+00	361	355	5.3693	5.3986	5.3580	5.3640
14800	2018-12-16 00:00:00+00	361	355	5.3649	5.3723	5.3548	5.3625
14801	2018-12-15 00:00:00+00	361	355	5.3625	5.3625	5.3625	5.3625
14802	2018-12-14 00:00:00+00	361	355	5.3625	5.4217	5.3350	5.3424
14803	2018-12-13 00:00:00+00	361	355	5.3404	5.3888	5.2940	5.3448
14804	2018-12-12 00:00:00+00	361	355	5.3456	5.4012	5.3260	5.3591
14805	2018-12-11 00:00:00+00	361	355	5.3617	5.4057	5.3000	5.3222
14806	2018-12-10 00:00:00+00	361	355	5.3217	5.3526	5.2701	5.3087
14807	2018-12-09 00:00:00+00	361	355	5.3076	5.3124	5.2913	5.3020
14808	2018-12-08 00:00:00+00	361	355	5.3020	5.3020	5.3020	5.3020
14809	2018-12-07 00:00:00+00	361	355	5.3020	5.3508	5.2509	5.3368
14810	2018-12-06 00:00:00+00	361	355	5.3363	5.4015	5.3145	5.3206
14811	2018-12-05 00:00:00+00	361	355	5.3208	5.4546	5.3020	5.3835
14812	2018-12-04 00:00:00+00	361	355	5.3835	5.4566	5.2260	5.2397
14813	2018-12-03 00:00:00+00	361	355	5.2470	5.2851	5.1360	5.1769
14814	2018-12-02 00:00:00+00	361	355	5.1654	5.2127	5.1529	5.2118
14815	2018-12-01 00:00:00+00	361	355	5.2118	5.2118	5.2118	5.2118
14816	2018-11-30 00:00:00+00	361	355	5.2002	5.2568	5.1370	5.1649
14817	2018-11-29 00:00:00+00	361	355	5.1641	5.2278	5.1220	5.2171
14818	2018-11-28 00:00:00+00	361	355	5.2167	5.2740	5.2026	5.2437
14819	2018-11-27 00:00:00+00	361	355	5.2629	5.2960	5.2135	5.2532
14820	2018-11-26 00:00:00+00	361	355	5.2483	5.2982	5.2103	5.2926
14821	2018-11-25 00:00:00+00	361	355	5.2891	5.2999	5.2779	5.2865
14822	2018-11-24 00:00:00+00	361	355	5.2865	5.2865	5.2865	5.2865
14823	2018-11-23 00:00:00+00	361	355	5.2865	5.3152	5.2560	5.2885
14824	2018-11-22 00:00:00+00	361	355	5.2979	5.3448	5.2640	5.3099
14825	2018-11-21 00:00:00+00	361	355	5.3084	5.3967	5.2729	5.3782
14826	2018-11-20 00:00:00+00	361	355	5.3776	5.4387	5.2960	5.3104
14827	2018-11-19 00:00:00+00	361	355	5.3099	5.3697	5.2981	5.3440
14828	2018-11-18 00:00:00+00	361	355	5.3309	5.3612	5.3217	5.3348
14829	2018-11-17 00:00:00+00	361	355	5.3305	5.3305	5.3305	5.3305
14830	2018-11-16 00:00:00+00	361	355	5.3197	5.3941	5.3040	5.3676
14831	2018-11-15 00:00:00+00	361	355	5.3675	5.4756	5.3009	5.4555
14832	2018-11-14 00:00:00+00	361	355	5.4563	5.4990	5.4400	5.4760
14833	2018-11-13 00:00:00+00	361	355	5.4759	5.5293	5.4450	5.4671
14834	2018-11-12 00:00:00+00	361	355	5.4674	5.5157	5.4165	5.4635
14835	2018-11-11 00:00:00+00	361	355	5.4635	5.4676	5.4476	5.4596
14836	2018-11-10 00:00:00+00	361	355	5.4596	5.4596	5.4596	5.4596
14837	2018-11-09 00:00:00+00	361	355	5.4476	5.5419	5.4383	5.4614
14838	2018-11-08 00:00:00+00	361	355	5.4611	5.4750	5.3540	5.3608
14839	2018-11-07 00:00:00+00	361	355	5.3646	5.4125	5.3120	5.3535
14840	2018-11-06 00:00:00+00	361	355	5.3697	5.4195	5.2930	5.3126
14841	2018-11-05 00:00:00+00	361	355	5.3164	5.4769	5.2990	5.4260
14842	2018-11-04 00:00:00+00	361	355	5.4291	5.4314	5.4184	5.4286
14843	2018-11-02 00:00:00+00	361	355	5.4285	5.5269	5.3975	5.5150
14844	2018-11-01 00:00:00+00	361	355	5.5158	5.6485	5.4976	5.5813
14845	2018-10-31 00:00:00+00	361	355	5.5847	5.6284	5.4635	5.4712
14846	2018-10-30 00:00:00+00	361	355	5.4763	5.5619	5.4535	5.5549
14847	2018-10-29 00:00:00+00	361	355	5.5518	5.5949	5.5033	5.5831
14848	2018-10-28 00:00:00+00	361	355	5.5831	5.6038	5.5799	5.5919
14849	2018-10-26 00:00:00+00	361	355	5.5919	5.6580	5.5597	5.6321
14850	2018-10-25 00:00:00+00	361	355	5.6323	5.7354	5.6064	5.6956
14851	2018-10-24 00:00:00+00	361	355	5.6956	5.7753	5.6525	5.7455
14852	2018-10-23 00:00:00+00	361	355	5.7455	5.8736	5.6605	5.6655
14853	2018-10-22 00:00:00+00	361	355	5.6654	5.6913	5.6120	5.6506
14854	2018-10-21 00:00:00+00	361	355	5.6489	5.6513	5.6384	5.6415
14855	2018-10-19 00:00:00+00	361	355	5.6415	5.6998	5.5830	5.6300
14856	2018-10-18 00:00:00+00	361	355	5.6303	5.6936	5.5073	5.5885
14857	2018-10-17 00:00:00+00	361	355	5.5886	5.7162	5.5225	5.6873
14858	2018-10-16 00:00:00+00	361	355	5.6873	5.8072	5.6575	5.7768
14859	2018-10-15 00:00:00+00	361	355	5.7787	5.9042	5.7400	5.8864
14860	2018-10-14 00:00:00+00	361	355	5.8883	5.9029	5.8654	5.8700
14861	2018-10-12 00:00:00+00	361	355	5.8700	5.9850	5.8130	5.9165
14862	2018-10-11 00:00:00+00	361	355	5.9291	6.0834	5.8935	6.0803
14863	2018-10-10 00:00:00+00	361	355	6.0803	6.1322	6.0097	6.1020
14864	2018-10-09 00:00:00+00	361	355	6.1042	6.1594	6.0720	6.1145
14865	2018-10-08 00:00:00+00	361	355	6.1139	6.1922	6.0911	6.1636
14866	2018-10-07 00:00:00+00	361	355	6.1648	6.1716	6.1240	6.1425
14867	2018-10-06 00:00:00+00	361	355	6.1425	6.1425	6.1425	6.1425
14868	2018-10-05 00:00:00+00	361	355	6.1425	6.2116	6.0867	6.1653
14869	2018-10-04 00:00:00+00	361	355	6.1668	6.2293	6.0285	6.0481
14870	2018-10-03 00:00:00+00	361	355	6.0506	6.0980	5.9660	5.9836
14871	2018-10-02 00:00:00+00	361	355	5.9836	6.0588	5.9120	5.9383
14872	2018-10-01 00:00:00+00	361	355	5.9374	6.0553	5.8950	6.0430
14873	2018-09-30 00:00:00+00	361	355	6.0438	6.0692	6.0286	6.0685
14874	2018-09-28 00:00:00+00	361	355	6.0685	6.0932	5.9375	6.0028
14875	2018-09-27 00:00:00+00	361	355	6.0028	6.1353	5.9458	6.1088
14876	2018-09-26 00:00:00+00	361	355	6.1080	6.1989	6.0380	6.1954
14877	2018-09-25 00:00:00+00	361	355	6.1966	6.2240	6.0550	6.1320
14878	2018-09-24 00:00:00+00	361	355	6.1325	6.3313	6.0310	6.2934
14879	2018-09-23 00:00:00+00	361	355	6.2987	6.3105	6.2786	6.2805
14880	2018-09-21 00:00:00+00	361	355	6.2917	6.3059	6.1830	6.1965
14881	2018-09-20 00:00:00+00	361	355	6.1965	6.3747	6.1145	6.2502
14882	2018-09-19 00:00:00+00	361	355	6.2572	6.4156	6.2160	6.3914
14883	2018-09-18 00:00:00+00	361	355	6.3995	6.4636	6.2910	6.3165
14884	2018-09-17 00:00:00+00	361	355	6.3165	6.3261	6.1414	6.1414
14885	2018-09-16 00:00:00+00	361	355	6.1592	6.1799	6.1353	6.1630
14886	2018-09-15 00:00:00+00	361	355	6.1630	6.1630	6.1630	6.1630
14887	2018-09-14 00:00:00+00	361	355	6.1630	6.1940	6.0020	6.1009
14888	2018-09-13 00:00:00+00	361	355	6.1009	6.5514	5.9879	6.3448
14889	2018-09-12 00:00:00+00	361	355	6.3444	6.4697	6.3150	6.4376
14890	2018-09-11 00:00:00+00	361	355	6.4376	6.4903	6.4060	6.4691
14891	2018-09-10 00:00:00+00	361	355	6.4691	6.4969	6.3785	6.3897
14892	2018-09-09 00:00:00+00	361	355	6.4040	6.4076	6.3603	6.3815
14893	2018-09-08 00:00:00+00	361	355	6.3815	6.3815	6.3815	6.3815
14894	2018-09-07 00:00:00+00	361	355	6.3815	6.6051	6.3614	6.5819
14895	2018-09-06 00:00:00+00	361	355	6.5743	6.6400	6.5400	6.5628
14896	2018-09-05 00:00:00+00	361	355	6.5626	6.7228	6.5492	6.6850
14897	2018-09-04 00:00:00+00	361	355	6.6850	6.7239	6.5873	6.6090
14898	2018-09-03 00:00:00+00	361	355	6.6318	6.7329	6.4935	6.5633
14899	2018-09-02 00:00:00+00	361	355	6.5648	6.5883	6.5180	6.5180
14900	2018-08-31 00:00:00+00	361	355	6.5180	6.7898	6.3720	6.6769
14901	2018-08-30 00:00:00+00	361	355	6.6777	6.8396	6.4212	6.4230
14902	2018-08-29 00:00:00+00	361	355	6.4200	6.4872	6.2190	6.2571
14903	2018-08-28 00:00:00+00	361	355	6.2697	6.2878	6.1125	6.1621
14904	2018-08-27 00:00:00+00	361	355	6.1621	6.2975	5.9688	5.9843
14905	2018-08-26 00:00:00+00	361	355	5.9843	6.0258	5.9649	6.0048
14906	2018-08-25 00:00:00+00	361	355	6.0048	6.0048	6.0048	6.0048
14907	2018-08-24 00:00:00+00	361	355	6.0048	6.1337	5.9836	6.0897
14908	2018-08-23 00:00:00+00	361	355	6.0881	6.1531	5.9899	6.0265
14909	2018-08-22 00:00:00+00	361	355	6.0217	6.1180	6.0011	6.0662
14910	2018-08-21 00:00:00+00	361	355	6.0603	6.1590	6.0040	6.0964
14911	2018-08-20 00:00:00+00	361	355	6.0964	6.1994	5.9530	5.9832
14912	2018-08-19 00:00:00+00	361	355	5.9830	6.0270	5.9540	6.0120
14913	2018-08-18 00:00:00+00	361	355	6.0120	6.0120	6.0120	6.0120
14914	2018-08-17 00:00:00+00	361	355	6.0120	6.3467	5.7286	5.8351
14915	2018-08-16 00:00:00+00	361	355	5.8350	6.0372	5.6844	5.9796
14916	2018-08-15 00:00:00+00	361	355	5.9781	6.5796	5.8365	6.3512
14917	2018-08-14 00:00:00+00	361	355	6.3746	6.9658	6.2865	6.9070
14918	2018-08-13 00:00:00+00	361	355	6.9263	7.0861	6.4446	6.8347
14919	2018-08-12 00:00:00+00	361	355	6.8339	7.2149	6.4118	6.4280
14920	2018-08-11 00:00:00+00	361	355	6.4280	6.4280	6.4280	6.4280
14921	2018-08-10 00:00:00+00	361	355	6.4280	6.8010	5.5421	5.5510
14922	2018-08-09 00:00:00+00	361	355	5.5460	5.5676	5.2784	5.2818
14923	2018-08-08 00:00:00+00	361	355	5.2814	5.3121	5.2239	5.2507
14924	2018-08-07 00:00:00+00	361	355	5.2548	5.3555	5.1720	5.2641
14925	2018-08-06 00:00:00+00	361	355	5.2642	5.4269	5.0864	5.1033
14926	2018-08-05 00:00:00+00	361	355	5.1037	5.1067	5.0719	5.0800
14927	2018-08-04 00:00:00+00	361	355	5.0800	5.0800	5.0800	5.0800
14928	2018-08-03 00:00:00+00	361	355	5.0800	5.1174	5.0520	5.0662
14929	2018-08-02 00:00:00+00	361	355	5.0700	5.0932	4.9571	4.9930
14930	2018-08-01 00:00:00+00	361	355	4.9928	5.0156	4.9046	4.9153
14931	2018-07-31 00:00:00+00	361	355	4.9154	4.9286	4.8705	4.8847
14932	2018-07-30 00:00:00+00	361	355	4.8873	4.9084	4.8436	4.8520
14933	2018-07-29 00:00:00+00	361	355	4.8517	4.8595	4.8384	4.8470
14934	2018-07-27 00:00:00+00	361	355	4.8470	4.8828	4.8330	4.8676
14935	2018-07-26 00:00:00+00	361	355	4.8681	4.8835	4.7763	4.7995
14936	2018-07-25 00:00:00+00	361	355	4.7941	4.8851	4.7658	4.8818
14937	2018-07-24 00:00:00+00	361	355	4.8815	4.9387	4.7315	4.7393
14938	2018-07-23 00:00:00+00	361	355	4.7373	4.7810	4.7315	4.7767
14939	2018-07-22 00:00:00+00	361	355	4.7762	4.8053	4.7715	4.8053
14940	2018-07-21 00:00:00+00	361	355	4.7955	4.7955	4.7955	4.7955
14941	2018-07-20 00:00:00+00	361	355	4.7917	4.8297	4.7630	4.8091
14942	2018-07-19 00:00:00+00	361	355	4.8096	4.8412	4.7861	4.7935
14943	2018-07-18 00:00:00+00	361	355	4.7935	4.8467	4.7615	4.8002
14944	2018-07-17 00:00:00+00	361	355	4.8011	4.8595	4.7731	4.8515
14945	2018-07-16 00:00:00+00	361	355	4.8520	4.8748	4.8170	4.8554
14946	2018-07-15 00:00:00+00	361	355	4.8554	4.8635	4.8385	4.8385
14947	2018-07-13 00:00:00+00	361	355	4.8385	4.8796	4.8090	4.8676
14948	2018-07-12 00:00:00+00	361	355	4.8571	4.9085	4.7824	4.9021
14949	2018-07-11 00:00:00+00	361	355	4.9019	4.9768	4.6913	4.7122
14950	2018-07-10 00:00:00+00	361	355	4.7120	4.7430	4.6380	4.7158
14951	2018-07-09 00:00:00+00	361	355	4.7153	4.7510	4.5115	4.5775
14952	2018-07-08 00:00:00+00	361	355	4.5775	4.5890	4.5654	4.5674
14953	2018-07-07 00:00:00+00	361	355	4.5674	4.5674	4.5674	4.5674
14954	2018-07-06 00:00:00+00	361	355	4.5737	4.6190	4.5654	4.5910
14955	2018-07-05 00:00:00+00	361	355	4.5956	4.6863	4.5774	4.6650
14956	2018-07-04 00:00:00+00	361	355	4.6708	4.7227	4.6580	4.6679
14957	2018-07-03 00:00:00+00	361	355	4.6674	4.6873	4.5955	4.6155
14958	2018-07-02 00:00:00+00	361	355	4.6165	4.6405	4.5770	4.5986
14959	2018-07-01 00:00:00+00	361	355	4.5950	4.6060	4.5840	4.5862
14960	2018-06-29 00:00:00+00	361	355	4.5862	4.6118	4.5440	4.5887
14961	2018-06-28 00:00:00+00	361	355	4.5881	4.6513	4.5705	4.6192
14962	2018-06-27 00:00:00+00	361	355	4.6176	4.6565	4.5885	4.6156
14963	2018-06-26 00:00:00+00	361	355	4.6176	4.7149	4.6015	4.6802
14964	2018-06-25 00:00:00+00	361	355	4.6819	4.7233	4.5294	4.6028
14965	2018-06-24 00:00:00+00	361	355	4.6019	4.6798	4.5791	4.6760
14966	2018-06-22 00:00:00+00	361	355	4.6760	4.7456	4.6576	4.7255
14967	2018-06-21 00:00:00+00	361	355	4.7290	4.7680	4.7124	4.7391
14968	2018-06-20 00:00:00+00	361	355	4.7397	4.7694	4.7210	4.7317
14969	2018-06-19 00:00:00+00	361	355	4.7419	4.7756	4.6975	4.7024
14970	2018-06-18 00:00:00+00	361	355	4.7036	4.7461	4.6720	4.7341
14971	2018-06-17 00:00:00+00	361	355	4.7332	4.7359	4.7220	4.7255
14972	2018-06-16 00:00:00+00	361	355	4.7255	4.7255	4.7255	4.7255
14973	2018-06-15 00:00:00+00	361	355	4.7255	4.7598	4.7073	4.7407
14974	2018-06-14 00:00:00+00	361	355	4.7422	4.7459	4.5920	4.6603
14975	2018-06-13 00:00:00+00	361	355	4.6547	4.6972	4.5780	4.5869
14976	2018-06-12 00:00:00+00	361	355	4.5884	4.5979	4.5162	4.5206
14977	2018-06-11 00:00:00+00	361	355	4.5195	4.5396	4.4580	4.4609
14978	2018-06-10 00:00:00+00	361	355	4.4678	4.4859	4.4638	4.4685
14979	2018-06-08 00:00:00+00	361	355	4.4685	4.5406	4.4595	4.4812
14980	2018-06-07 00:00:00+00	361	355	4.4834	4.5869	4.4515	4.5599
14981	2018-06-06 00:00:00+00	361	355	4.5612	4.6287	4.5360	4.5913
14982	2018-06-05 00:00:00+00	361	355	4.5953	4.6332	4.5795	4.5873
14983	2018-06-04 00:00:00+00	361	355	4.5869	4.6788	4.5723	4.6454
14984	2018-06-03 00:00:00+00	361	355	4.6446	4.6514	4.6266	4.6498
14985	2018-06-02 00:00:00+00	361	355	4.6498	4.6498	4.6498	4.6498
14986	2018-06-01 00:00:00+00	361	355	4.6498	4.6596	4.5149	4.5224
14987	2018-05-31 00:00:00+00	361	355	4.5228	4.5463	4.4499	4.4622
14988	2018-05-30 00:00:00+00	361	355	4.4632	4.5647	4.4405	4.5565
14989	2018-05-29 00:00:00+00	361	355	4.5551	4.6354	4.5270	4.5794
14990	2018-05-28 00:00:00+00	361	355	4.5799	4.7132	4.5483	4.7055
14991	2018-05-27 00:00:00+00	361	355	4.7127	4.7165	4.6950	4.7060
14992	2018-05-26 00:00:00+00	361	355	4.7060	4.7060	4.7060	4.7060
14993	2018-05-25 00:00:00+00	361	355	4.7060	4.8021	4.6800	4.7420
14994	2018-05-24 00:00:00+00	361	355	4.7430	4.8066	4.5521	4.5743
14995	2018-05-23 00:00:00+00	361	355	4.5739	4.9294	4.5375	4.7349
14996	2018-05-22 00:00:00+00	361	355	4.7343	4.8143	4.5375	4.5740
14997	2018-05-21 00:00:00+00	361	355	4.5746	4.5990	4.4919	4.4992
14998	2018-05-20 00:00:00+00	361	355	4.4981	4.5011	4.4870	4.4883
14999	2018-05-18 00:00:00+00	361	355	4.4942	4.5050	4.4375	4.4580
15000	2018-05-17 00:00:00+00	361	355	4.4581	4.4677	4.4085	4.4282
15001	2018-05-16 00:00:00+00	361	355	4.4267	4.5011	4.3895	4.4586
15002	2018-05-15 00:00:00+00	361	355	4.4586	4.4752	4.3450	4.3559
15003	2018-05-14 00:00:00+00	361	355	4.3555	4.3704	4.2990	4.3122
15004	2018-05-13 00:00:00+00	361	355	4.3122	4.3221	4.2930	4.3127
15005	2018-05-11 00:00:00+00	361	355	4.3125	4.3185	4.2276	4.2347
15006	2018-05-10 00:00:00+00	361	355	4.2343	4.3088	4.2187	4.2812
15007	2018-05-09 00:00:00+00	361	355	4.2819	4.3744	4.2500	4.3453
15008	2018-05-08 00:00:00+00	361	355	4.3452	4.3456	4.2560	4.2627
15009	2018-05-07 00:00:00+00	361	355	4.2636	4.2726	4.2174	4.2455
15010	2018-05-06 00:00:00+00	361	355	4.2455	4.2493	4.2210	4.2210
15011	2018-05-05 00:00:00+00	361	355	4.2210	4.2210	4.2210	4.2210
15012	2018-05-04 00:00:00+00	361	355	4.2210	4.2900	4.2157	4.2180
15013	2018-05-03 00:00:00+00	361	355	4.2178	4.2445	4.1520	4.1811
15014	2018-05-02 00:00:00+00	361	355	4.1811	4.1871	4.0876	4.1055
15015	2018-05-01 00:00:00+00	361	355	4.1058	4.1232	4.0500	4.0597
15016	2018-04-30 00:00:00+00	361	355	4.0601	4.0739	4.0236	4.0473
15017	2018-04-29 00:00:00+00	361	355	4.0476	4.0587	4.0368	4.0412
15018	2018-04-27 00:00:00+00	361	355	4.0412	4.0794	4.0340	4.0643
15019	2018-04-26 00:00:00+00	361	355	4.0643	4.0856	4.0535	4.0807
15020	2018-04-25 00:00:00+00	361	355	4.0807	4.1093	4.0287	4.0826
15021	2018-04-24 00:00:00+00	361	355	4.0836	4.1123	4.0765	4.1081
15022	2018-04-23 00:00:00+00	361	355	4.1081	4.1138	4.0599	4.0794
15023	2018-04-22 00:00:00+00	361	355	4.0796	4.0872	4.0708	4.0756
15024	2018-04-20 00:00:00+00	361	355	4.0763	4.0784	4.0220	4.0392
15025	2018-04-19 00:00:00+00	361	355	4.0404	4.0484	4.0088	4.0189
15026	2018-04-18 00:00:00+00	361	355	4.0188	4.1081	4.0025	4.0940
15027	2018-04-17 00:00:00+00	361	355	4.0938	4.1267	4.0690	4.0990
15028	2018-04-16 00:00:00+00	361	355	4.0994	4.1192	4.0840	4.0865
15029	2018-04-15 00:00:00+00	361	355	4.0842	4.1046	4.0792	4.0959
15030	2018-04-14 00:00:00+00	361	355	4.0959	4.0959	4.0959	4.0959
15031	2018-04-13 00:00:00+00	361	355	4.0961	4.1178	4.0642	4.1117
15032	2018-04-12 00:00:00+00	361	355	4.1117	4.1613	4.0803	4.1406
15033	2018-04-11 00:00:00+00	361	355	4.1407	4.1935	4.1042	4.1136
15034	2018-04-10 00:00:00+00	361	355	4.1136	4.1387	4.0528	4.0758
15035	2018-04-09 00:00:00+00	361	355	4.0764	4.0774	4.0305	4.0476
15036	2018-04-08 00:00:00+00	361	355	4.0476	4.0515	4.0347	4.0442
15037	2018-04-06 00:00:00+00	361	355	4.0442	4.0664	4.0242	4.0551
15038	2018-04-05 00:00:00+00	361	355	4.0555	4.0586	3.9944	4.0005
15039	2018-04-04 00:00:00+00	361	355	3.9997	4.0272	3.9817	3.9901
15040	2018-04-03 00:00:00+00	361	355	3.9905	3.9940	3.9660	3.9751
15041	2018-04-02 00:00:00+00	361	355	3.9754	3.9806	3.9499	3.9523
15042	2018-04-01 00:00:00+00	361	355	3.9519	3.9571	3.9486	3.9542
15043	2018-03-30 00:00:00+00	361	355	3.9542	3.9614	3.9366	3.9429
15044	2018-03-29 00:00:00+00	361	355	3.9419	4.0157	3.9317	4.0124
15045	2018-03-28 00:00:00+00	361	355	4.0111	4.0147	3.9745	3.9791
15046	2018-03-27 00:00:00+00	361	355	3.9790	3.9971	3.9569	3.9649
15047	2018-03-26 00:00:00+00	361	355	3.9651	3.9959	3.9514	3.9829
15048	2018-03-25 00:00:00+00	361	355	3.9829	3.9843	3.9646	3.9814
15049	2018-03-23 00:00:00+00	361	355	3.9814	4.0065	3.9510	3.9993
15050	2018-03-22 00:00:00+00	361	355	4.0030	4.0363	3.8950	3.9088
15051	2018-03-21 00:00:00+00	361	355	3.9088	3.9384	3.9036	3.9326
15052	2018-03-20 00:00:00+00	361	355	3.9321	3.9528	3.9170	3.9391
15053	2018-03-19 00:00:00+00	361	355	3.9391	3.9525	3.9136	3.9149
15054	2018-03-18 00:00:00+00	361	355	3.9174	3.9229	3.9095	3.9186
15055	2018-03-17 00:00:00+00	361	355	3.9186	3.9186	3.9186	3.9186
15056	2018-03-16 00:00:00+00	361	355	3.9186	3.9260	3.8865	3.8935
15057	2018-03-15 00:00:00+00	361	355	3.8935	3.9054	3.8711	3.8783
15058	2018-03-14 00:00:00+00	361	355	3.8784	3.8949	3.8545	3.8707
15059	2018-03-13 00:00:00+00	361	355	3.8693	3.8751	3.8315	3.8430
15060	2018-03-12 00:00:00+00	361	355	3.8432	3.8511	3.8015	3.8115
15061	2018-03-11 00:00:00+00	361	355	3.8115	3.8161	3.8033	3.8100
15062	2018-03-10 00:00:00+00	361	355	3.8100	3.8101	3.8100	3.8101
15063	2018-03-09 00:00:00+00	361	355	3.8114	3.8285	3.8000	3.8180
15064	2018-03-08 00:00:00+00	361	355	3.8221	3.8280	3.7967	3.8025
15065	2018-03-07 00:00:00+00	361	355	3.8018	3.8092	3.7868	3.7960
15066	2018-03-06 00:00:00+00	361	355	3.7964	3.8131	3.7818	3.8081
15067	2018-03-05 00:00:00+00	361	355	3.8092	3.8288	3.8028	3.8065
15068	2018-03-04 00:00:00+00	361	355	3.8073	3.8119	3.8016	3.8025
15069	2018-03-03 00:00:00+00	361	355	3.8025	3.8025	3.8025	3.8025
15070	2018-03-02 00:00:00+00	361	355	3.8054	3.8248	3.7980	3.8073
15071	2018-03-01 00:00:00+00	361	355	3.8071	3.8209	3.7977	3.8005
15072	2018-02-28 00:00:00+00	361	355	3.8007	3.8159	3.7917	3.8147
15073	2018-02-27 00:00:00+00	361	355	3.8147	3.8159	3.7775	3.7854
15074	2018-02-26 00:00:00+00	361	355	3.7846	3.7917	3.7710	3.7858
15075	2018-02-25 00:00:00+00	361	355	3.7846	3.7968	3.7836	3.7880
15076	2018-02-24 00:00:00+00	361	355	3.7900	3.7900	3.7880	3.7880
15077	2018-02-23 00:00:00+00	361	355	3.7901	3.7990	3.7735	3.7830
15078	2018-02-22 00:00:00+00	361	355	3.7830	3.8095	3.7775	3.7913
15079	2018-02-21 00:00:00+00	361	355	3.7906	3.8081	3.7719	3.7981
15080	2018-02-20 00:00:00+00	361	355	3.7984	3.8120	3.7550	3.7583
15081	2018-02-19 00:00:00+00	361	355	3.7582	3.7628	3.7412	3.7452
15082	2018-02-18 00:00:00+00	361	355	3.7455	3.7495	3.7388	3.7410
15083	2018-02-17 00:00:00+00	361	355	3.7410	3.7444	3.7410	3.7438
15084	2018-02-16 00:00:00+00	361	355	3.7437	3.7750	3.7335	3.7671
15085	2018-02-15 00:00:00+00	361	355	3.7673	3.7854	3.7592	3.7797
15086	2018-02-14 00:00:00+00	361	355	3.7807	3.8230	3.7755	3.8079
15087	2018-02-13 00:00:00+00	361	355	3.8097	3.8124	3.7865	3.7957
15088	2018-02-12 00:00:00+00	361	355	3.7969	3.8184	3.7920	3.8148
15089	2018-02-11 00:00:00+00	361	355	3.8157	3.8265	3.8123	3.8210
15090	2018-02-09 00:00:00+00	361	355	3.8210	3.8451	3.8030	3.8237
15091	2018-02-08 00:00:00+00	361	355	3.8248	3.8351	3.7879	3.8040
15092	2018-02-07 00:00:00+00	361	355	3.8056	3.8075	3.7595	3.7648
15093	2018-02-06 00:00:00+00	361	355	3.7656	3.7956	3.7595	3.7862
15094	2018-02-05 00:00:00+00	361	355	3.7862	3.7917	3.7516	3.7678
15095	2018-02-04 00:00:00+00	361	355	3.7720	3.7746	3.7638	3.7690
15096	2018-02-03 00:00:00+00	361	355	3.7688	3.7707	3.7687	3.7706
15097	2018-02-02 00:00:00+00	361	355	3.7705	3.7762	3.7289	3.7309
15098	2018-02-01 00:00:00+00	361	355	3.7309	3.7721	3.7250	3.7564
15099	2018-01-31 00:00:00+00	361	355	3.7563	3.7825	3.7430	3.7746
15100	2018-01-30 00:00:00+00	361	355	3.7728	3.7990	3.7574	3.7882
15101	2018-01-29 00:00:00+00	361	355	3.7871	3.7972	3.7480	3.7502
15102	2018-01-28 00:00:00+00	361	355	3.7516	3.7531	3.7362	3.7520
15103	2018-01-27 00:00:00+00	361	355	3.7538	3.7538	3.7520	3.7535
15104	2018-01-26 00:00:00+00	361	355	3.7548	3.7634	3.7234	3.7563
15105	2018-01-25 00:00:00+00	361	355	3.7576	3.7604	3.7125	3.7399
15106	2018-01-24 00:00:00+00	361	355	3.7399	3.7751	3.7289	3.7660
15107	2018-01-23 00:00:00+00	361	355	3.7666	3.8030	3.7615	3.7743
15108	2018-01-22 00:00:00+00	361	355	3.7760	3.8349	3.7685	3.8244
15109	2018-01-21 00:00:00+00	361	355	3.8268	3.8481	3.8050	3.8050
15110	2018-01-20 00:00:00+00	361	355	3.8062	3.8069	3.8061	3.8068
15111	2018-01-19 00:00:00+00	361	355	3.8067	3.8166	3.7570	3.7673
15112	2018-01-18 00:00:00+00	361	355	3.7691	3.8228	3.7545	3.8208
15113	2018-01-17 00:00:00+00	361	355	3.8208	3.8324	3.7884	3.7936
15114	2018-01-16 00:00:00+00	361	355	3.7967	3.8336	3.7810	3.7982
15115	2018-01-15 00:00:00+00	361	355	3.7996	3.8039	3.7419	3.7524
15116	2018-01-14 00:00:00+00	361	355	3.7544	3.7601	3.7449	3.7455
15117	2018-01-13 00:00:00+00	361	355	3.7477	3.7477	3.7474	3.7474
15118	2018-01-12 00:00:00+00	361	355	3.7473	3.7829	3.7410	3.7725
15119	2018-01-11 00:00:00+00	361	355	3.7739	3.8060	3.7660	3.7975
15120	2018-01-10 00:00:00+00	361	355	3.7975	3.8071	3.7620	3.7699
15121	2018-01-09 00:00:00+00	361	355	3.7708	3.7786	3.7375	3.7437
15122	2018-01-08 00:00:00+00	361	355	3.7429	3.7566	3.7280	3.7329
15123	2018-01-07 00:00:00+00	361	355	3.7325	3.7437	3.7301	3.7340
15124	2018-01-06 00:00:00+00	361	355	3.7340	3.7347	3.7340	3.7342
15125	2018-01-05 00:00:00+00	361	355	3.7355	3.7598	3.7280	3.7473
15126	2018-01-04 00:00:00+00	361	355	3.7485	3.7865	3.7397	3.7798
15127	2018-01-03 00:00:00+00	361	355	3.7806	3.7872	3.7520	3.7622
15128	2018-01-02 00:00:00+00	361	355	3.7637	3.7925	3.7490	3.7882
15129	2018-01-01 00:00:00+00	361	355	3.7888	3.7958	3.7723	3.7949
55687	2019-12-27 02:25:00+00	266	355	7.7014	7.7128	7.6897	7.7127
11570	2019-11-08 00:00:00+00	361	288	109.2300	109.4770	109.0500	109.2750
55780	2019-12-27 04:20:00+00	355	263	0.1510	0.1514	0.1510	0.1513
13325	2019-11-08 00:00:00+00	266	355	7.3627	7.3853	7.3448	7.3746
13326	2019-11-08 00:00:00+00	266	361	1.2773	1.2823	1.2767	1.2820
55873	2019-12-27 06:15:00+00	288	266	0.0070	0.0070	0.0070	0.0070
14496	2019-11-08 00:00:00+00	263	361	1.1019	1.1055	1.1015	1.1052
14497	2019-11-08 00:00:00+00	263	355	6.3491	6.3689	6.3266	6.3569
56056	2019-12-27 10:00:00+00	266	355	7.7726	7.7749	7.6897	7.7127
56145	2019-12-27 11:45:00+00	288	266	0.0070	0.0070	0.0070	0.0070
52384	2019-12-18 00:00:00+00	288	266	0.0070	0.0070	0.0069	0.0069
52385	2019-12-17 00:00:00+00	288	266	0.0069	0.0070	0.0069	0.0069
15130	2019-11-08 00:00:00+00	361	355	5.7621	5.7705	5.7320	5.7515
52386	2019-12-16 00:00:00+00	288	266	0.0069	0.0069	0.0068	0.0069
52387	2019-12-15 00:00:00+00	288	266	0.0069	0.0069	0.0069	0.0069
52388	2019-12-13 00:00:00+00	288	266	0.0069	0.0069	0.0067	0.0068
52389	2019-12-12 00:00:00+00	288	266	0.0068	0.0070	0.0068	0.0070
52390	2019-12-11 00:00:00+00	288	266	0.0070	0.0070	0.0070	0.0070
52391	2019-12-10 00:00:00+00	288	266	0.0070	0.0070	0.0070	0.0070
52392	2019-12-09 00:00:00+00	288	266	0.0070	0.0070	0.0070	0.0070
52393	2019-12-08 00:00:00+00	288	266	0.0070	0.0070	0.0070	0.0070
52394	2019-12-06 00:00:00+00	288	266	0.0070	0.0070	0.0070	0.0070
52395	2019-12-05 00:00:00+00	288	266	0.0070	0.0070	0.0070	0.0070
52396	2019-12-04 00:00:00+00	288	266	0.0070	0.0071	0.0070	0.0071
52397	2019-12-03 00:00:00+00	288	266	0.0071	0.0071	0.0070	0.0071
52398	2019-12-02 00:00:00+00	288	266	0.0071	0.0071	0.0070	0.0071
52399	2019-12-01 00:00:00+00	288	266	0.0071	0.0071	0.0071	0.0071
13324	2019-11-08 00:00:00+00	355	263	0.1570	0.1572	0.1565	0.1568
52400	2019-11-29 00:00:00+00	288	266	0.0071	0.0071	0.0070	0.0071
52401	2019-11-28 00:00:00+00	288	266	0.0071	0.0071	0.0070	0.0070
56233	2019-12-27 13:30:00+00	355	263	0.1500	0.1514	0.1499	0.1513
56316	2019-12-27 15:10:00+00	288	266	0.0070	0.0070	0.0070	0.0070
56476	2019-12-27 18:10:00+00	266	355	7.8000	7.8136	7.6897	7.7127
36723	2019-12-04 00:00:00+00	921	361	52.6700	52.6700	52.6700	52.6700
55591	2019-12-27 00:30:00+00	355	263	0.1514	0.1514	0.1513	0.1513
18533	2019-11-14 00:00:00+00	888	361	65.4000	65.5000	65.2200	65.3300
18534	2019-11-14 00:00:00+00	455	355	50431.7503	50768.9600	50399.6158	50639.3838
36722	2019-12-05 00:00:00+00	455	355	41582.6630	41657.7711	41188.6620	41376.0871
55876	2019-12-27 06:15:00+00	355	263	0.1509	0.1514	0.1507	0.1513
47276	2019-12-18 00:00:00+00	545	361	124.7800	125.7800	121.3300	121.8800
41393	2019-12-11 00:00:00+00	545	361	145.7100	145.8700	145.5100	145.5300
46137	2019-12-17 00:00:00+00	545	361	132.5600	132.9800	132.3900	132.7200
34256	2019-12-02 00:00:00+00	361	355	5.7409	5.7642	5.7270	5.7473
55969	2019-12-27 08:10:00+00	355	263	0.1507	0.1514	0.1507	0.1513
29374	2019-11-26 00:00:00+00	914	361	1308.6650	1314.0100	1304.0400	1309.9100
34257	2019-12-02 00:00:00+00	263	361	1.1076	1.1091	1.1001	1.1018
52402	2019-11-27 00:00:00+00	288	266	0.0070	0.0071	0.0070	0.0071
52403	2019-11-26 00:00:00+00	288	266	0.0071	0.0071	0.0071	0.0071
52404	2019-11-25 00:00:00+00	288	266	0.0071	0.0072	0.0071	0.0072
52405	2019-11-24 00:00:00+00	288	266	0.0072	0.0072	0.0072	0.0072
52406	2019-11-22 00:00:00+00	288	266	0.0072	0.0072	0.0071	0.0071
44561	2019-12-13 00:00:00+00	917	361	205.2700	207.1000	203.7700	205.7600
35309	2019-12-03 00:00:00+00	917	361	194.2200	194.5000	189.8500	190.9700
52407	2019-11-21 00:00:00+00	288	266	0.0071	0.0071	0.0071	0.0071
52408	2019-11-20 00:00:00+00	288	266	0.0071	0.0072	0.0071	0.0071
52409	2019-11-19 00:00:00+00	288	266	0.0071	0.0071	0.0071	0.0071
52410	2019-11-18 00:00:00+00	288	266	0.0071	0.0071	0.0071	0.0071
52411	2019-11-17 00:00:00+00	288	266	0.0071	0.0071	0.0071	0.0071
52412	2019-11-15 00:00:00+00	288	266	0.0071	0.0072	0.0071	0.0072
52413	2019-11-14 00:00:00+00	288	266	0.0072	0.0072	0.0072	0.0072
52414	2019-11-13 00:00:00+00	288	266	0.0072	0.0072	0.0071	0.0071
52415	2019-11-12 00:00:00+00	288	266	0.0071	0.0071	0.0071	0.0071
52416	2019-11-11 00:00:00+00	288	266	0.0071	0.0072	0.0071	0.0072
52417	2019-11-10 00:00:00+00	288	266	0.0072	0.0072	0.0072	0.0072
52418	2019-11-08 00:00:00+00	288	266	0.0072	0.0072	0.0071	0.0071
18535	2019-11-13 00:00:00+00	921	361	51.7200	51.7200	51.7200	51.7200
52419	2019-11-07 00:00:00+00	288	266	0.0071	0.0072	0.0071	0.0071
52420	2019-11-06 00:00:00+00	288	266	0.0071	0.0071	0.0071	0.0071
52421	2019-11-05 00:00:00+00	288	266	0.0071	0.0071	0.0071	0.0071
52422	2019-11-04 00:00:00+00	288	266	0.0071	0.0072	0.0071	0.0071
52423	2019-11-03 00:00:00+00	288	266	0.0071	0.0071	0.0071	0.0071
52424	2019-11-01 00:00:00+00	288	266	0.0071	0.0072	0.0071	0.0072
31801	2019-11-28 00:00:00+00	355	263	0.1572	0.1574	0.1566	0.1567
52425	2019-10-31 00:00:00+00	288	266	0.0072	0.0072	0.0071	0.0071
52426	2019-10-30 00:00:00+00	288	266	0.0071	0.0071	0.0071	0.0071
19317	2019-11-14 00:00:00+00	914	361	1311.2500	1313.4400	1293.9400	1295.0000
52427	2019-10-29 00:00:00+00	288	266	0.0071	0.0072	0.0071	0.0071
31802	2019-11-28 00:00:00+00	266	355	7.4330	7.4877	7.4239	7.4709
52428	2019-10-28 00:00:00+00	288	266	0.0071	0.0072	0.0071	0.0072
52429	2019-10-27 00:00:00+00	288	266	0.0072	0.0072	0.0072	0.0072
44677	2019-12-14 00:00:00+00	888	361	52.1200	52.4800	52.0800	52.4400
52430	2019-10-25 00:00:00+00	288	266	0.0072	0.0072	0.0072	0.0072
52431	2019-10-24 00:00:00+00	288	266	0.0072	0.0072	0.0071	0.0071
52432	2019-10-23 00:00:00+00	288	266	0.0071	0.0072	0.0071	0.0071
52433	2019-10-22 00:00:00+00	288	266	0.0072	0.0072	0.0071	0.0071
52434	2019-10-21 00:00:00+00	288	266	0.0071	0.0072	0.0071	0.0072
52435	2019-10-20 00:00:00+00	288	266	0.0072	0.0072	0.0071	0.0071
52436	2019-10-18 00:00:00+00	288	266	0.0071	0.0072	0.0071	0.0072
52437	2019-10-17 00:00:00+00	288	266	0.0072	0.0072	0.0071	0.0072
52438	2019-10-16 00:00:00+00	288	266	0.0072	0.0073	0.0071	0.0072
48403	2019-12-18 00:00:00+00	921	361	54.2400	54.2400	54.2400	54.2400
20687	2019-11-15 00:00:00+00	361	288	108.8700	108.8700	108.4200	108.4940
20688	2019-11-15 00:00:00+00	263	361	1.1051	1.1057	1.1013	1.1020
52439	2019-10-15 00:00:00+00	288	266	0.0072	0.0073	0.0072	0.0073
35595	2019-12-03 00:00:00+00	921	361	52.3700	52.3700	52.3700	52.3700
52440	2019-10-14 00:00:00+00	288	266	0.0073	0.0074	0.0073	0.0073
52441	2019-10-13 00:00:00+00	288	266	0.0073	0.0073	0.0073	0.0073
52442	2019-10-11 00:00:00+00	288	266	0.0073	0.0075	0.0073	0.0075
52443	2019-10-10 00:00:00+00	288	266	0.0075	0.0076	0.0074	0.0076
52444	2019-10-09 00:00:00+00	288	266	0.0076	0.0076	0.0076	0.0076
56148	2019-12-27 11:45:00+00	355	263	0.1501	0.1514	0.1501	0.1513
28240	2019-11-25 00:00:00+00	917	361	190.4500	190.7200	187.8800	188.3200
56235	2019-12-27 13:35:00+00	266	355	7.7989	7.8080	7.6897	7.7127
24325	2019-11-20 00:00:00+00	263	355	6.3158	6.3348	6.2902	6.3167
24326	2019-11-20 00:00:00+00	266	361	1.2927	1.2929	1.2886	1.2929
24327	2019-11-20 00:00:00+00	263	288	120.1740	120.4070	119.8200	120.1670
24328	2019-11-20 00:00:00+00	263	361	1.1078	1.1081	1.1051	1.1078
24329	2019-11-20 00:00:00+00	355	263	0.1579	0.1584	0.1574	0.1578
55593	2019-12-27 00:35:00+00	266	355	7.7058	7.7128	7.7040	7.7127
20937	2019-11-17 00:00:00+00	266	355	7.4239	7.4271	7.3796	7.4136
20938	2019-11-17 00:00:00+00	361	288	108.6910	108.8700	108.6500	108.8700
20939	2019-11-17 00:00:00+00	263	361	1.1055	1.1055	1.1047	1.1051
20940	2019-11-17 00:00:00+00	263	355	6.3493	6.3543	6.3259	6.3492
20941	2019-11-17 00:00:00+00	266	361	1.2920	1.2927	1.2899	1.2902
55878	2019-12-27 06:20:00+00	266	355	7.7174	7.7271	7.6897	7.7127
47290	2019-12-18 00:00:00+00	455	355	39139.4388	39386.8442	38853.3009	38990.5718
55971	2019-12-27 08:15:00+00	266	355	7.7360	7.7446	7.6897	7.7127
38789	2019-12-06 00:00:00+00	266	355	7.5844	7.6071	7.5429	7.5632
56060	2019-12-27 10:00:00+00	288	266	0.0070	0.0070	0.0070	0.0070
56150	2019-12-27 11:50:00+00	266	355	7.7849	7.7899	7.6897	7.7127
56319	2019-12-27 15:15:00+00	355	263	0.1498	0.1514	0.1498	0.1513
52445	2019-10-08 00:00:00+00	288	266	0.0076	0.0077	0.0076	0.0076
52446	2019-10-07 00:00:00+00	288	266	0.0076	0.0076	0.0076	0.0076
52447	2019-10-06 00:00:00+00	288	266	0.0076	0.0076	0.0076	0.0076
52448	2019-10-05 00:00:00+00	288	266	0.0076	0.0076	0.0076	0.0076
52449	2019-10-04 00:00:00+00	288	266	0.0076	0.0076	0.0076	0.0076
52450	2019-10-03 00:00:00+00	288	266	0.0076	0.0076	0.0075	0.0076
52451	2019-10-02 00:00:00+00	288	266	0.0076	0.0076	0.0075	0.0076
52452	2019-10-01 00:00:00+00	288	266	0.0076	0.0076	0.0075	0.0075
52453	2019-09-30 00:00:00+00	288	266	0.0075	0.0075	0.0075	0.0075
52454	2019-09-29 00:00:00+00	288	266	0.0075	0.0075	0.0075	0.0075
52455	2019-09-27 00:00:00+00	288	266	0.0075	0.0076	0.0075	0.0075
52456	2019-09-26 00:00:00+00	288	266	0.0075	0.0076	0.0075	0.0075
52457	2019-09-25 00:00:00+00	288	266	0.0075	0.0075	0.0075	0.0075
52458	2019-09-24 00:00:00+00	288	266	0.0075	0.0075	0.0074	0.0075
52459	2019-09-23 00:00:00+00	288	266	0.0075	0.0075	0.0074	0.0074
52460	2019-09-22 00:00:00+00	288	266	0.0074	0.0074	0.0074	0.0074
52461	2019-09-20 00:00:00+00	288	266	0.0075	0.0075	0.0074	0.0074
52462	2019-09-19 00:00:00+00	288	266	0.0074	0.0074	0.0074	0.0074
48413	2019-12-19 00:00:00+00	888	361	46.6200	48.3100	46.4300	47.9400
52463	2019-09-18 00:00:00+00	288	266	0.0074	0.0074	0.0074	0.0074
52464	2019-09-17 00:00:00+00	288	266	0.0074	0.0075	0.0074	0.0074
52465	2019-09-16 00:00:00+00	288	266	0.0074	0.0075	0.0074	0.0074
52466	2019-09-15 00:00:00+00	288	266	0.0074	0.0075	0.0074	0.0074
52467	2019-09-13 00:00:00+00	288	266	0.0074	0.0075	0.0074	0.0075
52468	2019-09-12 00:00:00+00	288	266	0.0075	0.0076	0.0075	0.0075
52469	2019-09-11 00:00:00+00	288	266	0.0075	0.0075	0.0075	0.0075
52470	2019-09-10 00:00:00+00	288	266	0.0075	0.0076	0.0075	0.0076
52471	2019-09-09 00:00:00+00	288	266	0.0076	0.0076	0.0075	0.0076
52472	2019-09-08 00:00:00+00	288	266	0.0076	0.0076	0.0076	0.0076
52473	2019-09-06 00:00:00+00	288	266	0.0076	0.0076	0.0076	0.0076
52474	2019-09-05 00:00:00+00	288	266	0.0076	0.0077	0.0076	0.0077
52475	2019-09-04 00:00:00+00	288	266	0.0077	0.0078	0.0077	0.0078
52476	2019-09-03 00:00:00+00	288	266	0.0078	0.0079	0.0078	0.0078
52477	2019-09-02 00:00:00+00	288	266	0.0078	0.0078	0.0077	0.0077
52478	2019-09-01 00:00:00+00	288	266	0.0077	0.0078	0.0077	0.0078
15320	2019-11-10 00:00:00+00	355	263	0.1568	0.1570	0.1567	0.1570
52479	2019-08-31 00:00:00+00	288	266	0.0077	0.0077	0.0077	0.0077
15321	2019-11-10 00:00:00+00	266	355	7.3776	7.3839	7.3370	7.3627
20691	2019-11-15 00:00:00+00	266	361	1.2902	1.2919	1.2866	1.2881
15322	2019-11-10 00:00:00+00	266	361	1.2794	1.2802	1.2773	1.2773
52480	2019-08-30 00:00:00+00	288	266	0.0077	0.0077	0.0077	0.0077
15323	2019-11-10 00:00:00+00	263	361	1.1022	1.1025	1.1017	1.1019
52481	2019-08-29 00:00:00+00	288	266	0.0077	0.0077	0.0077	0.0077
15324	2019-11-10 00:00:00+00	263	355	6.3574	6.3611	6.3330	6.3491
52482	2019-08-28 00:00:00+00	288	266	0.0077	0.0078	0.0077	0.0077
52483	2019-08-27 00:00:00+00	288	266	0.0077	0.0077	0.0077	0.0077
52484	2019-08-26 00:00:00+00	288	266	0.0077	0.0078	0.0077	0.0078
15325	2019-11-10 00:00:00+00	361	355	5.7654	5.7768	5.7558	5.7621
52485	2019-08-25 00:00:00+00	288	266	0.0078	0.0078	0.0077	0.0077
15326	2019-11-10 00:00:00+00	361	288	109.2240	109.2550	109.0900	109.2300
52486	2019-08-23 00:00:00+00	288	266	0.0077	0.0077	0.0077	0.0077
52487	2019-08-22 00:00:00+00	288	266	0.0077	0.0078	0.0076	0.0077
44656	2019-12-13 00:00:00+00	263	355	6.4600	6.4993	6.4298	6.4565
44678	2019-12-14 00:00:00+00	361	355	5.8072	5.8072	5.8072	5.8072
52488	2019-08-21 00:00:00+00	288	266	0.0077	0.0077	0.0077	0.0077
52489	2019-08-20 00:00:00+00	288	266	0.0077	0.0078	0.0077	0.0077
52490	2019-08-19 00:00:00+00	288	266	0.0077	0.0077	0.0077	0.0077
52491	2019-08-18 00:00:00+00	288	266	0.0077	0.0077	0.0077	0.0077
52492	2019-08-16 00:00:00+00	288	266	0.0077	0.0078	0.0077	0.0078
52493	2019-08-15 00:00:00+00	288	266	0.0078	0.0078	0.0078	0.0078
56406	2019-12-27 16:55:00+00	288	266	0.0070	0.0070	0.0070	0.0070
49299	2019-12-19 00:00:00+00	914	361	1353.5650	1357.5259	1348.7507	1351.9100
24330	2019-11-20 00:00:00+00	361	355	5.6964	5.7216	5.6780	5.7024
24331	2019-11-20 00:00:00+00	266	355	7.3697	7.3907	7.3371	7.3720
24332	2019-11-20 00:00:00+00	361	288	108.4800	108.7400	108.3200	108.4730
20942	2019-11-17 00:00:00+00	355	263	0.1569	0.1572	0.1569	0.1570
20943	2019-11-17 00:00:00+00	361	355	5.7465	5.7478	5.7341	5.7443
46146	2019-12-17 00:00:00+00	455	355	40311.0888	40426.6808	40245.1616	40313.5457
9599	2019-11-10 00:00:00+00	888	361	61.9200	62.0000	61.6500	61.9100
9840	2019-11-10 00:00:00+00	455	355	50590.2334	50807.9877	50553.9602	50800.7792
55694	2019-12-27 02:35:00+00	355	263	0.1511	0.1514	0.1511	0.1513
55784	2019-12-27 04:25:00+00	266	355	7.7147	7.7177	7.6897	7.7127
50530	2019-12-20 00:00:00+00	355	263	0.1515	0.1519	0.1508	0.1508
56063	2019-12-27 10:00:00+00	355	263	0.1506	0.1514	0.1504	0.1513
52494	2019-08-14 00:00:00+00	288	266	0.0078	0.0078	0.0078	0.0078
52495	2019-08-13 00:00:00+00	288	266	0.0078	0.0079	0.0077	0.0079
52496	2019-08-12 00:00:00+00	288	266	0.0079	0.0079	0.0078	0.0079
52497	2019-08-11 00:00:00+00	288	266	0.0079	0.0079	0.0078	0.0079
52498	2019-08-09 00:00:00+00	288	266	0.0079	0.0079	0.0078	0.0078
52499	2019-08-08 00:00:00+00	288	266	0.0078	0.0078	0.0077	0.0078
52500	2019-08-07 00:00:00+00	288	266	0.0078	0.0078	0.0077	0.0077
52501	2019-08-06 00:00:00+00	288	266	0.0077	0.0078	0.0077	0.0078
40030	2019-12-09 00:00:00+00	914	361	1345.1800	1357.5530	1336.0700	1338.8600
52502	2019-08-05 00:00:00+00	288	266	0.0078	0.0078	0.0077	0.0077
52503	2019-08-04 00:00:00+00	288	266	0.0077	0.0077	0.0077	0.0077
52504	2019-08-02 00:00:00+00	288	266	0.0077	0.0077	0.0077	0.0077
52505	2019-08-01 00:00:00+00	288	266	0.0077	0.0077	0.0075	0.0076
26392	2019-11-22 00:00:00+00	914	361	1293.0800	1306.9000	1291.4000	1303.0000
52506	2019-07-31 00:00:00+00	288	266	0.0076	0.0076	0.0075	0.0076
52507	2019-07-30 00:00:00+00	288	266	0.0076	0.0076	0.0075	0.0075
52508	2019-07-29 00:00:00+00	288	266	0.0075	0.0075	0.0074	0.0074
52509	2019-07-28 00:00:00+00	288	266	0.0074	0.0074	0.0074	0.0074
52510	2019-07-26 00:00:00+00	288	266	0.0074	0.0074	0.0074	0.0074
52511	2019-07-25 00:00:00+00	288	266	0.0074	0.0074	0.0074	0.0074
52512	2019-07-24 00:00:00+00	288	266	0.0074	0.0074	0.0074	0.0074
52513	2019-07-23 00:00:00+00	288	266	0.0074	0.0074	0.0074	0.0074
52514	2019-07-22 00:00:00+00	288	266	0.0074	0.0074	0.0074	0.0074
52515	2019-07-21 00:00:00+00	288	266	0.0074	0.0074	0.0074	0.0074
52516	2019-07-19 00:00:00+00	288	266	0.0074	0.0074	0.0074	0.0074
52517	2019-07-18 00:00:00+00	288	266	0.0074	0.0075	0.0074	0.0075
52518	2019-07-17 00:00:00+00	288	266	0.0075	0.0075	0.0074	0.0074
52519	2019-07-16 00:00:00+00	288	266	0.0074	0.0075	0.0074	0.0074
52520	2019-07-15 00:00:00+00	288	266	0.0074	0.0074	0.0074	0.0074
52521	2019-07-14 00:00:00+00	288	266	0.0074	0.0074	0.0074	0.0074
52522	2019-07-12 00:00:00+00	288	266	0.0074	0.0074	0.0073	0.0073
52523	2019-07-11 00:00:00+00	288	266	0.0073	0.0074	0.0073	0.0074
52524	2019-07-10 00:00:00+00	288	266	0.0074	0.0074	0.0073	0.0074
52525	2019-07-09 00:00:00+00	288	266	0.0074	0.0074	0.0073	0.0073
52526	2019-07-08 00:00:00+00	288	266	0.0073	0.0074	0.0073	0.0073
43581	2019-12-12 00:00:00+00	263	288	122.3860	122.5810	120.7300	120.8500
43582	2019-12-12 00:00:00+00	263	361	1.1186	1.1200	1.1102	1.1133
52527	2019-07-07 00:00:00+00	288	266	0.0073	0.0074	0.0073	0.0074
52528	2019-07-05 00:00:00+00	288	266	0.0074	0.0074	0.0073	0.0074
38422	2019-12-05 00:00:00+00	921	361	52.6600	52.6600	52.6600	52.6600
52529	2019-07-04 00:00:00+00	288	266	0.0074	0.0074	0.0074	0.0074
43583	2019-12-12 00:00:00+00	263	355	6.4558	6.4848	6.4089	6.4597
51869	2019-12-23 00:00:00+00	361	288	109.3830	109.5020	109.3100	109.4980
51870	2019-12-23 00:00:00+00	266	361	1.2941	1.3032	1.2903	1.3005
52530	2019-07-03 00:00:00+00	288	266	0.0074	0.0074	0.0073	0.0074
52531	2019-07-02 00:00:00+00	288	266	0.0074	0.0074	0.0073	0.0073
38791	2019-12-06 00:00:00+00	263	288	120.0600	120.8000	119.9800	120.7310
38790	2019-12-06 00:00:00+00	263	355	6.3832	6.4080	6.3480	6.3850
52532	2019-07-01 00:00:00+00	288	266	0.0073	0.0073	0.0073	0.0073
43695	2019-12-13 00:00:00+00	888	361	53.0200	53.2000	52.7300	52.9800
51871	2019-12-23 00:00:00+00	355	263	0.1511	0.1518	0.1509	0.1514
51872	2019-12-23 00:00:00+00	361	355	5.9463	5.9554	5.9130	5.9366
52533	2019-06-30 00:00:00+00	288	266	0.0073	0.0073	0.0073	0.0073
52534	2019-06-28 00:00:00+00	288	266	0.0073	0.0073	0.0073	0.0073
52535	2019-06-27 00:00:00+00	288	266	0.0073	0.0073	0.0073	0.0073
52536	2019-06-26 00:00:00+00	288	266	0.0073	0.0073	0.0073	0.0073
52537	2019-06-25 00:00:00+00	288	266	0.0073	0.0073	0.0073	0.0073
36428	2019-12-04 00:00:00+00	917	361	194.1900	196.6600	193.8200	195.5300
52538	2019-06-24 00:00:00+00	288	266	0.0073	0.0073	0.0073	0.0073
52539	2019-06-23 00:00:00+00	288	266	0.0073	0.0073	0.0073	0.0073
52540	2019-06-21 00:00:00+00	288	266	0.0073	0.0073	0.0073	0.0073
56321	2019-12-27 10:18:50+00	917	361	217.3920	218.1100	216.1700	217.9900
50539	2019-12-21 00:00:00+00	888	361	46.4700	46.7100	46.4500	46.6900
50512	2019-12-20 00:00:00+00	263	361	1.1077	1.1124	1.1065	1.1123
52573	2019-05-15 00:00:00+00	288	266	0.0071	0.0071	0.0070	0.0071
20944	2019-11-17 00:00:00+00	263	288	120.1550	120.3100	119.9000	120.3100
55599	2019-12-27 00:40:00+00	355	263	0.1513	0.1514	0.1513	0.1513
52574	2019-05-14 00:00:00+00	288	266	0.0071	0.0071	0.0070	0.0071
52575	2019-05-13 00:00:00+00	288	266	0.0071	0.0071	0.0070	0.0070
44680	2019-12-15 00:00:00+00	545	361	140.7400	141.9700	139.9200	141.7900
38792	2019-12-06 00:00:00+00	355	263	0.1561	0.1563	0.1557	0.1562
55696	2019-12-27 02:40:00+00	266	355	7.7032	7.7128	7.6897	7.7127
52576	2019-05-12 00:00:00+00	288	266	0.0070	0.0070	0.0070	0.0070
50739	2019-12-22 00:00:00+00	361	288	109.5120	109.5380	109.3880	109.4300
50740	2019-12-22 00:00:00+00	266	361	1.3004	1.3014	1.2986	1.2998
50741	2019-12-22 00:00:00+00	361	355	5.9366	5.9411	5.9227	5.9356
50742	2019-12-22 00:00:00+00	355	263	0.1514	0.1515	0.1514	0.1515
52577	2019-05-10 00:00:00+00	288	266	0.0070	0.0070	0.0070	0.0070
37590	2019-12-05 00:00:00+00	917	361	200.4900	200.5000	196.4300	196.9300
52578	2019-05-09 00:00:00+00	288	266	0.0070	0.0070	0.0070	0.0070
40031	2019-12-09 00:00:00+00	917	361	199.0703	203.4300	198.9000	200.3200
52579	2019-05-08 00:00:00+00	288	266	0.0070	0.0070	0.0069	0.0069
55788	2019-12-27 04:30:00+00	288	266	0.0070	0.0070	0.0070	0.0070
52580	2019-05-07 00:00:00+00	288	266	0.0069	0.0069	0.0069	0.0069
52581	2019-05-06 00:00:00+00	288	266	0.0069	0.0069	0.0069	0.0069
55884	2019-12-27 06:25:00+00	355	263	0.1509	0.1514	0.1507	0.1513
55975	2019-12-27 08:15:00+00	288	266	0.0070	0.0070	0.0070	0.0070
56065	2019-12-27 10:10:00+00	266	355	7.7734	7.7768	7.6897	7.7127
52541	2019-06-20 00:00:00+00	288	266	0.0073	0.0073	0.0073	0.0073
52542	2019-06-19 00:00:00+00	288	266	0.0073	0.0074	0.0073	0.0073
52543	2019-06-18 00:00:00+00	288	266	0.0073	0.0074	0.0073	0.0073
52544	2019-06-17 00:00:00+00	288	266	0.0073	0.0073	0.0073	0.0073
52545	2019-06-16 00:00:00+00	288	266	0.0073	0.0073	0.0073	0.0073
52546	2019-06-14 00:00:00+00	288	266	0.0073	0.0073	0.0073	0.0073
52547	2019-06-13 00:00:00+00	288	266	0.0073	0.0073	0.0073	0.0073
52548	2019-06-12 00:00:00+00	288	266	0.0073	0.0073	0.0072	0.0072
52549	2019-06-11 00:00:00+00	288	266	0.0072	0.0073	0.0072	0.0073
52550	2019-06-10 00:00:00+00	288	266	0.0073	0.0073	0.0072	0.0072
52551	2019-06-09 00:00:00+00	288	266	0.0072	0.0072	0.0072	0.0072
52552	2019-06-07 00:00:00+00	288	266	0.0073	0.0073	0.0072	0.0073
52553	2019-06-06 00:00:00+00	288	266	0.0073	0.0073	0.0073	0.0073
52582	2019-05-05 00:00:00+00	288	266	0.0069	0.0069	0.0069	0.0069
52554	2019-06-05 00:00:00+00	288	266	0.0073	0.0073	0.0073	0.0073
52555	2019-06-04 00:00:00+00	288	266	0.0073	0.0073	0.0073	0.0073
52556	2019-06-03 00:00:00+00	288	266	0.0073	0.0073	0.0073	0.0073
52557	2019-06-02 00:00:00+00	288	266	0.0073	0.0073	0.0073	0.0073
52558	2019-05-31 00:00:00+00	288	266	0.0073	0.0073	0.0072	0.0072
52559	2019-05-30 00:00:00+00	288	266	0.0072	0.0072	0.0072	0.0072
52560	2019-05-29 00:00:00+00	288	266	0.0072	0.0073	0.0072	0.0072
52561	2019-05-28 00:00:00+00	288	266	0.0072	0.0072	0.0072	0.0072
52562	2019-05-27 00:00:00+00	288	266	0.0072	0.0072	0.0072	0.0072
52563	2019-05-26 00:00:00+00	288	266	0.0072	0.0072	0.0072	0.0072
52564	2019-05-25 00:00:00+00	288	266	0.0072	0.0072	0.0072	0.0072
52565	2019-05-24 00:00:00+00	288	266	0.0072	0.0072	0.0072	0.0072
52566	2019-05-23 00:00:00+00	288	266	0.0072	0.0072	0.0072	0.0072
52567	2019-05-22 00:00:00+00	288	266	0.0072	0.0072	0.0071	0.0071
52568	2019-05-21 00:00:00+00	288	266	0.0071	0.0072	0.0071	0.0071
52569	2019-05-20 00:00:00+00	288	266	0.0071	0.0072	0.0071	0.0071
52570	2019-05-19 00:00:00+00	288	266	0.0071	0.0071	0.0071	0.0071
52571	2019-05-17 00:00:00+00	288	266	0.0071	0.0072	0.0071	0.0071
52572	2019-05-16 00:00:00+00	288	266	0.0071	0.0071	0.0071	0.0071
52583	2019-05-03 00:00:00+00	288	266	0.0068	0.0069	0.0068	0.0069
52584	2019-05-02 00:00:00+00	288	266	0.0069	0.0069	0.0069	0.0069
52585	2019-05-01 00:00:00+00	288	266	0.0069	0.0069	0.0069	0.0069
52586	2019-04-30 00:00:00+00	288	266	0.0069	0.0069	0.0069	0.0069
52587	2019-04-29 00:00:00+00	288	266	0.0069	0.0069	0.0069	0.0069
52588	2019-04-28 00:00:00+00	288	266	0.0069	0.0069	0.0069	0.0069
52589	2019-04-26 00:00:00+00	288	266	0.0069	0.0069	0.0069	0.0069
52590	2019-04-25 00:00:00+00	288	266	0.0069	0.0069	0.0069	0.0069
52591	2019-04-24 00:00:00+00	288	266	0.0069	0.0069	0.0069	0.0069
52592	2019-04-23 00:00:00+00	288	266	0.0069	0.0069	0.0069	0.0069
51873	2019-12-23 00:00:00+00	266	355	7.7019	7.7391	7.6683	7.7245
51874	2019-12-23 00:00:00+00	263	288	121.3000	121.3600	121.0500	121.3300
43584	2019-12-12 00:00:00+00	266	361	1.3475	1.3515	1.3049	1.3200
43585	2019-12-12 00:00:00+00	361	355	5.7709	5.8104	5.7560	5.8023
43586	2019-12-12 00:00:00+00	355	263	0.1543	0.1555	0.1538	0.1543
52593	2019-04-22 00:00:00+00	288	266	0.0069	0.0069	0.0069	0.0069
52594	2019-04-21 00:00:00+00	288	266	0.0069	0.0069	0.0069	0.0069
43587	2019-12-12 00:00:00+00	266	355	7.7765	7.8196	7.5403	7.6594
50535	2019-12-20 23:15:00+00	361	355	5.9356	5.9356	5.9356	5.9356
51875	2019-12-23 00:00:00+00	263	361	1.1092	1.1096	1.1068	1.1080
51876	2019-12-23 00:00:00+00	263	355	6.6038	6.6125	6.5648	6.5807
49562	2019-12-20 00:00:00+00	888	361	46.8400	47.5400	46.8100	47.4000
50531	2019-12-20 00:00:00+00	263	355	6.5771	6.6114	6.5522	6.6070
50529	2019-12-20 00:00:00+00	263	288	121.2400	121.6900	121.1440	121.6800
43588	2019-12-12 00:00:00+00	361	288	109.4080	109.5790	108.4200	108.5550
55601	2019-12-27 00:40:00+00	288	266	0.0070	0.0070	0.0070	0.0070
41408	2019-12-11 00:00:00+00	888	361	52.7500	52.8800	52.6700	52.6800
44681	2019-12-15 00:00:00+00	888	361	50.7400	51.2300	50.6600	51.2300
55791	2019-12-27 04:30:00+00	355	263	0.1510	0.1514	0.1510	0.1513
55886	2019-12-27 06:30:00+00	266	355	7.7175	7.7271	7.6897	7.7127
55978	2019-12-27 08:20:00+00	355	263	0.1508	0.1514	0.1507	0.1513
50743	2019-12-22 00:00:00+00	266	355	7.7265	7.7323	7.6617	7.7170
56156	2019-12-27 11:55:00+00	355	263	0.1501	0.1514	0.1501	0.1513
50744	2019-12-22 00:00:00+00	263	355	6.5823	6.5891	6.5711	6.5771
56241	2019-12-27 13:40:00+00	355	263	0.1499	0.1514	0.1499	0.1513
52595	2019-04-19 00:00:00+00	288	266	0.0069	0.0069	0.0069	0.0069
52596	2019-04-18 00:00:00+00	288	266	0.0069	0.0069	0.0068	0.0068
47030	2019-12-17 00:00:00+00	917	361	207.8330	208.8700	206.8200	208.6900
52597	2019-04-17 00:00:00+00	288	266	0.0068	0.0069	0.0068	0.0068
52598	2019-04-16 00:00:00+00	288	266	0.0068	0.0068	0.0068	0.0068
52599	2019-04-15 00:00:00+00	288	266	0.0068	0.0068	0.0068	0.0068
52600	2019-04-14 00:00:00+00	288	266	0.0068	0.0068	0.0068	0.0068
52601	2019-04-12 00:00:00+00	288	266	0.0068	0.0069	0.0068	0.0069
52602	2019-04-11 00:00:00+00	288	266	0.0069	0.0069	0.0069	0.0069
52603	2019-04-10 00:00:00+00	288	266	0.0069	0.0069	0.0069	0.0069
52604	2019-04-09 00:00:00+00	288	266	0.0069	0.0069	0.0068	0.0069
52605	2019-04-08 00:00:00+00	288	266	0.0069	0.0069	0.0069	0.0069
23200	2019-11-19 00:00:00+00	355	263	0.1578	0.1580	0.1568	0.1570
23201	2019-11-19 00:00:00+00	361	355	5.7017	5.7419	5.6890	5.7279
23202	2019-11-19 00:00:00+00	266	355	7.3739	7.4387	7.3543	7.4238
23203	2019-11-19 00:00:00+00	361	288	108.4790	108.8400	108.3500	108.6660
52606	2019-04-07 00:00:00+00	288	266	0.0069	0.0069	0.0069	0.0069
52607	2019-04-05 00:00:00+00	288	266	0.0069	0.0069	0.0068	0.0069
52608	2019-04-04 00:00:00+00	288	266	0.0069	0.0069	0.0068	0.0068
52609	2019-04-03 00:00:00+00	288	266	0.0068	0.0068	0.0068	0.0068
50541	2019-12-22 00:00:00+00	545	361	127.0100	127.1400	126.8200	127.0000
52610	2019-04-02 00:00:00+00	288	266	0.0068	0.0069	0.0068	0.0069
52611	2019-04-01 00:00:00+00	288	266	0.0069	0.0069	0.0068	0.0069
52612	2019-03-31 00:00:00+00	288	266	0.0069	0.0069	0.0069	0.0069
52613	2019-03-29 00:00:00+00	288	266	0.0069	0.0069	0.0069	0.0069
52614	2019-03-28 00:00:00+00	288	266	0.0069	0.0069	0.0069	0.0069
52615	2019-03-27 00:00:00+00	288	266	0.0069	0.0069	0.0068	0.0069
52616	2019-03-26 00:00:00+00	288	266	0.0068	0.0069	0.0068	0.0069
52617	2019-03-25 00:00:00+00	288	266	0.0069	0.0069	0.0069	0.0069
52618	2019-03-24 00:00:00+00	288	266	0.0069	0.0069	0.0069	0.0069
38793	2019-12-06 00:00:00+00	361	355	5.7756	5.7756	5.7756	5.7756
52619	2019-03-22 00:00:00+00	288	266	0.0069	0.0069	0.0069	0.0069
52620	2019-03-21 00:00:00+00	288	266	0.0069	0.0069	0.0068	0.0068
52621	2019-03-20 00:00:00+00	288	266	0.0068	0.0069	0.0067	0.0068
52622	2019-03-19 00:00:00+00	288	266	0.0068	0.0068	0.0067	0.0068
52623	2019-03-18 00:00:00+00	288	266	0.0068	0.0068	0.0067	0.0067
52624	2019-03-17 00:00:00+00	288	266	0.0067	0.0067	0.0067	0.0067
52625	2019-03-15 00:00:00+00	288	266	0.0067	0.0068	0.0067	0.0067
52626	2019-03-14 00:00:00+00	288	266	0.0067	0.0068	0.0067	0.0067
52627	2019-03-13 00:00:00+00	288	266	0.0067	0.0069	0.0067	0.0069
52628	2019-03-12 00:00:00+00	288	266	0.0069	0.0069	0.0068	0.0068
52629	2019-03-11 00:00:00+00	288	266	0.0068	0.0069	0.0068	0.0069
52630	2019-03-10 00:00:00+00	288	266	0.0069	0.0069	0.0069	0.0069
52631	2019-03-08 00:00:00+00	288	266	0.0069	0.0069	0.0068	0.0069
52632	2019-03-07 00:00:00+00	288	266	0.0068	0.0069	0.0068	0.0068
52633	2019-03-06 00:00:00+00	288	266	0.0068	0.0068	0.0068	0.0068
52634	2019-03-05 00:00:00+00	288	266	0.0068	0.0068	0.0068	0.0068
48442	2019-12-19 00:00:00+00	455	355	42392.1842	43716.1680	42190.8410	43110.9538
52635	2019-03-04 00:00:00+00	288	266	0.0068	0.0068	0.0067	0.0067
52636	2019-03-03 00:00:00+00	288	266	0.0067	0.0068	0.0067	0.0067
52637	2019-03-01 00:00:00+00	288	266	0.0068	0.0068	0.0067	0.0068
52638	2019-02-28 00:00:00+00	288	266	0.0068	0.0068	0.0067	0.0068
52639	2019-02-27 00:00:00+00	288	266	0.0068	0.0068	0.0067	0.0068
52640	2019-02-26 00:00:00+00	288	266	0.0068	0.0069	0.0068	0.0069
56322	2019-12-27 15:20:00+00	266	355	7.8119	7.8136	7.6897	7.7127
52641	2019-02-25 00:00:00+00	288	266	0.0069	0.0069	0.0069	0.0069
52642	2019-02-24 00:00:00+00	288	266	0.0069	0.0069	0.0069	0.0069
41132	2019-12-10 00:00:00+00	914	361	1343.7400	1348.0000	1334.0000	1339.9400
50536	2019-12-21 00:00:00+00	545	361	127.3700	128.4000	127.3000	128.1900
50514	2019-12-20 00:00:00+00	266	361	1.2998	1.3079	1.2978	1.3017
55602	2019-12-27 00:45:00+00	266	355	7.7066	7.7128	7.7040	7.7127
36740	2019-12-05 00:00:00+00	888	361	52.4800	52.9200	52.4000	52.6600
50745	2019-12-22 00:00:00+00	263	288	121.3160	121.3600	121.1460	121.2400
50746	2019-12-22 00:00:00+00	263	361	1.1080	1.1086	1.1075	1.1077
44682	2019-12-15 00:00:00+00	455	355	40975.3665	41041.9980	40712.9068	41037.0021
55702	2019-12-27 02:45:00+00	355	263	0.1511	0.1514	0.1511	0.1513
25596	2019-11-21 00:00:00+00	921	361	52.4300	52.4300	52.4300	52.4300
55793	2019-12-27 04:35:00+00	266	355	7.7150	7.7177	7.6897	7.7127
55980	2019-12-27 08:25:00+00	266	355	7.7354	7.7446	7.6897	7.7127
52643	2019-02-22 00:00:00+00	288	266	0.0069	0.0069	0.0069	0.0069
52644	2019-02-21 00:00:00+00	288	266	0.0069	0.0069	0.0069	0.0069
52645	2019-02-20 00:00:00+00	288	266	0.0069	0.0069	0.0069	0.0069
50542	2019-12-22 00:00:00+00	455	355	42440.6379	42455.5460	42303.9106	42358.0788
52646	2019-02-19 00:00:00+00	288	266	0.0069	0.0070	0.0069	0.0070
52647	2019-02-18 00:00:00+00	288	266	0.0070	0.0070	0.0070	0.0070
52648	2019-02-17 00:00:00+00	288	266	0.0070	0.0070	0.0070	0.0070
52649	2019-02-15 00:00:00+00	288	266	0.0070	0.0071	0.0070	0.0071
52650	2019-02-14 00:00:00+00	288	266	0.0071	0.0071	0.0070	0.0070
42286	2019-12-11 00:00:00+00	914	361	1344.9130	1349.8900	1341.1000	1348.3000
52651	2019-02-13 00:00:00+00	288	266	0.0070	0.0070	0.0070	0.0070
52652	2019-02-12 00:00:00+00	288	266	0.0070	0.0070	0.0070	0.0070
52653	2019-02-11 00:00:00+00	288	266	0.0070	0.0070	0.0070	0.0070
52654	2019-02-10 00:00:00+00	288	266	0.0070	0.0070	0.0070	0.0070
52655	2019-02-08 00:00:00+00	288	266	0.0070	0.0070	0.0070	0.0070
52656	2019-02-07 00:00:00+00	288	266	0.0070	0.0071	0.0070	0.0070
23204	2019-11-19 00:00:00+00	263	355	6.3177	6.3599	6.3045	6.3477
23205	2019-11-19 00:00:00+00	266	361	1.2928	1.2970	1.2909	1.2949
23206	2019-11-19 00:00:00+00	263	288	120.1500	120.4970	119.9800	120.3200
52657	2019-02-06 00:00:00+00	288	266	0.0070	0.0070	0.0070	0.0070
22055	2019-11-18 00:00:00+00	266	355	7.4115	7.4582	7.3317	7.4237
22058	2019-11-18 00:00:00+00	355	263	0.1570	0.1575	0.1567	0.1569
52658	2019-02-05 00:00:00+00	288	266	0.0070	0.0070	0.0070	0.0070
52659	2019-02-04 00:00:00+00	288	266	0.0070	0.0070	0.0069	0.0070
52660	2019-02-03 00:00:00+00	288	266	0.0070	0.0070	0.0070	0.0070
52661	2019-02-01 00:00:00+00	288	266	0.0070	0.0070	0.0070	0.0070
52662	2019-01-31 00:00:00+00	288	266	0.0070	0.0070	0.0070	0.0070
52663	2019-01-30 00:00:00+00	288	266	0.0070	0.0070	0.0070	0.0070
52664	2019-01-29 00:00:00+00	288	266	0.0070	0.0070	0.0069	0.0069
52665	2019-01-28 00:00:00+00	288	266	0.0069	0.0070	0.0069	0.0069
56071	2019-12-27 10:10:00+00	355	263	0.1504	0.1514	0.1504	0.1513
52666	2019-01-27 00:00:00+00	288	266	0.0069	0.0069	0.0069	0.0069
52667	2019-01-25 00:00:00+00	288	266	0.0069	0.0070	0.0069	0.0070
52668	2019-01-24 00:00:00+00	288	266	0.0070	0.0070	0.0070	0.0070
52669	2019-01-23 00:00:00+00	288	266	0.0070	0.0071	0.0070	0.0070
52670	2019-01-22 00:00:00+00	288	266	0.0070	0.0071	0.0070	0.0071
52671	2019-01-21 00:00:00+00	288	266	0.0071	0.0071	0.0071	0.0071
52672	2019-01-20 00:00:00+00	288	266	0.0071	0.0071	0.0071	0.0071
52673	2019-01-18 00:00:00+00	288	266	0.0071	0.0071	0.0070	0.0070
35570	2019-12-04 00:00:00+00	888	361	52.2100	53.3400	51.6700	53.2800
52674	2019-01-17 00:00:00+00	288	266	0.0070	0.0072	0.0070	0.0071
52675	2019-01-16 00:00:00+00	288	266	0.0071	0.0072	0.0071	0.0072
52676	2019-01-15 00:00:00+00	288	266	0.0072	0.0073	0.0071	0.0072
52677	2019-01-14 00:00:00+00	288	266	0.0072	0.0072	0.0071	0.0072
52678	2019-01-13 00:00:00+00	288	266	0.0072	0.0072	0.0072	0.0072
52679	2019-01-11 00:00:00+00	288	266	0.0072	0.0073	0.0072	0.0072
44661	2019-12-13 00:00:00+00	266	355	7.7404	7.8054	7.7184	7.7772
52680	2019-01-10 00:00:00+00	288	266	0.0072	0.0073	0.0072	0.0072
52681	2019-01-09 00:00:00+00	288	266	0.0072	0.0073	0.0072	0.0072
52682	2019-01-08 00:00:00+00	288	266	0.0072	0.0072	0.0072	0.0072
52683	2019-01-07 00:00:00+00	288	266	0.0072	0.0073	0.0072	0.0072
52684	2019-01-06 00:00:00+00	288	266	0.0072	0.0072	0.0072	0.0072
52685	2019-01-04 00:00:00+00	288	266	0.0072	0.0074	0.0072	0.0073
52686	2019-01-03 00:00:00+00	288	266	0.0073	0.0075	0.0073	0.0075
52687	2019-01-02 00:00:00+00	288	266	0.0075	0.0076	0.0071	0.0072
52688	2019-01-01 00:00:00+00	288	266	0.0072	0.0072	0.0071	0.0072
56158	2019-12-27 12:00:00+00	266	355	7.7928	7.7941	7.6897	7.7127
56243	2019-12-27 13:45:00+00	266	355	7.7984	7.8080	7.6897	7.7127
49308	2019-12-19 00:00:00+00	917	361	210.0300	211.3700	209.2300	209.6100
50532	2019-12-20 00:00:00+00	361	355	5.9356	5.9429	5.8973	5.9409
49543	2019-12-20 00:00:00+00	455	355	42174.7840	42541.8560	42063.5572	42490.2235
50537	2019-12-21 00:00:00+00	455	355	42446.9931	42708.4499	42421.6908	42693.1854
44581	2019-12-13 00:00:00+00	914	361	1348.3300	1351.3500	1341.6600	1347.9000
43144	2019-12-11 00:00:00+00	921	361	53.0600	53.0600	53.0600	53.0600
55704	2019-12-27 02:45:00+00	288	266	0.0070	0.0070	0.0070	0.0070
55890	2019-12-27 06:35:00+00	288	266	0.0070	0.0070	0.0070	0.0070
56073	2019-12-27 10:20:00+00	266	355	7.7733	7.7768	7.6897	7.7127
56326	2019-12-27 10:25:00+00	914	361	1358.7500	1367.0700	1354.4750	1364.0000
56410	2019-12-27 17:00:00+00	355	263	0.1497	0.1514	0.1496	0.1513
38794	2019-12-07 00:00:00+00	545	361	148.2800	148.9300	148.2400	148.4600
56556	2019-12-27 19:40:00+00	266	355	7.7954	7.8136	7.6897	7.7127
41996	2019-12-10 00:00:00+00	921	361	52.8300	52.8300	52.8300	52.8300
34101	2019-12-02 00:00:00+00	917	361	196.1300	198.6700	193.5100	198.5800
55550	2019-12-26 00:00:00+00	288	266	0.0070	0.0070	0.0070	0.0070
36437	2019-12-04 00:00:00+00	914	361	1318.9400	1324.2700	1303.0500	1306.1000
34376	2019-12-02 00:00:00+00	921	361	52.6100	52.6100	52.6100	52.6100
22060	2019-11-18 00:00:00+00	263	355	6.3390	6.3977	6.2662	6.3516
22061	2019-11-18 00:00:00+00	266	361	1.2949	1.2985	1.2914	1.2919
19638	2019-11-15 00:00:00+00	888	361	64.6300	65.1100	64.5100	65.0200
22062	2019-11-18 00:00:00+00	263	288	120.2900	120.6860	120.1300	120.1530
23207	2019-11-19 00:00:00+00	263	361	1.1077	1.1084	1.1061	1.1072
26492	2019-11-22 00:00:00+00	263	288	119.7500	120.4930	119.6200	120.1480
26493	2019-11-22 00:00:00+00	263	361	1.1022	1.1088	1.1013	1.1066
26491	2019-11-22 00:00:00+00	266	361	1.2829	1.2929	1.2822	1.2919
31804	2019-11-28 00:00:00+00	263	355	6.3414	6.3717	6.3301	6.3662
31805	2019-11-28 00:00:00+00	266	361	1.2910	1.2951	1.2897	1.2930
31806	2019-11-28 00:00:00+00	263	288	120.5900	120.6020	120.3100	120.3620
56688	2019-12-27 00:00:00+00	263	355	6.6478	6.6661	6.5765	6.5841
56687	2019-12-27 00:00:00+00	263	288	122.3000	122.5030	121.4900	121.7050
56686	2019-12-27 22:25:00+00	266	355	7.7803	7.8136	7.6897	7.7127
50540	2019-12-20 00:00:00+00	921	361	51.1200	51.1200	51.1200	51.1200
40179	2019-12-09 00:00:00+00	355	263	0.1550	0.1560	0.1548	0.1559
40180	2019-12-09 00:00:00+00	266	355	7.6385	7.6532	7.5889	7.5947
40181	2019-12-09 00:00:00+00	361	288	108.5830	108.6800	108.4000	108.6410
40182	2019-12-09 00:00:00+00	263	288	120.1390	120.2700	119.9600	120.1370
40183	2019-12-09 00:00:00+00	361	355	5.8086	5.8169	5.7670	5.7789
40184	2019-12-09 00:00:00+00	263	361	1.1064	1.1078	1.1052	1.1058
29546	2019-11-26 00:00:00+00	361	355	5.7582	5.7705	5.7280	5.7406
45900	2019-12-16 00:00:00+00	914	361	1362.1600	1363.5300	1350.6100	1355.0000
34258	2019-12-02 00:00:00+00	355	263	0.1567	0.1578	0.1565	0.1573
55608	2019-12-27 00:50:00+00	355	263	0.1513	0.1514	0.1513	0.1513
55705	2019-12-27 02:50:00+00	266	355	7.7079	7.7128	7.6897	7.7127
31807	2019-11-28 00:00:00+00	361	355	5.7570	5.7840	5.7473	5.7801
39037	2019-12-08 00:00:00+00	263	355	6.3923	6.3962	6.3693	6.3832
31808	2019-11-28 00:00:00+00	263	361	1.1011	1.1018	1.0999	1.1005
39038	2019-12-08 00:00:00+00	266	361	1.3140	1.3153	1.3118	1.3132
55799	2019-12-27 04:40:00+00	355	263	0.1510	0.1514	0.1510	0.1513
55893	2019-12-27 06:35:00+00	355	263	0.1509	0.1514	0.1507	0.1513
55986	2019-12-27 08:30:00+00	355	263	0.1507	0.1514	0.1507	0.1513
56162	2019-12-27 12:05:00+00	288	266	0.0070	0.0070	0.0070	0.0070
56247	2019-12-27 13:50:00+00	288	266	0.0070	0.0070	0.0070	0.0070
47303	2019-12-17 00:00:00+00	921	361	54.0900	54.0900	54.0900	54.0900
56329	2019-12-27 15:25:00+00	355	263	0.1497	0.1514	0.1497	0.1513
19519	2019-11-14 00:00:00+00	263	288	119.5620	119.8120	119.2300	119.7800
56412	2019-12-27 17:05:00+00	266	355	7.7967	7.8136	7.6897	7.7127
56482	2019-12-27 18:20:00+00	355	263	0.1497	0.1514	0.1496	0.1513
56560	2019-12-27 19:40:00+00	288	266	0.0070	0.0070	0.0070	0.0070
26495	2019-11-22 00:00:00+00	361	355	5.7120	5.7236	5.6885	5.6954
56630	2019-12-27 21:10:00+00	355	263	0.1497	0.1514	0.1495	0.1513
48324	2019-12-18 00:00:00+00	266	355	7.7553	7.7621	7.6930	7.7226
48172	2019-12-18 00:00:00+00	917	361	209.5850	209.9900	208.0400	208.5300
48325	2019-12-18 00:00:00+00	263	288	121.7740	122.1400	121.6600	122.1330
34259	2019-12-02 00:00:00+00	266	355	7.4264	7.4478	7.4020	7.4241
34260	2019-12-02 00:00:00+00	361	288	109.0280	109.7270	108.8900	109.5320
38795	2019-12-07 00:00:00+00	888	361	54.0300	54.3100	53.9100	54.1100
43678	2019-12-13 00:00:00+00	455	355	41612.5230	41687.1528	41535.9870	41576.4211
48326	2019-12-18 00:00:00+00	263	361	1.1115	1.1151	1.1109	1.1151
19639	2019-11-15 00:00:00+00	455	355	49189.5613	49794.2053	49027.6903	49719.2789
40185	2019-12-09 00:00:00+00	263	355	6.4287	6.4416	6.3798	6.3920
40186	2019-12-09 00:00:00+00	266	361	1.3143	1.3181	1.3134	1.3138
29548	2019-11-26 00:00:00+00	355	263	0.1570	0.1578	0.1569	0.1577
45901	2019-12-16 00:00:00+00	917	361	207.6200	209.1500	206.1900	206.3300
29549	2019-11-26 00:00:00+00	266	355	7.4039	7.4199	7.3775	7.4034
29550	2019-11-26 00:00:00+00	361	288	109.0970	109.2080	108.8400	108.9970
29551	2019-11-26 00:00:00+00	263	355	6.3478	6.3605	6.3159	6.3243
29552	2019-11-26 00:00:00+00	266	361	1.2860	1.2904	1.2834	1.2896
23307	2019-11-19 00:00:00+00	921	361	52.5800	52.5800	52.5800	52.5800
29553	2019-11-26 00:00:00+00	263	288	120.2400	120.2530	119.9000	120.0120
29555	2019-11-26 00:00:00+00	263	361	1.1022	1.1026	1.1006	1.1010
55610	2019-12-27 00:55:00+00	266	355	7.7074	7.7128	7.7040	7.7127
23306	2019-11-20 00:00:00+00	455	355	46462.6996	46512.8650	46198.9745	46420.5812
24174	2019-11-20 00:00:00+00	914	361	1296.4000	1313.2100	1289.2100	1311.3600
56484	2019-12-27 18:20:00+00	288	266	0.0070	0.0070	0.0070	0.0070
56563	2019-12-27 19:50:00+00	355	263	0.1496	0.1514	0.1495	0.1513
55801	2019-12-27 04:45:00+00	266	355	7.7223	7.7234	7.6897	7.7127
39039	2019-12-08 00:00:00+00	355	263	0.1559	0.1561	0.1559	0.1561
39040	2019-12-08 00:00:00+00	266	355	7.5939	7.5963	7.5605	7.5844
39041	2019-12-08 00:00:00+00	361	288	108.6310	108.6620	108.5500	108.5500
56632	2019-12-27 21:15:00+00	266	355	7.7812	7.8136	7.6897	7.7127
55895	2019-12-27 06:40:00+00	266	355	7.7205	7.7271	7.6897	7.7127
20703	2019-11-15 00:00:00+00	355	263	0.1570	0.1573	0.1568	0.1573
55988	2019-12-27 08:35:00+00	266	355	7.7415	7.7446	7.6897	7.7127
37875	2019-12-06 00:00:00+00	455	355	42533.7314	42739.4953	42049.1314	42480.8388
34106	2019-12-02 00:00:00+00	914	361	1290.4600	1305.4400	1280.3800	1302.5600
38796	2019-12-07 00:00:00+00	455	355	43433.5778	43660.4732	43344.7500	43505.4145
56077	2019-12-27 10:20:00+00	288	266	0.0070	0.0070	0.0070	0.0070
22065	2019-11-18 00:00:00+00	361	288	108.6720	109.0730	108.4800	108.7010
22066	2019-11-18 00:00:00+00	263	361	1.1072	1.1090	1.1052	1.1054
22068	2019-11-18 00:00:00+00	361	355	5.7315	5.7533	5.6885	5.7464
56165	2019-12-27 12:05:00+00	355	263	0.1501	0.1514	0.1501	0.1513
19520	2019-11-14 00:00:00+00	361	355	5.7462	5.7794	5.7405	5.7556
19521	2019-11-14 00:00:00+00	266	361	1.2880	1.2888	1.2823	1.2852
19522	2019-11-14 00:00:00+00	355	263	0.1573	0.1578	0.1567	0.1573
19523	2019-11-14 00:00:00+00	266	355	7.4050	7.4281	7.3800	7.3990
56250	2019-12-27 13:50:00+00	355	263	0.1499	0.1514	0.1499	0.1513
31811	2019-11-28 00:00:00+00	361	288	109.5160	109.5480	109.3100	109.3720
48327	2019-12-18 00:00:00+00	263	355	6.5880	6.5962	6.5488	6.5633
56331	2019-12-27 15:30:00+00	266	355	7.8094	7.8136	7.6897	7.7127
46053	2019-12-16 00:00:00+00	266	355	7.7574	7.8410	7.7394	7.7584
46054	2019-12-16 00:00:00+00	263	288	122.0320	122.2310	121.6200	121.6790
31924	2019-11-29 00:00:00+00	455	355	42921.4241	43123.6788	42411.2654	42735.1263
20704	2019-11-15 00:00:00+00	263	288	120.3100	120.3200	119.5100	119.5590
32882	2019-11-30 00:00:00+00	888	361	56.0000	56.0500	55.5400	55.7200
46055	2019-12-16 00:00:00+00	263	361	1.1137	1.1158	1.1121	1.1124
45044	2019-12-16 00:00:00+00	455	355	41242.8128	41443.5075	41036.9468	41368.4358
30791	2019-11-28 00:00:00+00	455	355	43335.5693	43740.0783	43120.9483	43385.9017
56690	2019-12-27 00:00:00+00	361	355	5.9492	5.9598	5.9210	5.9321
55711	2019-12-27 02:55:00+00	355	263	0.1511	0.1514	0.1511	0.1513
21032	2019-11-18 00:00:00+00	888	361	61.7800	61.8600	61.4700	61.6600
47308	2019-12-18 00:00:00+00	888	361	45.4000	45.6000	44.9400	45.0800
46164	2019-12-17 00:00:00+00	888	361	49.0600	49.2500	49.0300	49.1500
27987	2019-11-25 00:00:00+00	921	361	53.0200	53.0200	53.0200	53.0200
50827	2019-12-23 00:00:00+00	545	361	133.5300	134.8700	132.1000	132.1200
56080	2019-12-27 10:20:00+00	355	263	0.1504	0.1514	0.1503	0.1513
56167	2019-12-27 12:10:00+00	266	355	7.7964	7.8005	7.6897	7.7127
39042	2019-12-08 00:00:00+00	263	288	120.1200	120.2500	119.9950	120.0600
39043	2019-12-08 00:00:00+00	361	355	5.7789	5.7814	5.7633	5.7756
35278	2019-12-03 00:00:00+00	914	361	1292.2900	1294.5200	1277.0500	1278.6600
39044	2019-12-08 00:00:00+00	263	361	1.1058	1.1061	1.1053	1.1056
56252	2019-12-27 13:55:00+00	266	355	7.7978	7.8080	7.6897	7.7127
42295	2019-12-11 00:00:00+00	917	361	204.2100	204.8000	200.7200	201.1000
56418	2019-12-27 17:10:00+00	355	263	0.1497	0.1514	0.1496	0.1513
20705	2019-11-15 00:00:00+00	266	355	7.4136	7.4303	7.3966	7.4064
56485	2019-12-27 13:23:15+00	917	361	216.1400	218.1100	216.0500	217.9900
56565	2019-12-27 19:50:00+00	266	355	7.7987	7.8136	7.6897	7.7127
32812	2019-11-29 00:00:00+00	917	361	200.0000	200.4300	198.3502	199.8100
18390	2019-11-13 00:00:00+00	361	288	108.7880	109.1510	108.6300	108.9970
18391	2019-11-13 00:00:00+00	263	361	1.1009	1.1020	1.0994	1.1012
18392	2019-11-13 00:00:00+00	263	355	6.3339	6.3661	6.3054	6.3612
19641	2019-11-14 00:00:00+00	921	361	51.8200	51.8200	51.8200	51.8200
19524	2019-11-14 00:00:00+00	361	288	108.4820	108.8630	108.2300	108.7990
19525	2019-11-14 00:00:00+00	263	361	1.1019	1.1027	1.0988	1.1010
19526	2019-11-14 00:00:00+00	263	355	6.3372	6.3691	6.3173	6.3417
55555	2019-12-26 00:00:00+00	361	288	109.5510	109.6840	109.3300	109.3700
55556	2019-12-26 00:00:00+00	266	361	1.2995	1.3016	1.2959	1.2970
55557	2019-12-26 00:00:00+00	355	263	0.1514	0.1515	0.1512	0.1512
20706	2019-11-15 00:00:00+00	263	355	6.3492	6.3608	6.3328	6.3356
46056	2019-12-16 00:00:00+00	263	355	6.5138	6.5309	6.4603	6.4621
55558	2019-12-26 00:00:00+00	361	355	5.9305	5.9436	5.9240	5.9364
48328	2019-12-18 00:00:00+00	361	288	109.5480	109.6280	109.3700	109.5230
23034	2019-11-19 00:00:00+00	914	361	1314.2583	1326.6300	1311.7700	1326.6300
48329	2019-12-18 00:00:00+00	266	361	1.3084	1.3129	1.3058	1.3122
56691	2019-12-27 22:30:00+00	288	266	0.0070	0.0070	0.0070	0.0070
44633	2019-12-13 00:00:00+00	361	288	109.4100	109.7070	109.1700	109.4050
48330	2019-12-18 00:00:00+00	361	355	5.9257	5.9312	5.8812	5.8854
48331	2019-12-18 00:00:00+00	355	263	0.1514	0.1522	0.1511	0.1519
42442	2019-12-11 00:00:00+00	263	288	120.8560	120.9290	120.3500	120.6520
42443	2019-12-11 00:00:00+00	263	361	1.1133	1.1145	1.1069	1.1092
42444	2019-12-11 00:00:00+00	263	355	6.4603	6.4674	6.4263	6.4416
15950	2019-11-08 00:00:00+00	921	361	51.7400	51.7400	51.7400	51.7400
42445	2019-12-11 00:00:00+00	361	355	5.7994	5.8185	5.7880	5.8054
52008	2019-12-23 00:00:00+00	921	361	51.1700	51.1700	51.1700	51.1700
42446	2019-12-11 00:00:00+00	355	263	0.1543	0.1551	0.1541	0.1548
42447	2019-12-11 00:00:00+00	266	355	7.6596	7.6707	7.6101	7.6221
42448	2019-12-11 00:00:00+00	361	288	108.5460	108.8000	108.4500	108.7690
50828	2019-12-23 00:00:00+00	888	361	47.2900	47.6500	47.0800	47.3900
24452	2019-11-21 00:00:00+00	455	355	46235.9183	46348.4972	46059.6111	46163.4117
50445	2019-12-20 00:00:00+00	917	361	212.2500	213.9800	210.4200	211.3500
33112	2019-12-01 00:00:00+00	263	355	6.3357	6.3426	6.3072	6.3316
33113	2019-12-01 00:00:00+00	266	361	1.2911	1.2928	1.2901	1.2928
33114	2019-12-01 00:00:00+00	263	288	120.7060	120.7810	120.4400	120.6200
42551	2019-12-12 00:00:00+00	888	361	52.3200	53.5100	51.0100	53.0000
55616	2019-12-27 01:00:00+00	355	263	0.1513	0.1514	0.1513	0.1513
24453	2019-11-20 00:00:00+00	921	361	52.4900	52.4900	52.4900	52.4900
54482	2019-12-26 00:00:00+00	888	361	45.8200	46.1200	45.7800	45.9900
55713	2019-12-27 03:00:00+00	266	355	7.7051	7.7128	7.6897	7.7127
20707	2019-11-15 00:00:00+00	361	355	5.7443	5.7702	5.7324	5.7499
20593	2019-11-15 00:00:00+00	914	361	1329.0700	1333.2200	1311.8900	1315.0500
55805	2019-12-27 04:50:00+00	288	266	0.0070	0.0070	0.0070	0.0070
55559	2019-12-26 00:00:00+00	266	355	7.7062	7.7267	7.6890	7.7005
47043	2019-12-17 00:00:00+00	914	361	1356.3700	1364.3300	1350.7700	1362.4100
55901	2019-12-27 06:45:00+00	355	263	0.1510	0.1514	0.1507	0.1513
55992	2019-12-27 08:40:00+00	288	266	0.0070	0.0070	0.0070	0.0070
56082	2019-12-27 10:30:00+00	266	355	7.7743	7.7768	7.6897	7.7127
55560	2019-12-26 00:00:00+00	263	288	121.7000	121.7900	121.3000	121.3380
55561	2019-12-26 00:00:00+00	263	361	1.1099	1.1109	1.1081	1.1094
26500	2019-11-22 00:00:00+00	263	355	6.2973	6.3306	6.2773	6.3042
26501	2019-11-22 00:00:00+00	355	263	0.1583	0.1585	0.1575	0.1581
56335	2019-12-27 15:30:00+00	288	266	0.0070	0.0070	0.0070	0.0070
18393	2019-11-13 00:00:00+00	361	355	5.7490	5.7781	5.7270	5.7750
49463	2019-12-19 00:00:00+00	266	355	7.7295	7.7975	7.7146	7.7506
49464	2019-12-19 00:00:00+00	263	288	121.6700	122.0500	121.3900	121.7670
49465	2019-12-19 00:00:00+00	263	361	1.1123	1.1144	1.1106	1.1116
56420	2019-12-27 17:15:00+00	266	355	7.7968	7.8136	7.6897	7.7127
56486	2019-12-27 18:25:00+00	266	355	7.7993	7.8136	7.6897	7.7127
46057	2019-12-16 00:00:00+00	361	288	109.5870	109.6760	109.3200	109.3830
46058	2019-12-16 00:00:00+00	266	361	1.3270	1.3422	1.3235	1.3354
46059	2019-12-16 00:00:00+00	361	355	5.8492	5.8586	5.8055	5.8071
46060	2019-12-16 00:00:00+00	355	263	0.1530	0.1542	0.1527	0.1542
56569	2019-12-27 14:57:54+00	917	361	216.1600	218.1100	215.1700	217.9900
56638	2019-12-27 21:20:00+00	355	263	0.1498	0.1514	0.1495	0.1513
44639	2019-12-13 00:00:00+00	263	361	1.1122	1.1186	1.1110	1.1183
16165	2019-11-11 00:00:00+00	914	361	1296.8200	1304.9000	1296.1566	1304.0000
37750	2019-12-05 00:00:00+00	361	355	5.7457	5.7685	5.7320	5.7482
37751	2019-12-05 00:00:00+00	263	361	1.1105	1.1108	1.1078	1.1083
37752	2019-12-05 00:00:00+00	355	263	0.1561	0.1566	0.1558	0.1565
37753	2019-12-05 00:00:00+00	266	355	7.5643	7.5836	7.5278	7.5346
37754	2019-12-05 00:00:00+00	361	288	108.7310	108.9980	108.6200	108.8310
55562	2019-12-26 00:00:00+00	263	355	6.5829	6.5954	6.5667	6.5857
32885	2019-11-29 00:00:00+00	921	361	53.1500	53.1500	53.1500	53.1500
42449	2019-12-11 00:00:00+00	266	361	1.3200	1.3214	1.3110	1.3129
55618	2019-12-27 01:05:00+00	288	266	0.0070	0.0070	0.0070	0.0070
39117	2019-12-09 00:00:00+00	455	355	43449.7070	43600.4781	43395.8272	43416.6969
50543	2019-12-22 00:00:00+00	888	361	45.3400	45.3700	44.9600	44.9900
34375	2019-12-03 00:00:00+00	455	355	42229.3392	42484.8800	41864.8304	41878.7241
34350	2019-12-03 00:00:00+00	888	361	53.9900	54.8000	53.8800	53.9100
55808	2019-12-27 04:50:00+00	355	263	0.1509	0.1514	0.1509	0.1513
41433	2019-12-11 00:00:00+00	455	355	42120.7314	42237.1877	41916.6135	41939.0804
18394	2019-11-13 00:00:00+00	266	361	1.2852	1.2859	1.2820	1.2851
18395	2019-11-13 00:00:00+00	355	263	0.1574	0.1580	0.1567	0.1568
55903	2019-12-27 06:50:00+00	266	355	7.7214	7.7271	7.6897	7.7127
18396	2019-11-13 00:00:00+00	266	355	7.3956	7.4263	7.3558	7.4195
33115	2019-12-01 00:00:00+00	361	355	5.7485	5.7510	5.7340	5.7470
33116	2019-12-01 00:00:00+00	263	361	1.1018	1.1027	1.1013	1.1017
55995	2019-12-27 08:40:00+00	355	263	0.1506	0.1514	0.1506	0.1513
32884	2019-12-01 00:00:00+00	455	355	42561.8775	43349.7996	42340.8707	43342.7872
56173	2019-12-27 12:15:00+00	355	263	0.1500	0.1514	0.1500	0.1513
37608	2019-12-05 00:00:00+00	914	361	1325.1000	1327.7200	1314.3200	1327.0000
38799	2019-12-08 00:00:00+00	545	361	147.2600	147.6300	146.6700	147.1600
56258	2019-12-27 14:00:00+00	355	263	0.1500	0.1514	0.1499	0.1513
38717	2019-12-06 00:00:00+00	914	361	1342.1200	1342.4700	1331.2300	1332.7500
56338	2019-12-27 15:35:00+00	355	263	0.1497	0.1514	0.1497	0.1513
56423	2019-12-27 17:15:00+00	288	266	0.0070	0.0070	0.0070	0.0070
56490	2019-12-27 13:26:27+00	914	361	1358.3900	1367.0700	1354.4750	1364.0000
18277	2019-11-13 00:00:00+00	914	361	1298.1200	1302.5200	1292.1470	1293.1800
56572	2019-12-27 20:00:00+00	355	263	0.1495	0.1514	0.1495	0.1513
56640	2019-12-27 21:25:00+00	288	266	0.0070	0.0070	0.0070	0.0070
26502	2019-11-22 00:00:00+00	266	355	7.3300	7.3300	7.3300	7.3300
30683	2019-11-27 00:00:00+00	361	355	5.7781	5.7912	5.7445	5.7594
30684	2019-11-27 00:00:00+00	263	361	1.1005	1.1022	1.0990	1.1022
56693	2019-12-28 00:00:00+00	545	361	127.3400	128.3100	125.8400	126.2800
49466	2019-12-19 00:00:00+00	263	355	6.6070	6.6206	6.5738	6.5877
31895	2019-11-29 00:00:00+00	888	361	53.9500	54.4100	53.7000	53.7800
31403	2019-11-27 00:00:00+00	921	361	53.3600	53.3600	53.3600	53.3600
49547	2019-12-20 00:00:00+00	545	361	126.4700	128.6000	126.2500	128.1000
37755	2019-12-05 00:00:00+00	263	355	6.3828	6.4049	6.3631	6.3755
35543	2019-12-04 00:00:00+00	545	361	144.5500	147.2800	143.1500	147.1900
37756	2019-12-05 00:00:00+00	266	361	1.3158	1.3166	1.3103	1.3109
37757	2019-12-05 00:00:00+00	263	288	120.7490	120.8890	120.5300	120.6180
21041	2019-11-18 00:00:00+00	455	355	48726.3422	48876.5323	48603.3968	48872.7962
33117	2019-12-01 00:00:00+00	355	263	0.1573	0.1574	0.1572	0.1574
33118	2019-12-01 00:00:00+00	266	355	7.4214	7.4328	7.3809	7.4328
33119	2019-12-01 00:00:00+00	361	288	109.5340	109.5700	109.4500	109.4800
38718	2019-12-06 00:00:00+00	917	361	201.8900	202.0000	199.5100	201.1100
55619	2019-12-27 01:05:00+00	266	355	7.7056	7.7128	7.7031	7.7127
55719	2019-12-27 03:05:00+00	355	263	0.1511	0.1514	0.1511	0.1513
36609	2019-12-04 00:00:00+00	263	355	6.3754	6.3898	6.3534	6.3622
55810	2019-12-27 04:55:00+00	266	355	7.7216	7.7234	7.6897	7.7127
36610	2019-12-04 00:00:00+00	266	361	1.3109	1.3120	1.2981	1.2997
55997	2019-12-27 08:45:00+00	266	355	7.7545	7.7550	7.6897	7.7127
16310	2019-11-11 00:00:00+00	355	263	0.1565	0.1569	0.1562	0.1568
16311	2019-11-11 00:00:00+00	266	355	7.4168	7.4532	7.3706	7.3781
16312	2019-11-11 00:00:00+00	266	361	1.2854	1.2898	1.2784	1.2795
16313	2019-11-11 00:00:00+00	263	361	1.1035	1.1043	1.1015	1.1022
36611	2019-12-04 00:00:00+00	263	288	120.6130	120.8110	120.0700	120.4160
16314	2019-11-11 00:00:00+00	263	355	6.3693	6.3942	6.3369	6.3573
36612	2019-12-04 00:00:00+00	361	355	5.7476	5.7581	5.7270	5.7438
16315	2019-11-11 00:00:00+00	361	355	5.7669	5.7956	5.7548	5.7658
16316	2019-11-11 00:00:00+00	361	288	109.0410	109.2460	108.8600	109.2060
38800	2019-12-08 00:00:00+00	888	361	53.7700	54.3500	53.6100	54.2500
56088	2019-12-27 10:35:00+00	355	263	0.1504	0.1514	0.1503	0.1513
56175	2019-12-27 12:20:00+00	266	355	7.8011	7.8025	7.6897	7.7127
56260	2019-12-27 14:05:00+00	266	355	7.8009	7.8080	7.6897	7.7127
55371	2019-12-26 00:00:00+00	914	361	1358.5000	1363.2000	1345.5100	1346.5500
56340	2019-12-27 15:40:00+00	266	355	7.8127	7.8136	7.6897	7.7127
56425	2019-12-27 12:22:19+00	917	361	216.7000	218.1100	216.1700	217.9900
20709	2019-11-16 00:00:00+00	888	361	61.5500	61.9000	61.3000	61.8400
30685	2019-11-27 00:00:00+00	355	263	0.1567	0.1575	0.1565	0.1570
30686	2019-11-27 00:00:00+00	266	355	7.4764	7.4896	7.3874	7.4070
30687	2019-11-27 00:00:00+00	361	288	109.3550	109.6100	109.0400	109.0960
56574	2019-12-27 20:00:00+00	266	355	7.7960	7.8136	7.6897	7.7127
44669	2019-12-13 00:00:00+00	266	361	1.3324	1.3508	1.3304	1.3473
18397	2019-11-13 00:00:00+00	263	288	119.7840	120.1800	119.5500	120.0280
56641	2019-12-27 21:25:00+00	266	355	7.7783	7.8136	7.6897	7.7127
40259	2019-12-10 00:00:00+00	545	361	146.9100	148.5700	146.1800	147.4000
55565	2019-12-27 00:00:00+00	355	263	0.1499	0.1514	0.1495	0.1513
56694	2019-12-28 00:00:00+00	455	355	43559.7052	43689.8820	43086.7354	43182.5675
16414	2019-11-11 00:00:00+00	921	361	51.6500	51.6500	51.6500	51.6500
55721	2019-12-27 03:05:00+00	288	266	0.0070	0.0070	0.0070	0.0070
23324	2019-11-20 00:00:00+00	888	361	58.4400	58.5600	58.1700	58.4900
27969	2019-11-26 00:00:00+00	888	361	50.2100	50.2100	49.5300	49.8700
55907	2019-12-27 06:55:00+00	288	266	0.0070	0.0070	0.0070	0.0070
56090	2019-12-27 10:40:00+00	266	355	7.7740	7.7768	7.6897	7.7127
15415	2019-11-11 00:00:00+00	888	361	63.8200	63.9300	63.6800	63.8400
15416	2019-11-11 00:00:00+00	455	355	52285.7329	52295.0785	52075.8603	52151.7790
36697	2019-12-05 00:00:00+00	545	361	145.7800	146.0300	144.9900	145.4500
56428	2019-12-27 17:20:00+00	355	263	0.1496	0.1514	0.1496	0.1513
36613	2019-12-04 00:00:00+00	263	361	1.1083	1.1116	1.1065	1.1082
36614	2019-12-04 00:00:00+00	355	263	0.1565	0.1568	0.1561	0.1567
56578	2019-12-27 20:00:00+00	288	266	0.0070	0.0070	0.0070	0.0070
36615	2019-12-04 00:00:00+00	266	355	7.5396	7.5505	7.4573	7.4620
38801	2019-12-08 00:00:00+00	455	355	42928.8716	43343.3052	42837.2697	43271.4107
36616	2019-12-04 00:00:00+00	361	288	108.8340	108.9630	108.4000	108.6630
29401	2019-11-26 00:00:00+00	917	361	193.2200	193.3600	189.0400	190.3900
55567	2019-12-27 00:00:00+00	288	266	0.0070	0.0070	0.0070	0.0070
25545	2019-11-22 00:00:00+00	455	355	43645.3562	43833.1185	43404.0290	43466.1985
49467	2019-12-19 00:00:00+00	361	288	109.3820	109.6850	109.1500	109.5480
26504	2019-11-23 00:00:00+00	263	355	6.2973	6.2973	6.2973	6.2973
26505	2019-11-23 00:00:00+00	355	263	0.1583	0.1583	0.1583	0.1583
49468	2019-12-19 00:00:00+00	266	361	1.3017	1.3133	1.2989	1.3084
49469	2019-12-19 00:00:00+00	361	355	5.9386	5.9443	5.8950	5.9253
49470	2019-12-19 00:00:00+00	355	263	0.1508	0.1515	0.1506	0.1514
20710	2019-11-16 00:00:00+00	455	355	48573.6859	48769.1070	48252.1200	48663.5268
30688	2019-11-27 00:00:00+00	263	355	6.3621	6.3711	6.3286	6.3479
30689	2019-11-27 00:00:00+00	266	361	1.2929	1.2951	1.2825	1.2860
30690	2019-11-27 00:00:00+00	263	288	120.3490	120.6000	120.0300	120.2470
35544	2019-12-04 00:00:00+00	455	355	41212.5271	41909.3082	40805.9614	41901.7238
41311	2019-12-10 00:00:00+00	263	355	6.4397	6.4460	6.4175	6.4278
41312	2019-12-10 00:00:00+00	266	361	1.3131	1.3215	1.3103	1.3146
44670	2019-12-13 00:00:00+00	263	288	121.5100	121.5100	121.5100	121.5100
44914	2019-12-15 00:00:00+00	266	355	7.7573	7.7600	7.7189	7.7404
44915	2019-12-15 00:00:00+00	263	288	121.6920	121.9600	121.5100	121.5100
44916	2019-12-15 00:00:00+00	263	361	1.1124	1.1133	1.1118	1.1122
47186	2019-12-17 00:00:00+00	266	355	7.7212	7.7818	7.7014	7.7606
47187	2019-12-17 00:00:00+00	263	288	122.1180	122.4620	121.9000	122.0260
47188	2019-12-17 00:00:00+00	263	361	1.1151	1.1175	1.1128	1.1136
47189	2019-12-17 00:00:00+00	263	355	6.5636	6.5712	6.5113	6.5132
33192	2019-12-02 00:00:00+00	888	361	53.3400	53.5200	53.1400	53.4800
29670	2019-11-27 00:00:00+00	888	361	51.0900	51.3200	50.8500	51.1500
29643	2019-11-27 00:00:00+00	455	355	41069.0946	41357.5353	41018.6204	41224.9540
55625	2019-12-27 01:10:00+00	355	263	0.1513	0.1514	0.1513	0.1513
39124	2019-12-09 00:00:00+00	545	361	150.3500	151.0900	150.2500	150.4400
56346	2019-12-27 15:45:00+00	355	263	0.1496	0.1514	0.1496	0.1513
56430	2019-12-27 12:25:06+00	914	361	1358.9200	1367.0700	1354.4750	1364.0000
32876	2019-11-29 00:00:00+00	266	355	7.4328	7.4494	7.3993	7.4350
55722	2019-12-27 03:10:00+00	266	355	7.7016	7.7128	7.6897	7.7127
56497	2019-12-27 18:30:00+00	355	263	0.1496	0.1514	0.1496	0.1513
41313	2019-12-10 00:00:00+00	361	355	5.8037	5.8186	5.7880	5.8099
41314	2019-12-10 00:00:00+00	355	263	0.1548	0.1553	0.1547	0.1550
41315	2019-12-10 00:00:00+00	266	355	7.6210	7.6684	7.6025	7.6373
55816	2019-12-27 05:00:00+00	355	263	0.1509	0.1514	0.1509	0.1513
41316	2019-12-10 00:00:00+00	361	288	108.7620	108.8570	108.4800	108.5870
56581	2019-12-27 20:10:00+00	355	263	0.1496	0.1514	0.1495	0.1513
55910	2019-12-27 06:55:00+00	355	263	0.1510	0.1514	0.1507	0.1513
26506	2019-11-22 23:20:00+00	263	355	6.2973	6.2973	6.2973	6.2973
56647	2019-12-27 21:30:00+00	355	263	0.1498	0.1514	0.1495	0.1513
20711	2019-11-15 00:00:00+00	921	361	52.4000	52.4000	52.4000	52.4000
40268	2019-12-10 00:00:00+00	888	361	53.4000	54.6700	53.2800	54.4300
55568	2019-12-27 00:05:00+00	266	355	7.7077	7.7128	7.7040	7.7127
26507	2019-11-22 23:20:00+00	355	263	0.1583	0.1583	0.1583	0.1583
56003	2019-12-27 08:50:00+00	355	263	0.1505	0.1514	0.1505	0.1513
44294	2019-12-12 00:00:00+00	921	361	53.3900	53.3900	53.3900	53.3900
26838	2019-11-25 00:00:00+00	888	361	46.9100	47.9200	46.7900	47.4400
56179	2019-12-27 12:25:00+00	288	266	0.0070	0.0070	0.0070	0.0070
56696	2019-12-28 00:00:00+00	888	361	45.3200	45.4100	45.0400	45.1100
56264	2019-12-27 14:10:00+00	288	266	0.0070	0.0070	0.0070	0.0070
44917	2019-12-15 00:00:00+00	263	355	6.4639	6.4735	6.4457	6.4600
51967	2019-12-24 00:00:00+00	888	361	47.5700	47.8400	47.1000	47.1800
29644	2019-11-26 00:00:00+00	921	361	53.0700	53.0700	53.0700	53.0700
30527	2019-11-27 00:00:00+00	914	361	1312.6200	1317.6400	1309.4742	1315.4200
26510	2019-11-22 00:00:00+00	921	361	52.4800	52.4800	52.4800	52.4800
44918	2019-12-15 00:00:00+00	361	288	109.3980	109.4500	109.2330	109.4100
44919	2019-12-15 00:00:00+00	266	361	1.3352	1.3355	1.3324	1.3324
39154	2019-12-09 00:00:00+00	888	361	53.6700	53.8700	53.6200	53.7000
44920	2019-12-15 00:00:00+00	361	355	5.8068	5.8145	5.7960	5.8072
44921	2019-12-15 00:00:00+00	355	263	0.1542	0.1543	0.1540	0.1543
47190	2019-12-17 00:00:00+00	361	288	109.5120	109.6340	109.4100	109.5790
47191	2019-12-17 00:00:00+00	266	361	1.3119	1.3301	1.3099	1.3268
47192	2019-12-17 00:00:00+00	361	355	5.8849	5.8892	5.8400	5.8494
20712	2019-11-17 00:00:00+00	888	361	61.5100	61.8700	61.3400	61.3800
47193	2019-12-17 00:00:00+00	355	263	0.1519	0.1530	0.1517	0.1530
55627	2019-12-27 01:15:00+00	266	355	7.7071	7.7128	7.7026	7.7127
33221	2019-12-02 00:00:00+00	455	355	42587.6207	42684.5452	42262.6214	42517.3863
55818	2019-12-27 05:10:00+00	266	355	7.7215	7.7234	7.6897	7.7127
26508	2019-11-23 00:00:00+00	888	361	50.4200	51.0400	50.0300	50.9500
26509	2019-11-23 00:00:00+00	455	355	41488.2946	41620.3907	40811.5305	41527.0321
55912	2019-12-27 07:00:00+00	266	355	7.7211	7.7271	7.6897	7.7127
32886	2019-12-01 00:00:00+00	888	361	53.5300	54.7700	53.3300	54.7700
56005	2019-12-27 08:55:00+00	266	355	7.7696	7.7743	7.6897	7.7127
41317	2019-12-10 00:00:00+00	263	288	120.6400	120.7600	120.0900	120.1440
41318	2019-12-10 00:00:00+00	263	361	1.1093	1.1098	1.1061	1.1064
56094	2019-12-27 10:40:00+00	288	266	0.0070	0.0070	0.0070	0.0070
39401	2019-12-06 00:00:00+00	921	361	53.1400	53.1400	53.1400	53.1400
56182	2019-12-27 12:25:00+00	355	263	0.1500	0.1514	0.1500	0.1513
25315	2019-11-21 00:00:00+00	914	361	1297.6300	1311.1200	1290.7500	1299.2500
44673	2019-12-14 00:00:00+00	266	361	1.3324	1.3324	1.3324	1.3324
56267	2019-12-27 14:10:00+00	355	263	0.1500	0.1514	0.1499	0.1513
26744	2019-11-24 00:00:00+00	361	355	5.7149	5.7267	5.7016	5.7120
56348	2019-12-27 10:49:44+00	917	361	217.1200	218.1100	216.1700	217.9900
56431	2019-12-27 17:25:00+00	266	355	7.7952	7.8136	7.6897	7.7127
56499	2019-12-27 18:35:00+00	266	355	7.8011	7.8136	7.6897	7.7127
38775	2019-12-06 00:00:00+00	266	361	1.3132	1.3165	1.3099	1.3158
50451	2019-12-20 00:00:00+00	914	361	1353.1900	1364.0000	1351.7150	1363.1000
56583	2019-12-27 20:20:00+00	266	355	7.7925	7.8136	7.6897	7.7127
56649	2019-12-27 21:35:00+00	266	355	7.7750	7.8136	7.6897	7.7127
25550	2019-11-22 00:00:00+00	888	361	54.8900	54.9200	54.1100	54.1100
56697	2019-12-27 00:00:00+00	921	361	51.4300	51.4300	51.4300	51.4300
32877	2019-11-29 00:00:00+00	263	355	6.3316	6.3511	6.3017	6.3414
32856	2019-11-29 00:00:00+00	266	361	1.2928	1.2942	1.2878	1.2912
50520	2019-12-20 00:00:00+00	361	288	109.4300	109.5260	109.2300	109.3880
55728	2019-12-27 03:15:00+00	355	263	0.1511	0.1514	0.1511	0.1513
56097	2019-12-27 10:45:00+00	355	263	0.1504	0.1514	0.1503	0.1513
32875	2019-11-29 00:00:00+00	355	263	0.1574	0.1578	0.1570	0.1572
20713	2019-11-17 00:00:00+00	455	355	48724.2171	48940.4401	48724.1022	48775.0559
56184	2019-12-27 12:35:00+00	266	355	7.8017	7.8065	7.6897	7.7127
56269	2019-12-27 14:15:00+00	266	355	7.8002	7.8080	7.6897	7.7127
34765	2019-12-02 00:00:00+00	545	361	148.6500	151.4200	146.7100	150.7200
34766	2019-12-01 00:00:00+00	545	361	150.7300	152.4900	145.7900	151.4300
34767	2019-11-30 00:00:00+00	545	361	151.3700	155.2500	149.7000	154.5400
34768	2019-11-29 00:00:00+00	545	361	154.5700	157.6000	150.2300	150.6900
34769	2019-11-28 00:00:00+00	545	361	150.7200	154.6300	149.0900	152.6100
34770	2019-11-27 00:00:00+00	545	361	152.6200	155.5400	140.8400	147.4700
34771	2019-11-26 00:00:00+00	545	361	147.4700	149.9700	143.3700	145.8100
34772	2019-11-25 00:00:00+00	545	361	145.6900	151.5000	131.4500	139.9900
34773	2019-11-24 00:00:00+00	545	361	139.9600	152.8600	138.6200	151.8400
34774	2019-11-23 00:00:00+00	545	361	151.8400	154.3300	146.1100	149.5500
34775	2019-11-22 00:00:00+00	545	361	149.5600	162.7900	138.0000	161.0200
34776	2019-11-21 00:00:00+00	545	361	161.0100	175.8500	157.2600	174.7500
34777	2019-11-20 00:00:00+00	545	361	174.7200	177.4100	173.5000	175.9300
34778	2019-11-19 00:00:00+00	545	361	175.9400	178.5200	172.6500	178.2000
34779	2019-11-18 00:00:00+00	545	361	178.2000	184.0600	175.0100	183.8200
34780	2019-11-17 00:00:00+00	545	361	183.8200	186.0900	180.0000	182.3700
34781	2019-11-16 00:00:00+00	545	361	182.3700	183.4600	179.3000	179.9900
34782	2019-11-15 00:00:00+00	545	361	180.0000	186.7000	177.6700	184.9300
34783	2019-11-14 00:00:00+00	545	361	184.9200	188.7200	183.3400	188.0700
34784	2019-11-13 00:00:00+00	545	361	188.1100	189.6600	185.3000	187.0900
34785	2019-11-12 00:00:00+00	545	361	187.0900	187.6500	182.4100	184.9800
34786	2019-11-11 00:00:00+00	545	361	184.9800	190.1900	184.0600	188.9600
34787	2019-11-10 00:00:00+00	545	361	188.9600	191.5800	183.3000	184.8600
34788	2019-11-09 00:00:00+00	545	361	184.8900	185.7900	182.6300	183.7100
26746	2019-11-24 00:00:00+00	355	263	0.1582	0.1584	0.1580	0.1583
26747	2019-11-24 00:00:00+00	266	355	7.3456	7.3636	7.3198	7.3300
26748	2019-11-24 00:00:00+00	361	288	108.7400	108.7530	108.5950	108.6200
26749	2019-11-24 00:00:00+00	263	355	6.3018	6.3138	6.2863	6.2973
26750	2019-11-24 00:00:00+00	266	361	1.2849	1.2864	1.2829	1.2829
56349	2019-12-27 15:50:00+00	266	355	7.8067	7.8136	7.6897	7.7127
34789	2019-11-08 00:00:00+00	545	361	183.7400	188.2600	181.4100	186.6700
34790	2019-11-07 00:00:00+00	545	361	186.6800	192.2700	184.5900	191.1600
34791	2019-11-06 00:00:00+00	545	361	191.1600	195.0900	187.7200	188.6500
34792	2019-11-05 00:00:00+00	545	361	188.6800	192.5100	182.2200	185.7100
34793	2019-11-04 00:00:00+00	545	361	185.7100	188.6400	180.3600	181.5300
34794	2019-11-03 00:00:00+00	545	361	181.5400	184.7000	178.9500	182.9000
34795	2019-11-02 00:00:00+00	545	361	182.9100	186.0000	181.5300	182.8600
34796	2019-11-01 00:00:00+00	545	361	182.8500	184.5000	177.0200	182.1900
34797	2019-10-31 00:00:00+00	545	361	182.1800	185.2700	177.6600	183.1400
34798	2019-10-30 00:00:00+00	545	361	183.1300	191.7100	179.2800	190.4500
34799	2019-10-29 00:00:00+00	545	361	190.4600	192.7400	181.2600	181.6700
34800	2019-10-28 00:00:00+00	545	361	181.7200	189.4800	180.3500	183.8400
34801	2019-10-27 00:00:00+00	545	361	183.7500	188.7000	176.2200	179.4200
34802	2019-10-26 00:00:00+00	545	361	179.4900	197.7400	173.8000	181.5300
34803	2019-10-25 00:00:00+00	545	361	181.5000	187.7800	160.2500	160.3900
34804	2019-10-24 00:00:00+00	545	361	160.3800	163.7200	158.7200	162.3500
34805	2019-10-23 00:00:00+00	545	361	162.3500	171.4900	153.4500	171.1900
34806	2019-10-22 00:00:00+00	545	361	171.2000	175.0400	170.3000	174.0000
34807	2019-10-21 00:00:00+00	545	361	173.9800	177.9000	171.5900	175.1800
34808	2019-10-20 00:00:00+00	545	361	175.2200	176.8800	169.2100	171.8400
34809	2019-10-19 00:00:00+00	545	361	171.7900	174.9800	169.4400	172.7800
34810	2019-10-18 00:00:00+00	545	361	172.7400	177.4400	168.6600	177.1700
34811	2019-10-17 00:00:00+00	545	361	177.1600	178.9600	172.6100	174.5200
34812	2019-10-16 00:00:00+00	545	361	174.4700	181.4400	171.8100	180.5200
34813	2019-10-15 00:00:00+00	545	361	180.4900	188.3700	175.9600	186.7000
34814	2019-10-14 00:00:00+00	545	361	186.7200	187.5400	180.4300	180.9800
34815	2019-10-13 00:00:00+00	545	361	180.9900	184.9500	178.5200	179.6500
34816	2019-10-12 00:00:00+00	545	361	179.6800	184.6400	177.5900	180.6500
16735	2019-11-11 00:00:00+00	263	288	120.3050	120.4220	120.0400	120.3730
16736	2019-11-10 00:00:00+00	263	288	120.3680	120.4200	120.1900	120.3400
34817	2019-10-11 00:00:00+00	545	361	180.7200	196.6500	179.4100	191.1800
56503	2019-12-27 18:40:00+00	288	266	0.0070	0.0070	0.0070	0.0070
26751	2019-11-24 00:00:00+00	263	288	119.8460	119.8670	119.6300	119.7500
26753	2019-11-24 00:00:00+00	263	361	1.1022	1.1025	1.1012	1.1022
32862	2019-11-29 00:00:00+00	361	288	109.4800	109.6700	109.3700	109.5200
26512	2019-11-24 00:00:00+00	888	361	50.9800	51.8600	50.8700	51.5600
45621	2019-12-13 00:00:00+00	921	361	53.5200	53.5200	53.5200	53.5200
54464	2019-12-26 00:00:00+00	455	355	42798.4533	42879.5206	42671.7150	42790.5544
16413	2019-11-12 00:00:00+00	455	355	50559.6364	50661.0941	50289.8328	50401.9672
55730	2019-12-27 03:20:00+00	266	355	7.7032	7.7128	7.6897	7.7127
55822	2019-12-27 05:10:00+00	288	266	0.0070	0.0070	0.0070	0.0070
26847	2019-11-25 00:00:00+00	455	355	38382.3650	39686.9729	37819.2780	39449.9950
34818	2019-10-10 00:00:00+00	545	361	191.1400	194.2000	186.8800	192.6100
34819	2019-10-09 00:00:00+00	545	361	192.6200	195.5300	178.9600	180.6100
34820	2019-10-08 00:00:00+00	545	361	180.6000	184.8700	177.0000	179.8800
34821	2019-10-07 00:00:00+00	545	361	179.8500	182.3200	168.6800	170.0800
34822	2019-10-06 00:00:00+00	545	361	170.1000	177.0400	167.6800	176.2300
34823	2019-10-05 00:00:00+00	545	361	176.2500	176.7100	172.0200	175.5500
34824	2019-10-04 00:00:00+00	545	361	175.5500	178.9800	170.7400	174.7100
34825	2019-10-03 00:00:00+00	545	361	174.6900	180.7200	169.5500	180.2400
34826	2019-10-02 00:00:00+00	545	361	180.2400	181.2900	173.6500	175.6500
34827	2019-10-01 00:00:00+00	545	361	175.6600	185.5300	173.1900	180.8900
55918	2019-12-27 07:05:00+00	355	263	0.1509	0.1514	0.1507	0.1513
56009	2019-12-27 09:00:00+00	288	266	0.0070	0.0070	0.0070	0.0070
30765	2019-11-28 00:00:00+00	888	361	55.4000	56.0900	55.3800	55.7300
56099	2019-12-27 10:50:00+00	266	355	7.7709	7.7768	7.6897	7.7127
56352	2019-12-27 15:50:00+00	288	266	0.0070	0.0070	0.0070	0.0070
56437	2019-12-27 17:30:00+00	355	263	0.1496	0.1514	0.1496	0.1513
38778	2019-12-06 00:00:00+00	263	361	1.1056	1.1110	1.1038	1.1104
56506	2019-12-27 18:40:00+00	355	263	0.1496	0.1514	0.1496	0.1513
56589	2019-12-27 20:20:00+00	355	263	0.1496	0.1514	0.1495	0.1513
43428	2019-12-12 00:00:00+00	917	361	204.9800	206.0000	202.0000	203.7100
43663	2019-12-13 00:00:00+00	545	361	144.6600	145.2800	144.2400	144.8700
27689	2019-11-25 00:00:00+00	914	361	1304.7000	1310.4100	1295.6100	1296.2600
44997	2019-12-16 00:00:00+00	545	361	142.0500	142.7200	141.8000	142.4600
44674	2019-12-13 23:30:00+00	266	361	1.3324	1.3324	1.3324	1.3324
48407	2019-12-19 00:00:00+00	545	361	127.8700	134.0000	126.5000	132.8000
32878	2019-11-29 00:00:00+00	263	288	120.6200	120.7620	120.3800	120.5960
40900	2019-12-09 00:00:00+00	921	361	52.9300	52.9300	52.9300	52.9300
26513	2019-11-24 00:00:00+00	455	355	41351.2277	41882.1833	41262.8970	41771.9698
42524	2019-12-12 00:00:00+00	455	355	41371.0017	42321.2130	41267.5627	41828.0940
34764	2019-12-03 00:00:00+00	545	361	148.6600	149.9300	148.4200	148.6600
50528	2019-12-20 00:00:00+00	266	355	7.7170	7.7668	7.6947	7.7323
55825	2019-12-27 05:10:00+00	355	263	0.1509	0.1514	0.1509	0.1513
16412	2019-11-12 00:00:00+00	888	361	61.8500	61.9800	61.6400	61.7100
55920	2019-12-27 07:10:00+00	266	355	7.7280	7.7288	7.6897	7.7127
56012	2019-12-27 09:00:00+00	355	263	0.1505	0.1514	0.1505	0.1513
56190	2019-12-27 12:35:00+00	355	263	0.1500	0.1514	0.1500	0.1513
56275	2019-12-27 14:20:00+00	355	263	0.1499	0.1514	0.1499	0.1513
56356	2019-12-27 15:55:00+00	355	263	0.1497	0.1514	0.1496	0.1513
56439	2019-12-27 17:35:00+00	266	355	7.7972	7.8136	7.6897	7.7127
56508	2019-12-27 18:45:00+00	266	355	7.8008	7.8136	7.6897	7.7127
43429	2019-12-12 00:00:00+00	914	361	1346.9300	1354.5800	1338.2001	1343.2100
56591	2019-12-27 20:20:00+00	288	266	0.0070	0.0070	0.0070	0.0070
32765	2019-11-29 00:00:00+00	914	361	1304.0900	1309.9500	1303.2300	1306.6000
55633	2019-12-27 00:00:00+00	266	355	7.7803	7.8136	7.6897	7.7155
35458	2019-12-03 00:00:00+00	263	355	6.3634	6.3925	6.3467	6.3611
35459	2019-12-03 00:00:00+00	266	361	1.3000	1.3012	1.2928	1.2939
56654	2019-12-27 00:00:00+00	914	361	1354.6400	1367.0700	1353.0000	1364.0000
35460	2019-12-03 00:00:00+00	263	288	120.3980	120.9600	120.2200	120.7550
35461	2019-12-03 00:00:00+00	361	355	5.7417	5.7660	5.7260	5.7416
35462	2019-12-03 00:00:00+00	263	361	1.1082	1.1094	1.1065	1.1076
48143	2019-12-18 00:00:00+00	914	361	1352.0900	1359.4300	1350.4600	1357.0000
56699	2019-12-29 00:00:00+00	545	361	127.7300	128.1600	127.5200	128.1100
44675	2019-12-14 00:00:00+00	545	361	144.8200	144.9000	144.5800	144.8000
38781	2019-12-06 00:00:00+00	361	288	108.5500	108.9230	108.4050	108.7280
50534	2019-12-21 00:00:00+00	361	355	5.9356	5.9356	5.9356	5.9356
49561	2019-12-19 00:00:00+00	921	361	54.5600	54.5600	54.5600	54.5600
32866	2019-11-29 00:00:00+00	263	361	1.1017	1.1028	1.0980	1.1011
55736	2019-12-27 03:25:00+00	355	263	0.1511	0.1514	0.1510	0.1513
17471	2019-11-13 00:00:00+00	888	361	61.9300	62.3800	61.7900	62.2800
44676	2019-12-14 00:00:00+00	455	355	42163.1736	42243.1663	42012.6572	42159.5138
55827	2019-12-27 05:20:00+00	266	355	7.7184	7.7271	7.6897	7.7127
42528	2019-12-12 00:00:00+00	545	361	141.7200	144.1100	141.2600	143.4100
56014	2019-12-27 09:05:00+00	266	355	7.7694	7.7743	7.6897	7.7127
53203	2019-12-24 00:00:00+00	917	361	214.2600	215.4300	213.3500	215.0100
53185	2019-12-24 00:00:00+00	914	361	1344.4300	1352.0100	1344.1650	1350.2100
56105	2019-12-27 10:55:00+00	355	263	0.1503	0.1514	0.1503	0.1513
56192	2019-12-27 12:45:00+00	266	355	7.8004	7.8065	7.6897	7.7127
56277	2019-12-27 14:25:00+00	266	355	7.7958	7.8080	7.6897	7.7127
35463	2019-12-03 00:00:00+00	355	263	0.1566	0.1570	0.1561	0.1568
35464	2019-12-03 00:00:00+00	266	355	7.4658	7.4944	7.4209	7.4283
56358	2019-12-27 16:00:00+00	266	355	7.7988	7.8136	7.6897	7.7127
56442	2019-12-27 17:40:00+00	288	266	0.0070	0.0070	0.0070	0.0070
56512	2019-12-27 13:53:32+00	917	361	215.4600	218.1100	215.1700	217.9900
37833	2019-12-06 00:00:00+00	545	361	147.4700	148.3700	146.9100	148.1100
56592	2019-12-27 15:31:44+00	917	361	216.0299	218.1100	215.1700	217.9900
56656	2019-12-27 21:40:00+00	355	263	0.1498	0.1514	0.1495	0.1513
46770	2019-12-16 00:00:00+00	921	361	54.0200	54.0200	54.0200	54.0200
40285	2019-12-10 00:00:00+00	455	355	42838.1978	43030.0076	42463.1171	42629.4259
22174	2019-11-19 00:00:00+00	888	361	58.7900	58.7900	58.2100	58.4100
35465	2019-12-03 00:00:00+00	361	288	108.6410	109.2070	108.4500	109.0230
34253	2019-12-02 00:00:00+00	263	355	6.3595	6.3710	6.3150	6.3349
34254	2019-12-02 00:00:00+00	266	361	1.2938	1.2949	1.2894	1.2912
34255	2019-12-02 00:00:00+00	263	288	120.7520	121.0160	120.4900	120.6810
56700	2019-12-29 00:00:00+00	455	355	43445.8377	43547.8601	43380.3624	43543.2173
44653	2019-12-13 00:00:00+00	355	263	0.1543	0.1546	0.1535	0.1544
44652	2019-12-13 00:00:00+00	361	355	5.8072	5.8264	5.7639	5.7725
30538	2019-11-27 00:00:00+00	917	361	199.9800	200.9800	197.0000	197.2400
32865	2019-11-29 00:00:00+00	361	355	5.7470	5.7667	5.7310	5.7564
32880	2019-11-30 00:00:00+00	455	355	44567.7221	44661.1830	44400.4583	44494.4364
17474	2019-11-12 00:00:00+00	921	361	51.8600	51.8600	51.8600	51.8600
27986	2019-11-26 00:00:00+00	455	355	41201.6626	41284.5828	40489.6624	40828.4066
55639	2019-12-27 01:30:00+00	355	263	0.1512	0.1514	0.1512	0.1513
17473	2019-11-13 00:00:00+00	455	355	50596.9871	51047.0908	50559.9354	50913.8892
55738	2019-12-27 03:25:00+00	288	266	0.0070	0.0070	0.0070	0.0070
55924	2019-12-27 07:15:00+00	288	266	0.0070	0.0070	0.0070	0.0070
56107	2019-12-27 11:00:00+00	266	355	7.7802	7.7822	7.6897	7.7127
28256	2019-11-01 00:00:00+00	917	361	176.4600	182.1200	176.0600	179.0100
28257	2019-10-31 00:00:00+00	917	361	176.6700	179.2400	175.5000	179.1600
28258	2019-10-30 00:00:00+00	917	361	177.5300	177.8800	173.9359	175.4200
28259	2019-10-29 00:00:00+00	917	361	176.8900	177.7400	175.4400	177.0600
28241	2019-11-22 00:00:00+00	917	361	186.7800	186.7800	183.9350	185.8000
28242	2019-11-21 00:00:00+00	917	361	184.8600	184.8900	181.6000	181.7700
28243	2019-11-20 00:00:00+00	917	361	182.3500	183.7000	181.0600	183.6700
28244	2019-11-19 00:00:00+00	917	361	185.2500	186.7100	183.8700	186.3100
28245	2019-11-18 00:00:00+00	917	361	184.6100	186.9800	184.1600	186.9800
28246	2019-11-15 00:00:00+00	917	361	185.4900	185.6000	183.7100	184.0000
28247	2019-11-14 00:00:00+00	917	361	182.8000	184.5000	181.3212	182.8700
28248	2019-11-13 00:00:00+00	917	361	182.4800	185.6740	181.0000	185.4700
28249	2019-11-12 00:00:00+00	917	361	186.9700	187.6500	185.1400	185.9100
28250	2019-11-11 00:00:00+00	917	361	186.7100	187.2000	181.3700	184.8200
28251	2019-11-08 00:00:00+00	917	361	187.1600	188.2800	185.1500	187.9016
28252	2019-11-07 00:00:00+00	917	361	186.6600	188.0700	184.6900	187.0700
28253	2019-11-06 00:00:00+00	917	361	184.1600	185.0000	182.2000	183.6100
28254	2019-11-05 00:00:00+00	917	361	182.0000	183.2000	180.3100	181.4200
28255	2019-11-04 00:00:00+00	917	361	179.6900	182.4000	178.0200	180.6600
28260	2019-10-28 00:00:00+00	917	361	178.6800	179.6400	176.4100	176.5000
28261	2019-10-25 00:00:00+00	917	361	174.3100	175.8100	170.8800	171.5600
28262	2019-10-24 00:00:00+00	917	361	172.5500	172.7500	170.2100	171.2800
28263	2019-10-23 00:00:00+00	917	361	169.9200	171.0400	168.1200	170.4500
28264	2019-10-22 00:00:00+00	917	361	169.8900	175.3602	169.2600	174.5300
28265	2019-10-21 00:00:00+00	917	361	173.5200	173.9100	170.8700	172.6400
28266	2019-10-18 00:00:00+00	917	361	169.1300	176.2300	169.0000	176.0000
28267	2019-10-17 00:00:00+00	917	361	176.8500	178.5900	175.2300	178.0000
28268	2019-10-16 00:00:00+00	917	361	177.1200	177.3500	174.1200	175.8000
28269	2019-10-15 00:00:00+00	917	361	175.2900	176.7500	172.6900	172.9100
28270	2019-10-14 00:00:00+00	917	361	171.1600	173.3400	170.7900	172.8400
28271	2019-10-11 00:00:00+00	917	361	172.9400	174.8800	169.5700	170.7700
28272	2019-10-10 00:00:00+00	917	361	166.0700	168.5700	164.0900	165.9600
28273	2019-10-09 00:00:00+00	917	361	165.1900	166.5800	163.4200	165.5000
28274	2019-10-08 00:00:00+00	917	361	161.9300	165.2200	161.6800	164.3000
28275	2019-10-07 00:00:00+00	917	361	168.3200	172.3000	167.2100	168.8300
28276	2019-10-04 00:00:00+00	917	361	170.3400	170.7000	167.5600	169.6000
28277	2019-10-03 00:00:00+00	917	361	169.4800	170.1800	165.0000	166.6500
28278	2019-10-02 00:00:00+00	917	361	165.7700	166.8800	161.9000	162.8200
28279	2019-10-01 00:00:00+00	917	361	165.1500	168.2300	163.6400	168.0100
28280	2019-09-30 00:00:00+00	917	361	167.2300	170.2000	166.4500	169.8865
28281	2019-09-27 00:00:00+00	917	361	165.9800	176.5000	163.1500	176.0000
28282	2019-09-26 00:00:00+00	917	361	175.0000	178.2300	174.8300	177.0000
28283	2019-09-25 00:00:00+00	917	361	176.6600	176.9900	171.7200	172.3000
28284	2019-09-24 00:00:00+00	917	361	171.5500	179.4900	171.3000	179.1700
28285	2019-09-23 00:00:00+00	917	361	176.9800	181.3300	176.8000	181.2500
28286	2019-09-20 00:00:00+00	917	361	182.5100	183.8200	178.8400	182.3100
28287	2019-09-19 00:00:00+00	917	361	180.4600	184.1300	180.4300	180.9000
28288	2019-09-18 00:00:00+00	917	361	180.0000	180.1700	177.5800	179.1500
28289	2019-09-17 00:00:00+00	917	361	179.0000	179.1200	176.0500	176.8500
28290	2019-09-16 00:00:00+00	917	361	177.0700	179.1700	175.3700	177.7500
28291	2019-09-13 00:00:00+00	917	361	179.1700	180.1800	178.6100	179.7400
28292	2019-09-12 00:00:00+00	917	361	178.2400	180.5000	177.0000	177.8900
28293	2019-09-11 00:00:00+00	917	361	176.0900	176.6600	174.1500	176.0000
28294	2019-09-10 00:00:00+00	917	361	174.9900	176.3000	172.2200	176.2800
28295	2019-09-09 00:00:00+00	917	361	177.7800	177.9900	175.8600	177.8800
28296	2019-09-06 00:00:00+00	917	361	176.6900	179.2200	176.2100	179.0100
28297	2019-09-05 00:00:00+00	917	361	178.9400	178.9500	176.5200	176.8800
28298	2019-09-04 00:00:00+00	917	361	174.3300	176.5500	173.9900	176.2600
28299	2019-09-03 00:00:00+00	917	361	172.4100	174.7200	172.1500	173.0000
28300	2019-08-30 00:00:00+00	917	361	175.0300	175.2500	172.6600	174.3500
28301	2019-08-29 00:00:00+00	917	361	172.8100	173.9600	170.9500	171.0000
28302	2019-08-28 00:00:00+00	917	361	167.4800	168.0000	164.2000	164.6400
28303	2019-08-27 00:00:00+00	917	361	166.2000	168.1900	165.1900	167.2000
28304	2019-08-26 00:00:00+00	917	361	165.9000	167.4500	165.5300	166.4900
28305	2019-08-23 00:00:00+00	917	361	164.5400	171.4900	163.8310	169.6900
28306	2019-08-22 00:00:00+00	917	361	171.9100	174.9796	170.5000	174.1000
28307	2019-08-21 00:00:00+00	917	361	175.2400	178.5000	174.8900	177.2200
28308	2019-08-20 00:00:00+00	917	361	177.2100	177.9900	175.6200	175.9100
28309	2019-08-19 00:00:00+00	917	361	178.2800	178.8000	175.5900	177.4300
28310	2019-08-16 00:00:00+00	917	361	174.6000	177.5500	168.5700	170.0000
55641	2019-12-27 01:35:00+00	266	355	7.7054	7.7128	7.7024	7.7127
55739	2019-12-27 03:30:00+00	266	355	7.7046	7.7128	7.6897	7.7127
55833	2019-12-27 05:20:00+00	355	263	0.1509	0.1514	0.1507	0.1513
55927	2019-12-27 07:15:00+00	355	263	0.1508	0.1514	0.1507	0.1513
25454	2019-11-21 00:00:00+00	263	355	6.3038	6.3315	6.2942	6.3169
25455	2019-11-21 00:00:00+00	266	361	1.2917	1.2970	1.2891	1.2926
25456	2019-11-21 00:00:00+00	263	288	120.1460	120.5780	119.9100	120.1650
25457	2019-11-21 00:00:00+00	263	361	1.1065	1.1097	1.1051	1.1078
28311	2019-08-15 00:00:00+00	917	361	166.9700	171.0000	164.3600	170.1100
28312	2019-08-14 00:00:00+00	917	361	162.0600	163.0000	159.2100	161.3400
28313	2019-08-13 00:00:00+00	917	361	164.0300	167.3600	159.5700	160.6400
28314	2019-08-12 00:00:00+00	917	361	159.3100	159.3600	155.5400	157.5000
28315	2019-08-09 00:00:00+00	917	361	159.1200	161.9900	159.1100	160.9800
28316	2019-08-08 00:00:00+00	917	361	162.2200	162.3000	159.1200	161.7100
28317	2019-08-07 00:00:00+00	917	361	159.1700	159.4800	155.3000	155.7300
28318	2019-08-06 00:00:00+00	917	361	157.4300	158.7300	156.1100	158.4800
28319	2019-08-05 00:00:00+00	917	361	153.6700	157.2300	151.8500	155.0300
28320	2019-08-02 00:00:00+00	917	361	161.0000	163.8500	160.3500	162.5600
28321	2019-08-01 00:00:00+00	917	361	165.6500	175.7145	162.1000	174.5400
28322	2019-07-31 00:00:00+00	917	361	173.1100	174.8900	170.0900	173.7100
28323	2019-07-30 00:00:00+00	917	361	174.1000	175.7100	172.8900	174.2500
28324	2019-07-29 00:00:00+00	917	361	177.0200	179.8800	175.3500	178.4300
28325	2019-07-26 00:00:00+00	917	361	178.7400	179.4000	176.8800	178.2500
28326	2019-07-25 00:00:00+00	917	361	177.2900	179.1500	175.3690	178.4900
28327	2019-07-24 00:00:00+00	917	361	178.6700	178.9600	176.9382	178.0000
28328	2019-07-23 00:00:00+00	917	361	178.0900	178.6400	174.8450	175.3900
28329	2019-07-22 00:00:00+00	917	361	174.0000	174.2800	171.4373	173.5000
28330	2019-07-19 00:00:00+00	917	361	172.9900	175.1500	172.9900	174.8700
28331	2019-07-18 00:00:00+00	917	361	172.8000	174.4000	172.0600	173.4100
28332	2019-07-17 00:00:00+00	917	361	174.8200	176.2200	172.4900	172.7500
28333	2019-07-16 00:00:00+00	917	361	174.1900	175.5200	173.4600	174.2000
28334	2019-07-15 00:00:00+00	917	361	173.5000	173.7500	170.4200	171.5000
28335	2019-07-12 00:00:00+00	917	361	169.0700	170.2000	167.6500	168.0000
28336	2019-07-11 00:00:00+00	917	361	166.5500	168.4240	165.0000	167.5600
28337	2019-07-10 00:00:00+00	917	361	166.9300	171.3700	166.8600	171.2400
28338	2019-07-09 00:00:00+00	917	361	168.8000	168.9800	166.5000	167.0850
28339	2019-07-08 00:00:00+00	917	361	168.4500	170.2800	168.3500	170.0900
28340	2019-07-05 00:00:00+00	917	361	173.3000	173.8200	172.8200	173.7500
28341	2019-07-03 00:00:00+00	917	361	174.6700	175.8500	173.8500	175.6900
28342	2019-07-02 00:00:00+00	917	361	175.4500	175.5500	174.2500	175.1300
28343	2019-07-01 00:00:00+00	917	361	175.0500	177.9500	174.3600	175.8650
28344	2019-06-28 00:00:00+00	917	361	169.4500	170.8900	167.9600	170.2000
28345	2019-06-27 00:00:00+00	917	361	170.9000	171.9800	169.3800	170.6200
28346	2019-06-26 00:00:00+00	917	361	168.9900	171.2400	168.1500	168.2800
28347	2019-06-25 00:00:00+00	917	361	165.8000	167.3400	164.6200	167.0400
28348	2019-06-24 00:00:00+00	917	361	168.1000	168.8800	165.7800	168.4000
28349	2019-06-21 00:00:00+00	917	361	167.5500	169.4710	166.7700	167.4800
28350	2019-06-20 00:00:00+00	917	361	168.2500	170.4800	166.2750	170.1900
28351	2019-06-19 00:00:00+00	917	361	165.4600	167.9000	163.4200	167.7700
28352	2019-06-18 00:00:00+00	917	361	165.5100	169.1100	161.9500	162.8900
28353	2019-06-17 00:00:00+00	917	361	159.9100	160.5500	157.4200	157.5300
28354	2019-06-14 00:00:00+00	917	361	158.1000	158.7100	157.2300	158.3700
28355	2019-06-13 00:00:00+00	917	361	160.3300	161.3200	159.8000	160.5500
28356	2019-06-12 00:00:00+00	917	361	160.0400	161.7000	158.8100	160.4700
28357	2019-06-11 00:00:00+00	917	361	162.6500	165.6800	161.9245	164.2000
28358	2019-06-10 00:00:00+00	917	361	159.8500	161.9800	157.4000	158.7800
28359	2019-06-07 00:00:00+00	917	361	154.2300	155.6900	152.2135	152.9500
28360	2019-06-06 00:00:00+00	917	361	151.5000	152.7000	150.5700	152.0000
28361	2019-06-05 00:00:00+00	917	361	151.6500	156.1100	149.3100	155.1700
28362	2019-06-04 00:00:00+00	917	361	154.1500	155.2000	150.6400	151.5600
28363	2019-06-03 00:00:00+00	917	361	149.9100	151.7700	148.8450	149.6000
28364	2019-05-31 00:00:00+00	917	361	149.2600	150.6800	147.9500	149.6300
28365	2019-05-30 00:00:00+00	917	361	151.0700	153.3700	150.2500	152.3600
28366	2019-05-29 00:00:00+00	917	361	152.4800	154.3850	150.7100	153.5800
28367	2019-05-28 00:00:00+00	917	361	154.8100	157.0700	153.2200	156.4000
28368	2019-05-24 00:00:00+00	917	361	155.0000	158.4300	154.9000	157.6150
28369	2019-05-23 00:00:00+00	917	361	156.0000	158.4795	154.4100	155.4500
28370	2019-05-22 00:00:00+00	917	361	158.8300	162.8200	158.0700	162.4100
28371	2019-05-21 00:00:00+00	917	361	163.4300	165.5896	162.5200	163.1600
28372	2019-05-20 00:00:00+00	917	361	160.6500	164.5700	160.0200	164.4400
28373	2019-05-17 00:00:00+00	917	361	169.5700	172.2900	168.4900	171.6900
28374	2019-05-16 00:00:00+00	917	361	175.5700	178.2500	174.7500	178.1800
28375	2019-05-15 00:00:00+00	917	361	177.6000	180.2400	173.3212	177.0600
28376	2019-05-14 00:00:00+00	917	361	174.8400	175.1500	171.4800	172.7500
28377	2019-05-13 00:00:00+00	917	361	170.0100	172.4700	168.7800	169.7900
22184	2019-11-18 00:00:00+00	921	361	52.5000	52.5000	52.5000	52.5000
17205	2019-11-12 00:00:00+00	914	361	1295.1095	1309.3500	1294.3600	1298.5700
24411	2019-11-21 00:00:00+00	888	361	58.0200	58.1100	57.6000	57.8700
55835	2019-12-27 05:30:00+00	266	355	7.7187	7.7271	7.6897	7.7127
55929	2019-12-27 07:20:00+00	266	355	7.7240	7.7293	7.6897	7.7127
22183	2019-11-19 00:00:00+00	455	355	47110.8645	47163.4301	46907.7181	46979.0489
27864	2019-11-25 00:00:00+00	263	288	119.9930	120.1160	119.7600	119.8400
27865	2019-11-25 00:00:00+00	361	355	5.7390	5.7538	5.6950	5.7157
27866	2019-11-25 00:00:00+00	263	361	1.1010	1.1032	1.1002	1.1023
25458	2019-11-21 00:00:00+00	355	263	0.1581	0.1583	0.1576	0.1579
28378	2019-05-10 00:00:00+00	917	361	178.0000	180.7900	174.1000	180.1800
28379	2019-05-09 00:00:00+00	917	361	179.0400	180.6950	173.0700	175.4300
28380	2019-05-08 00:00:00+00	917	361	179.5900	183.2000	178.5800	180.9500
28381	2019-05-07 00:00:00+00	917	361	181.4300	186.4500	179.6300	186.0500
28382	2019-05-06 00:00:00+00	917	361	188.2400	189.0000	184.8300	185.1700
28383	2019-05-03 00:00:00+00	917	361	195.2100	195.7200	191.8800	191.8800
28384	2019-05-02 00:00:00+00	917	361	190.3900	192.7000	186.6500	189.4200
28385	2019-05-01 00:00:00+00	917	361	189.3100	193.1950	185.8800	186.7500
28386	2019-04-30 00:00:00+00	917	361	185.5700	188.2500	183.8200	186.3000
28387	2019-04-29 00:00:00+00	917	361	186.9400	188.0000	185.7600	187.4200
28388	2019-04-26 00:00:00+00	917	361	187.0900	188.7400	185.5100	187.8800
28389	2019-04-25 00:00:00+00	917	361	187.8800	188.1300	183.9550	185.2400
28390	2019-04-24 00:00:00+00	917	361	185.6700	186.9000	184.5800	186.7600
28391	2019-04-23 00:00:00+00	917	361	187.2900	188.1500	185.4400	186.0000
28392	2019-04-22 00:00:00+00	917	361	185.3800	186.4700	183.6100	184.5000
28393	2019-04-18 00:00:00+00	917	361	186.9400	187.2800	185.3900	186.4100
28394	2019-04-17 00:00:00+00	917	361	187.5500	188.2000	185.7800	187.3400
28395	2019-04-16 00:00:00+00	917	361	185.7800	185.7900	183.4000	185.5500
28396	2019-04-15 00:00:00+00	917	361	183.0700	188.1700	182.5600	188.0600
28397	2019-04-12 00:00:00+00	917	361	188.9100	189.7900	187.1400	187.7100
28398	2019-04-11 00:00:00+00	917	361	184.9800	186.0600	183.7500	185.1500
28399	2019-04-10 00:00:00+00	917	361	186.1900	187.4000	184.0000	186.6900
28400	2019-04-09 00:00:00+00	917	361	187.1900	187.8900	186.1600	186.4900
28401	2019-04-08 00:00:00+00	917	361	186.5000	187.8200	184.0100	184.1900
28402	2019-04-05 00:00:00+00	917	361	185.3500	185.5000	182.0000	182.5100
28403	2019-04-04 00:00:00+00	917	361	181.0700	181.9600	176.8900	177.0400
28404	2019-04-03 00:00:00+00	917	361	178.3200	180.7000	176.7600	179.5100
28405	2019-04-02 00:00:00+00	917	361	181.7400	183.5627	180.9500	181.4600
28406	2019-04-01 00:00:00+00	917	361	180.8900	185.5600	180.8900	185.0900
28407	2019-03-29 00:00:00+00	917	361	182.4500	182.6000	179.0000	180.7300
28408	2019-03-28 00:00:00+00	917	361	177.7300	178.5300	175.9700	177.4700
28409	2019-03-27 00:00:00+00	917	361	177.0300	179.8300	176.9125	177.7000
28410	2019-03-26 00:00:00+00	917	361	178.0800	180.6500	177.0950	179.7000
28411	2019-03-25 00:00:00+00	917	361	178.7700	178.9000	174.1000	174.3300
28412	2019-03-22 00:00:00+00	917	361	176.2600	180.4800	175.3362	179.7700
28413	2019-03-21 00:00:00+00	917	361	181.5000	181.7300	178.5200	178.9500
28414	2019-03-20 00:00:00+00	917	361	181.2800	181.9500	178.4300	180.9400
28415	2019-03-19 00:00:00+00	917	361	182.1400	183.3600	180.8500	181.6300
28416	2019-03-18 00:00:00+00	917	361	181.8300	182.8900	180.7600	181.9300
28417	2019-03-15 00:00:00+00	917	361	180.9700	181.4500	179.6600	180.6600
28418	2019-03-14 00:00:00+00	917	361	180.3600	180.8200	178.0100	179.0600
28419	2019-03-13 00:00:00+00	917	361	180.7000	182.5350	179.2600	180.7300
28420	2019-03-12 00:00:00+00	917	361	180.6300	182.1800	179.5100	182.0400
28421	2019-03-11 00:00:00+00	917	361	180.4100	181.7200	177.5800	177.8300
28422	2019-03-08 00:00:00+00	917	361	175.0300	175.3500	171.5650	171.5650
28423	2019-03-07 00:00:00+00	917	361	177.3200	181.8000	176.7300	180.9100
28424	2019-03-06 00:00:00+00	917	361	184.1700	185.5900	183.0200	184.3800
28425	2019-03-05 00:00:00+00	917	361	185.0000	188.0800	185.0000	186.9400
28426	2019-03-04 00:00:00+00	917	361	187.2500	187.3400	184.4600	186.0000
28427	2019-03-01 00:00:00+00	917	361	183.8800	186.9000	183.3800	185.0900
28428	2019-02-28 00:00:00+00	917	361	183.0300	184.3000	181.4700	183.0100
28429	2019-02-27 00:00:00+00	917	361	184.5800	184.9300	180.8800	181.7200
28430	2019-02-26 00:00:00+00	917	361	183.5400	184.3500	179.3700	179.7900
28431	2019-02-25 00:00:00+00	917	361	183.2500	183.7200	180.7300	181.2600
28432	2019-02-22 00:00:00+00	917	361	176.9200	177.0200	172.5200	172.8000
28433	2019-02-21 00:00:00+00	917	361	171.6600	171.7800	169.8000	171.0000
28434	2019-02-20 00:00:00+00	917	361	170.7100	172.6800	170.6100	171.0000
28435	2019-02-19 00:00:00+00	917	361	170.1800	171.1500	166.5000	166.9800
28436	2019-02-15 00:00:00+00	917	361	166.1500	168.7700	165.4100	168.6100
28437	2019-02-14 00:00:00+00	917	361	168.3800	168.5000	166.6100	167.6400
28438	2019-02-13 00:00:00+00	917	361	169.4000	171.0500	168.9900	169.9100
28439	2019-02-12 00:00:00+00	917	361	168.7100	170.4900	168.6100	169.6000
28440	2019-02-11 00:00:00+00	917	361	167.4500	170.3300	167.4500	168.8500
28441	2019-02-08 00:00:00+00	917	361	167.3600	167.6500	163.7500	163.8300
28442	2019-02-07 00:00:00+00	917	361	166.9600	169.6100	164.3360	169.1600
28443	2019-02-06 00:00:00+00	917	361	171.5200	173.0900	169.9900	171.8600
28444	2019-02-05 00:00:00+00	917	361	171.8300	171.9500	168.0000	168.5500
28445	2019-02-04 00:00:00+00	917	361	166.7000	167.5500	165.6100	166.3200
28446	2019-02-01 00:00:00+00	917	361	167.9700	169.4000	167.6300	168.0000
17331	2019-11-12 00:00:00+00	263	361	1.1013	1.1039	1.1001	1.1035
17332	2019-11-12 00:00:00+00	263	355	6.3679	6.3811	6.3471	6.3693
50861	2019-12-23 00:00:00+00	455	355	45077.7211	45355.3346	44558.1387	44560.2180
55649	2019-12-27 01:45:00+00	355	263	0.1512	0.1514	0.1512	0.1513
55745	2019-12-27 03:35:00+00	355	263	0.1511	0.1514	0.1510	0.1513
55691	2019-12-26 00:00:00+00	921	361	51.4400	51.4400	51.4400	51.4400
21875	2019-11-18 00:00:00+00	914	361	1323.2900	1333.9200	1318.0000	1332.3400
56364	2019-12-27 16:05:00+00	355	263	0.1498	0.1514	0.1496	0.1513
17327	2019-11-12 00:00:00+00	361	288	108.9980	109.2950	108.8900	109.0440
56281	2019-12-27 14:30:00+00	288	266	0.0070	0.0070	0.0070	0.0070
56020	2019-12-27 09:10:00+00	355	263	0.1505	0.1514	0.1505	0.1513
56701	2019-12-29 00:00:00+00	888	361	45.3300	45.4600	45.3000	45.4400
51705	2019-12-23 00:00:00+00	914	361	1349.3100	1361.8540	1348.0500	1358.7300
56515	2019-12-27 18:55:00+00	355	263	0.1496	0.1514	0.1496	0.1513
51714	2019-12-23 00:00:00+00	917	361	214.9297	215.0400	212.9100	213.2500
27867	2019-11-25 00:00:00+00	355	263	0.1577	0.1585	0.1574	0.1582
27868	2019-11-25 00:00:00+00	266	355	7.4071	7.4175	7.3307	7.3466
27869	2019-11-25 00:00:00+00	361	288	108.9930	109.0120	108.6600	108.7250
27870	2019-11-25 00:00:00+00	263	355	6.3233	6.3357	6.2897	6.3010
27871	2019-11-25 00:00:00+00	266	361	1.2896	1.2912	1.2839	1.2851
56196	2019-12-27 12:45:00+00	288	266	0.0070	0.0070	0.0070	0.0070
26474	2019-11-22 00:00:00+00	361	288	108.6200	108.7320	108.4500	108.5800
25459	2019-11-21 00:00:00+00	361	355	5.6955	5.7092	5.6780	5.6963
25460	2019-11-21 00:00:00+00	266	355	7.3597	7.3917	7.3440	7.3661
37842	2019-12-06 00:00:00+00	888	361	54.2800	54.3900	53.4600	53.7400
56658	2019-12-27 21:45:00+00	288	266	0.0070	0.0070	0.0070	0.0070
55646	2019-12-27 00:00:00+00	545	361	125.3400	125.7200	125.1200	125.5800
41170	2019-12-10 00:00:00+00	917	361	200.1800	202.4800	199.2300	200.7100
25461	2019-11-21 00:00:00+00	361	288	108.5840	108.6980	108.2500	108.4710
17328	2019-11-12 00:00:00+00	355	263	0.1567	0.1569	0.1563	0.1565
45011	2019-12-16 00:00:00+00	888	361	50.4900	50.8700	50.3900	50.8100
17329	2019-11-12 00:00:00+00	266	355	7.4286	7.4345	7.3956	7.4190
28447	2019-01-31 00:00:00+00	917	361	168.4900	169.7300	165.7000	167.8000
28448	2019-01-30 00:00:00+00	917	361	166.8200	167.8400	160.5000	161.2900
28449	2019-01-29 00:00:00+00	917	361	156.8800	160.3746	155.9200	159.0400
28450	2019-01-28 00:00:00+00	917	361	158.9200	159.6900	155.3000	157.8000
28451	2019-01-25 00:00:00+00	917	361	159.2100	160.5000	157.4300	158.9100
28452	2019-01-24 00:00:00+00	917	361	155.8600	156.0000	151.2100	151.4700
28453	2019-01-23 00:00:00+00	917	361	152.0300	155.1800	150.9500	154.6500
28454	2019-01-22 00:00:00+00	917	361	152.1500	155.4400	150.2069	154.4000
17326	2019-11-12 00:00:00+00	361	355	5.7796	5.7823	5.7560	5.7714
28455	2019-01-18 00:00:00+00	917	361	157.0200	159.4900	154.7300	158.4500
17330	2019-11-12 00:00:00+00	266	361	1.2852	1.2874	1.2813	1.2854
28456	2019-01-17 00:00:00+00	917	361	155.9700	158.5500	151.9000	152.1100
17333	2019-11-12 00:00:00+00	263	288	120.0270	120.6400	119.9200	120.3290
28457	2019-01-16 00:00:00+00	917	361	154.8400	155.3900	151.5000	152.8100
28458	2019-01-15 00:00:00+00	917	361	150.8800	154.1700	149.9643	150.6800
28459	2019-01-14 00:00:00+00	917	361	149.2700	150.5700	146.5400	148.5000
28460	2019-01-11 00:00:00+00	917	361	151.3200	153.3800	150.1401	151.8300
28461	2019-01-10 00:00:00+00	917	361	151.6900	152.0300	148.8800	149.8100
28462	2019-01-09 00:00:00+00	917	361	151.9200	153.3500	148.5000	149.8900
28463	2019-01-08 00:00:00+00	917	361	146.7900	147.5500	142.0600	145.0000
28464	2019-01-07 00:00:00+00	917	361	143.1000	144.0800	139.0100	140.5500
28465	2019-01-04 00:00:00+00	917	361	139.7500	141.0800	133.6600	134.2600
28466	2019-01-03 00:00:00+00	917	361	130.6000	134.8699	129.8300	134.2700
28467	2019-01-02 00:00:00+00	917	361	136.7000	137.7488	133.0300	134.1300
55651	2019-12-27 01:45:00+00	288	266	0.0070	0.0070	0.0070	0.0070
55747	2019-12-27 03:40:00+00	266	355	7.7094	7.7128	7.6897	7.7127
55839	2019-12-27 05:30:00+00	288	266	0.0070	0.0070	0.0070	0.0070
55935	2019-12-27 07:25:00+00	355	263	0.1509	0.1514	0.1507	0.1513
56022	2019-12-27 09:15:00+00	266	355	7.7678	7.7743	7.6897	7.7127
56111	2019-12-27 11:00:00+00	288	266	0.0070	0.0070	0.0070	0.0070
56199	2019-12-27 12:45:00+00	355	263	0.1502	0.1514	0.1500	0.1513
56284	2019-12-27 14:30:00+00	355	263	0.1499	0.1514	0.1499	0.1513
56366	2019-12-27 16:10:00+00	266	355	7.8032	7.8136	7.6897	7.7127
56517	2019-12-27 18:55:00+00	266	355	7.8010	7.8136	7.6897	7.7127
56595	2019-12-27 20:35:00+00	266	355	7.7872	7.8136	7.6897	7.7127
56659	2019-12-27 21:45:00+00	266	355	7.7822	7.8136	7.6897	7.7127
56702	2019-12-29 16:40:00+00	361	355	5.9492	5.9492	5.9492	5.9492
51950	2019-12-24 00:00:00+00	455	355	43411.8510	43573.3419	43331.9085	43524.0321
55652	2019-12-27 01:45:00+00	266	355	7.7034	7.7128	7.7004	7.7127
55842	2019-12-27 05:35:00+00	355	263	0.1509	0.1514	0.1507	0.1513
55937	2019-12-27 07:35:00+00	266	355	7.7303	7.7318	7.6897	7.7127
56114	2019-12-27 11:05:00+00	355	263	0.1502	0.1514	0.1501	0.1513
56201	2019-12-27 12:55:00+00	266	355	7.8003	7.8065	7.6897	7.7127
53350	2019-12-24 00:00:00+00	361	288	109.3810	109.4410	109.2900	109.3910
53351	2019-12-24 00:00:00+00	266	361	1.2932	1.2971	1.2912	1.2943
56286	2019-12-27 14:35:00+00	266	355	7.8032	7.8080	7.6897	7.7127
53352	2019-12-24 00:00:00+00	355	263	0.1511	0.1514	0.1510	0.1510
53353	2019-12-24 00:00:00+00	361	355	5.9477	5.9512	5.9260	5.9472
53354	2019-12-24 00:00:00+00	266	355	7.6914	7.7223	7.6545	7.6990
53355	2019-12-24 00:00:00+00	263	288	121.2800	121.3900	121.0300	121.3100
56369	2019-12-27 16:15:00+00	288	266	0.0070	0.0070	0.0070	0.0070
53356	2019-12-24 00:00:00+00	263	361	1.1087	1.1094	1.1068	1.1092
53357	2019-12-24 00:00:00+00	263	355	6.5972	6.6070	6.5766	6.5974
53349	2019-12-24 00:00:00+00	288	266	0.0071	0.0071	0.0070	0.0071
56448	2019-12-27 17:45:00+00	355	263	0.1496	0.1514	0.1496	0.1513
56521	2019-12-27 19:00:00+00	288	266	0.0070	0.0070	0.0070	0.0070
56703	2019-12-29 17:40:00+00	361	355	5.9488	5.9492	5.9488	5.9492
55753	2019-12-27 03:45:00+00	355	263	0.1510	0.1514	0.1510	0.1513
51949	2019-12-24 00:00:00+00	545	361	127.7400	128.5300	127.5600	127.8000
55844	2019-12-27 05:40:00+00	266	355	7.7189	7.7271	7.6897	7.7127
53445	2019-12-25 00:00:00+00	455	355	43086.5589	43244.6042	42921.6706	43175.4594
53468	2019-12-25 00:00:00+00	888	361	45.7500	45.8700	45.5400	45.8100
56026	2019-12-27 09:20:00+00	288	266	0.0070	0.0070	0.0070	0.0070
56116	2019-12-27 11:10:00+00	266	355	7.7806	7.7830	7.6897	7.7127
56371	2019-12-27 11:19:57+00	917	361	217.2268	218.1100	216.1700	217.9900
56374	2019-12-27 16:15:00+00	355	263	0.1497	0.1514	0.1496	0.1513
56450	2019-12-27 17:45:00+00	266	355	7.7953	7.8136	7.6897	7.7127
56524	2019-12-27 19:05:00+00	355	263	0.1495	0.1514	0.1495	0.1513
56602	2019-12-27 20:40:00+00	355	263	0.1496	0.1514	0.1495	0.1513
56604	2019-12-27 15:42:12+00	914	361	1356.0000	1367.0700	1354.4750	1364.0000
56665	2019-12-27 21:50:00+00	355	263	0.1498	0.1514	0.1495	0.1513
53463	2019-12-24 00:00:00+00	921	361	51.1800	51.1800	51.1800	51.1800
56704	2019-12-29 18:00:00+00	263	361	1.1172	1.1178	1.1170	1.1175
56705	2019-12-29 18:00:00+00	263	355	6.6512	6.6527	6.6478	6.6478
55658	2019-12-27 01:55:00+00	355	263	0.1512	0.1514	0.1512	0.1513
55755	2019-12-27 03:50:00+00	288	266	0.0070	0.0070	0.0070	0.0070
55941	2019-12-27 07:35:00+00	288	266	0.0070	0.0070	0.0070	0.0070
56029	2019-12-27 09:20:00+00	355	263	0.1505	0.1514	0.1505	0.1513
56207	2019-12-27 13:00:00+00	355	263	0.1499	0.1514	0.1499	0.1513
56292	2019-12-27 14:40:00+00	355	263	0.1499	0.1514	0.1499	0.1513
56376	2019-12-27 11:25:19+00	914	361	1362.4740	1367.0700	1354.4750	1364.0000
56377	2019-12-27 16:25:00+00	266	355	7.7999	7.8136	7.6897	7.7127
56526	2019-12-27 19:05:00+00	266	355	7.8015	7.8136	7.6897	7.7127
56605	2019-12-27 20:45:00+00	288	266	0.0070	0.0070	0.0070	0.0070
56667	2019-12-27 21:55:00+00	266	355	7.7793	7.8136	7.6897	7.7127
56669	2019-12-27 00:00:00+00	263	361	1.1175	1.1188	1.1097	1.1101
56706	2019-12-29 18:00:00+00	361	288	109.4800	109.4800	109.4100	109.4100
55660	2019-12-27 01:55:00+00	266	355	7.6932	7.7128	7.6897	7.7127
55850	2019-12-27 05:45:00+00	355	263	0.1509	0.1514	0.1507	0.1513
55944	2019-12-27 07:35:00+00	355	263	0.1509	0.1514	0.1507	0.1513
56031	2019-12-27 09:25:00+00	266	355	7.7685	7.7743	7.6897	7.7127
56122	2019-12-27 11:15:00+00	355	263	0.1502	0.1514	0.1501	0.1513
56209	2019-12-27 13:05:00+00	266	355	7.7949	7.8065	7.6897	7.7127
56294	2019-12-27 09:48:30+00	917	361	217.3700	218.1100	216.5000	217.9900
56454	2019-12-27 12:52:38+00	917	361	216.4400	218.1100	216.1570	217.9900
56532	2019-12-27 19:15:00+00	355	263	0.1496	0.1514	0.1495	0.1513
56606	2019-12-27 20:45:00+00	266	355	7.7890	7.8136	7.6897	7.7127
56707	2019-12-29 18:00:00+00	263	288	122.3600	122.3600	122.2900	122.3000
56708	2019-12-29 18:05:00+00	263	361	1.1178	1.1179	1.1169	1.1175
56709	2019-12-29 18:05:00+00	263	355	6.6495	6.6554	6.6478	6.6478
55757	2019-12-27 03:50:00+00	266	355	7.7086	7.7135	7.6897	7.7127
55852	2019-12-27 05:50:00+00	266	355	7.7144	7.7271	7.6897	7.7127
56710	2019-12-29 18:05:00+00	361	288	109.4200	109.4800	109.4100	109.4100
56124	2019-12-27 11:20:00+00	266	355	7.7795	7.7852	7.6897	7.7127
56672	2019-12-27 00:00:00+00	266	361	1.3078	1.3117	1.2968	1.3001
56711	2019-12-29 18:10:00+00	266	361	1.3076	1.3078	1.3076	1.3078
56295	2019-12-27 14:50:00+00	266	355	7.8047	7.8098	7.6897	7.7127
56383	2019-12-27 16:30:00+00	355	263	0.1497	0.1514	0.1496	0.1513
56457	2019-12-27 17:55:00+00	355	263	0.1496	0.1514	0.1496	0.1513
53444	2019-12-25 00:00:00+00	545	361	126.0500	127.8400	125.1100	127.7000
56534	2019-12-27 19:15:00+00	266	355	7.7983	7.8136	7.6897	7.7127
56673	2019-12-27 22:00:00+00	355	263	0.1499	0.1514	0.1495	0.1513
55644	2019-12-27 00:00:00+00	888	361	45.0400	45.4300	44.9700	45.3400
54443	2019-12-26 00:00:00+00	545	361	124.7400	125.4300	124.5700	125.0900
55666	2019-12-27 02:05:00+00	355	263	0.1512	0.1514	0.1512	0.1513
55946	2019-12-27 07:45:00+00	266	355	7.7316	7.7338	7.6897	7.7127
56037	2019-12-27 09:30:00+00	355	263	0.1505	0.1514	0.1505	0.1513
56213	2019-12-27 13:05:00+00	288	266	0.0070	0.0070	0.0070	0.0070
56385	2019-12-27 16:35:00+00	266	355	7.8014	7.8136	7.6897	7.7127
56538	2019-12-27 19:20:00+00	288	266	0.0070	0.0070	0.0070	0.0070
56539	2019-12-27 14:23:37+00	917	361	215.5900	218.1100	215.1700	217.9900
56612	2019-12-27 20:50:00+00	355	263	0.1497	0.1514	0.1495	0.1513
56675	2019-12-27 22:05:00+00	288	266	0.0070	0.0070	0.0070	0.0070
56712	2019-12-29 18:00:00+00	361	355	5.9480	5.9492	5.9479	5.9492
55668	2019-12-27 02:05:00+00	288	266	0.0070	0.0070	0.0070	0.0070
55763	2019-12-27 04:00:00+00	355	263	0.1511	0.1514	0.1510	0.1513
55856	2019-12-27 05:50:00+00	288	266	0.0070	0.0070	0.0070	0.0070
56039	2019-12-27 09:35:00+00	266	355	7.7666	7.7743	7.6897	7.7127
56128	2019-12-27 11:25:00+00	288	266	0.0070	0.0070	0.0070	0.0070
56216	2019-12-27 13:10:00+00	355	263	0.1500	0.1514	0.1499	0.1513
56299	2019-12-27 14:50:00+00	288	266	0.0070	0.0070	0.0070	0.0070
56389	2019-12-27 16:35:00+00	288	266	0.0070	0.0070	0.0070	0.0070
56460	2019-12-27 18:00:00+00	266	355	7.7979	7.8136	7.6897	7.7127
56542	2019-12-27 19:25:00+00	355	263	0.1496	0.1514	0.1495	0.1513
56614	2019-12-27 20:55:00+00	266	355	7.7884	7.8136	7.6897	7.7127
56676	2019-12-27 22:05:00+00	266	355	7.7803	7.8136	7.6897	7.7127
56713	2019-12-29 18:20:00+00	263	288	122.3400	122.3600	122.2900	122.3000
56714	2019-12-29 18:20:00+00	263	361	1.1178	1.1179	1.1169	1.1175
56715	2019-12-29 18:20:00+00	263	355	6.6493	6.6554	6.6478	6.6478
55669	2019-12-27 02:05:00+00	266	355	7.7002	7.7128	7.6897	7.7127
55765	2019-12-27 04:05:00+00	266	355	7.7094	7.7135	7.6897	7.7127
55859	2019-12-27 05:55:00+00	355	263	0.1509	0.1514	0.1507	0.1513
55952	2019-12-27 07:45:00+00	355	263	0.1509	0.1514	0.1507	0.1513
56131	2019-12-27 11:25:00+00	355	263	0.1501	0.1514	0.1501	0.1513
56218	2019-12-27 13:15:00+00	266	355	7.8034	7.8065	7.6897	7.7127
56302	2019-12-27 14:50:00+00	355	263	0.1499	0.1514	0.1499	0.1513
56392	2019-12-27 16:40:00+00	355	263	0.1497	0.1514	0.1496	0.1513
56463	2019-12-27 18:00:00+00	288	266	0.0070	0.0070	0.0070	0.0070
56679	2019-12-27 00:00:00+00	361	288	109.4100	109.5930	109.3600	109.5250
56716	2019-12-29 18:15:00+00	361	288	109.4100	109.4800	109.4100	109.4100
56717	2019-12-29 18:20:00+00	266	361	1.3076	1.3078	1.3076	1.3078
55861	2019-12-27 06:00:00+00	266	355	7.7105	7.7271	7.6897	7.7127
55954	2019-12-27 07:55:00+00	266	355	7.7336	7.7357	7.6897	7.7127
56043	2019-12-27 09:40:00+00	288	266	0.0070	0.0070	0.0070	0.0070
56133	2019-12-27 11:30:00+00	266	355	7.7807	7.7852	7.6897	7.7127
55412	2019-12-26 00:00:00+00	917	361	216.3900	216.9900	214.3300	214.6500
56304	2019-12-27 15:00:00+00	266	355	7.8062	7.8098	7.6897	7.7127
56394	2019-12-27 16:45:00+00	266	355	7.7950	7.8136	7.6897	7.7127
56546	2019-12-27 19:30:00+00	266	355	7.7977	7.8136	7.6897	7.7127
56680	2019-12-27 22:15:00+00	355	263	0.1499	0.1514	0.1495	0.1513
56619	2019-12-27 00:00:00+00	917	361	215.4700	218.1100	215.1700	217.9900
55675	2019-12-27 02:15:00+00	355	263	0.1512	0.1514	0.1512	0.1513
55769	2019-12-27 04:10:00+00	288	266	0.0070	0.0070	0.0070	0.0070
56046	2019-12-27 09:40:00+00	355	263	0.1505	0.1514	0.1505	0.1513
56224	2019-12-27 13:20:00+00	355	263	0.1500	0.1514	0.1499	0.1513
56470	2019-12-27 18:10:00+00	355	263	0.1496	0.1514	0.1496	0.1513
56621	2019-12-27 21:00:00+00	355	263	0.1497	0.1514	0.1495	0.1513
56681	2019-12-27 22:15:00+00	266	355	7.7803	7.8136	7.6897	7.7127
55772	2019-12-27 04:10:00+00	355	263	0.1511	0.1514	0.1510	0.1513
55867	2019-12-27 06:05:00+00	355	263	0.1509	0.1514	0.1507	0.1513
56684	2019-12-27 22:25:00+00	355	263	0.1499	0.1514	0.1495	0.1513
55958	2019-12-27 07:55:00+00	288	266	0.0070	0.0070	0.0070	0.0070
56048	2019-12-27 09:45:00+00	266	355	7.7706	7.7743	7.6897	7.7127
56139	2019-12-27 11:35:00+00	355	263	0.1502	0.1514	0.1501	0.1513
56226	2019-12-27 13:25:00+00	266	355	7.8019	7.8080	7.6897	7.7127
56310	2019-12-27 15:05:00+00	355	263	0.1498	0.1514	0.1498	0.1513
56398	2019-12-27 11:50:28+00	917	361	217.4900	218.1100	216.1700	217.9900
56551	2019-12-27 14:33:56+00	914	361	1358.0100	1367.0700	1354.4750	1364.0000
56623	2019-12-27 21:05:00+00	288	266	0.0070	0.0070	0.0070	0.0070
55677	2019-12-27 00:00:00+00	455	355	42858.7591	42969.5413	42663.3030	42734.5074
54358	2019-12-25 00:00:00+00	263	355	6.5895	6.6029	6.5682	6.5954
54360	2019-12-25 00:00:00+00	361	288	109.3700	109.4800	109.2300	109.3810
55678	2019-12-27 02:15:00+00	266	355	7.6962	7.7128	7.6897	7.7127
55774	2019-12-27 04:15:00+00	266	355	7.7118	7.7147	7.6897	7.7127
54361	2019-12-25 00:00:00+00	266	361	1.2971	1.2982	1.2920	1.2931
54362	2019-12-25 00:00:00+00	355	263	0.1513	0.1517	0.1511	0.1511
54363	2019-12-25 00:00:00+00	361	355	5.9364	5.9492	5.9250	5.9477
55869	2019-12-27 06:10:00+00	266	355	7.7144	7.7271	7.6897	7.7127
54359	2019-12-25 00:00:00+00	288	266	0.0070	0.0071	0.0070	0.0071
55961	2019-12-27 07:55:00+00	355	263	0.1509	0.1514	0.1507	0.1513
56141	2019-12-27 11:40:00+00	266	355	7.7830	7.7852	7.6897	7.7127
56312	2019-12-27 15:10:00+00	266	355	7.8094	7.8122	7.6897	7.7127
56401	2019-12-27 16:50:00+00	355	263	0.1497	0.1514	0.1496	0.1513
54355	2019-12-25 00:00:00+00	266	355	7.7029	7.7144	7.6507	7.6934
54356	2019-12-25 00:00:00+00	263	288	121.3420	121.6000	121.0200	121.2900
54357	2019-12-25 00:00:00+00	263	361	1.1095	1.1102	1.1072	1.1087
56554	2019-12-27 19:35:00+00	355	263	0.1496	0.1514	0.1495	0.1513
56624	2019-12-27 21:05:00+00	266	355	7.7818	7.8136	7.6897	7.7127
56685	2019-12-27 22:25:00+00	288	266	0.0070	0.0070	0.0070	0.0070
\.


--
-- Data for Name: api_paritysetting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_paritysetting (id, update_rate, from_date, last_updated, base_equipment_id, target_equipment_id, "order") FROM stdin;
21	00:10:00	2018-01-01 00:00:00+00	2019-12-29 18:23:40.397913+00	355	263	0
20	00:10:00	2018-01-01 00:00:00+00	2019-12-29 18:23:40.397913+00	361	288	0
23	00:10:00	2018-01-01 00:00:00+00	2019-12-29 18:23:40.397913+00	266	361	0
28	00:30:00	2019-01-01 00:00:00+00	2019-12-29 18:24:43.97226+00	917	361	0
31	00:20:00	2019-01-01 00:00:00+00	2019-12-29 18:24:43.97226+00	288	266	100
26	00:10:00	2018-01-01 00:00:00+00	2019-12-29 18:24:43.97226+00	361	355	-100
17	01:00:00	2018-01-01 00:00:00+00	2019-12-29 18:25:49.863299+00	888	361	0
22	00:10:00	2018-01-01 00:00:00+00	2019-12-29 18:32:58.789736+00	266	355	0
27	00:10:00	2019-11-10 00:00:00+00	2019-12-29 18:32:58.789736+00	263	288	0
24	00:10:00	2018-01-01 00:00:00+00	2019-12-29 18:32:58.789736+00	263	361	0
25	00:10:00	2018-01-01 00:00:00+00	2019-12-29 18:32:58.789736+00	263	355	-999
30	00:10:00	2019-10-01 00:00:00+00	2019-12-29 18:32:58.789736+00	545	361	-100
19	01:00:00	2018-01-01 00:00:00+00	2019-12-29 18:09:10.327397+00	914	361	-50
16	01:00:00	2018-01-01 00:00:00+00	2019-12-29 18:14:24.812959+00	921	361	-10
18	01:00:00	2018-01-01 00:00:00+00	2019-12-29 18:20:30.905721+00	455	355	-99
\.


--
-- Data for Name: api_portfolio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_portfolio (id, name, user_id) FROM stdin;
1	Example Portfolio	65
15	furkan	44
16	hello	44
18	My Portfolio	566
19	Very Good Portfolio	546
12	wow	44
22	s	550
13	ben	44
9	deneme	44
24	se a se	573
25	new port	555
14	Alperen	550
6	denemeharun	44
23	test	572
26	my crypto portfolio	545
28	super portfolio	545
29	nice portfolio	545
30	ggg	545
40	PoundTrack	586
42	crypto	589
44	Dolar	557
41	Non-Conventional Pound Predictors	587
\.


--
-- Data for Name: api_portfolio_followed_by; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_portfolio_followed_by (id, portfolio_id, user_id) FROM stdin;
1	1	71
2	1	44
3	14	44
4	6	550
6	9	550
7	12	550
8	13	550
9	9	572
10	23	566
11	14	566
12	6	574
13	23	567
14	26	113
16	28	66
21	41	586
\.


--
-- Data for Name: api_portfolioitem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_portfolioitem (id, base_equipment_id, portfolio_id, target_equipment_id) FROM stdin;
1	361	1	355
2	263	1	361
95	355	40	266
96	361	40	266
26	355	12	361
27	355	6	348
97	263	40	266
29	355	13	352
30	355	6	355
98	914	41	266
99	455	41	266
100	263	41	266
34	355	16	355
101	288	41	266
36	350	18	354
37	350	18	354
38	355	19	349
39	355	14	263
40	351	22	355
41	351	22	355
42	355	25	361
43	221	28	259
44	310	28	340
102	221	26	230
103	221	26	221
111	361	44	355
117	361	42	455
118	361	42	545
119	361	42	445
120	221	42	235
\.


--
-- Data for Name: api_prediction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_prediction (id, date, direction, result, base_equipment_id, target_equipment_id, user_id) FROM stdin;
1157	2019-07-01	-1	1	266	263	587
1158	2019-07-02	1	1	266	263	587
1159	2019-07-03	-1	1	266	263	587
1160	2019-07-04	-1	1	266	263	587
1161	2019-07-05	1	1	266	263	587
1162	2019-07-06	1	1	266	263	587
1163	2019-07-07	1	1	266	263	587
1164	2019-07-08	1	1	266	263	587
110	2019-07-01	1	1	263	355	545
111	2019-07-02	1	0	263	355	545
112	2019-07-03	1	1	263	355	545
113	2019-07-04	1	1	263	355	545
114	2019-07-05	1	1	263	355	545
1165	2019-07-09	-1	1	266	263	587
115	2019-07-06	1	1	263	355	545
116	2019-07-07	1	1	263	355	545
1166	2019-07-10	-1	1	266	263	587
117	2019-07-08	1	1	263	355	545
1167	2019-07-11	1	1	266	263	587
118	2019-07-09	1	1	263	355	545
119	2019-07-10	-1	1	263	355	545
120	2019-07-11	1	1	263	355	545
121	2019-07-12	-1	1	263	355	545
1168	2019-07-12	-1	1	266	263	587
1169	2019-07-13	1	1	266	263	587
1170	2019-07-14	1	1	266	263	587
122	2019-07-13	1	1	263	355	545
123	2019-07-14	-1	1	263	355	545
197	2019-12-19	1	-1	355	266	545
1171	2019-07-15	1	1	266	263	587
124	2019-07-15	-1	1	263	355	545
1172	2019-07-16	-1	1	266	263	587
125	2019-07-16	-1	0	263	355	545
126	2019-07-17	-1	1	263	355	545
127	2019-07-18	1	1	263	355	545
128	2019-07-19	1	1	263	355	545
1173	2019-07-17	-1	1	266	263	587
129	2019-07-20	1	1	263	355	545
130	2019-07-21	-1	1	263	355	545
1174	2019-07-18	-1	1	266	263	587
131	2019-07-22	-1	1	263	355	545
132	2019-07-23	-1	1	263	355	545
133	2019-07-24	-1	1	263	355	545
134	2019-07-25	-1	1	263	355	545
135	2019-07-26	-1	1	263	355	545
1175	2019-07-19	-1	1	266	263	587
136	2019-07-27	1	1	263	355	545
137	2019-07-28	1	1	263	355	545
138	2019-07-29	1	1	263	355	545
139	2019-07-30	1	1	263	355	545
140	2019-07-31	-1	1	263	355	545
1176	2019-07-20	-1	1	266	263	587
141	2019-08-01	-1	1	263	355	545
142	2019-08-02	1	1	263	355	545
143	2019-08-03	-1	1	263	355	545
144	2019-08-04	-1	1	263	355	545
145	2019-08-05	1	1	263	355	545
146	2019-08-06	1	1	263	355	545
147	2019-08-07	1	1	263	355	545
1177	2019-07-21	1	1	266	263	587
1178	2019-07-22	-1	1	266	263	587
148	2019-08-08	1	1	263	355	545
1179	2019-07-23	-1	1	266	263	587
149	2019-08-09	-1	1	263	355	545
150	2019-08-10	-1	1	263	355	545
151	2019-08-11	-1	1	263	355	545
152	2019-08-12	-1	1	263	355	545
1180	2019-07-24	-1	1	266	263	587
1181	2019-07-25	-1	1	266	263	587
153	2019-08-13	1	1	263	355	545
1182	2019-07-26	-1	1	266	263	587
1183	2019-07-27	-1	1	266	263	587
1184	2019-07-28	-1	1	266	263	587
154	2019-08-14	1	1	263	355	545
155	2019-08-15	1	1	263	355	545
1185	2019-07-29	-1	1	266	263	587
1186	2019-07-30	-1	1	266	263	587
1187	2019-07-31	1	1	266	263	587
1188	2019-08-01	-1	1	266	263	587
156	2019-08-16	1	1	263	355	545
157	2019-08-17	1	0	263	355	545
158	2019-08-18	1	1	263	355	545
159	2019-08-19	1	1	263	355	545
160	2019-11-01	1	0	545	361	545
161	2019-11-02	1	0	545	361	545
162	2019-11-03	1	1	545	361	545
163	2019-11-26	1	0	545	361	545
164	2019-11-05	-1	1	545	361	545
1189	2019-08-02	1	1	266	263	587
1190	2019-08-03	1	1	266	263	587
167	2019-11-26	1	0	355	263	546
168	2019-12-08	1	1	263	355	556
1191	2019-08-04	-1	1	266	263	587
169	2019-12-10	1	0	355	263	557
171	2019-12-10	1	0	355	263	545
172	2019-12-12	1	-1	361	545	545
173	2019-12-12	1	-1	288	361	545
174	2019-12-14	1	-1	355	361	545
1192	2019-08-05	-1	1	266	263	587
1193	2019-08-06	1	1	266	263	587
1194	2019-08-07	-1	1	266	263	587
1195	2019-08-08	-1	1	266	263	587
179	2019-12-14	1	-1	361	545	545
1196	2019-08-09	1	1	266	263	587
1197	2019-08-10	1	1	266	263	587
182	2019-12-14	1	-1	355	455	545
1198	2019-08-11	1	1	266	263	587
184	2019-12-14	1	-1	355	266	545
185	2019-12-14	1	-1	288	263	545
1199	2019-08-12	-1	1	266	263	587
187	2019-12-14	-1	-1	288	361	545
188	2019-12-14	1	-1	361	888	545
189	2019-12-14	1	-1	361	921	545
191	2019-12-14	-1	-1	361	917	545
190	2019-12-14	-1	0	263	355	545
193	2019-12-17	1	-1	355	266	546
192	2019-12-16	1	1	361	355	564
194	2019-12-19	1	-1	355	361	568
195	2019-12-19	1	-1	355	361	545
199	2019-12-20	1	-1	361	263	568
200	2019-12-20	1	-1	288	263	568
198	2019-12-19	1	1	355	263	545
201	2019-12-21	1	-1	288	263	568
202	2019-12-22	1	-1	355	455	568
1200	2019-08-13	-1	1	266	263	587
1201	2019-08-14	1	1	266	263	587
1202	2019-08-15	-1	1	266	263	587
1203	2019-08-16	1	1	266	263	587
1204	2019-08-17	1	1	266	263	587
1205	2019-08-18	-1	1	266	263	587
1206	2019-08-19	1	1	266	263	587
1207	2019-08-20	-1	1	266	263	587
1208	2019-08-21	1	1	266	263	587
1209	2019-08-22	-1	1	266	263	587
1210	2019-08-23	-1	1	266	263	587
1211	2019-08-24	-1	1	266	263	587
1212	2019-08-25	-1	1	266	263	587
1213	2019-08-26	1	1	266	263	587
1214	2019-08-27	-1	1	266	263	587
1215	2019-08-28	-1	1	266	263	587
1216	2019-08-29	1	1	266	263	587
1217	2019-08-30	-1	1	266	263	587
1218	2019-08-31	-1	1	266	263	587
1219	2019-09-01	-1	1	266	263	587
1220	2019-09-02	1	1	266	263	587
1221	2019-09-03	-1	1	266	263	587
1222	2019-09-04	-1	1	266	263	587
1223	2019-09-05	-1	0	266	263	587
1224	2019-09-06	-1	1	266	263	587
1225	2019-09-07	1	1	266	263	587
1226	2019-09-08	-1	1	266	263	587
1227	2019-09-09	1	1	266	263	587
1228	2019-09-10	-1	1	266	263	587
1229	2019-09-11	1	1	266	263	587
1230	2019-09-12	-1	1	266	263	587
1231	2019-09-13	-1	1	266	263	587
1232	2019-09-14	1	1	266	263	587
1233	2019-09-15	-1	1	266	263	587
1234	2019-09-16	1	1	266	263	587
1235	2019-09-17	1	1	266	263	587
1236	2019-09-18	1	1	266	263	587
1237	2019-09-19	-1	1	266	263	587
1238	2019-09-20	-1	1	266	263	587
1239	2019-09-21	-1	1	266	263	587
1240	2019-09-22	-1	1	266	263	587
1241	2019-09-23	-1	0	266	263	587
1242	2019-09-24	1	1	266	263	587
1243	2019-09-25	1	1	266	263	587
1244	2019-09-26	1	0	266	263	587
1245	2019-09-27	1	1	266	263	587
1246	2019-09-28	-1	0	266	263	587
1247	2019-09-29	1	1	266	263	587
1248	2019-09-30	-1	1	266	263	587
1249	2019-10-01	1	1	266	263	587
1250	2019-10-02	1	1	266	263	587
1251	2019-10-03	-1	1	266	263	587
1252	2019-10-04	1	1	266	263	587
1253	2019-10-05	-1	1	266	263	587
1254	2019-10-06	-1	1	266	263	587
1255	2019-10-07	1	1	266	263	587
1256	2019-10-08	-1	1	266	263	587
1257	2019-10-09	-1	1	266	263	587
1258	2019-10-10	1	1	266	263	587
1259	2019-10-11	-1	1	266	263	587
1260	2019-10-12	-1	1	266	263	587
1261	2019-10-13	1	0	266	263	587
1262	2019-10-14	-1	0	266	263	587
1263	2019-10-15	1	1	266	263	587
1264	2019-10-16	-1	1	266	263	587
1265	2019-10-17	-1	1	266	263	587
1266	2019-10-18	-1	1	266	263	587
1267	2019-10-19	1	1	266	263	587
1268	2019-10-20	-1	1	266	263	587
1269	2019-10-21	-1	1	266	263	587
1270	2019-10-22	-1	1	266	263	587
1271	2019-10-23	1	1	266	263	587
1272	2019-10-24	1	1	266	263	587
1273	2019-10-25	-1	1	266	263	587
1274	2019-10-26	-1	0	266	263	587
1275	2019-10-27	1	1	266	263	587
1276	2019-10-28	1	1	266	263	587
1277	2019-10-29	-1	1	266	263	587
1278	2019-10-30	-1	1	266	263	587
1279	2019-10-31	-1	1	266	263	587
1280	2019-11-01	-1	1	266	263	587
1281	2019-11-02	-1	1	266	263	587
1282	2019-11-03	-1	1	266	263	587
1283	2019-11-04	1	1	266	263	587
1284	2019-11-05	1	1	266	263	587
1285	2019-11-06	-1	1	266	263	587
1286	2019-11-07	-1	1	266	263	587
1287	2019-11-08	1	1	266	263	587
1288	2019-11-09	1	1	266	263	587
1289	2019-11-10	1	1	266	263	587
1290	2019-11-11	1	1	266	263	587
1291	2019-11-12	1	1	266	263	587
1292	2019-11-13	-1	1	266	263	587
1293	2019-11-14	-1	1	266	263	587
1294	2019-11-15	1	1	266	263	587
1295	2019-11-16	1	1	266	263	587
1296	2019-11-17	1	1	266	263	587
1297	2019-11-18	1	1	266	263	587
1298	2019-11-19	1	1	266	263	587
1299	2019-11-20	1	1	266	263	587
1300	2019-11-21	1	0	266	263	587
1301	2019-11-22	1	1	266	263	587
1302	2019-11-23	1	1	266	263	587
1303	2019-11-24	-1	1	266	263	587
1304	2019-11-25	-1	1	266	263	587
1305	2019-11-26	-1	1	266	263	587
1306	2019-11-27	-1	1	266	263	587
1307	2019-11-28	1	0	266	263	587
1308	2019-11-29	1	1	266	263	587
1309	2019-11-30	-1	1	266	263	587
1310	2019-12-01	1	1	266	263	587
1311	2019-12-02	-1	1	266	263	587
1312	2019-12-03	-1	1	266	263	587
1313	2019-12-04	-1	1	266	263	587
1314	2019-12-05	-1	1	266	263	587
1315	2019-12-06	1	1	266	263	587
1316	2019-12-07	1	1	266	263	587
1317	2019-12-08	-1	1	266	263	587
1318	2019-12-09	1	1	266	263	587
1319	2019-12-10	1	1	266	263	587
1320	2019-12-11	-1	1	266	263	587
1321	2019-12-12	-1	1	266	263	587
1322	2019-12-13	-1	1	266	263	587
1323	2019-12-14	1	1	266	263	587
1324	2019-12-15	-1	1	266	263	587
1325	2019-12-16	1	1	266	263	587
1326	2019-12-17	-1	1	266	263	587
1327	2019-12-18	-1	1	266	263	587
1328	2019-12-19	-1	1	266	263	587
1329	2019-12-20	1	1	266	263	587
1330	2019-12-21	1	1	266	263	587
1331	2019-12-22	1	1	266	263	587
1332	2019-12-23	1	1	266	263	587
1333	2019-12-24	-1	1	266	263	587
1334	2019-12-25	1	1	266	263	587
1335	2019-12-26	-1	1	266	263	587
1336	2019-12-27	1	1	266	263	587
1337	2019-12-28	1	1	266	263	587
1338	2019-12-29	1	1	266	263	587
1339	2019-12-30	1	1	266	263	587
1340	2019-12-31	-1	1	266	263	587
1341	2020-01-01	1	1	266	263	587
1342	2020-01-02	-1	1	266	263	587
1343	2020-01-03	1	1	266	263	587
1344	2020-01-04	-1	1	266	263	587
1345	2020-01-05	1	1	266	263	587
1346	2020-01-06	-1	1	266	263	587
1347	2020-01-07	-1	1	266	263	587
1348	2020-01-08	-1	1	266	263	587
1349	2020-01-09	-1	0	266	263	587
1350	2020-01-10	1	1	266	263	587
1351	2020-01-11	1	1	266	263	587
1352	2020-01-12	1	1	266	263	587
1353	2020-01-13	1	0	266	263	587
1354	2020-01-14	1	1	266	263	587
1355	2020-01-15	-1	1	266	263	587
1356	2020-01-16	1	1	266	263	587
1357	2020-01-17	-1	1	266	263	587
1358	2020-01-18	1	1	266	263	587
1359	2020-01-19	1	1	266	263	587
1360	2020-01-20	-1	1	266	263	587
1361	2020-01-21	-1	1	266	263	587
1362	2020-01-22	1	1	266	263	587
1363	2020-01-23	-1	1	266	263	587
1364	2020-01-24	1	1	266	263	587
1365	2020-01-25	-1	1	266	263	587
1366	2020-01-26	1	1	266	263	587
1367	2020-01-27	1	0	266	263	587
1368	2020-01-28	1	1	266	263	587
1369	2020-01-29	1	1	266	263	587
1370	2020-01-30	-1	1	266	263	587
1371	2020-01-31	-1	1	266	263	587
1372	2020-02-01	-1	1	266	263	587
1373	2020-02-02	-1	1	266	263	587
1374	2020-02-03	-1	1	266	263	587
1375	2020-02-04	-1	0	266	263	587
1376	2020-02-05	1	1	266	263	587
1377	2020-02-06	1	0	266	263	587
1378	2020-02-07	1	0	266	263	587
1379	2020-02-08	1	1	266	263	587
1380	2020-02-09	1	1	266	263	587
1381	2020-02-10	1	1	266	263	587
1382	2020-02-11	-1	1	266	263	587
1383	2020-02-12	-1	1	266	263	587
1384	2020-02-13	1	1	266	263	587
1385	2020-02-14	1	1	266	263	587
1386	2020-02-15	-1	1	266	263	587
1387	2020-02-16	1	1	266	263	587
1388	2020-02-17	-1	1	266	263	587
1389	2020-02-18	-1	1	266	263	587
1390	2020-02-19	1	1	266	263	587
1391	2020-02-20	1	0	266	263	587
1392	2020-02-21	-1	1	266	263	587
1393	2020-02-22	1	1	266	263	587
1394	2020-02-23	-1	1	266	263	587
1395	2020-02-24	-1	1	266	263	587
1396	2020-02-25	-1	1	266	263	587
1397	2020-02-26	1	1	266	263	587
1398	2020-02-27	-1	1	266	263	587
1399	2020-02-28	1	1	266	263	587
1400	2020-02-29	1	1	266	263	587
1401	2020-03-01	-1	1	266	263	587
1402	2020-03-02	-1	1	266	263	587
1403	2020-03-03	1	1	266	263	587
1404	2020-03-04	-1	1	266	263	587
1405	2020-03-05	-1	1	266	263	587
1406	2020-03-06	1	1	266	263	587
1407	2020-03-07	-1	1	266	263	587
1408	2020-03-08	-1	1	266	263	587
1409	2020-03-09	-1	1	266	263	587
1410	2020-03-10	-1	1	266	263	587
1411	2020-03-11	-1	1	266	263	587
1412	2020-03-12	-1	1	266	263	587
1413	2020-03-13	-1	1	266	263	587
1414	2020-03-14	1	1	266	263	587
1415	2020-03-15	-1	1	266	263	587
1416	2020-03-16	1	0	266	263	587
1417	2020-03-17	1	1	266	263	587
1418	2020-03-18	1	0	266	263	587
1419	2020-03-19	1	1	266	263	587
1420	2020-03-20	-1	1	266	263	587
1421	2020-03-21	1	1	266	263	587
1422	2020-03-22	1	1	266	263	587
1423	2020-03-23	1	1	266	263	587
1424	2020-03-24	-1	1	266	263	587
1425	2020-03-25	-1	1	266	263	587
1426	2020-03-26	-1	0	266	263	587
1427	2020-03-27	-1	1	266	263	587
1428	2020-03-28	1	1	266	263	587
1429	2020-03-29	-1	1	266	263	587
1430	2020-03-30	1	1	266	263	587
1431	2020-03-31	1	1	266	263	587
1432	2020-04-01	-1	1	266	263	587
1433	2020-04-02	1	1	266	263	587
1434	2020-04-03	-1	1	266	263	587
1435	2020-04-04	-1	1	266	263	587
1436	2020-04-05	1	1	266	263	587
1437	2020-04-06	-1	1	266	263	587
1438	2020-04-07	1	1	266	263	587
1439	2020-04-08	1	1	266	263	587
1440	2020-04-09	1	1	266	263	587
1441	2020-04-10	-1	1	266	263	587
1442	2020-04-11	1	1	266	263	587
1443	2020-04-12	-1	1	266	263	587
1444	2020-04-13	1	1	266	263	587
1445	2020-04-14	-1	1	266	263	587
1446	2020-04-15	-1	1	266	263	587
1447	2020-04-16	-1	1	266	263	587
1448	2020-04-17	-1	1	266	263	587
1449	2020-04-18	1	1	266	263	587
1450	2020-04-19	-1	1	266	263	587
1451	2020-04-20	-1	1	266	263	587
1452	2020-04-21	-1	1	266	263	587
1453	2020-04-22	1	1	266	263	587
1454	2020-04-23	1	1	266	263	587
1455	2020-04-24	1	1	266	263	587
1456	2020-04-25	1	1	266	263	587
1457	2019-09-16	-1	1	266	355	586
1458	2019-12-24	1	-1	355	361	557
\.


--
-- Data for Name: api_stoplossorder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_stoplossorder (id, date, sell_ratio, sell_amount, base_equipment_id, target_equipment_id, user_id) FROM stdin;
2	2019-12-23 13:59:44.070717+00	5.0000	30.000	355	263	572
\.


--
-- Data for Name: api_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, is_trader, iban, city, country, is_private, avatar, email_verified) FROM stdin;
62	password	\N	f	cochran69	Olag	Cochran		f	t	2019-11-26 09:40:45.624375+00	f		Ankara	TR	f	2	f
65	password	\N	f	jonathan83	Jonathan	Rourk		f	t	2019-11-26 09:40:45.629118+00	f		Istanbul	TR	f	2	f
66	password	\N	f	angel79	Angel	Martincello		f	t	2019-11-26 09:40:45.630376+00	f		New York	US	f	10	f
68	password	\N	f	hamavand58	Etheline	Hamavand		f	t	2019-11-26 09:40:45.633102+00	f		New York	US	f	2	f
70	password	\N	f	grace20	Grace	Nagarur		f	t	2019-11-26 09:40:45.635677+00	f		Ankara	TR	f	6	f
71	password	\N	f	pham69	Gilbertina	Pham		f	t	2019-11-26 09:40:45.636993+00	f		Paris	FR	f	10	f
72	password	\N	f	clarence52	Clarence	Talbert		f	t	2019-11-26 09:40:45.638316+00	f		Izmir	TR	f	10	f
74	password	\N	f	szamosi55	Adina	Szamosi		f	t	2019-11-26 09:40:45.64078+00	f		Houston	US	f	8	f
75	password	\N	f	edith2	Edith	Popel		f	t	2019-11-26 09:40:45.642064+00	f		Paris	FR	f	1	f
78	password	\N	f	welby62	Welby	Roohy-Laleh		f	t	2019-11-26 09:40:45.653355+00	f		Ankara	TR	f	9	f
79	password	\N	f	elsinore86	Elsinore	Roscoe		f	t	2019-11-26 09:40:45.660489+00	f		Istanbul	TR	f	8	f
81	password	\N	f	giani51	Dominic	Giani		f	t	2019-11-26 09:40:45.663886+00	f		Ankara	TR	f	6	f
84	password	\N	f	achcar58	Berry	Achcar		f	t	2019-11-26 09:40:45.667666+00	f		Berlin	DE	f	9	f
87	password	\N	f	alkire24	Eleanore	Alkire		f	t	2019-11-26 09:40:45.671394+00	f		Houston	US	f	8	f
89	password	\N	f	sibincic49	Waldon	Sibincic		f	t	2019-11-26 09:40:45.674463+00	f		Moscow	RU	f	8	f
90	password	\N	f	lotte31	Lotte	Westfall		f	t	2019-11-26 09:40:45.675727+00	f		Boston	US	f	1	f
92	password	\N	f	leonora88	Leonora	Niles		f	t	2019-11-26 09:40:45.67822+00	f		New York	US	f	5	f
93	password	\N	f	lahteenmaa43	Anallese	Lahteenmaa		f	t	2019-11-26 09:40:45.679441+00	f		Moscow	RU	f	5	f
94	password	\N	f	ardith54	Ardith	Calow		f	t	2019-11-26 09:40:45.68063+00	f		Ankara	TR	f	1	f
95	password	\N	f	saw59	Saw	Michaelson		f	t	2019-11-26 09:40:45.681928+00	f		Izmir	TR	f	5	f
96	password	\N	f	barel89	Dyanne	Barel		f	t	2019-11-26 09:40:45.683112+00	f		Moscow	RU	f	2	f
100	password	\N	f	soto8	Elna	Soto		f	t	2019-11-26 09:40:45.688767+00	f		Izmir	TR	f	2	f
103	password	\N	f	vick59	Vick	Biggerstaff		f	t	2019-11-26 09:40:45.693949+00	f		Ankara	TR	f	6	f
106	password	\N	f	sam7	Sam	Siu		f	t	2019-11-26 09:40:45.697764+00	f		Ankara	TR	f	4	f
108	password	\N	f	georges49	Georges	Rollo		f	t	2019-11-26 09:40:45.700267+00	f		Moscow	RU	f	9	f
111	password	\N	f	twiss39	Scotti	Twiss		f	t	2019-11-26 09:40:45.704194+00	f		New York	US	f	9	f
116	password	\N	f	terrell0	Jeanie	Terrell		f	t	2019-11-26 09:40:45.710796+00	f		Houston	US	f	5	f
117	password	\N	f	jemie80	Jemie	Hincher		f	t	2019-11-26 09:40:45.712155+00	f		Houston	US	f	1	f
118	password	\N	f	maria7	Maria	Hollander		f	t	2019-11-26 09:40:45.713308+00	f		Paris	FR	f	9	f
120	password	\N	f	deligdisch7	Ilona	Deligdisch		f	t	2019-11-26 09:40:45.715715+00	f		Houston	US	f	1	f
121	password	\N	f	du berger95	Godfry	Du Berger		f	t	2019-11-26 09:40:45.716896+00	f		Moscow	RU	f	7	f
122	password	\N	f	kaile94	Kaile	McCaig		f	t	2019-11-26 09:40:45.718086+00	f		Moscow	RU	f	7	f
123	password	\N	f	godish32	Corene	Godish		f	t	2019-11-26 09:40:45.719283+00	f		Izmir	TR	f	2	f
124	password	\N	f	linberg21	Lurlene	Linberg		f	t	2019-11-26 09:40:45.720488+00	f		New York	US	f	10	f
125	password	\N	f	cobby84	Cobby	Arunachalam		f	t	2019-11-26 09:40:45.721714+00	f		Berlin	DE	f	6	f
127	password	\N	f	hummel45	Vittoria	Hummel		f	t	2019-11-26 09:40:45.724202+00	f		Moscow	RU	f	10	f
128	password	\N	f	bill31	Bill	Pelosi		f	t	2019-11-26 09:40:45.725531+00	f		Houston	US	f	7	f
132	password	\N	f	chanpong43	Denis	Chanpong		f	t	2019-11-26 09:40:45.730767+00	f		Berlin	DE	f	6	f
64	password	\N	f	rosella73	Rosella	MacCarthy		f	t	2019-11-26 09:40:45.627788+00	f		Houston	US	f	3	f
67	password	\N	f	quill68	Quill	Fajardo		f	t	2019-11-26 09:40:45.631878+00	f		Berlin	DE	f	11	f
69	password	\N	f	bing14	Bing	Zukovsky		f	t	2019-11-26 09:40:45.634403+00	f		Paris	FR	f	1	f
76	password	\N	f	rao73	Pattie	Rao		f	t	2019-11-26 09:40:45.643272+00	f		Paris	FR	f	6	f
77	password	\N	f	wealch34	Ileana	Wealch		f	t	2019-11-26 09:40:45.65039+00	f		Izmir	TR	f	4	f
80	password	\N	f	steffens13	Tommy	Steffens		f	t	2019-11-26 09:40:45.662607+00	f		Boston	US	f	1	f
82	password	\N	f	lynton82	Kandace	Lynton		f	t	2019-11-26 09:40:45.665134+00	f		Ankara	TR	f	8	f
83	password	\N	f	aliza100	Aliza	Drop-Box		f	t	2019-11-26 09:40:45.666415+00	f		Izmir	TR	f	9	f
85	password	\N	f	sawyere26	Sawyere	Neilsen		f	t	2019-11-26 09:40:45.668911+00	f		Moscow	RU	f	9	f
86	password	\N	f	chrisy83	Chrisy	Muselik		f	t	2019-11-26 09:40:45.670155+00	f		Berlin	DE	f	11	f
88	password	\N	f	teo81	Melodee	Teo		f	t	2019-11-26 09:40:45.673206+00	f		Boston	US	f	11	f
91	password	\N	f	skippie71	Skippie	Thornley		f	t	2019-11-26 09:40:45.677001+00	f		Paris	FR	f	7	f
97	password	\N	f	enet79	Marney	Enet		f	t	2019-11-26 09:40:45.684361+00	f		New York	US	f	7	f
98	password	\N	f	bayless28	Neddie	Bayless		f	t	2019-11-26 09:40:45.685872+00	f		Izmir	TR	f	4	f
99	password	\N	f	eason72	Marilin	Eason		f	t	2019-11-26 09:40:45.68718+00	f		New York	US	f	2	f
101	password	\N	f	parikh49	Ailyn	Parikh		f	t	2019-11-26 09:40:45.691572+00	f		Boston	US	f	7	f
102	password	\N	f	casey33	Casey	Tarsky		f	t	2019-11-26 09:40:45.692791+00	f		Moscow	RU	f	9	f
104	password	\N	f	jessie52	Jessie	Benjamin		f	t	2019-11-26 09:40:45.695286+00	f		Boston	US	f	9	f
105	password	\N	f	gravelle40	Kalli	Gravelle		f	t	2019-11-26 09:40:45.696476+00	f		Izmir	TR	f	4	f
107	password	\N	f	mercier46	Sukey	Mercier		f	t	2019-11-26 09:40:45.698978+00	f		Paris	FR	f	6	f
109	password	\N	f	tiffani30	Tiffani	Bomstein		f	t	2019-11-26 09:40:45.70154+00	f		Istanbul	TR	f	2	f
110	password	\N	f	iarocci70	Waring	Iarocci		f	t	2019-11-26 09:40:45.703032+00	f		Paris	FR	f	6	f
112	password	\N	f	seetharaman79	Ellie	Seetharaman		f	t	2019-11-26 09:40:45.705497+00	f		Moscow	RU	f	9	f
113	password	\N	f	beaudry59	Kathie	Beaudry		f	t	2019-11-26 09:40:45.706824+00	f		Boston	US	f	9	f
114	password	\N	f	xpmbld95	Ursa	Xpmbld		f	t	2019-11-26 09:40:45.708109+00	f		Istanbul	TR	f	11	f
115	password	\N	f	corliss15	Corliss	Sheppard		f	t	2019-11-26 09:40:45.709493+00	f		Houston	US	f	4	f
119	password	\N	f	claudie90	Claudie	Kusan		f	t	2019-11-26 09:40:45.714473+00	f		Houston	US	f	4	f
126	password	\N	f	kikelia42	Kikelia	Foreman		f	t	2019-11-26 09:40:45.722967+00	f		New York	US	f	8	f
129	password	\N	f	leola55	Leola	Gyenes		f	t	2019-11-26 09:40:45.72679+00	f		Boston	US	f	4	f
130	password	\N	f	dickinson78	Rubin	Dickinson		f	t	2019-11-26 09:40:45.72807+00	f		Moscow	RU	f	6	f
131	password	\N	f	ninon56	Ninon	Walchli		f	t	2019-11-26 09:40:45.72933+00	f		Izmir	TR	f	8	f
46	password	\N	f	carma22	Carma	Hahn		f	t	2019-11-26 09:40:45.603863+00	f		Ankara	TR	f	4	f
47	password	\N	f	starkauskas38	Karmen	Starkauskas		f	t	2019-11-26 09:40:45.605277+00	f		Boston	US	f	8	f
48	password	\N	f	lrcrtp84	Vin	Lrcrtp		f	t	2019-11-26 09:40:45.606552+00	f		Istanbul	TR	f	10	f
49	password	\N	f	pace77	Pace	Favreau		f	t	2019-11-26 09:40:45.607807+00	f		Boston	US	f	4	f
50	password	\N	f	beaufort61	Beaufort	Lahey		f	t	2019-11-26 09:40:45.60913+00	f		Houston	US	f	5	f
51	password	\N	f	giallo32	Elroy	Giallo		f	t	2019-11-26 09:40:45.610415+00	f		New York	US	f	9	f
52	password	\N	f	wilkinson68	Rhoda	Wilkinson		f	t	2019-11-26 09:40:45.611696+00	f		New York	US	f	10	f
53	password	\N	f	giselle73	Giselle	Billingham		f	t	2019-11-26 09:40:45.612892+00	f		Izmir	TR	f	9	f
54	password	\N	f	seka96	Seka	Dubois		f	t	2019-11-26 09:40:45.614209+00	f		New York	US	f	9	f
59	password	\N	f	lenehan5	Marcella	Lenehan		f	t	2019-11-26 09:40:45.620312+00	f		Izmir	TR	f	2	f
61	password	\N	f	zaydan17	Billie	Zaydan		f	t	2019-11-26 09:40:45.622911+00	f		New York	US	f	11	f
45	password	\N	f	lichtenstein88	Alison	Lichtenstein		f	t	2019-11-26 09:40:45.596717+00	f		Ankara	TR	f	5	f
55	password	\N	f	zhelka40	Crawford	Zhelka		f	t	2019-11-26 09:40:45.615344+00	f		Istanbul	TR	f	9	f
56	password	\N	f	reichow27	Caressa	Reichow		f	t	2019-11-26 09:40:45.616541+00	f		Paris	FR	f	5	f
57	password	\N	f	volfe62	Guthry	Volfe		f	t	2019-11-26 09:40:45.617729+00	f		Paris	FR	f	5	f
58	password	\N	f	strayhorn74	Conan	Strayhorn		f	t	2019-11-26 09:40:45.618972+00	f		Paris	FR	f	6	f
60	password	\N	f	ciara49	Ciara	Crucefix		f	t	2019-11-26 09:40:45.621597+00	f		Paris	FR	f	8	f
44	pbkdf2_sha256$150000$BNEvZftUUUwQ$fJwqiycgiv+UsqHUuOX83OSzjVluc/iVGYfxdOHd0Es=	2019-12-25 11:12:16.860341+00	t	admin			traidersapp@gmail.com	t	t	2019-11-26 09:40:28.453246+00	f			TR	f	4	f
135	password	\N	f	felipe50	Felipe	Namiki		f	t	2019-11-26 09:40:45.734737+00	f		Istanbul	TR	f	4	f
137	password	\N	f	onufrak-stoner51	Shara	Onufrak-Stoner		f	t	2019-11-26 09:40:45.737463+00	f		New York	US	f	1	f
141	password	\N	f	cadd23	Amadeus	Cadd		f	t	2019-11-26 09:40:45.742455+00	f		Boston	US	f	10	f
146	password	\N	f	danit9	Danit	Cuthill		f	t	2019-11-26 09:40:45.74913+00	f		Moscow	RU	f	8	f
147	password	\N	f	valentin6	Valentin	Chattoe		f	t	2019-11-26 09:40:45.750567+00	f		Houston	US	f	1	f
150	password	\N	f	vandergeest9	Maddalena	Vandergeest		f	t	2019-11-26 09:40:45.754285+00	f		Berlin	DE	f	4	f
151	password	\N	f	de belen67	Reynold	de Belen		f	t	2019-11-26 09:40:45.755547+00	f		Izmir	TR	f	9	f
152	password	\N	f	labelle30	Simone	LaBelle		f	t	2019-11-26 09:40:45.756837+00	f		Istanbul	TR	f	8	f
158	password	\N	f	sofia90	Sofia	Faust		f	t	2019-11-26 09:40:45.764024+00	f		Boston	US	f	10	f
159	password	\N	f	marys47	Marys	Topp		f	t	2019-11-26 09:40:45.765278+00	f		Moscow	RU	f	3	f
161	password	\N	f	sinclair27	Sinclair	Acklin		f	t	2019-11-26 09:40:45.767951+00	f		Moscow	RU	f	5	f
162	password	\N	f	aurelia47	Aurelia	Choynowska		f	t	2019-11-26 09:40:45.769197+00	f		Istanbul	TR	f	1	f
163	password	\N	f	dulciana47	Dulciana	Harvey		f	t	2019-11-26 09:40:45.770465+00	f		Ankara	TR	f	9	f
165	password	\N	f	alexandrina61	Alexandrina	Dropin		f	t	2019-11-26 09:40:45.77315+00	f		New York	US	f	1	f
166	password	\N	f	tsenter8	Helge	Tsenter		f	t	2019-11-26 09:40:45.774548+00	f		New York	US	f	6	f
167	password	\N	f	girgis44	Tabor	Girgis		f	t	2019-11-26 09:40:45.77581+00	f		Berlin	DE	f	6	f
168	password	\N	f	chantal6	Chantal	Beriault		f	t	2019-11-26 09:40:45.776979+00	f		Paris	FR	f	1	f
171	password	\N	f	giamberardino78	Camilla	Giamberardino		f	t	2019-11-26 09:40:45.780701+00	f		Ankara	TR	f	8	f
174	password	\N	f	van terrie36	Ludvig	Van Terrie		f	t	2019-11-26 09:40:45.784749+00	f		Moscow	RU	f	3	f
177	password	\N	f	amalle13	Amalle	Bossert		f	t	2019-11-26 09:40:45.788358+00	f		Berlin	DE	f	5	f
178	password	\N	f	fortier98	Cindelyn	Fortier		f	t	2019-11-26 09:40:45.7896+00	f		Berlin	DE	f	6	f
180	password	\N	f	de marco29	Thaddus	De Marco		f	t	2019-11-26 09:40:45.792228+00	f		Moscow	RU	f	9	f
182	password	\N	f	jakob11	Jakob	Zilaie		f	t	2019-11-26 09:40:45.794775+00	f		Istanbul	TR	f	10	f
183	password	\N	f	immanuel20	Immanuel	Scissons		f	t	2019-11-26 09:40:45.796102+00	f		Boston	US	f	9	f
185	password	\N	f	sztein70	Cristie	Sztein		f	t	2019-11-26 09:40:45.7988+00	f		Istanbul	TR	f	7	f
186	password	\N	f	arnold65	Arnold	Burega		f	t	2019-11-26 09:40:45.800083+00	f		Istanbul	TR	f	10	f
188	password	\N	f	randy99	Randy	Askins		f	t	2019-11-26 09:40:45.802586+00	f		Berlin	DE	f	1	f
189	password	\N	f	boivin53	Allyce	Boivin		f	t	2019-11-26 09:40:45.803884+00	f		Izmir	TR	f	1	f
191	password	\N	f	odette60	Odette	Miasek		f	t	2019-11-26 09:40:45.806375+00	f		Houston	US	f	10	f
193	password	\N	f	cordelie63	Cordelie	Bruner		f	t	2019-11-26 09:40:45.808954+00	f		Ankara	TR	f	2	f
194	password	\N	f	mason83	Mason	Mabes		f	t	2019-11-26 09:40:45.810588+00	f		Moscow	RU	f	6	f
195	password	\N	f	flookes99	Frederica	Flookes		f	t	2019-11-26 09:40:45.81186+00	f		Ankara	TR	f	1	f
196	password	\N	f	sam22	Sam	Frodsham		f	t	2019-11-26 09:40:45.813036+00	f		Paris	FR	f	9	f
197	password	\N	f	berny12	Berny	Waletzky		f	t	2019-11-26 09:40:45.814282+00	f		Istanbul	TR	f	10	f
199	password	\N	f	ashwood-smith24	Joela	Ashwood-Smith		f	t	2019-11-26 09:40:45.816889+00	f		Istanbul	TR	f	9	f
200	password	\N	f	amie32	Amie	Miksik		f	t	2019-11-26 09:40:45.818085+00	f		New York	US	f	5	f
202	password	\N	f	roelofs76	Sheffield	Roelofs		f	t	2019-11-26 09:40:45.820723+00	f		Houston	US	f	7	f
134	password	\N	f	valdemar20	Valdemar	Delbrouck		f	t	2019-11-26 09:40:45.7335+00	f		Izmir	TR	f	3	f
136	password	\N	f	bourdignon87	Adey	Bourdignon		f	t	2019-11-26 09:40:45.736015+00	f		Berlin	DE	f	11	f
138	password	\N	f	bartie24	Bartie	Lundhild		f	t	2019-11-26 09:40:45.738771+00	f		Boston	US	f	6	f
139	password	\N	f	islam58	Weston	Islam		f	t	2019-11-26 09:40:45.739929+00	f		Istanbul	TR	f	3	f
140	password	\N	f	hertha53	Hertha	LRCRICH		f	t	2019-11-26 09:40:45.741178+00	f		Izmir	TR	f	3	f
142	password	\N	f	anastasiadis82	Rand	Anastasiadis		f	t	2019-11-26 09:40:45.743754+00	f		Izmir	TR	f	9	f
143	password	\N	f	tucker80	Nikita	Tucker		f	t	2019-11-26 09:40:45.745282+00	f		Istanbul	TR	f	3	f
144	password	\N	f	aubree55	Aubree	Weinkauf		f	t	2019-11-26 09:40:45.746591+00	f		Moscow	RU	f	2	f
145	password	\N	f	barry13	Katheryn	Barry		f	t	2019-11-26 09:40:45.747893+00	f		Paris	FR	f	9	f
148	password	\N	f	hinz1	Nikolai	Hinz		f	t	2019-11-26 09:40:45.751856+00	f		Boston	US	f	8	f
149	password	\N	f	maheu7	Tamara	Maheu		f	t	2019-11-26 09:40:45.753038+00	f		Istanbul	TR	f	11	f
153	password	\N	f	committe78	Lisandra	Committe		f	t	2019-11-26 09:40:45.75809+00	f		New York	US	f	2	f
154	password	\N	f	albertine65	Albertine	Jarboe		f	t	2019-11-26 09:40:45.759275+00	f		Houston	US	f	1	f
155	password	\N	f	josefa80	Josefa	Charlton		f	t	2019-11-26 09:40:45.760509+00	f		Moscow	RU	f	4	f
156	password	\N	f	clotilda22	Clotilda	Reiman		f	t	2019-11-26 09:40:45.76171+00	f		Berlin	DE	f	6	f
157	password	\N	f	van leeuwen28	Jean-Paul	van Leeuwen		f	t	2019-11-26 09:40:45.762873+00	f		Boston	US	f	1	f
160	password	\N	f	claire30	Claire	Saxena		f	t	2019-11-26 09:40:45.766728+00	f		Moscow	RU	f	10	f
164	password	\N	f	procner53	Queada	Procner		f	t	2019-11-26 09:40:45.771924+00	f		Istanbul	TR	f	6	f
169	password	\N	f	munro5	Mirabella	Munro		f	t	2019-11-26 09:40:45.778189+00	f		Boston	US	f	10	f
170	password	\N	f	geuder44	Emanuel	Geuder		f	t	2019-11-26 09:40:45.77953+00	f		Boston	US	f	2	f
172	password	\N	f	sacha55	Sacha	Brody		f	t	2019-11-26 09:40:45.781892+00	f		Moscow	RU	f	6	f
173	password	\N	f	timmerman98	Antonin	Timmerman		f	t	2019-11-26 09:40:45.783533+00	f		Paris	FR	f	7	f
175	password	\N	f	albery42	Tally	Albery		f	t	2019-11-26 09:40:45.785946+00	f		Paris	FR	f	9	f
179	password	\N	f	mohan55	Mohan	Lagrandeur		f	t	2019-11-26 09:40:45.790808+00	f		Houston	US	f	11	f
181	password	\N	f	stastny23	Sheba	Stastny		f	t	2019-11-26 09:40:45.793546+00	f		Berlin	DE	f	5	f
184	password	\N	f	clarice41	Clarice	Santitoro		f	t	2019-11-26 09:40:45.797403+00	f		Ankara	TR	f	3	f
187	password	\N	f	praneetf21	Praneetf	Felton		f	t	2019-11-26 09:40:45.801325+00	f		Paris	FR	f	11	f
190	password	\N	f	graibe62	Baily	Graibe		f	t	2019-11-26 09:40:45.805177+00	f		New York	US	f	5	f
192	password	\N	f	mariejeanne80	Mariejeanne	Miotla		f	t	2019-11-26 09:40:45.807639+00	f		Boston	US	f	5	f
198	password	\N	f	fabrice23	Fabrice	Wainwright		f	t	2019-11-26 09:40:45.815549+00	f		Houston	US	f	8	f
201	password	\N	f	fortuna57	Fortuna	Sheu		f	t	2019-11-26 09:40:45.819358+00	f		Boston	US	f	8	f
203	password	\N	f	donald2	Donald	Paulett		f	t	2019-11-26 09:40:45.82203+00	f		Paris	FR	f	8	f
204	password	\N	f	velvet14	Velvet	Rousseau		f	t	2019-11-26 09:40:45.823274+00	f		Ankara	TR	f	7	f
205	password	\N	f	broulik2	Lanny	Broulik		f	t	2019-11-26 09:40:45.824492+00	f		Moscow	RU	f	4	f
206	password	\N	f	ventura1	Patience	Ventura		f	t	2019-11-26 09:40:45.825826+00	f		Istanbul	TR	f	2	f
208	password	\N	f	salvato58	Sue	Salvato		f	t	2019-11-26 09:40:45.828542+00	f		Moscow	RU	f	3	f
210	password	\N	f	trixy69	Trixy	Spohn		f	t	2019-11-26 09:40:45.831093+00	f		Houston	US	f	7	f
212	password	\N	f	lorianne59	Lorianne	Skerry		f	t	2019-11-26 09:40:45.833714+00	f		Istanbul	TR	f	7	f
213	password	\N	f	ozmore84	Charlie	Ozmore		f	t	2019-11-26 09:40:45.834943+00	f		Moscow	RU	f	6	f
214	password	\N	f	silvan12	Silvan	Services		f	t	2019-11-26 09:40:45.836255+00	f		Istanbul	TR	f	7	f
219	password	\N	f	valente82	Rolf	Valente		f	t	2019-11-26 09:40:45.842693+00	f		Paris	FR	f	5	f
220	password	\N	f	shostak67	Mort	Shostak		f	t	2019-11-26 09:40:45.843895+00	f		Boston	US	f	7	f
221	password	\N	f	maclean90	Arne	MacLean		f	t	2019-11-26 09:40:45.84528+00	f		Berlin	DE	f	10	f
223	password	\N	f	mchan21	Ferdinand	McHan		f	t	2019-11-26 09:40:45.863855+00	f		Ankara	TR	f	8	f
227	password	\N	f	latisha26	Latisha	Zoehner		f	t	2019-11-26 09:40:45.903895+00	f		Izmir	TR	f	4	f
231	password	\N	f	buehler79	Shannon	Buehler		f	t	2019-11-26 09:40:45.943794+00	f		Berlin	DE	f	1	f
235	password	\N	f	markham88	Sterne	Markham		f	t	2019-11-26 09:40:45.983862+00	f		Berlin	DE	f	6	f
236	password	\N	f	hughson78	Merilyn	Hughson		f	t	2019-11-26 09:40:45.993867+00	f		Ankara	TR	f	6	f
238	password	\N	f	gerri98	Gerri	Dubeau		f	t	2019-11-26 09:40:46.013868+00	f		Berlin	DE	f	6	f
239	password	\N	f	brina77	Brina	Hoeksma		f	t	2019-11-26 09:40:46.023793+00	f		Moscow	RU	f	2	f
241	password	\N	f	cissy95	Cissy	Bunzey		f	t	2019-11-26 09:40:46.043717+00	f		Houston	US	f	9	f
242	password	\N	f	kalyani98	Gloria	Kalyani		f	t	2019-11-26 09:40:46.053796+00	f		Paris	FR	f	2	f
246	password	\N	f	yao40	Raine	Yao		f	t	2019-11-26 09:40:46.093824+00	f		Izmir	TR	f	3	f
247	password	\N	f	smook38	Dena	Smook		f	t	2019-11-26 09:40:46.103757+00	f		Izmir	TR	f	9	f
248	password	\N	f	tab71	Tab	Tiberghien		f	t	2019-11-26 09:40:46.113934+00	f		Moscow	RU	f	1	f
249	password	\N	f	jules69	Jules	Blacklock		f	t	2019-11-26 09:40:46.123699+00	f		Boston	US	f	1	f
253	password	\N	f	anthea9	Anthea	Brooksbank		f	t	2019-11-26 09:40:46.163759+00	f		Paris	FR	f	5	f
258	password	\N	f	rege14	Powell	Rege		f	t	2019-11-26 09:40:46.21383+00	f		Boston	US	f	4	f
259	password	\N	f	bettie91	Bettie	Comeau		f	t	2019-11-26 09:40:46.223729+00	f		Berlin	DE	f	6	f
261	password	\N	f	mavis20	Ritchie	Mavis		f	t	2019-11-26 09:40:46.243786+00	f		Moscow	RU	f	3	f
264	password	\N	f	uriah92	Uriah	Pomerleau		f	t	2019-11-26 09:40:46.273804+00	f		Berlin	DE	f	5	f
266	password	\N	f	skillen95	Lizabeth	Skillen		f	t	2019-11-26 09:40:46.293833+00	f		New York	US	f	3	f
269	password	\N	f	caison56	Jaimie	Caison		f	t	2019-11-26 09:40:46.323746+00	f		Houston	US	f	1	f
270	password	\N	f	lincoln89	Lincoln	Nedderman		f	t	2019-11-26 09:40:46.333765+00	f		Izmir	TR	f	3	f
272	password	\N	f	lewinski24	Elysha	Lewinski		f	t	2019-11-26 09:40:46.35378+00	f		Ankara	TR	f	3	f
273	password	\N	f	rik53	Rik	Thoms		f	t	2019-11-26 09:40:46.363763+00	f		Boston	US	f	10	f
274	password	\N	f	broderic47	Broderic	Yabe		f	t	2019-11-26 09:40:46.373809+00	f		Houston	US	f	9	f
209	password	\N	f	walz21	Gretel	Walz		f	t	2019-11-26 09:40:45.829818+00	f		Izmir	TR	f	8	f
211	password	\N	f	garnette4	Garnette	Shuster		f	t	2019-11-26 09:40:45.832323+00	f		Houston	US	f	5	f
216	password	\N	f	ulick4	Ulick	Braaksma		f	t	2019-11-26 09:40:45.838827+00	f		New York	US	f	2	f
217	password	\N	f	gianina83	Gianina	Messerian		f	t	2019-11-26 09:40:45.840059+00	f		Boston	US	f	6	f
218	password	\N	f	ancel86	Lil	Ancel		f	t	2019-11-26 09:40:45.841438+00	f		Paris	FR	f	5	f
222	password	\N	f	alys9	Alys	KleynenbergNTNTCA		f	t	2019-11-26 09:40:45.853807+00	f		Moscow	RU	f	7	f
224	password	\N	f	metcalfe30	Skipper	Metcalfe		f	t	2019-11-26 09:40:45.873796+00	f		Istanbul	TR	f	7	f
225	password	\N	f	navarro68	Roarke	Navarro		f	t	2019-11-26 09:40:45.88391+00	f		New York	US	f	7	f
226	password	\N	f	beggs69	Karlie	Beggs		f	t	2019-11-26 09:40:45.893803+00	f		Ankara	TR	f	6	f
228	password	\N	f	andromeda72	Andromeda	Huether		f	t	2019-11-26 09:40:45.913793+00	f		Ankara	TR	f	3	f
229	password	\N	f	desmond89	Desmond	McPherson		f	t	2019-11-26 09:40:45.923996+00	f		Berlin	DE	f	1	f
230	password	\N	f	layla37	Layla	Callery		f	t	2019-11-26 09:40:45.933874+00	f		New York	US	f	4	f
232	password	\N	f	grissel23	Grissel	Michailov		f	t	2019-11-26 09:40:45.953762+00	f		Houston	US	f	9	f
233	password	\N	f	teichman73	Clarisse	Teichman		f	t	2019-11-26 09:40:45.963811+00	f		New York	US	f	10	f
234	password	\N	f	phylis68	Phylis	Bassignana		f	t	2019-11-26 09:40:45.973888+00	f		Berlin	DE	f	8	f
237	password	\N	f	gunther29	Gunther	Sedran		f	t	2019-11-26 09:40:46.003853+00	f		Moscow	RU	f	6	f
240	password	\N	f	schnirer73	Duke	Schnirer		f	t	2019-11-26 09:40:46.033904+00	f		Ankara	TR	f	4	f
243	password	\N	f	olmstead23	Penelope	Olmstead		f	t	2019-11-26 09:40:46.063833+00	f		Berlin	DE	f	1	f
244	password	\N	f	decacqueray96	Kennedy	DeCacqueray		f	t	2019-11-26 09:40:46.073788+00	f		New York	US	f	4	f
245	password	\N	f	rasia85	Rasia	Burge		f	t	2019-11-26 09:40:46.083769+00	f		Houston	US	f	11	f
250	password	\N	f	theodosia84	Theodosia	Holliday		f	t	2019-11-26 09:40:46.133908+00	f		Houston	US	f	9	f
251	password	\N	f	peterman49	Aram	Peterman		f	t	2019-11-26 09:40:46.143776+00	f		Ankara	TR	f	8	f
252	password	\N	f	randi66	Randi	Speight		f	t	2019-11-26 09:40:46.153786+00	f		New York	US	f	1	f
254	password	\N	f	passier7	Layney	Passier		f	t	2019-11-26 09:40:46.173942+00	f		Berlin	DE	f	2	f
255	password	\N	f	corrie38	Corrie	Bvworks		f	t	2019-11-26 09:40:46.183798+00	f		Boston	US	f	11	f
256	password	\N	f	shellie11	Shellie	Peluso		f	t	2019-11-26 09:40:46.193844+00	f		Izmir	TR	f	1	f
257	password	\N	f	reine22	Reine	Antonarelli		f	t	2019-11-26 09:40:46.203733+00	f		Moscow	RU	f	6	f
260	password	\N	f	pratt73	Christ	Pratt		f	t	2019-11-26 09:40:46.23385+00	f		New York	US	f	1	f
262	password	\N	f	wildeman67	Simona	Wildeman		f	t	2019-11-26 09:40:46.253854+00	f		New York	US	f	2	f
263	password	\N	f	schmidt93	Sergei	Schmidt		f	t	2019-11-26 09:40:46.263782+00	f		Boston	US	f	3	f
267	password	\N	f	blaauw40	Giraldo	Blaauw		f	t	2019-11-26 09:40:46.303804+00	f		Paris	FR	f	3	f
268	password	\N	f	shayne95	Shayne	Da		f	t	2019-11-26 09:40:46.313813+00	f		Paris	FR	f	6	f
271	password	\N	f	jemimah62	Jemimah	Guilbert		f	t	2019-11-26 09:40:46.343801+00	f		Moscow	RU	f	3	f
275	password	\N	f	johnette29	Johnette	Nolet		f	t	2019-11-26 09:40:46.383771+00	f		Houston	US	f	3	f
276	password	\N	f	wimmer37	Gonzales	Wimmer		f	t	2019-11-26 09:40:46.393781+00	f		New York	US	f	7	f
278	password	\N	f	montreuil94	Wenda	Montreuil		f	t	2019-11-26 09:40:46.413829+00	f		Paris	FR	f	5	f
280	password	\N	f	dann71	Marcellina	Dann		f	t	2019-11-26 09:40:46.443782+00	f		Houston	US	f	2	f
283	password	\N	f	reid37	Reid	Tiwari		f	t	2019-11-26 09:40:46.473803+00	f		Paris	FR	f	3	f
284	password	\N	f	skylar70	Skylar	Langner		f	t	2019-11-26 09:40:46.483836+00	f		New York	US	f	3	f
285	password	\N	f	susannah30	Susannah	Soyster		f	t	2019-11-26 09:40:46.493823+00	f		Istanbul	TR	f	6	f
286	password	\N	f	caves10	Christel	Caves		f	t	2019-11-26 09:40:46.503969+00	f		Houston	US	f	9	f
287	password	\N	f	berke44	Berke	Gurer		f	t	2019-11-26 09:40:46.51382+00	f		Izmir	TR	f	8	f
290	password	\N	f	giertych42	Taddeus	Giertych		f	t	2019-11-26 09:40:46.543887+00	f		Berlin	DE	f	8	f
293	password	\N	f	ormsby67	Delora	Ormsby		f	t	2019-11-26 09:40:46.573782+00	f		Paris	FR	f	2	f
295	password	\N	f	srinivas100	Srinivas	Woodyer		f	t	2019-11-26 09:40:46.5938+00	f		Boston	US	f	10	f
299	password	\N	f	abelard13	Abelard	Ross		f	t	2019-11-26 09:40:46.633785+00	f		Moscow	RU	f	4	f
301	password	\N	f	cathlene63	Cathlene	Obenauf		f	t	2019-11-26 09:40:46.653884+00	f		Paris	FR	f	8	f
302	password	\N	f	sales72	Lester	Sales		f	t	2019-11-26 09:40:46.663841+00	f		Berlin	DE	f	2	f
304	password	\N	f	cobban77	Ware	Cobban		f	t	2019-11-26 09:40:46.683774+00	f		Izmir	TR	f	4	f
305	password	\N	f	roseanne30	Roseanne	Momtahan		f	t	2019-11-26 09:40:46.693784+00	f		Istanbul	TR	f	5	f
307	password	\N	f	hari87	Hari	TestNTMVAB		f	t	2019-11-26 09:40:46.713813+00	f		New York	US	f	9	f
308	password	\N	f	emil16	Emil	Savarimuthu		f	t	2019-11-26 09:40:46.723795+00	f		Moscow	RU	f	4	f
310	password	\N	f	potocki27	Stewart	Potocki		f	t	2019-11-26 09:40:46.743828+00	f		Ankara	TR	f	8	f
311	password	\N	f	boone56	Rowena	Boone		f	t	2019-11-26 09:40:46.753794+00	f		Houston	US	f	9	f
314	password	\N	f	zaidi89	Yovonnda	Zaidi		f	t	2019-11-26 09:40:46.783791+00	f		Boston	US	f	4	f
317	password	\N	f	raddalgoda39	Granville	Raddalgoda		f	t	2019-11-26 09:40:46.813796+00	f		Izmir	TR	f	8	f
320	password	\N	f	berneche7	Poppy	Berneche		f	t	2019-11-26 09:40:46.843954+00	f		Ankara	TR	f	8	f
323	password	\N	f	isidore64	Isidore	Woloshko		f	t	2019-11-26 09:40:46.903812+00	f		Izmir	TR	f	7	f
324	password	\N	f	demetra11	Demetra	Burdick		f	t	2019-11-26 09:40:46.913868+00	f		New York	US	f	6	f
325	password	\N	f	yakibchuk53	Tommy	Yakibchuk		f	t	2019-11-26 09:40:46.923793+00	f		Houston	US	f	7	f
326	password	\N	f	emelita13	Emelita	Gillespy		f	t	2019-11-26 09:40:46.933839+00	f		New York	US	f	9	f
327	password	\N	f	tropeano33	Catina	Tropeano		f	t	2019-11-26 09:40:46.943814+00	f		Boston	US	f	4	f
329	password	\N	f	tarver43	Sampson	Tarver		f	t	2019-11-26 09:40:46.963794+00	f		Ankara	TR	f	4	f
330	password	\N	f	fred16	Fred	Rains		f	t	2019-11-26 09:40:46.973851+00	f		New York	US	f	6	f
332	password	\N	f	ginger80	Ginger	Bienek		f	t	2019-11-26 09:40:46.99384+00	f		Houston	US	f	1	f
333	password	\N	f	maritan18	Yvette	Maritan		f	t	2019-11-26 09:40:47.003716+00	f		Izmir	TR	f	10	f
334	password	\N	f	leigh49	Leigh	Eason		f	t	2019-11-26 09:40:47.013779+00	f		Berlin	DE	f	10	f
338	password	\N	f	mcdowall5	Nonna	McDowall		f	t	2019-11-26 09:40:47.073896+00	f		Houston	US	f	2	f
339	password	\N	f	laliberte19	Gwenni	Laliberte		f	t	2019-11-26 09:40:47.083757+00	f		Berlin	DE	f	9	f
340	password	\N	f	noelani35	Noelani	Ebrahim		f	t	2019-11-26 09:40:47.093808+00	f		Izmir	TR	f	5	f
342	password	\N	f	vanaman81	Jorey	Vanaman		f	t	2019-11-26 09:40:47.113774+00	f		Ankara	TR	f	6	f
345	password	\N	f	garcia22	Garcia	Befanis		f	t	2019-11-26 09:40:47.143776+00	f		Ankara	TR	f	9	f
346	password	\N	f	hermon90	Hermon	Tomes		f	t	2019-11-26 09:40:47.153761+00	f		Moscow	RU	f	1	f
279	password	\N	f	tebbe42	Cleland	Tebbe		f	t	2019-11-26 09:40:46.434084+00	f		Paris	FR	f	1	f
281	password	\N	f	thornburg39	Elinor	Thornburg		f	t	2019-11-26 09:40:46.453816+00	f		New York	US	f	9	f
282	password	\N	f	starlene13	Starlene	Juhan		f	t	2019-11-26 09:40:46.463804+00	f		Paris	FR	f	7	f
288	password	\N	f	towney95	Towney	Ruzicka		f	t	2019-11-26 09:40:46.523787+00	f		Berlin	DE	f	6	f
289	password	\N	f	gendre1	Allan	Gendre		f	t	2019-11-26 09:40:46.533895+00	f		Ankara	TR	f	8	f
291	password	\N	f	layton78	Layton	Negandhi		f	t	2019-11-26 09:40:46.553861+00	f		Paris	FR	f	9	f
294	password	\N	f	swinson88	Cyril	Swinson		f	t	2019-11-26 09:40:46.583918+00	f		Berlin	DE	f	1	f
296	password	\N	f	welsh24	Welsh	Ginest		f	t	2019-11-26 09:40:46.603825+00	f		Izmir	TR	f	3	f
297	password	\N	f	lun57	Herrick	Lun		f	t	2019-11-26 09:40:46.613841+00	f		Ankara	TR	f	6	f
298	password	\N	f	goza26	Georgeta	Goza		f	t	2019-11-26 09:40:46.62399+00	f		Ankara	TR	f	5	f
300	password	\N	f	grimsley5	Sibyl	Grimsley		f	t	2019-11-26 09:40:46.643903+00	f		Berlin	DE	f	6	f
303	password	\N	f	joyann30	Joyann	Flatley		f	t	2019-11-26 09:40:46.673845+00	f		Berlin	DE	f	11	f
306	password	\N	f	orser93	Talya	Orser		f	t	2019-11-26 09:40:46.703749+00	f		Ankara	TR	f	3	f
309	password	\N	f	vivianna16	Vivianna	Materna		f	t	2019-11-26 09:40:46.733742+00	f		Ankara	TR	f	9	f
312	password	\N	f	davidson18	Davidson	Mariotti		f	t	2019-11-26 09:40:46.763872+00	f		Houston	US	f	2	f
313	password	\N	f	hammonds36	Roxana	Hammonds		f	t	2019-11-26 09:40:46.773781+00	f		Houston	US	f	1	f
315	password	\N	f	yamada83	Roni	Yamada		f	t	2019-11-26 09:40:46.793797+00	f		Ankara	TR	f	8	f
316	password	\N	f	rtprelb82	Carli	Rtprelb		f	t	2019-11-26 09:40:46.803716+00	f		Istanbul	TR	f	3	f
318	password	\N	f	menaker99	Rissa	Menaker		f	t	2019-11-26 09:40:46.823733+00	f		Ankara	TR	f	2	f
319	password	\N	f	tabbi100	Tabbi	Olinyk		f	t	2019-11-26 09:40:46.833811+00	f		Moscow	RU	f	10	f
321	password	\N	f	hindson84	Darci	Hindson		f	t	2019-11-26 09:40:46.88398+00	f		Houston	US	f	8	f
322	password	\N	f	geoffrion71	Avie	Geoffrion		f	t	2019-11-26 09:40:46.893772+00	f		Istanbul	TR	f	11	f
328	password	\N	f	isabel61	Isabel	Parmigiani		f	t	2019-11-26 09:40:46.953959+00	f		Ankara	TR	f	5	f
331	password	\N	f	waly10	Waly	Comstock		f	t	2019-11-26 09:40:46.983865+00	f		Boston	US	f	2	f
335	password	\N	f	cinicolo23	Malva	Cinicolo		f	t	2019-11-26 09:40:47.023802+00	f		Berlin	DE	f	10	f
336	password	\N	f	fayette21	Fayette	Barkhouse		f	t	2019-11-26 09:40:47.033811+00	f		Ankara	TR	f	7	f
337	password	\N	f	alonso31	Alonso	Gatka		f	t	2019-11-26 09:40:47.043786+00	f		Istanbul	TR	f	1	f
341	password	\N	f	charissa50	Charissa	Burton		f	t	2019-11-26 09:40:47.103816+00	f		Paris	FR	f	7	f
343	password	\N	f	forrester19	Forrester	Shears		f	t	2019-11-26 09:40:47.123843+00	f		Istanbul	TR	f	6	f
344	password	\N	f	edkins97	Gusty	Edkins		f	t	2019-11-26 09:40:47.133891+00	f		Izmir	TR	f	9	f
347	password	\N	f	flin73	Flin	Luin		f	t	2019-11-26 09:40:47.163756+00	f		Berlin	DE	f	3	f
348	password	\N	f	antonin76	Antonin	Estes		f	t	2019-11-26 09:40:47.17378+00	f		Boston	US	f	3	f
349	password	\N	f	roana55	Roana	Demren		f	t	2019-11-26 09:40:47.183722+00	f		Izmir	TR	f	5	f
351	password	\N	f	theodoric13	Theodoric	Nolet		f	t	2019-11-26 09:40:47.203755+00	f		Izmir	TR	f	4	f
353	password	\N	f	aram38	Aram	Ronan		f	t	2019-11-26 09:40:47.223831+00	f		Moscow	RU	f	3	f
355	password	\N	f	virani96	Deena	Virani		f	t	2019-11-26 09:40:47.243915+00	f		Houston	US	f	7	f
358	password	\N	f	markell19	Albrecht	Markell		f	t	2019-11-26 09:40:47.283904+00	f		Houston	US	f	7	f
359	password	\N	f	katusha60	Katusha	Schejbal		f	t	2019-11-26 09:40:47.293904+00	f		Izmir	TR	f	4	f
361	password	\N	f	marlowe82	Marlowe	Neto		f	t	2019-11-26 09:40:47.333906+00	f		New York	US	f	7	f
362	password	\N	f	stokoski72	Kissiah	Stokoski		f	t	2019-11-26 09:40:47.343772+00	f		Boston	US	f	2	f
364	password	\N	f	nash20	Bobinette	Nash		f	t	2019-11-26 09:40:47.363821+00	f		New York	US	f	8	f
365	password	\N	f	demetris70	Demetris	Gantt		f	t	2019-11-26 09:40:47.373874+00	f		Istanbul	TR	f	6	f
367	password	\N	f	shayne27	Shayne	Vieillard-Baron		f	t	2019-11-26 09:40:47.393828+00	f		Houston	US	f	1	f
368	password	\N	f	brosso76	Gabey	Brosso		f	t	2019-11-26 09:40:47.403814+00	f		Boston	US	f	7	f
369	password	\N	f	ientile97	Rosette	Ientile		f	t	2019-11-26 09:40:47.413805+00	f		Moscow	RU	f	7	f
372	password	\N	f	gillian5	Gillian	Belaire		f	t	2019-11-26 09:40:47.443798+00	f		Berlin	DE	f	9	f
377	password	\N	f	wayler6	Oral	Wayler		f	t	2019-11-26 09:40:47.493845+00	f		New York	US	f	8	f
380	password	\N	f	crain13	Kaiser	Crain		f	t	2019-11-26 09:40:47.523798+00	f		Istanbul	TR	f	2	f
381	password	\N	f	thumm50	Terrill	Thumm		f	t	2019-11-26 09:40:47.533827+00	f		Houston	US	f	4	f
382	password	\N	f	quent13	Quent	Ruban		f	t	2019-11-26 09:40:47.553921+00	f		Boston	US	f	3	f
383	password	\N	f	fogelson82	Meridith	Fogelson		f	t	2019-11-26 09:40:47.563944+00	f		Houston	US	f	7	f
386	password	\N	f	hanson87	Laverne	Hanson		f	t	2019-11-26 09:40:47.593833+00	f		Moscow	RU	f	3	f
387	password	\N	f	dept79	Kane	Dept		f	t	2019-11-26 09:40:47.603863+00	f		Istanbul	TR	f	6	f
389	password	\N	f	duke94	Duke	Dalsiel		f	t	2019-11-26 09:40:47.62381+00	f		Istanbul	TR	f	5	f
394	password	\N	f	culp37	Willy	Culp		f	t	2019-11-26 09:40:47.673844+00	f		Boston	US	f	8	f
395	password	\N	f	braddock67	Sharia	Braddock		f	t	2019-11-26 09:40:47.683811+00	f		New York	US	f	6	f
396	password	\N	f	ilic32	Benita	Ilic		f	t	2019-11-26 09:40:47.693869+00	f		Moscow	RU	f	3	f
400	password	\N	f	elden13	Elden	Robins		f	t	2019-11-26 09:40:47.733809+00	f		Paris	FR	f	9	f
402	password	\N	f	elinor82	Elinor	Drane		f	t	2019-11-26 09:40:47.753795+00	f		New York	US	f	10	f
406	password	\N	f	gemmill70	Carlynne	Gemmill		f	t	2019-11-26 09:40:47.793795+00	f		Moscow	RU	f	1	f
407	password	\N	f	jennette61	Dotti	Jennette		f	t	2019-11-26 09:40:47.803766+00	f		Ankara	TR	f	3	f
413	password	\N	f	nicholas85	Isaak	Nicholas		f	t	2019-11-26 09:40:47.863831+00	f		Istanbul	TR	f	8	f
416	password	\N	f	yerigan34	Sharyl	Yerigan		f	t	2019-11-26 09:40:47.893805+00	f		Ankara	TR	f	5	f
417	password	\N	f	ike71	Ike	Brait		f	t	2019-11-26 09:40:47.903843+00	f		Moscow	RU	f	10	f
419	password	\N	f	cossota26	Koral	Cossota		f	t	2019-11-26 09:40:47.923755+00	f		Istanbul	TR	f	1	f
352	password	\N	f	lucinda34	Lucinda	De Souza		f	t	2019-11-26 09:40:47.213793+00	f		Berlin	DE	f	10	f
354	password	\N	f	genni72	Genni	Challice		f	t	2019-11-26 09:40:47.233773+00	f		Izmir	TR	f	3	f
356	password	\N	f	betsey64	Betsey	Connelly		f	t	2019-11-26 09:40:47.253825+00	f		Istanbul	TR	f	2	f
357	password	\N	f	hakeem61	Hakeem	McEwen		f	t	2019-11-26 09:40:47.273899+00	f		Boston	US	f	4	f
360	password	\N	f	dallas71	Dallas	Hagstrom		f	t	2019-11-26 09:40:47.303804+00	f		Paris	FR	f	3	f
363	password	\N	f	fallon100	Fallon	Isfan		f	t	2019-11-26 09:40:47.353763+00	f		Berlin	DE	f	1	f
366	password	\N	f	bastien97	Yolanda	Bastien		f	t	2019-11-26 09:40:47.383793+00	f		Paris	FR	f	11	f
370	password	\N	f	hage28	Jean-Francois	Hage		f	t	2019-11-26 09:40:47.42382+00	f		Ankara	TR	f	5	f
373	password	\N	f	dari65	Dari	Griswold		f	t	2019-11-26 09:40:47.453858+00	f		Berlin	DE	f	5	f
374	password	\N	f	admin18	Paton	Admin		f	t	2019-11-26 09:40:47.463825+00	f		New York	US	f	9	f
375	password	\N	f	corsale9	Charlean	Corsale		f	t	2019-11-26 09:40:47.473794+00	f		Istanbul	TR	f	3	f
376	password	\N	f	nagle74	Jordain	Nagle		f	t	2019-11-26 09:40:47.48384+00	f		Moscow	RU	f	1	f
378	password	\N	f	wald64	Wald	Attard		f	t	2019-11-26 09:40:47.503793+00	f		New York	US	f	2	f
379	password	\N	f	pieter10	Pieter	Jodoin-St.Jean		f	t	2019-11-26 09:40:47.513814+00	f		Boston	US	f	6	f
384	password	\N	f	hendrika17	Hendrika	Logue		f	t	2019-11-26 09:40:47.573926+00	f		Paris	FR	f	5	f
385	password	\N	f	bestavros26	Burl	Bestavros		f	t	2019-11-26 09:40:47.583837+00	f		Moscow	RU	f	11	f
388	password	\N	f	lister83	Rita	Lister		f	t	2019-11-26 09:40:47.613819+00	f		Houston	US	f	3	f
390	password	\N	f	monteggia8	Rickard	Monteggia		f	t	2019-11-26 09:40:47.633873+00	f		New York	US	f	11	f
391	password	\N	f	breslin86	Murdock	Breslin		f	t	2019-11-26 09:40:47.643854+00	f		Istanbul	TR	f	8	f
392	password	\N	f	deonne62	Deonne	Easterling		f	t	2019-11-26 09:40:47.653828+00	f		Moscow	RU	f	9	f
393	password	\N	f	jacquelynn22	Jacquelynn	Pompeo		f	t	2019-11-26 09:40:47.663761+00	f		New York	US	f	8	f
397	password	\N	f	stephi41	Stephi	Zadorozny		f	t	2019-11-26 09:40:47.703833+00	f		New York	US	f	10	f
398	password	\N	f	doucet65	Kristel	Doucet		f	t	2019-11-26 09:40:47.713806+00	f		Ankara	TR	f	8	f
399	password	\N	f	trixy99	Trixy	Hariman		f	t	2019-11-26 09:40:47.723769+00	f		Ankara	TR	f	11	f
401	password	\N	f	margalit79	Margalit	Bhatti		f	t	2019-11-26 09:40:47.74381+00	f		Paris	FR	f	8	f
403	password	\N	f	gilmour85	Cleveland	Gilmour		f	t	2019-11-26 09:40:47.763814+00	f		Boston	US	f	5	f
404	password	\N	f	jasmine1	Jasmine	Tussey		f	t	2019-11-26 09:40:47.773831+00	f		Boston	US	f	11	f
405	password	\N	f	svm-bnrmtvb94	Abby	SVM-BNRMTVB		f	t	2019-11-26 09:40:47.783806+00	f		Boston	US	f	4	f
408	password	\N	f	rama99	Valentia	Rama		f	t	2019-11-26 09:40:47.813829+00	f		New York	US	f	2	f
409	password	\N	f	avie81	Avie	Hickerson		f	t	2019-11-26 09:40:47.823746+00	f		Moscow	RU	f	9	f
410	password	\N	f	deborah69	Deborah	Killam		f	t	2019-11-26 09:40:47.833882+00	f		Houston	US	f	7	f
411	password	\N	f	lebon72	Cosette	Lebon		f	t	2019-11-26 09:40:47.84382+00	f		New York	US	f	3	f
412	password	\N	f	cunha-gomes99	Kaspar	Cunha-Gomes		f	t	2019-11-26 09:40:47.853809+00	f		Berlin	DE	f	6	f
414	password	\N	f	bielejeski20	Sky	Bielejeski		f	t	2019-11-26 09:40:47.873778+00	f		Paris	FR	f	11	f
415	password	\N	f	joellyn84	Joellyn	McClennon		f	t	2019-11-26 09:40:47.883743+00	f		New York	US	f	10	f
418	password	\N	f	huether4	Harriett	Huether		f	t	2019-11-26 09:40:47.913783+00	f		Istanbul	TR	f	4	f
421	password	\N	f	nari11	Nari	Heaton		f	t	2019-11-26 09:40:47.943834+00	f		Paris	FR	f	1	f
422	password	\N	f	wray48	Waite	Wray		f	t	2019-11-26 09:40:47.953934+00	f		Ankara	TR	f	6	f
423	password	\N	f	janella52	Janella	Onsy		f	t	2019-11-26 09:40:47.96383+00	f		Istanbul	TR	f	7	f
424	password	\N	f	lin3	Lin	Kokosopoulos		f	t	2019-11-26 09:40:47.973837+00	f		Paris	FR	f	5	f
425	password	\N	f	laforge16	Worden	Laforge		f	t	2019-11-26 09:40:47.983861+00	f		Izmir	TR	f	5	f
427	password	\N	f	hudson78	Cher	Hudson		f	t	2019-11-26 09:40:48.003822+00	f		New York	US	f	4	f
429	password	\N	f	o'neal77	Flossi	O'Neal		f	t	2019-11-26 09:40:48.023982+00	f		New York	US	f	7	f
432	password	\N	f	sibel50	Sibel	Schaefer		f	t	2019-11-26 09:40:48.053797+00	f		Paris	FR	f	9	f
435	password	\N	f	daisi4	Daisi	Mapile		f	t	2019-11-26 09:40:48.083776+00	f		Paris	FR	f	10	f
437	password	\N	f	koeller15	Joaquin	Koeller		f	t	2019-11-26 09:40:48.103807+00	f		Moscow	RU	f	1	f
441	password	\N	f	orford54	Abbot	Orford		f	t	2019-11-26 09:40:48.143733+00	f		New York	US	f	8	f
444	password	\N	f	kellen66	Kellen	McGowan		f	t	2019-11-26 09:40:48.17379+00	f		Izmir	TR	f	7	f
452	password	\N	f	basa11	Jannel	Basa		f	t	2019-11-26 09:40:48.25379+00	f		Moscow	RU	f	5	f
453	password	\N	f	guciz81	Joice	Guciz		f	t	2019-11-26 09:40:48.263737+00	f		Berlin	DE	f	1	f
456	password	\N	f	carlsen65	Costa	Carlsen		f	t	2019-11-26 09:40:48.293762+00	f		Berlin	DE	f	3	f
457	password	\N	f	schumacher86	Michal	Schumacher		f	t	2019-11-26 09:40:48.303737+00	f		Moscow	RU	f	6	f
461	password	\N	f	rivkah59	Rivkah	Kornitzer		f	t	2019-11-26 09:40:48.343716+00	f		Istanbul	TR	f	4	f
463	password	\N	f	xenia73	Xenia	Tennant		f	t	2019-11-26 09:40:48.363723+00	f		Paris	FR	f	6	f
465	password	\N	f	lynett49	Lynett	Chanpong		f	t	2019-11-26 09:40:48.383772+00	f		Istanbul	TR	f	5	f
466	password	\N	f	dufresne99	Cosette	Dufresne		f	t	2019-11-26 09:40:48.393799+00	f		New York	US	f	3	f
469	password	\N	f	desmarais70	Shayne	Desmarais		f	t	2019-11-26 09:40:48.423722+00	f		Berlin	DE	f	1	f
475	password	\N	f	pavia38	Pavia	Talbot		f	t	2019-11-26 09:40:48.483818+00	f		Paris	FR	f	2	f
476	password	\N	f	onder56	Ely	Onder		f	t	2019-11-26 09:40:48.493784+00	f		Berlin	DE	f	8	f
477	password	\N	f	vally60	Vally	Coulson		f	t	2019-11-26 09:40:48.503818+00	f		Izmir	TR	f	4	f
480	password	\N	f	gillan20	Gillan	Edkins		f	t	2019-11-26 09:40:48.53379+00	f		Moscow	RU	f	4	f
483	password	\N	f	trotsky18	Paola	Trotsky		f	t	2019-11-26 09:40:48.563816+00	f		Ankara	TR	f	8	f
484	password	\N	f	constable51	Stinky	Constable		f	t	2019-11-26 09:40:48.573784+00	f		Berlin	DE	f	9	f
488	password	\N	f	fairlie59	Grete	Fairlie		f	t	2019-11-26 09:40:48.613791+00	f		Istanbul	TR	f	3	f
489	password	\N	f	cobbold37	Wendie	Cobbold		f	t	2019-11-26 09:40:48.623832+00	f		Berlin	DE	f	1	f
492	password	\N	f	deslandes80	Tansy	Deslandes		f	t	2019-11-26 09:40:48.653767+00	f		Boston	US	f	9	f
426	password	\N	f	groleau89	Cheston	Groleau		f	t	2019-11-26 09:40:47.993792+00	f		Paris	FR	f	5	f
430	password	\N	f	fenelia71	Fenelia	Steinberg		f	t	2019-11-26 09:40:48.033832+00	f		Paris	FR	f	10	f
431	password	\N	f	zen7	Lora	Zen		f	t	2019-11-26 09:40:48.043878+00	f		Berlin	DE	f	4	f
433	password	\N	f	caine19	Hester	Caine		f	t	2019-11-26 09:40:48.063809+00	f		Moscow	RU	f	5	f
434	password	\N	f	attarchi74	Amata	Attarchi		f	t	2019-11-26 09:40:48.07379+00	f		Moscow	RU	f	3	f
436	password	\N	f	pincus18	Pincus	Milakovic		f	t	2019-11-26 09:40:48.093793+00	f		Moscow	RU	f	9	f
438	password	\N	f	wingrove65	Eulalie	Wingrove		f	t	2019-11-26 09:40:48.113766+00	f		Moscow	RU	f	1	f
439	password	\N	f	steede67	Forrester	Steede		f	t	2019-11-26 09:40:48.123761+00	f		Berlin	DE	f	10	f
440	password	\N	f	banerd20	Konstance	Banerd		f	t	2019-11-26 09:40:48.133848+00	f		Berlin	DE	f	9	f
442	password	\N	f	missie97	Missie	Mis		f	t	2019-11-26 09:40:48.153784+00	f		Ankara	TR	f	1	f
443	password	\N	f	pilip44	Gigi	Pilip		f	t	2019-11-26 09:40:48.163869+00	f		New York	US	f	9	f
445	password	\N	f	hestia12	Hestia	Ashar		f	t	2019-11-26 09:40:48.183799+00	f		Ankara	TR	f	7	f
446	password	\N	f	awadalla20	Zared	Awadalla		f	t	2019-11-26 09:40:48.193801+00	f		Istanbul	TR	f	2	f
447	password	\N	f	pam18	Pam	Canavan		f	t	2019-11-26 09:40:48.203739+00	f		Ankara	TR	f	6	f
448	password	\N	f	tarrant32	Leoline	Tarrant		f	t	2019-11-26 09:40:48.213789+00	f		Istanbul	TR	f	11	f
449	password	\N	f	sergi51	Daryl	Sergi		f	t	2019-11-26 09:40:48.223896+00	f		Moscow	RU	f	9	f
450	password	\N	f	federico57	Federico	Thornton		f	t	2019-11-26 09:40:48.23379+00	f		Istanbul	TR	f	2	f
451	password	\N	f	berkie91	Berkie	Jean-Louis		f	t	2019-11-26 09:40:48.243795+00	f		Berlin	DE	f	8	f
454	password	\N	f	brannen17	Vanny	Brannen		f	t	2019-11-26 09:40:48.273734+00	f		Berlin	DE	f	2	f
455	password	\N	f	nyce30	Daisy	Nyce		f	t	2019-11-26 09:40:48.283722+00	f		Houston	US	f	6	f
458	password	\N	f	tove22	Tove	Erbilgin		f	t	2019-11-26 09:40:48.313855+00	f		New York	US	f	2	f
459	password	\N	f	overby44	Jolyn	Overby		f	t	2019-11-26 09:40:48.32377+00	f		Ankara	TR	f	8	f
460	password	\N	f	zukovsky74	Radcliffe	Zukovsky		f	t	2019-11-26 09:40:48.333763+00	f		Izmir	TR	f	11	f
462	password	\N	f	zukovsky98	Madeleine	Zukovsky		f	t	2019-11-26 09:40:48.353818+00	f		Houston	US	f	11	f
464	password	\N	f	leeanne18	Leeanne	Deng		f	t	2019-11-26 09:40:48.373753+00	f		Moscow	RU	f	7	f
467	password	\N	f	hurteau2	Ralf	Hurteau		f	t	2019-11-26 09:40:48.403728+00	f		Moscow	RU	f	7	f
468	password	\N	f	gregg57	Gregg	Branham		f	t	2019-11-26 09:40:48.413816+00	f		Ankara	TR	f	1	f
470	password	\N	f	koning59	Hetti	Koning		f	t	2019-11-26 09:40:48.433766+00	f		New York	US	f	1	f
472	password	\N	f	leigh67	Leigh	Costache		f	t	2019-11-26 09:40:48.453827+00	f		Moscow	RU	f	1	f
473	password	\N	f	reggi76	Reggi	Sethi		f	t	2019-11-26 09:40:48.463775+00	f		Moscow	RU	f	9	f
474	password	\N	f	thayer24	Mark	Thayer		f	t	2019-11-26 09:40:48.473889+00	f		Moscow	RU	f	6	f
478	password	\N	f	sharra53	Sharra	Conboy		f	t	2019-11-26 09:40:48.513877+00	f		Berlin	DE	f	3	f
479	password	\N	f	peter18	Peter	Hawker		f	t	2019-11-26 09:40:48.523907+00	f		Izmir	TR	f	7	f
481	password	\N	f	ewasyshyn65	Joly	Ewasyshyn		f	t	2019-11-26 09:40:48.543811+00	f		Boston	US	f	7	f
482	password	\N	f	houde56	Aleks	Houde		f	t	2019-11-26 09:40:48.553814+00	f		Izmir	TR	f	1	f
485	password	\N	f	antonia76	Antonia	Gdowik		f	t	2019-11-26 09:40:48.583754+00	f		Houston	US	f	3	f
486	password	\N	f	wojnar98	Agnes	Wojnar		f	t	2019-11-26 09:40:48.59392+00	f		Paris	FR	f	8	f
487	password	\N	f	shaylyn93	Shaylyn	Weidenfeller		f	t	2019-11-26 09:40:48.603848+00	f		Paris	FR	f	3	f
490	password	\N	f	kaigler65	Bayard	Kaigler		f	t	2019-11-26 09:40:48.633904+00	f		Moscow	RU	f	10	f
491	password	\N	f	lorry88	Lorry	Werling		f	t	2019-11-26 09:40:48.643794+00	f		Ankara	TR	f	4	f
493	password	\N	f	alvina32	Alvina	Frink		f	t	2019-11-26 09:40:48.663794+00	f		Ankara	TR	f	4	f
494	password	\N	f	van rijswijk75	Katya	Van Rijswijk		f	t	2019-11-26 09:40:48.673821+00	f		Paris	FR	f	4	f
498	password	\N	f	katinka17	Katinka	Salembier		f	t	2019-11-26 09:40:48.713801+00	f		Paris	FR	f	9	f
500	password	\N	f	kresl50	Demosthenis	Kresl		f	t	2019-11-26 09:40:48.733808+00	f		Berlin	DE	f	3	f
501	password	\N	f	jannel35	Jannel	Glanfield		f	t	2019-11-26 09:40:48.743809+00	f		New York	US	f	6	f
502	password	\N	f	lapointe69	Krishna	Lapointe		f	t	2019-11-26 09:40:48.755611+00	f		Istanbul	TR	f	1	f
505	password	\N	f	carlye34	Carlye	Kolton		f	t	2019-11-26 09:40:48.78387+00	f		Paris	FR	f	7	f
506	password	\N	f	ivor55	Ivor	Naem		f	t	2019-11-26 09:40:48.793804+00	f		Istanbul	TR	f	9	f
507	password	\N	f	ivy32	Ivy	Micucci		f	t	2019-11-26 09:40:48.803873+00	f		Paris	FR	f	5	f
511	password	\N	f	gabriel41	Gabriel	Busuttil		f	t	2019-11-26 09:40:48.843844+00	f		Paris	FR	f	10	f
515	password	\N	f	obermeyer67	Allie	Obermeyer		f	t	2019-11-26 09:40:48.883802+00	f		Paris	FR	f	9	f
518	password	\N	f	kleynenbergntntia1	Isa	KleynenbergNTNTIA		f	t	2019-11-26 09:40:48.913741+00	f		Istanbul	TR	f	9	f
519	password	\N	f	schrier34	Alasdair	Schrier		f	t	2019-11-26 09:40:48.923749+00	f		Boston	US	f	4	f
522	password	\N	f	red61	Red	DeLat		f	t	2019-11-26 09:40:48.953812+00	f		New York	US	f	9	f
525	password	\N	f	ianthe13	Ianthe	Ramsaran		f	t	2019-11-26 09:40:48.983738+00	f		Istanbul	TR	f	1	f
530	password	\N	f	monica78	Monica	Cunningham		f	t	2019-11-26 09:40:49.033778+00	f		Paris	FR	f	1	f
535	password	\N	f	norris92	Norris	Muenstermann		f	t	2019-11-26 09:40:49.083741+00	f		Berlin	DE	f	7	f
536	password	\N	f	terese15	Terese	Bangia		f	t	2019-11-26 09:40:49.09398+00	f		Ankara	TR	f	9	f
538	password	\N	f	adolphe72	Adolphe	Marti		f	t	2019-11-26 09:40:49.113813+00	f		Istanbul	TR	f	10	f
539	password	\N	f	van benthem1	Dulcie	Van Benthem		f	t	2019-11-26 09:40:49.123746+00	f		Ankara	TR	f	10	f
540	password	\N	f	charlot56	Charlot	Pitcavage		f	t	2019-11-26 09:40:49.133806+00	f		Istanbul	TR	f	6	f
541	password	\N	f	noel24	Noel	Parham		f	t	2019-11-26 09:40:49.143868+00	f		Paris	FR	f	7	f
547	pbkdf2_sha256$150000$6IoSm2o6lOoF$UxbfQ4DgeL7bEJnYKhUWUTHBykkrxSAS+rVxE0THabM=	\N	f	someuser	Some	User	some@mail.com	f	t	2019-11-26 10:10:56+00	t	TR150001001745342721325335	İstanbul	TR	f	1	t
63	password	\N	f	emmey63	Emmey	Schwenk		f	t	2019-11-26 09:40:45.626477+00	f		Paris	FR	f	1	f
73	password	\N	f	michele86	Michele	Bortenstein		f	t	2019-11-26 09:40:45.639542+00	f		Izmir	TR	f	1	f
133	password	\N	f	casten43	Nichol	Casten		f	t	2019-11-26 09:40:45.73201+00	f		Houston	US	f	7	f
176	password	\N	f	rolando34	Rolando	Dpierre		f	t	2019-11-26 09:40:45.787202+00	f		Izmir	TR	f	1	f
207	password	\N	f	eddie57	Eddie	SpringThorpe		f	t	2019-11-26 09:40:45.827055+00	f		New York	US	f	8	f
215	password	\N	f	sloboda3	Roselle	Sloboda		f	t	2019-11-26 09:40:45.837544+00	f		Izmir	TR	f	4	f
265	password	\N	f	stadelmeier85	Emmett	Stadelmeier		f	t	2019-11-26 09:40:46.283726+00	f		Moscow	RU	f	4	f
277	password	\N	f	gussi76	Gussi	Merritt		f	t	2019-11-26 09:40:46.403809+00	f		Boston	US	f	9	f
292	password	\N	f	lynnelle81	Lynnelle	Fuller		f	t	2019-11-26 09:40:46.563821+00	f		Paris	FR	f	11	f
350	password	\N	f	crystal13	Crystal	Cervantes		f	t	2019-11-26 09:40:47.193786+00	f		New York	US	f	5	f
371	password	\N	f	rowena100	Rowena	Murison		f	t	2019-11-26 09:40:47.433789+00	f		New York	US	f	8	f
420	password	\N	f	maryak23	Candi	Maryak		f	t	2019-11-26 09:40:47.933796+00	f		Berlin	DE	f	9	f
495	password	\N	f	brooke64	Jaleh	Brooke		f	t	2019-11-26 09:40:48.683817+00	f		Istanbul	TR	f	9	f
496	password	\N	f	bhatt60	Gerrard	Bhatt		f	t	2019-11-26 09:40:48.693786+00	f		Ankara	TR	f	11	f
497	password	\N	f	chitnis26	Twyla	Chitnis		f	t	2019-11-26 09:40:48.703804+00	f		Berlin	DE	f	6	f
499	password	\N	f	christoph76	Christoph	Hallenbeck		f	t	2019-11-26 09:40:48.723799+00	f		Berlin	DE	f	3	f
503	password	\N	f	willdon99	Willdon	Seawell		f	t	2019-11-26 09:40:48.763801+00	f		Berlin	DE	f	8	f
504	password	\N	f	oden5	Tania	Oden		f	t	2019-11-26 09:40:48.773781+00	f		Berlin	DE	f	6	f
508	password	\N	f	bjorn75	Bjorn	Langdon		f	t	2019-11-26 09:40:48.813798+00	f		Izmir	TR	f	3	f
509	password	\N	f	junette62	Junette	Bedrosian		f	t	2019-11-26 09:40:48.823805+00	f		Houston	US	f	3	f
510	password	\N	f	joletta95	Joletta	Helgeland		f	t	2019-11-26 09:40:48.833877+00	f		Izmir	TR	f	1	f
512	password	\N	f	allah62	Allah	Allahyari		f	t	2019-11-26 09:40:48.853782+00	f		New York	US	f	10	f
513	password	\N	f	libbie10	Libbie	Travis		f	t	2019-11-26 09:40:48.863756+00	f		Ankara	TR	f	7	f
514	password	\N	f	trev64	Trev	Fishman		f	t	2019-11-26 09:40:48.873851+00	f		Istanbul	TR	f	3	f
516	password	\N	f	mohrmann32	Ardella	Mohrmann		f	t	2019-11-26 09:40:48.893771+00	f		Moscow	RU	f	9	f
517	password	\N	f	dedra37	Dedra	Dickinson		f	t	2019-11-26 09:40:48.903801+00	f		New York	US	f	1	f
520	password	\N	f	pirkle76	Tom	Pirkle		f	t	2019-11-26 09:40:48.933836+00	f		Houston	US	f	7	f
521	password	\N	f	murchison0	Brier	Murchison		f	t	2019-11-26 09:40:48.943843+00	f		Moscow	RU	f	5	f
523	password	\N	f	mazzei40	Glennis	Mazzei		f	t	2019-11-26 09:40:48.963909+00	f		Berlin	DE	f	4	f
524	password	\N	f	karly15	Karly	Cheney		f	t	2019-11-26 09:40:48.973901+00	f		Ankara	TR	f	7	f
526	password	\N	f	morry34	Morry	Iguchi		f	t	2019-11-26 09:40:48.993772+00	f		Ankara	TR	f	8	f
527	password	\N	f	asia50	Asia	Nadler		f	t	2019-11-26 09:40:49.003732+00	f		Paris	FR	f	1	f
528	password	\N	f	bebee23	Shimon	Bebee		f	t	2019-11-26 09:40:49.013884+00	f		Houston	US	f	8	f
529	password	\N	f	armenakis4	Madelina	Armenakis		f	t	2019-11-26 09:40:49.023761+00	f		Paris	FR	f	8	f
531	password	\N	f	pallen97	Desirae	Pallen		f	t	2019-11-26 09:40:49.043745+00	f		Moscow	RU	f	11	f
532	password	\N	f	mcallister20	Emerson	McAllister		f	t	2019-11-26 09:40:49.053829+00	f		Izmir	TR	f	6	f
533	password	\N	f	hersch21	Hersch	Fraties		f	t	2019-11-26 09:40:49.063776+00	f		Moscow	RU	f	4	f
534	password	\N	f	lucky15	Lucky	Spisak		f	t	2019-11-26 09:40:49.073957+00	f		Moscow	RU	f	4	f
537	password	\N	f	nickie84	Nickie	Atcheson		f	t	2019-11-26 09:40:49.103754+00	f		Istanbul	TR	f	10	f
542	password	\N	f	gerstmar46	Yule	Gerstmar		f	t	2019-11-26 09:40:49.153784+00	f		Boston	US	f	4	f
543	password	\N	f	myriam45	Myriam	Zou		f	t	2019-11-26 09:40:49.163999+00	f		Izmir	TR	f	4	f
544	password	\N	f	emlyn62	Emlyn	Griner		f	t	2019-11-26 09:40:49.17383+00	f		Moscow	RU	f	9	f
546	pbkdf2_sha256$150000$nD7ptMEaYRx2$ZKUNaaufMFIsuWgY6bRAG4GFuLhUAkfIqIxg7d3fLHw=	\N	f	sarper	Sarperrrr	Rahmetoğlu		f	t	2019-11-26 09:41:08.953767+00	t	TR150001001745342721325335	Dusseldorf	DE	f	1	t
428	password	\N	f	sterling48	Sterling	Hally		f	t	2019-11-26 09:40:48.01381+00	f		Izmir	TR	f	4	f
471	password	\N	f	oesterreicher56	Clark	Oesterreicher		f	t	2019-11-26 09:40:48.443889+00	f		Izmir	TR	f	10	f
549	pbkdf2_sha256$150000$ss9M3w4U2Oqd$e2oITuscSe/8jliwZQBRXXM9WqIu4wYkBdK5LJo4OFI=	\N	f	Mehmet12	Mehmet	12	Mehmet12@gmail.com	f	t	2019-11-26 11:32:10.128187+00	f		İstanbul	TR	f	1	f
551	pbkdf2_sha256$150000$mLqTbfzKnJES$hqra4iVlMTPcPlwu6bshRTQQhJIqI3vlE1iTb8tfa0E=	\N	f	arondacemoglu	Aron	Dacemoglu	aron_dacemoglu@gmail.com	f	t	2019-11-26 13:18:10.743998+00	t	TR910004600148888000136893	İstanbul	TR	f	1	f
561	pbkdf2_sha256$150000$TBKlzS6Ln3RB$/+7Dphsul8K6Skrus9ctjXSHnsCUFW10BUdLic22o8s=	\N	f	gizemlee	Gizem	Lee	mcboun@hotmail.com	f	t	2019-12-12 07:48:14.721175+00	f		İstanbul	TR	f	1	f
562	!8sTpcbNH0lB1PMJcefTMfcEMlXxEa2iX5zRLFsni	\N	f	traidersapp	Traiders	Boun	traidersapp@gmail.com	f	t	2019-12-12 12:50:02.791303+00	f			TR	f	1	f
572	pbkdf2_sha256$150000$y1doz8UELVGJ$VeM2VEMxXSksGeD5jjHXT8K1HCF37blIko2bKw0TycY=	\N	f	alperentest12	alperen	özkan	alperenkozkan@gmail.com	f	t	2019-12-21 14:06:00.125976+00	t	TR33 0006 1005 1978 6457 8413 26	İstanbul	TR	f	1	t
556	pbkdf2_sha256$150000$UBGu9JKiHVv7$ujGkKoaLGn8VooAu3vXj8QxzA/zqjT072MyNnb8Iz6Q=	\N	f	Emmanuel39	Alperen	ÖZKAN	alperenkozkan@gmail.com	f	t	2019-12-07 16:08:44.524551+00	t	TR33 0006 1005 1978 6457 8413 26	İstanbul	TR	f	6	f
573		\N	f	oscaryanki09	Oğuzhan	YİĞİT	oscaryanki09@gmail.com	f	t	2019-12-23 18:10:51.428857+00	f		Istanbul	TR	f	1	t
558	pbkdf2_sha256$150000$FelK67hlryL2$rnspY6oV7/jNnf+wJhyvtNSCCG0WtrnDFRj+NhUURik=	\N	f	merthesap	M	Y	mert.yuksekgonul@boun.edu.tr	f	t	2019-12-10 10:11:40.448336+00	f		İstanbul	TR	f	1	f
559	pbkdf2_sha256$150000$T4EobUEvseoj$Q82hFyTrKTv8PtJNtdy8ytykvsYG/xgZukx5OEuAjdk=	\N	f	merthesap2	M	Y	mertyuksekgonul@gmail.com	f	t	2019-12-10 10:15:13.64054+00	f		İstanbul	TR	f	1	f
569	pbkdf2_sha256$150000$DyKSGxL28ma4$HwLLCPAnbDWQbkUTMICfBbC1KJzb23nBGfSmKQXLUYc=	\N	f	kemalbey	Kemal	Bey	Kemal@gmail.com	f	t	2019-12-19 17:36:42.651188+00	f		İstanbul	TR	f	1	f
570	pbkdf2_sha256$150000$y4erIwr3SKLf$YcV/rjTsBVt80dpaS/+uAICpKauy6BoWl5ItWpVzQuY=	\N	f	alperentest	Alperen	Özkan	alperenkozkan@gmail.com	f	t	2019-12-21 12:15:06.770181+00	t	TR33 0006 1005 1978 6457 8413 26	İstanbul	TR	f	1	t
592		\N	f	ahmetoglu.alper	Alper	Ahmetoğlu	ahmetoglu.alper@gmail.com	f	t	2019-12-24 17:16:18.183391+00	f		Istanbul	TR	f	1	t
550	12345678	2019-12-13 12:46:32+00	f	alexmanhattan	Alperen	ÖZKAN	alperenkozkan@gmail.com	f	t	2019-11-26 11:44:15+00	t	TR33 0006 1005 1978 6457 8413 26	İstanbul	TR	f	1	t
575	pbkdf2_sha256$150000$7ZrzaxBiHcLw$e14D05h+GXMG/YXlMUUJCYeEdujuzqTbBS1DYN88UTk=	\N	f	alperen123	alperen	özkan	alperenkozkan@gmail.com	f	t	2019-12-24 07:54:30.895366+00	t	TR33 0006 1005 1978 6457 8413 26	İstanbul	TR	f	1	f
564		\N	f	yemreinci	Yunus Emre	İnci	yemreinci@pragmacraft.com	f	t	2019-12-16 22:10:43.793582+00	f		Istanbul	TR	f	1	t
565		\N	f	ozgursolak24	özgür	solak	ozgursolak24@gmail.com	f	t	2019-12-17 10:17:04.27739+00	f		Istanbul	TR	f	1	t
563		\N	f	kursatozkan636	Alperen	Özkan	kursatozkan636@gmail.com	f	t	2019-12-15 21:08:38.548279+00	f		Istanbul	TR	f	1	t
545	pbkdf2_sha256$150000$sYvm0TB68XY5$Phy2MIP0whzUdkEegF4RCDeCYEUPMKQq/V4vE6qrvO0=	2019-12-21 21:41:49.128324+00	f	alperenduymaz	Alperen	Duymaz	alperen.duymaz@gmail.com	f	t	2019-11-26 09:41:03+00	t	TR120001001745377120435001	Yozgat	TR	f	9	t
589	pbkdf2_sha256$150000$CNQI0ygD3hfJ$9se6Eikc+sAI8lgmuQp3CjUF/vTLa/irCnN7LFh0VpA=	\N	f	john47	john	lewis	john.lewis47@gmail.com	f	t	2019-12-24 13:23:44.647993+00	t	NL17INGB7773107033	New York	US	f	9	f
567		\N	f	rostokofte	Ali	Veli	rostokofte@gmail.com	f	t	2019-12-17 13:48:36.582812+00	f		Istanbul	TR	f	1	t
574	pbkdf2_sha256$150000$ziyKjeFQVwc6$q46DkTQRX5NdSFy9ALFUbIJOjAN6e/Gcr56uL3XbUNM=	\N	f	alperen1234	alperen	özkan	alperenkozkan@gmail.com	f	t	2019-12-23 20:05:18.117692+00	t	TR33 0006 1005 1978 6457 8413 26	İstanbul	TR	f	1	f
587	pbkdf2_sha256$150000$ljwRrBwbIBJN$I+diWx4J5e2zdvPOtBxcKq5BnMlVDqE/up0AsGkEjEc=	\N	f	talat	Talat	Jackson		f	t	2019-12-24 11:30:09.183564+00	t	TR150001001745342721325335	London	UK	f	1	t
568	pbkdf2_sha256$150000$GmxWCrCto3In$Wr7nIY26iduJReJk5y6tjmGiFO0yCGfxYcPOQuV5sHs=	\N	f	bb	sa	as	aa@gmail.com	f	t	2019-12-19 13:50:01.305147+00	f		İstanbul	TR	t	5	f
571	pbkdf2_sha256$150000$fGiIctMksKi5$btxZMn/rScMIHOjxNeaAV+lVRkxnXh3OOaPkpWcRxtk=	\N	f	alperentest1	alperen	özkan	alperenkozkan@outlook.com	f	t	2019-12-21 12:16:05.11283+00	t	TR33 0006 1005 1978 6457 8413 26	İstanbul	TR	f	1	f
555	pbkdf2_sha256$150000$dqyK42FURPk3$KdUB6PXy0ZwjbxBJbeLO7m+ypuu49Kd3K1Zu4UB8kqI=	\N	f	yunus	yunus	inci	yemreinci0@gmail.com	f	t	2019-12-07 15:06:41+00	t	TR420001001745342721325334	İstanbul	TR	t	5	t
566	pbkdf2_sha256$150000$cO4uauwDMT08$2oUvWFN1nCKiY2BCMSqwrRsLNajjumv8Idcnew0NNuI=	\N	f	abcdefgh	a	b	abc@hotmail.com	f	t	2019-12-17 10:28:47.771984+00	f		İstanbul	TR	t	1	f
591	pbkdf2_sha256$150000$LCcqzftOol86$r2Q52m3ea13uRiIKr2qOvmDVYd3SGHSOH4awlK9R5Hs=	\N	f	KaracaSoft	Mahmut	Karaca	mahmutkaraca95@gmail.com	f	t	2019-12-24 17:13:05.371298+00	f		İstanbul	TR	f	1	t
557	pbkdf2_sha256$150000$F8jPc5zHjDs0$PdGXDI+PhnYNZuHp9V7JQbRKVb/K/m3H/un2JMyxIpY=	\N	f	dilruba	Dilruba	Köse	dilrubakose@gmail.com	f	t	2019-12-07 16:30:03.205108+00	f		İstanbul	TR	t	11	t
586	pbkdf2_sha256$150000$K71vj8yTaKW9$eB9NVx9JbQ7dtawaoh0m6Fo+Yfx5X15Xk9Z1EGVS4pQ=	2019-12-24 11:31:20+00	f	nihan	Nihan	Yaktir	nihanyaktiraider@gmail.com	f	t	2019-12-24 11:30:08+00	t	TR150001001745342721325335	Istanbul	TR	f	1	t
590	pbkdf2_sha256$150000$qKu6eg3J3naZ$cYrKEDwRnePBVIE/uYb1GXZqMkWEqWz+S96Dn5uw7BU=	\N	f	canozcan	Can	Özcan	ozcanc024@gmail.com	f	t	2019-12-24 14:03:24+00	t	TR33 0006 1005 1978 6457 8413 26	İstanbul	TR	f	1	t
\.


--
-- Data for Name: api_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: api_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add Token	6	add_token
22	Can change Token	6	change_token
23	Can delete Token	6	delete_token
24	Can view Token	6	view_token
25	Can add user	7	add_user
26	Can change user	7	change_user
27	Can delete user	7	delete_user
28	Can view user	7	view_user
29	Can add equipment	8	add_equipment
30	Can change equipment	8	change_equipment
31	Can delete equipment	8	delete_equipment
32	Can view equipment	8	view_equipment
33	Can add parity	9	add_parity
34	Can change parity	9	change_parity
35	Can delete parity	9	delete_parity
36	Can view parity	9	view_parity
37	Can add manual investment	10	add_manualinvestment
38	Can change manual investment	10	change_manualinvestment
39	Can delete manual investment	10	delete_manualinvestment
40	Can view manual investment	10	view_manualinvestment
41	Can add article	11	add_article
42	Can change article	11	change_article
43	Can delete article	11	delete_article
44	Can view article	11	view_article
45	Can add mobile app	12	add_mobileapp
46	Can change mobile app	12	change_mobileapp
47	Can delete mobile app	12	delete_mobileapp
48	Can view mobile app	12	view_mobileapp
49	Can add equipment comment	13	add_equipmentcomment
50	Can change equipment comment	13	change_equipmentcomment
51	Can delete equipment comment	13	delete_equipmentcomment
52	Can view equipment comment	13	view_equipmentcomment
53	Can add article comment	14	add_articlecomment
54	Can change article comment	14	change_articlecomment
55	Can delete article comment	14	delete_articlecomment
56	Can view article comment	14	view_articlecomment
57	Can add following	15	add_following
58	Can change following	15	change_following
59	Can delete following	15	delete_following
60	Can view following	15	view_following
61	Can add like	16	add_like
62	Can change like	16	change_like
63	Can delete like	16	delete_like
64	Can view like	16	view_like
65	Can add event	17	add_event
66	Can change event	17	change_event
67	Can delete event	17	delete_event
68	Can view event	17	view_event
69	Can add parity setting	18	add_paritysetting
70	Can change parity setting	18	change_paritysetting
71	Can delete parity setting	18	delete_paritysetting
72	Can view parity setting	18	view_paritysetting
73	Can add prediction	19	add_prediction
74	Can change prediction	19	change_prediction
75	Can delete prediction	19	delete_prediction
76	Can view prediction	19	view_prediction
77	Can add stop loss order	20	add_stoplossorder
78	Can change stop loss order	20	change_stoplossorder
79	Can delete stop loss order	20	delete_stoplossorder
80	Can view stop loss order	20	view_stoplossorder
81	Can add online investment	21	add_onlineinvestment
82	Can change online investment	21	change_onlineinvestment
83	Can delete online investment	21	delete_onlineinvestment
84	Can view online investment	21	view_onlineinvestment
85	Can add buy order	22	add_buyorder
86	Can change buy order	22	change_buyorder
87	Can delete buy order	22	delete_buyorder
88	Can view buy order	22	view_buyorder
89	Can add asset	23	add_asset
90	Can change asset	23	change_asset
91	Can delete asset	23	delete_asset
92	Can view asset	23	view_asset
93	Can add portfolio item	24	add_portfolioitem
94	Can change portfolio item	24	change_portfolioitem
95	Can delete portfolio item	24	delete_portfolioitem
96	Can view portfolio item	24	view_portfolioitem
97	Can add portfolio	25	add_portfolio
98	Can change portfolio	25	change_portfolio
99	Can delete portfolio	25	delete_portfolio
100	Can view portfolio	25	view_portfolio
101	Can add application	26	add_application
102	Can change application	26	change_application
103	Can delete application	26	delete_application
104	Can view application	26	view_application
105	Can add access token	27	add_accesstoken
106	Can change access token	27	change_accesstoken
107	Can delete access token	27	delete_accesstoken
108	Can view access token	27	view_accesstoken
109	Can add grant	28	add_grant
110	Can change grant	28	change_grant
111	Can delete grant	28	delete_grant
112	Can view grant	28	view_grant
113	Can add refresh token	29	add_refreshtoken
114	Can change refresh token	29	change_refreshtoken
115	Can delete refresh token	29	delete_refreshtoken
116	Can view refresh token	29	view_refreshtoken
117	Can add association	30	add_association
118	Can change association	30	change_association
119	Can delete association	30	delete_association
120	Can view association	30	view_association
121	Can add code	31	add_code
122	Can change code	31	change_code
123	Can delete code	31	delete_code
124	Can view code	31	view_code
125	Can add nonce	32	add_nonce
126	Can change nonce	32	change_nonce
127	Can delete nonce	32	delete_nonce
128	Can view nonce	32	view_nonce
129	Can add user social auth	33	add_usersocialauth
130	Can change user social auth	33	change_usersocialauth
131	Can delete user social auth	33	delete_usersocialauth
132	Can view user social auth	33	view_usersocialauth
133	Can add partial	34	add_partial
134	Can change partial	34	change_partial
135	Can delete partial	34	delete_partial
136	Can view partial	34	view_partial
137	Can add user	35	add_user
138	Can change user	35	change_user
139	Can delete user	35	delete_user
140	Can view user	35	view_user
141	Can add annotation target	36	add_annotationtarget
142	Can change annotation target	36	change_annotationtarget
143	Can delete annotation target	36	delete_annotationtarget
144	Can view annotation target	36	view_annotationtarget
145	Can add annotation body	37	add_annotationbody
146	Can change annotation body	37	change_annotationbody
147	Can delete annotation body	37	delete_annotationbody
148	Can view annotation body	37	view_annotationbody
149	Can add fragment selector	38	add_fragmentselector
150	Can change fragment selector	38	change_fragmentselector
151	Can delete fragment selector	38	delete_fragmentselector
152	Can view fragment selector	38	view_fragmentselector
153	Can add annotation	39	add_annotation
154	Can change annotation	39	change_annotation
155	Can delete annotation	39	delete_annotation
156	Can view annotation	39	view_annotation
157	Can add notification	40	add_notification
158	Can change notification	40	change_notification
159	Can delete notification	40	delete_notification
160	Can view notification	40	view_notification
161	Can add alert	41	add_alert
162	Can change alert	41	change_alert
163	Can delete alert	41	delete_alert
164	Can view alert	41	view_alert
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
6c35141b177aa6578d8391871d431dfa5e529a1d	2019-11-26 09:41:43.947424+00	545
d112cef18db0dc50933a4326390958f322d975bb	2019-11-26 09:43:24.714431+00	44
1b7effc0d8eebea4b84260f78b25cd49385f7794	2019-11-26 10:11:04.483424+00	547
f3c0f0424cf39b48d098ea8856955d848219be62	2019-11-26 11:31:41.135886+00	546
ec9576005721ec815aa6a974340816d3f07715a2	2019-11-26 11:32:21.707146+00	549
eeca1118de9ea560281ae7b57a501852a604de9d	2019-11-26 11:44:21.146185+00	550
5717ee77153a4dca5d342da017eceed770caa3c2	2019-11-26 13:18:26.677789+00	551
ab2d0945683121d20229ef8a56878a5e9267be4e	2019-12-07 16:08:53.502619+00	556
6a49a99372defefa78d9be74ec14f089a2518d41	2019-12-07 16:30:14.769777+00	557
b334da0a8d461971b53b7272b77a6d4a66cfcb90	2019-12-10 10:10:44.600951+00	555
005e967625160c527e344b9a8450e18dc66a48c6	2019-12-10 10:11:54.304159+00	558
06a85c0b95724b600db18a01430509d52e40ad8e	2019-12-12 07:48:19.651778+00	561
5bb302bc06a61d305215d647252a5eaf11b6060b	2019-12-15 21:08:38.568166+00	563
77a329d01ebed8c8bdc56436d01afc6f7aea89c7	2019-12-16 22:10:43.808124+00	564
c8c82caf070735b7c9c959beecc5a8dfd84b5538	2019-12-17 10:17:04.361927+00	565
4a59600c4970cf508649d778685d72ffcdf0fcd1	2019-12-17 10:28:59.875774+00	566
6911a619cd2b500c472d99f6be3c695fc1e0ad61	2019-12-17 13:48:36.611884+00	567
93359e889c783deeeaf5b802c063d7640f0d1238	2019-12-19 13:50:07.225726+00	568
9225af5a1082de1bf7538569a135dfd360864c45	2019-12-19 17:37:00.820498+00	569
0bb0846f3070bbdc1238e3fd82f9bbba9d0da157	2019-12-21 12:15:17.607993+00	570
1954c8f02f138301fabb09debd9b829e7dbe710d	2019-12-21 12:16:10.578515+00	571
d07878712faef454abb662244770ea6bc1acaede	2019-12-23 13:39:09.570205+00	572
d834f6f500e6bf52c1066c631f04951b10f74c4b	2019-12-23 18:10:51.460008+00	573
b555b06fc651aa717d194e4fabca994e530adb3f	2019-12-23 20:05:29.894364+00	574
c269d0e0557c3a85e066b0b741de0c4e49abe42e	2019-12-24 07:54:35.87691+00	575
169987766df272e52633460668697cca9175bc8d	2019-12-24 11:30:15.388521+00	586
4f782d878abf1f984e1cc0f340197644ca573375	2019-12-24 13:24:21.908629+00	589
f63d8213cf3885852ebf4984cb588f1d510269f1	2019-12-24 14:04:10.825805+00	590
f8aec212471bc3ab42b32c43aafa445069e533f5	2019-12-24 17:13:12.029054+00	591
5ecf359b798c2412976872338d021c114e481abc	2019-12-24 17:16:18.18988+00	592
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
188	2019-11-26 10:07:38.887138+00	53	EquipmentComment object (53)	1	[{"added": {}}]	13	44
189	2019-11-26 10:08:02.61157+00	54	EquipmentComment object (54)	1	[{"added": {}}]	13	44
190	2019-11-26 10:13:56.635809+00	547	someuser	2	[{"changed": {"fields": ["email_verified"]}}]	7	44
191	2019-11-26 10:41:52.846523+00	160	Prediction object (160)	1	[{"added": {}}]	19	44
192	2019-11-26 10:42:13.89278+00	161	Prediction object (161)	1	[{"added": {}}]	19	44
193	2019-11-26 10:42:43.08374+00	162	Prediction object (162)	1	[{"added": {}}]	19	44
194	2019-11-26 10:43:02.143237+00	163	Prediction object (163)	1	[{"added": {}}]	19	44
195	2019-11-26 10:43:23.554737+00	164	Prediction object (164)	1	[{"added": {}}]	19	44
196	2019-11-26 11:27:50.418915+00	548	arondacemoglu	3		7	44
197	2019-11-26 11:35:09.947815+00	55	EquipmentComment object (55)	1	[{"added": {}}]	13	44
198	2019-11-26 11:42:12.341268+00	983	sarper/alperenduymaz	3		15	44
199	2019-11-26 11:42:56.427807+00	165	Prediction object (165)	3		19	44
200	2019-11-26 11:52:34.60682+00	7	ManualInvestment object (7)	3		10	44
201	2019-11-26 11:52:34.615371+00	6	ManualInvestment object (6)	3		10	44
202	2019-11-26 11:53:00.659326+00	14	OnlineInvestment object (14)	3		21	44
203	2019-11-26 11:53:00.661344+00	13	OnlineInvestment object (13)	3		21	44
204	2019-11-26 12:07:08.451153+00	5	Event object (5)	1	[{"added": {}}]	17	44
205	2019-11-26 12:07:20.288589+00	12	Asset object (12)	3		23	44
206	2019-11-26 12:07:20.305548+00	11	Asset object (11)	3		23	44
207	2019-11-26 12:08:42.137436+00	6	Event object (6)	1	[{"added": {}}]	17	44
208	2019-11-26 12:09:54.959528+00	7	Event object (7)	1	[{"added": {}}]	17	44
209	2019-11-26 12:11:10.943242+00	8	Event object (8)	1	[{"added": {}}]	17	44
210	2019-11-26 12:23:13.512559+00	15	OnlineInvestment object (15)	3		21	44
211	2019-11-26 12:23:13.515128+00	12	OnlineInvestment object (12)	3		21	44
212	2019-11-26 12:23:27.779658+00	5	BuyOrder object (5)	3		22	44
213	2019-11-26 12:24:02.234059+00	9	Event object (9)	1	[{"added": {}}]	17	44
214	2019-11-26 12:26:53.693506+00	10	Event object (10)	1	[{"added": {}}]	17	44
215	2019-11-26 12:42:08.876679+00	545	alperenduymaz	2	[{"changed": {"fields": ["email"]}}]	7	44
216	2019-11-26 13:04:03.731059+00	29016	EUR/TRY/2019-11-26 13:04:00+00:00	1	[{"added": {}}]	9	44
217	2019-11-26 13:04:32.433212+00	29016	EUR/TRY/2019-11-26 13:04:00+00:00	3		9	44
218	2019-11-26 13:04:57.253554+00	29017	EUR/TRY/2019-11-26 13:04:54+00:00	1	[{"added": {}}]	9	44
219	2019-11-26 13:05:22.913413+00	29017	EUR/TRY/2019-11-26 13:04:54+00:00	3		9	44
220	2019-11-26 13:06:00.96774+00	8	ManualInvestment object (8)	3		10	44
221	2019-11-26 13:06:21.712751+00	18	OnlineInvestment object (18)	3		21	44
222	2019-11-26 13:06:21.714876+00	17	OnlineInvestment object (17)	3		21	44
223	2019-11-26 13:06:42.15015+00	16	OnlineInvestment object (16)	3		21	44
224	2019-11-26 13:07:12.249546+00	14	Asset object (14)	3		23	44
225	2019-11-26 13:07:28.673816+00	13	Asset object (13)	2	[{"changed": {"fields": ["amount"]}}]	23	44
226	2019-11-26 13:24:42.918627+00	103	Article object (103)	2	[{"changed": {"fields": ["image"]}}]	11	44
227	2019-11-26 13:28:00.85898+00	29039	EUR/TRY/2019-11-26 13:27:54+00:00	1	[{"added": {}}]	9	44
228	2019-12-03 10:46:09.884557+00	29	ETH/USD	3		18	44
229	2019-12-03 10:46:39.746753+00	30	ETH/USD	1	[{"added": {}}]	18	44
230	2019-12-07 14:20:38.071712+00	1	Portfolio object (1)	1	[{"added": {}}]	25	44
231	2019-12-07 14:20:59.325781+00	1	PortfolioItem object (1)	1	[{"added": {}}]	24	44
232	2019-12-07 14:21:12.686873+00	2	PortfolioItem object (2)	1	[{"added": {}}]	24	44
233	2019-12-07 14:49:37.172269+00	552	yunus	3		7	44
234	2019-12-07 14:58:00.460223+00	553	yunus	3		7	44
235	2019-12-07 15:03:39.905504+00	554	yunus	3		7	44
236	2019-12-10 11:54:50.729018+00	1	Traiders	1	[{"added": {}}]	26	44
239	2019-12-17 13:48:17.06798+00	560	rostokofte	3		7	44
240	2019-12-21 12:53:14.08698+00	550	alexmanhattan	2	[{"changed": {"fields": ["email_verified"]}}]	7	44
241	2019-12-21 15:58:49.459656+00	3	Notification object (3)	1	[{"added": {}}]	40	44
242	2019-12-21 16:01:12.301308+00	3	Notification object (3)	2	[{"changed": {"fields": ["user", "message", "reference_url"]}}]	40	44
243	2019-12-23 18:45:20.9007+00	26	USD/TRY	2	[{"changed": {"fields": ["order"]}}]	18	44
244	2019-12-23 18:45:29.065902+00	25	EUR/TRY	2	[{"changed": {"fields": ["order"]}}]	18	44
245	2019-12-23 18:45:52.831413+00	30	ETH/USD	2	[{"changed": {"fields": ["order"]}}]	18	44
246	2019-12-23 18:46:02.601535+00	18	BTC/TRY	2	[{"changed": {"fields": ["order"]}}]	18	44
247	2019-12-23 18:46:23.98379+00	19	GOOGL/USD	2	[{"changed": {"fields": ["order"]}}]	18	44
248	2019-12-23 18:46:51.025577+00	16	AGTHX/USD	2	[{"changed": {"fields": ["order"]}}]	18	44
249	2019-12-23 23:16:37.560263+00	555	yunus	2	[{"changed": {"fields": ["is_private"]}}]	7	44
250	2019-12-23 23:48:17.284441+00	1020	admin/yunus	2	[{"changed": {"fields": ["status"]}}]	15	44
251	2019-12-23 23:49:35.001645+00	1020	admin/yunus	2	[{"changed": {"fields": ["status"]}}]	15	44
252	2019-12-23 23:49:56.951922+00	1	Alert object (1)	1	[{"added": {}}]	41	44
253	2019-12-23 23:50:10.166922+00	1020	admin/yunus	2	[{"changed": {"fields": ["status"]}}]	15	44
254	2019-12-23 23:52:23.66916+00	1020	admin/yunus	2	[]	15	44
255	2019-12-23 23:52:43.567744+00	1020	admin/yunus	2	[{"changed": {"fields": ["status"]}}]	15	44
256	2019-12-23 23:53:05.206122+00	1020	admin/yunus	2	[{"changed": {"fields": ["status"]}}]	15	44
257	2019-12-24 01:51:51.515917+00	26	Portfolio object (26)	1	[{"added": {}}]	25	44
258	2019-12-24 01:56:47.070162+00	27	Portfolio object (27)	1	[{"added": {}}]	25	44
259	2019-12-24 01:57:06.372427+00	28	Portfolio object (28)	1	[{"added": {}}]	25	44
260	2019-12-24 01:58:57.76134+00	1	Alert object (1)	1	[{"added": {}}]	41	44
261	2019-12-24 02:07:28.658541+00	210	Notification object (210)	1	[{"added": {}}]	40	44
262	2019-12-24 02:08:19.746002+00	210	Notification object (210)	2	[{"changed": {"fields": ["seen"]}}]	40	44
263	2019-12-24 02:08:53.61442+00	210	Notification object (210)	2	[{"changed": {"fields": ["seen"]}}]	40	44
264	2019-12-24 02:11:55.251338+00	210	Notification object (210)	2	[{"changed": {"fields": ["seen"]}}]	40	44
265	2019-12-24 02:12:14.659855+00	210	Notification object (210)	3		40	44
266	2019-12-24 08:30:46.196627+00	117	Article object (117)	3		11	44
267	2019-12-24 08:30:54.819733+00	116	Article object (116)	3		11	44
268	2019-12-24 08:31:00.187577+00	115	Article object (115)	3		11	44
269	2019-12-24 08:31:05.361278+00	114	Article object (114)	3		11	44
270	2019-12-24 08:31:09.622647+00	113	Article object (113)	3		11	44
271	2019-12-24 08:31:13.70963+00	112	Article object (112)	3		11	44
272	2019-12-24 08:31:17.925074+00	111	Article object (111)	3		11	44
273	2019-12-24 08:31:22.75451+00	110	Article object (110)	3		11	44
274	2019-12-24 08:32:50.352618+00	109	Article object (109)	3		11	44
275	2019-12-24 08:32:54.607597+00	108	Article object (108)	3		11	44
276	2019-12-24 08:32:59.606152+00	107	Article object (107)	3		11	44
277	2019-12-24 08:33:05.184804+00	105	Article object (105)	3		11	44
278	2019-12-24 08:34:31.416002+00	193	ArticleComment object (193)	3		14	44
279	2019-12-24 08:34:48.632753+00	189	ArticleComment object (189)	3		14	44
280	2019-12-24 08:35:23.641053+00	185	ArticleComment object (185)	3		14	44
281	2019-12-24 10:49:40.653701+00	31	JPY/GBP	1	[{"added": {}}]	18	44
282	2019-12-24 10:50:55.158972+00	None	JPY/BTC	1	[{"added": {}}]	18	44
283	2019-12-24 11:11:27.356008+00	577	talat	3		7	44
284	2019-12-24 11:11:33.379966+00	576	nihan	3		7	44
285	2019-12-24 11:12:05.844607+00	578	john45	1	[{"added": {}}]	7	44
286	2019-12-24 11:13:50.788771+00	578	john45	2	[{"changed": {"fields": ["password"]}}]	7	44
287	2019-12-24 11:18:21.681583+00	550	alexmanhattan	2	[{"changed": {"fields": ["password"]}}]	7	44
288	2019-12-24 11:21:08.199007+00	579	nihanyaktiraider	3		7	44
289	2019-12-24 11:22:40.265159+00	580	nihan	3		7	44
290	2019-12-24 11:22:48.665983+00	581	talat	3		7	44
291	2019-12-24 11:27:30.925175+00	583	talat	3		7	44
292	2019-12-24 11:27:30.941822+00	582	nihan	3		7	44
293	2019-12-24 11:28:49.369676+00	585	talat	3		7	44
294	2019-12-24 11:28:49.374205+00	584	nihan	3		7	44
295	2019-12-24 11:35:59.786328+00	11	Event object (11)	1	[{"added": {}}]	17	44
296	2019-12-24 11:36:20.678188+00	11	Event object (11)	2	[{"changed": {"fields": ["event"]}}]	17	44
297	2019-12-24 13:23:58.844101+00	588	john46	3		7	44
298	2019-12-24 13:24:04.518239+00	578	john45	3		7	44
299	2019-12-24 13:25:50.417339+00	6	Alert object (6)	1	[{"added": {}}]	41	44
300	2019-12-24 13:27:36.97682+00	7	Alert object (7)	1	[{"added": {}}]	41	44
301	2019-12-24 13:27:54.010182+00	8	Alert object (8)	1	[{"added": {}}]	41	44
302	2019-12-24 13:28:19.190381+00	9	Alert object (9)	1	[{"added": {}}]	41	44
303	2019-12-24 13:31:43.682385+00	220	Notification object (220)	1	[{"added": {}}]	40	44
304	2019-12-24 13:35:29.486656+00	221	Notification object (221)	1	[{"added": {}}]	40	44
305	2019-12-24 13:39:49.068685+00	222	Notification object (222)	1	[{"added": {}}]	40	44
306	2019-12-24 13:42:52.757107+00	223	Notification object (223)	1	[{"added": {}}]	40	44
307	2019-12-24 13:43:55.571358+00	224	Notification object (224)	1	[{"added": {}}]	40	44
308	2019-12-24 13:48:26.657831+00	104	PortfolioItem object (104)	1	[{"added": {}}]	24	44
309	2019-12-24 13:48:46.079856+00	105	PortfolioItem object (105)	1	[{"added": {}}]	24	44
310	2019-12-24 13:49:39.684447+00	106	PortfolioItem object (106)	1	[{"added": {}}]	24	44
311	2019-12-24 13:50:45.854597+00	107	PortfolioItem object (107)	1	[{"added": {}}]	24	44
312	2019-12-24 13:52:05.131269+00	108	PortfolioItem object (108)	1	[{"added": {}}]	24	44
313	2019-12-24 13:52:53.051813+00	109	PortfolioItem object (109)	1	[{"added": {}}]	24	44
314	2019-12-24 13:56:37.010069+00	110	PortfolioItem object (110)	1	[{"added": {}}]	24	44
315	2019-12-24 13:57:55.662754+00	225	Notification object (225)	2	[{"changed": {"fields": ["reference_url", "seen"]}}]	40	44
316	2019-12-24 13:58:08.326873+00	224	Notification object (224)	2	[{"changed": {"fields": ["seen"]}}]	40	44
317	2019-12-24 13:58:16.813125+00	223	Notification object (223)	2	[{"changed": {"fields": ["seen"]}}]	40	44
318	2019-12-24 13:58:23.172943+00	222	Notification object (222)	2	[{"changed": {"fields": ["seen"]}}]	40	44
319	2019-12-24 13:59:11.306564+00	224	Notification object (224)	2	[{"changed": {"fields": ["seen"]}}]	40	44
320	2019-12-24 13:59:17.286092+00	223	Notification object (223)	2	[{"changed": {"fields": ["seen"]}}]	40	44
321	2019-12-24 13:59:22.956985+00	223	Notification object (223)	2	[]	40	44
322	2019-12-24 13:59:28.073904+00	222	Notification object (222)	2	[{"changed": {"fields": ["seen"]}}]	40	44
323	2019-12-24 14:04:18.672119+00	132	Article object (132)	1	[{"added": {}}]	11	44
324	2019-12-24 14:04:53.00561+00	590	canozcan	2	[{"changed": {"fields": ["email_verified"]}}]	7	44
325	2019-12-24 14:20:11.66111+00	213	ArticleComment object (213)	1	[{"added": {}}]	14	44
326	2019-12-24 14:21:21.479708+00	214	ArticleComment object (214)	1	[{"added": {}}]	14	44
327	2019-12-24 14:21:57.009444+00	215	ArticleComment object (215)	1	[{"added": {}}]	14	44
328	2019-12-24 14:26:37.149707+00	226	Notification object (226)	1	[{"added": {}}]	40	44
329	2019-12-24 14:34:51.858027+00	242	Notification object (242)	1	[{"added": {}}]	40	44
330	2019-12-24 14:35:14.748598+00	131	Article object (131)	3		11	44
331	2019-12-24 14:35:14.750576+00	130	Article object (130)	3		11	44
332	2019-12-24 14:35:14.751945+00	129	Article object (129)	3		11	44
333	2019-12-24 14:35:30.386854+00	128	Article object (128)	3		11	44
334	2019-12-24 15:17:42.600113+00	133	Article object (133)	1	[{"added": {}}]	11	44
335	2019-12-24 15:18:25.740809+00	8	Event object (8)	2	[{"changed": {"fields": ["actual"]}}]	17	44
336	2019-12-24 15:19:54.126651+00	348	Notification object (348)	2	[{"changed": {"fields": ["reference_url", "seen"]}}]	40	44
337	2019-12-24 15:28:00.870157+00	133	Article object (133)	2	[{"changed": {"fields": ["title", "content"]}}]	11	44
338	2019-12-24 15:36:21.614066+00	146	Notification object (146)	3		40	44
339	2019-12-24 15:36:21.620863+00	145	Notification object (145)	3		40	44
340	2019-12-24 15:36:21.622808+00	144	Notification object (144)	3		40	44
341	2019-12-24 15:36:21.625513+00	143	Notification object (143)	3		40	44
342	2019-12-24 15:36:21.626821+00	142	Notification object (142)	3		40	44
343	2019-12-24 15:36:21.628096+00	141	Notification object (141)	3		40	44
344	2019-12-24 15:36:21.629337+00	140	Notification object (140)	3		40	44
345	2019-12-24 15:36:21.635027+00	139	Notification object (139)	3		40	44
346	2019-12-24 15:36:21.642529+00	138	Notification object (138)	3		40	44
347	2019-12-24 16:05:36.965408+00	586	nihan	2	[{"changed": {"fields": ["email"]}}]	7	44
348	2019-12-24 16:51:19.619966+00	437	Notification object (437)	2	[{"changed": {"fields": ["user", "reference_url"]}}]	40	44
349	2019-12-24 16:52:19.265584+00	440	Notification object (440)	2	[{"changed": {"fields": ["user", "reference_url"]}}]	40	44
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	authtoken	token
7	api	user
8	api	equipment
9	api	parity
10	api	manualinvestment
11	api	article
12	api	mobileapp
13	api	equipmentcomment
14	api	articlecomment
15	api	following
16	api	like
17	api	event
18	api	paritysetting
19	api	prediction
20	api	stoplossorder
21	api	onlineinvestment
22	api	buyorder
23	api	asset
24	api	portfolioitem
25	api	portfolio
26	oauth2_provider	application
27	oauth2_provider	accesstoken
28	oauth2_provider	grant
29	oauth2_provider	refreshtoken
30	social_django	association
31	social_django	code
32	social_django	nonce
33	social_django	usersocialauth
34	social_django	partial
35	auth	user
36	annotation	annotationtarget
37	annotation	annotationbody
38	annotation	fragmentselector
39	annotation	annotation
40	api	notification
41	api	alert
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-10-20 20:05:57.143322+00
2	contenttypes	0002_remove_content_type_name	2019-10-20 20:05:57.156719+00
3	auth	0001_initial	2019-10-20 20:05:57.199317+00
4	auth	0002_alter_permission_name_max_length	2019-10-20 20:05:57.270078+00
5	auth	0003_alter_user_email_max_length	2019-10-20 20:05:57.27641+00
6	auth	0004_alter_user_username_opts	2019-10-20 20:05:57.282302+00
7	auth	0005_alter_user_last_login_null	2019-10-20 20:05:57.288681+00
8	auth	0006_require_contenttypes_0002	2019-10-20 20:05:57.290596+00
9	auth	0007_alter_validators_add_error_messages	2019-10-20 20:05:57.296402+00
10	auth	0008_alter_user_username_max_length	2019-10-20 20:05:57.302306+00
11	auth	0009_alter_user_last_name_max_length	2019-10-20 20:05:57.308354+00
12	auth	0010_alter_group_name_max_length	2019-10-20 20:05:57.314493+00
13	auth	0011_update_proxy_permissions	2019-10-20 20:05:57.329612+00
14	api	0001_initial	2019-10-20 20:05:57.456568+00
15	admin	0001_initial	2019-10-20 20:05:57.64375+00
16	admin	0002_logentry_remove_auto_add	2019-10-20 20:05:57.682457+00
17	admin	0003_logentry_add_action_flag_choices	2019-10-20 20:05:57.694839+00
18	api	0002_auto_20191015_1938	2019-10-20 20:05:57.717505+00
19	api	0003_remove_user_preferred_currency	2019-10-20 20:05:57.734052+00
20	api	0004_article	2019-10-20 20:05:57.761091+00
21	authtoken	0001_initial	2019-10-20 20:05:57.805282+00
22	authtoken	0002_auto_20160226_1747	2019-10-20 20:05:57.863585+00
23	sessions	0001_initial	2019-10-20 20:05:57.880177+00
32	api	0005_auto_20191021_1504	2019-10-21 20:25:50.317995+00
33	api	0006_auto_20191021_1522	2019-10-21 20:25:50.330742+00
34	api	0007_auto_20191026_1442	2019-10-26 14:42:28.165005+00
35	api	0008_like	2019-10-30 14:20:17.766913+00
36	api	0009_delete_like	2019-10-30 14:24:04.844999+00
37	api	0010_like	2019-10-30 14:28:40.576728+00
38	api	0011_auto_20191103_1816	2019-11-03 18:16:30.333+00
39	api	0012_event_event	2019-11-05 07:22:22.804305+00
40	api	0013_remove_event_event	2019-11-05 07:22:32.270227+00
41	api	0014_event_event	2019-11-05 13:04:35.855089+00
42	api	0015_auto_20191106_2010	2019-11-06 20:10:52.043317+00
43	api	0016_auto_20191106_2013	2019-11-06 20:13:59.675981+00
44	api	0017_auto_20191106_2103	2019-11-06 21:03:34.175336+00
45	api	0018_auto_20191109_1146	2019-11-09 11:46:44.784458+00
46	api	0019_auto_20191110_1019	2019-11-10 10:19:36.118795+00
47	api	0020_auto_20191110_1147	2019-11-10 11:47:05.387257+00
48	api	0021_auto_20191110_2308	2019-11-10 23:08:22.085388+00
49	api	0022_auto_20191110_2310	2019-11-10 23:10:35.733147+00
50	api	0023_auto_20191113_1608	2019-11-13 16:08:58.007958+00
51	api	0024_auto_20191119_1601	2019-11-19 16:02:06.722737+00
52	api	0025_portfolio_portfolioitem	2019-12-07 14:17:01.117158+00
53	oauth2_provider	0001_initial	2019-12-10 11:49:56.708241+00
54	oauth2_provider	0002_08_updates	2019-12-10 11:49:57.066991+00
55	oauth2_provider	0003_auto_20160316_1503	2019-12-10 11:49:57.108158+00
56	oauth2_provider	0004_auto_20160525_1623	2019-12-10 11:49:57.245428+00
57	oauth2_provider	0005_auto_20170514_1141	2019-12-10 11:49:58.404105+00
58	oauth2_provider	0006_auto_20171214_2232	2019-12-10 11:49:58.592554+00
59	default	0001_initial	2019-12-10 11:49:58.745835+00
60	social_auth	0001_initial	2019-12-10 11:49:58.747055+00
61	default	0002_add_related_name	2019-12-10 11:49:58.826355+00
62	social_auth	0002_add_related_name	2019-12-10 11:49:58.827588+00
63	default	0003_alter_email_max_length	2019-12-10 11:49:58.833527+00
64	social_auth	0003_alter_email_max_length	2019-12-10 11:49:58.83461+00
65	default	0004_auto_20160423_0400	2019-12-10 11:49:58.866031+00
66	social_auth	0004_auto_20160423_0400	2019-12-10 11:49:58.867257+00
67	social_auth	0005_auto_20160727_2333	2019-12-10 11:49:58.874638+00
68	social_django	0006_partial	2019-12-10 11:49:58.911513+00
69	social_django	0007_code_timestamp	2019-12-10 11:49:58.939411+00
70	social_django	0008_partial_timestamp	2019-12-10 11:49:58.955405+00
71	social_django	0002_add_related_name	2019-12-10 11:49:58.969795+00
72	social_django	0003_alter_email_max_length	2019-12-10 11:49:58.971735+00
73	social_django	0001_initial	2019-12-10 11:49:58.973415+00
74	social_django	0005_auto_20160727_2333	2019-12-10 11:49:58.97514+00
75	social_django	0004_auto_20160423_0400	2019-12-10 11:49:58.976918+00
76	annotation	0001_initial	2019-12-13 21:39:31.931861+00
77	api	0026_auto_20191219_1729	2019-12-19 17:29:56.390304+00
78	api	0027_notification_seen	2019-12-20 22:08:42.812518+00
79	api	0028_paritysetting_order	2019-12-23 18:44:03.589796+00
80	api	0029_alert	2019-12-23 23:45:57.318432+00
81	api	0030_delete_alert	2019-12-24 00:24:04.24994+00
82	api	0031_alert	2019-12-24 00:36:24.459373+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
e9ut3w9tmwlxnihuktml20u4tumr9bpl	MzY5NTE0YzlkNzEzN2ZjM2RlZmE0MzQ4ZTQ1ZTNmZjE5NjVjNjdhMjp7Il9hdXRoX3VzZXJfaWQiOiI0NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2VhNWVlOTZmZjdlNzk2ZmRmNTZiZTRmZTY2NmI5OTZkOTE4ZGZjMCJ9	2020-01-04 15:48:26.590153+00
s4jdr6kz36i3nl3d8xvk6wpkxuaw7n97	NDcyOWUzYjRkNDVlMGE1ZGRjY2ZkMzM1ZDcyNTZmZWYyY2M5NDlhNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMTdiNWMyZjVmOTE3NmZiY2JmNGEyMzI4OTE1OGM0YmYzYmMxNTk0In0=	2019-12-04 14:09:51.651193+00
q81qjbxola2wrso7xrrkwbv1gv4h8dz4	MmZkOTU4NTkwYjlhZGVhMmZkYzMxZDBkZmZlYjMwNzgxYmU0YmRiMjp7Il9hdXRoX3VzZXJfaWQiOiI1NDUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImFiMzVkNzM4ZjI4NWZiOGM1NmRkMjNmYzMxNDBkYjcwY2JiM2Q2ZjIifQ==	2020-01-04 21:41:49.131185+00
ef1ln2efkdd9oggk4r6lnlx5i2y5cyvb	NDcyOWUzYjRkNDVlMGE1ZGRjY2ZkMzM1ZDcyNTZmZWYyY2M5NDlhNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMTdiNWMyZjVmOTE3NmZiY2JmNGEyMzI4OTE1OGM0YmYzYmMxNTk0In0=	2019-12-09 13:09:22.233926+00
pxu661y8lgzbzn2o587v1kih1hqhhndp	MTIzNjIxOWYzZTM1ZDliNjZlN2RlY2EwZDI3MmY4YjY4OTVlNTczNTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlNjgyMDc1ZTFjMzYyYzgxNTg4NDAzOWY4NDFjN2Y5MjEwODIwYjdmIn0=	2019-12-09 21:26:09.262245+00
pfs4gal9pj0c3kfhblc5cwk2nygsr9q4	NDcyOWUzYjRkNDVlMGE1ZGRjY2ZkMzM1ZDcyNTZmZWYyY2M5NDlhNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMTdiNWMyZjVmOTE3NmZiY2JmNGEyMzI4OTE1OGM0YmYzYmMxNTk0In0=	2019-12-10 08:17:29.632198+00
oq48l6yqv6d2coiw4lq9zwczfjjnz07w	MzY5NTE0YzlkNzEzN2ZjM2RlZmE0MzQ4ZTQ1ZTNmZjE5NjVjNjdhMjp7Il9hdXRoX3VzZXJfaWQiOiI0NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2VhNWVlOTZmZjdlNzk2ZmRmNTZiZTRmZTY2NmI5OTZkOTE4ZGZjMCJ9	2019-12-10 10:06:13.570544+00
mpssinqj3wd9brxrqqn0uenhzqngq7po	MzY5NTE0YzlkNzEzN2ZjM2RlZmE0MzQ4ZTQ1ZTNmZjE5NjVjNjdhMjp7Il9hdXRoX3VzZXJfaWQiOiI0NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2VhNWVlOTZmZjdlNzk2ZmRmNTZiZTRmZTY2NmI5OTZkOTE4ZGZjMCJ9	2019-12-10 12:05:05.414248+00
qb2izsjisnriun9aj62gia0xavk4yt7e	NDcyOWUzYjRkNDVlMGE1ZGRjY2ZkMzM1ZDcyNTZmZWYyY2M5NDlhNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMTdiNWMyZjVmOTE3NmZiY2JmNGEyMzI4OTE1OGM0YmYzYmMxNTk0In0=	2019-11-23 11:58:48.914826+00
8hb3jks9vi30l3n9iogivlvx5wczt849	MzY5NTE0YzlkNzEzN2ZjM2RlZmE0MzQ4ZTQ1ZTNmZjE5NjVjNjdhMjp7Il9hdXRoX3VzZXJfaWQiOiI0NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2VhNWVlOTZmZjdlNzk2ZmRmNTZiZTRmZTY2NmI5OTZkOTE4ZGZjMCJ9	2019-12-10 12:07:01.293895+00
c9e3430syh19r25i8de2a8l0luv92ok5	MzY5NTE0YzlkNzEzN2ZjM2RlZmE0MzQ4ZTQ1ZTNmZjE5NjVjNjdhMjp7Il9hdXRoX3VzZXJfaWQiOiI0NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2VhNWVlOTZmZjdlNzk2ZmRmNTZiZTRmZTY2NmI5OTZkOTE4ZGZjMCJ9	2019-12-10 12:23:05.450877+00
4vwh1hijx9lozu5etf4t1l0rc61riwwo	MzY5NTE0YzlkNzEzN2ZjM2RlZmE0MzQ4ZTQ1ZTNmZjE5NjVjNjdhMjp7Il9hdXRoX3VzZXJfaWQiOiI0NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2VhNWVlOTZmZjdlNzk2ZmRmNTZiZTRmZTY2NmI5OTZkOTE4ZGZjMCJ9	2019-12-22 11:51:12.337084+00
ol8hi4dgqc6h87suhedebney5qsqmou3	NDcyOWUzYjRkNDVlMGE1ZGRjY2ZkMzM1ZDcyNTZmZWYyY2M5NDlhNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMTdiNWMyZjVmOTE3NmZiY2JmNGEyMzI4OTE1OGM0YmYzYmMxNTk0In0=	2019-11-23 16:51:58.733837+00
0nb0bms1n720govdjmh12jzku4k27cy3	NDcyOWUzYjRkNDVlMGE1ZGRjY2ZkMzM1ZDcyNTZmZWYyY2M5NDlhNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMTdiNWMyZjVmOTE3NmZiY2JmNGEyMzI4OTE1OGM0YmYzYmMxNTk0In0=	2019-11-24 13:31:39.534968+00
9m910kdukvvj9ltg2g0qtgh6p9bw27a9	NDcyOWUzYjRkNDVlMGE1ZGRjY2ZkMzM1ZDcyNTZmZWYyY2M5NDlhNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMTdiNWMyZjVmOTE3NmZiY2JmNGEyMzI4OTE1OGM0YmYzYmMxNTk0In0=	2019-11-24 13:54:05.551054+00
edptnyankzlwilcv5wmeetlii055d5e7	NDcyOWUzYjRkNDVlMGE1ZGRjY2ZkMzM1ZDcyNTZmZWYyY2M5NDlhNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMTdiNWMyZjVmOTE3NmZiY2JmNGEyMzI4OTE1OGM0YmYzYmMxNTk0In0=	2019-11-25 11:13:03.398038+00
jt5ai1r3gbnzp5qc8bfcn907u5dnp4xo	MzY5NTE0YzlkNzEzN2ZjM2RlZmE0MzQ4ZTQ1ZTNmZjE5NjVjNjdhMjp7Il9hdXRoX3VzZXJfaWQiOiI0NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2VhNWVlOTZmZjdlNzk2ZmRmNTZiZTRmZTY2NmI5OTZkOTE4ZGZjMCJ9	2019-12-24 10:13:50.007212+00
4q1zvycup68h6tg8reip7k7yhj1zmidh	NDcyOWUzYjRkNDVlMGE1ZGRjY2ZkMzM1ZDcyNTZmZWYyY2M5NDlhNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMTdiNWMyZjVmOTE3NmZiY2JmNGEyMzI4OTE1OGM0YmYzYmMxNTk0In0=	2019-11-26 10:13:59.48283+00
jludkrh6lwzlnrd3uxnlj4bjyk8szssr	MzY5NTE0YzlkNzEzN2ZjM2RlZmE0MzQ4ZTQ1ZTNmZjE5NjVjNjdhMjp7Il9hdXRoX3VzZXJfaWQiOiI0NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2VhNWVlOTZmZjdlNzk2ZmRmNTZiZTRmZTY2NmI5OTZkOTE4ZGZjMCJ9	2019-12-24 10:13:59.520884+00
vw8isye7hfht4l17yxqpdncm585r8pv4	MzY5NTE0YzlkNzEzN2ZjM2RlZmE0MzQ4ZTQ1ZTNmZjE5NjVjNjdhMjp7Il9hdXRoX3VzZXJfaWQiOiI0NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2VhNWVlOTZmZjdlNzk2ZmRmNTZiZTRmZTY2NmI5OTZkOTE4ZGZjMCJ9	2019-12-26 11:58:28.991062+00
9nq3p0als0ukjn4ttiml7jrhwd8ynnb4	MzY5NTE0YzlkNzEzN2ZjM2RlZmE0MzQ4ZTQ1ZTNmZjE5NjVjNjdhMjp7Il9hdXRoX3VzZXJfaWQiOiI0NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2VhNWVlOTZmZjdlNzk2ZmRmNTZiZTRmZTY2NmI5OTZkOTE4ZGZjMCJ9	2019-12-26 12:42:18.048551+00
nf5gbnr5ixv5zyloufqrmhqe6ks89bsu	MzY5NTE0YzlkNzEzN2ZjM2RlZmE0MzQ4ZTQ1ZTNmZjE5NjVjNjdhMjp7Il9hdXRoX3VzZXJfaWQiOiI0NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2VhNWVlOTZmZjdlNzk2ZmRmNTZiZTRmZTY2NmI5OTZkOTE4ZGZjMCJ9	2019-12-27 08:03:54.24337+00
o9i5yr1ht9be8mv3mexq36g272fndq8k	MzY5NTE0YzlkNzEzN2ZjM2RlZmE0MzQ4ZTQ1ZTNmZjE5NjVjNjdhMjp7Il9hdXRoX3VzZXJfaWQiOiI0NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2VhNWVlOTZmZjdlNzk2ZmRmNTZiZTRmZTY2NmI5OTZkOTE4ZGZjMCJ9	2019-12-27 12:50:29.20245+00
v0x6gkn5bxyk53pgvki7bpqh44qkhjwx	MzY5NTE0YzlkNzEzN2ZjM2RlZmE0MzQ4ZTQ1ZTNmZjE5NjVjNjdhMjp7Il9hdXRoX3VzZXJfaWQiOiI0NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2VhNWVlOTZmZjdlNzk2ZmRmNTZiZTRmZTY2NmI5OTZkOTE4ZGZjMCJ9	2019-12-29 12:20:56.918662+00
xnzhep9b2o1a21saa5j079wdu7d961hv	MzY5NTE0YzlkNzEzN2ZjM2RlZmE0MzQ4ZTQ1ZTNmZjE5NjVjNjdhMjp7Il9hdXRoX3VzZXJfaWQiOiI0NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2VhNWVlOTZmZjdlNzk2ZmRmNTZiZTRmZTY2NmI5OTZkOTE4ZGZjMCJ9	2020-01-03 21:53:30.541993+00
j21imkivaq6bbav5u26zif33f075xgg7	MzY5NTE0YzlkNzEzN2ZjM2RlZmE0MzQ4ZTQ1ZTNmZjE5NjVjNjdhMjp7Il9hdXRoX3VzZXJfaWQiOiI0NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2VhNWVlOTZmZjdlNzk2ZmRmNTZiZTRmZTY2NmI5OTZkOTE4ZGZjMCJ9	2020-01-07 10:48:35.038984+00
zg1ksi6g7g8pzsarju1c30br39b8g7xq	MzY5NTE0YzlkNzEzN2ZjM2RlZmE0MzQ4ZTQ1ZTNmZjE5NjVjNjdhMjp7Il9hdXRoX3VzZXJfaWQiOiI0NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2VhNWVlOTZmZjdlNzk2ZmRmNTZiZTRmZTY2NmI5OTZkOTE4ZGZjMCJ9	2020-01-07 11:20:55.217321+00
wncf96n7usz01r7jjzvuy92e1829qeny	MzY5NTE0YzlkNzEzN2ZjM2RlZmE0MzQ4ZTQ1ZTNmZjE5NjVjNjdhMjp7Il9hdXRoX3VzZXJfaWQiOiI0NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2VhNWVlOTZmZjdlNzk2ZmRmNTZiZTRmZTY2NmI5OTZkOTE4ZGZjMCJ9	2020-01-07 11:34:50.204996+00
l3wp5oawdkkj4gl8itftrhq5bbykc0q2	MzY5NTE0YzlkNzEzN2ZjM2RlZmE0MzQ4ZTQ1ZTNmZjE5NjVjNjdhMjp7Il9hdXRoX3VzZXJfaWQiOiI0NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2VhNWVlOTZmZjdlNzk2ZmRmNTZiZTRmZTY2NmI5OTZkOTE4ZGZjMCJ9	2020-01-07 13:33:14.607275+00
sdi80udq9irhw1kr3uiabf1zk0abviks	MzY5NTE0YzlkNzEzN2ZjM2RlZmE0MzQ4ZTQ1ZTNmZjE5NjVjNjdhMjp7Il9hdXRoX3VzZXJfaWQiOiI0NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2VhNWVlOTZmZjdlNzk2ZmRmNTZiZTRmZTY2NmI5OTZkOTE4ZGZjMCJ9	2020-01-07 13:47:27.731515+00
iu2hsde65pmkj2c2nn5y0n901xk5qtjn	MzY5NTE0YzlkNzEzN2ZjM2RlZmE0MzQ4ZTQ1ZTNmZjE5NjVjNjdhMjp7Il9hdXRoX3VzZXJfaWQiOiI0NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2VhNWVlOTZmZjdlNzk2ZmRmNTZiZTRmZTY2NmI5OTZkOTE4ZGZjMCJ9	2020-01-07 14:02:24.218393+00
0rwfoepytdg4ooqcpj42i8q51wf6gbr5	MzY5NTE0YzlkNzEzN2ZjM2RlZmE0MzQ4ZTQ1ZTNmZjE5NjVjNjdhMjp7Il9hdXRoX3VzZXJfaWQiOiI0NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2VhNWVlOTZmZjdlNzk2ZmRmNTZiZTRmZTY2NmI5OTZkOTE4ZGZjMCJ9	2020-01-07 14:34:12.615432+00
m2gas7q9i1l2ab8f0cl78edb6sj0n161	MzY5NTE0YzlkNzEzN2ZjM2RlZmE0MzQ4ZTQ1ZTNmZjE5NjVjNjdhMjp7Il9hdXRoX3VzZXJfaWQiOiI0NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2VhNWVlOTZmZjdlNzk2ZmRmNTZiZTRmZTY2NmI5OTZkOTE4ZGZjMCJ9	2020-01-07 15:17:32.780548+00
clfxgbyluex1a0hb21samc7i98xf4q28	MzY5NTE0YzlkNzEzN2ZjM2RlZmE0MzQ4ZTQ1ZTNmZjE5NjVjNjdhMjp7Il9hdXRoX3VzZXJfaWQiOiI0NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2VhNWVlOTZmZjdlNzk2ZmRmNTZiZTRmZTY2NmI5OTZkOTE4ZGZjMCJ9	2020-01-07 16:15:38.587716+00
8381f7i0ug506fv6kh55ly7klv443tuo	MzY5NTE0YzlkNzEzN2ZjM2RlZmE0MzQ4ZTQ1ZTNmZjE5NjVjNjdhMjp7Il9hdXRoX3VzZXJfaWQiOiI0NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2VhNWVlOTZmZjdlNzk2ZmRmNTZiZTRmZTY2NmI5OTZkOTE4ZGZjMCJ9	2020-01-08 11:12:16.895293+00
\.


--
-- Data for Name: oauth2_provider_accesstoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_provider_accesstoken (id, token, expires, scope, application_id, user_id, created, updated, source_refresh_token_id) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_application; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_provider_application (id, client_id, redirect_uris, client_type, authorization_grant_type, client_secret, name, user_id, skip_authorization, created, updated) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_grant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_provider_grant (id, code, expires, redirect_uri, scope, application_id, user_id, created, updated) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_refreshtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_provider_refreshtoken (id, token, access_token_id, application_id, user_id, created, updated, revoked) FROM stdin;
\.


--
-- Data for Name: social_auth_association; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_association (id, server_url, handle, secret, issued, lifetime, assoc_type) FROM stdin;
\.


--
-- Data for Name: social_auth_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_code (id, email, code, verified, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_nonce; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_nonce (id, server_url, "timestamp", salt) FROM stdin;
\.


--
-- Data for Name: social_auth_partial; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_partial (id, token, next_step, backend, data, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_usersocialauth; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_usersocialauth (id, provider, uid, extra_data, user_id) FROM stdin;
\.


--
-- Name: annotation_annotation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.annotation_annotation_id_seq', 1, false);


--
-- Name: annotation_annotationbody_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.annotation_annotationbody_id_seq', 1, false);


--
-- Name: annotation_annotationtarget_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.annotation_annotationtarget_id_seq', 1, false);


--
-- Name: annotation_fragmentselector_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.annotation_fragmentselector_id_seq', 1, false);


--
-- Name: api_alert_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_alert_id_seq', 11, true);


--
-- Name: api_article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_article_id_seq', 133, true);


--
-- Name: api_articlecomment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_articlecomment_id_seq', 216, true);


--
-- Name: api_articlecomment_liked_by_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_articlecomment_liked_by_id_seq', 62, true);


--
-- Name: api_asset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_asset_id_seq', 39, true);


--
-- Name: api_buyorder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_buyorder_id_seq', 12, true);


--
-- Name: api_equipment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_equipment_id_seq', 921, true);


--
-- Name: api_equipmentcomment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_equipmentcomment_id_seq', 59, true);


--
-- Name: api_equipmentcomment_liked_by_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_equipmentcomment_liked_by_id_seq', 7, true);


--
-- Name: api_event_followed_by_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_event_followed_by_id_seq', 75, true);


--
-- Name: api_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_event_id_seq', 11, true);


--
-- Name: api_following_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_following_id_seq', 1418, true);


--
-- Name: api_like_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_like_id_seq', 602, true);


--
-- Name: api_manualinvestment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_manualinvestment_id_seq', 11, true);


--
-- Name: api_mobileapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_mobileapp_id_seq', 2, true);


--
-- Name: api_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_notification_id_seq', 454, true);


--
-- Name: api_onlineinvestment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_onlineinvestment_id_seq', 33, true);


--
-- Name: api_parity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_parity_id_seq', 56717, true);


--
-- Name: api_paritysetting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_paritysetting_id_seq', 32, true);


--
-- Name: api_portfolio_followed_by_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_portfolio_followed_by_id_seq', 21, true);


--
-- Name: api_portfolio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_portfolio_id_seq', 44, true);


--
-- Name: api_portfolioitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_portfolioitem_id_seq', 120, true);


--
-- Name: api_prediction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_prediction_id_seq', 1458, true);


--
-- Name: api_stoplossorder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_stoplossorder_id_seq', 2, true);


--
-- Name: api_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_user_groups_id_seq', 1, false);


--
-- Name: api_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_user_id_seq', 592, true);


--
-- Name: api_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_user_user_permissions_id_seq', 92, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 164, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 349, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 41, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 82, true);


--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth2_provider_accesstoken_id_seq', 2, true);


--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth2_provider_application_id_seq', 1, true);


--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth2_provider_grant_id_seq', 1, false);


--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth2_provider_refreshtoken_id_seq', 2, true);


--
-- Name: social_auth_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_association_id_seq', 1, false);


--
-- Name: social_auth_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_code_id_seq', 1, false);


--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_nonce_id_seq', 1, false);


--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_partial_id_seq', 1, false);


--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_usersocialauth_id_seq', 2, true);


--
-- Name: annotation_annotation annotation_annotation_body_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation_annotation
    ADD CONSTRAINT annotation_annotation_body_id_key UNIQUE (body_id);


--
-- Name: annotation_annotation annotation_annotation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation_annotation
    ADD CONSTRAINT annotation_annotation_pkey PRIMARY KEY (id);


--
-- Name: annotation_annotation annotation_annotation_target_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation_annotation
    ADD CONSTRAINT annotation_annotation_target_id_key UNIQUE (target_id);


--
-- Name: annotation_annotationbody annotation_annotationbody_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation_annotationbody
    ADD CONSTRAINT annotation_annotationbody_pkey PRIMARY KEY (id);


--
-- Name: annotation_annotationtarget annotation_annotationtarget_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation_annotationtarget
    ADD CONSTRAINT annotation_annotationtarget_pkey PRIMARY KEY (id);


--
-- Name: annotation_annotationtarget annotation_annotationtarget_selector_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation_annotationtarget
    ADD CONSTRAINT annotation_annotationtarget_selector_id_key UNIQUE (selector_id);


--
-- Name: annotation_fragmentselector annotation_fragmentselector_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation_fragmentselector
    ADD CONSTRAINT annotation_fragmentselector_pkey PRIMARY KEY (id);


--
-- Name: api_alert api_alert_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_alert
    ADD CONSTRAINT api_alert_pkey PRIMARY KEY (id);


--
-- Name: api_article api_article_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_article
    ADD CONSTRAINT api_article_pkey PRIMARY KEY (id);


--
-- Name: api_articlecomment_liked_by api_articlecomment_liked_articlecomment_id_user_i_0955ec4f_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_articlecomment_liked_by
    ADD CONSTRAINT api_articlecomment_liked_articlecomment_id_user_i_0955ec4f_uniq UNIQUE (articlecomment_id, user_id);


--
-- Name: api_articlecomment_liked_by api_articlecomment_liked_by_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_articlecomment_liked_by
    ADD CONSTRAINT api_articlecomment_liked_by_pkey PRIMARY KEY (id);


--
-- Name: api_articlecomment api_articlecomment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_articlecomment
    ADD CONSTRAINT api_articlecomment_pkey PRIMARY KEY (id);


--
-- Name: api_asset api_asset_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_asset
    ADD CONSTRAINT api_asset_pkey PRIMARY KEY (id);


--
-- Name: api_asset api_asset_user_id_equipment_id_f09c94e7_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_asset
    ADD CONSTRAINT api_asset_user_id_equipment_id_f09c94e7_uniq UNIQUE (user_id, equipment_id);


--
-- Name: api_buyorder api_buyorder_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_buyorder
    ADD CONSTRAINT api_buyorder_pkey PRIMARY KEY (id);


--
-- Name: api_equipment api_equipment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_equipment
    ADD CONSTRAINT api_equipment_pkey PRIMARY KEY (id);


--
-- Name: api_equipment api_equipment_symbol_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_equipment
    ADD CONSTRAINT api_equipment_symbol_key UNIQUE (symbol);


--
-- Name: api_equipmentcomment_liked_by api_equipmentcomment_lik_equipmentcomment_id_user_bb907f65_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_equipmentcomment_liked_by
    ADD CONSTRAINT api_equipmentcomment_lik_equipmentcomment_id_user_bb907f65_uniq UNIQUE (equipmentcomment_id, user_id);


--
-- Name: api_equipmentcomment_liked_by api_equipmentcomment_liked_by_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_equipmentcomment_liked_by
    ADD CONSTRAINT api_equipmentcomment_liked_by_pkey PRIMARY KEY (id);


--
-- Name: api_equipmentcomment api_equipmentcomment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_equipmentcomment
    ADD CONSTRAINT api_equipmentcomment_pkey PRIMARY KEY (id);


--
-- Name: api_event api_event_calendarId_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_event
    ADD CONSTRAINT "api_event_calendarId_key" UNIQUE ("calendarId");


--
-- Name: api_event_followed_by api_event_followed_by_event_id_user_id_c4fd92e3_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_event_followed_by
    ADD CONSTRAINT api_event_followed_by_event_id_user_id_c4fd92e3_uniq UNIQUE (event_id, user_id);


--
-- Name: api_event_followed_by api_event_followed_by_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_event_followed_by
    ADD CONSTRAINT api_event_followed_by_pkey PRIMARY KEY (id);


--
-- Name: api_event api_event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_event
    ADD CONSTRAINT api_event_pkey PRIMARY KEY (id);


--
-- Name: api_following api_following_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_following
    ADD CONSTRAINT api_following_pkey PRIMARY KEY (id);


--
-- Name: api_following api_following_user_following_id_user_followed_id_de43861d_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_following
    ADD CONSTRAINT api_following_user_following_id_user_followed_id_de43861d_uniq UNIQUE (user_following_id, user_followed_id);


--
-- Name: api_like api_like_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_like
    ADD CONSTRAINT api_like_pkey PRIMARY KEY (id);


--
-- Name: api_manualinvestment api_manualinvestment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_manualinvestment
    ADD CONSTRAINT api_manualinvestment_pkey PRIMARY KEY (id);


--
-- Name: api_mobileapp api_mobileapp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_mobileapp
    ADD CONSTRAINT api_mobileapp_pkey PRIMARY KEY (id);


--
-- Name: api_notification api_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_notification
    ADD CONSTRAINT api_notification_pkey PRIMARY KEY (id);


--
-- Name: api_onlineinvestment api_onlineinvestment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_onlineinvestment
    ADD CONSTRAINT api_onlineinvestment_pkey PRIMARY KEY (id);


--
-- Name: api_parity api_parity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_parity
    ADD CONSTRAINT api_parity_pkey PRIMARY KEY (id);


--
-- Name: api_paritysetting api_paritysetting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_paritysetting
    ADD CONSTRAINT api_paritysetting_pkey PRIMARY KEY (id);


--
-- Name: api_portfolio_followed_by api_portfolio_followed_by_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_portfolio_followed_by
    ADD CONSTRAINT api_portfolio_followed_by_pkey PRIMARY KEY (id);


--
-- Name: api_portfolio_followed_by api_portfolio_followed_by_portfolio_id_user_id_5cd6115b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_portfolio_followed_by
    ADD CONSTRAINT api_portfolio_followed_by_portfolio_id_user_id_5cd6115b_uniq UNIQUE (portfolio_id, user_id);


--
-- Name: api_portfolio api_portfolio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_portfolio
    ADD CONSTRAINT api_portfolio_pkey PRIMARY KEY (id);


--
-- Name: api_portfolioitem api_portfolioitem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_portfolioitem
    ADD CONSTRAINT api_portfolioitem_pkey PRIMARY KEY (id);


--
-- Name: api_prediction api_prediction_date_user_id_base_equipm_14120460_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_prediction
    ADD CONSTRAINT api_prediction_date_user_id_base_equipm_14120460_uniq UNIQUE (date, user_id, base_equipment_id, target_equipment_id);


--
-- Name: api_prediction api_prediction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_prediction
    ADD CONSTRAINT api_prediction_pkey PRIMARY KEY (id);


--
-- Name: api_stoplossorder api_stoplossorder_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_stoplossorder
    ADD CONSTRAINT api_stoplossorder_pkey PRIMARY KEY (id);


--
-- Name: api_user_groups api_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_user_groups
    ADD CONSTRAINT api_user_groups_pkey PRIMARY KEY (id);


--
-- Name: api_user_groups api_user_groups_user_id_group_id_9c7ddfb5_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_user_groups
    ADD CONSTRAINT api_user_groups_user_id_group_id_9c7ddfb5_uniq UNIQUE (user_id, group_id);


--
-- Name: api_user api_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_user
    ADD CONSTRAINT api_user_pkey PRIMARY KEY (id);


--
-- Name: api_user_user_permissions api_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_user_user_permissions
    ADD CONSTRAINT api_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: api_user_user_permissions api_user_user_permissions_user_id_permission_id_a06dd704_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_user_user_permissions
    ADD CONSTRAINT api_user_user_permissions_user_id_permission_id_a06dd704_uniq UNIQUE (user_id, permission_id);


--
-- Name: api_user api_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_user
    ADD CONSTRAINT api_user_username_key UNIQUE (username);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_source_refresh_token_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_source_refresh_token_id_key UNIQUE (source_refresh_token_id);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_token_8af090f8_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_token_8af090f8_uniq UNIQUE (token);


--
-- Name: oauth2_provider_application oauth2_provider_application_client_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_client_id_key UNIQUE (client_id);


--
-- Name: oauth2_provider_application oauth2_provider_application_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_grant oauth2_provider_grant_code_49ab4ddf_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_code_49ab4ddf_uniq UNIQUE (code);


--
-- Name: oauth2_provider_grant oauth2_provider_grant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_access_token_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_access_token_id_key UNIQUE (access_token_id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq UNIQUE (token, revoked);


--
-- Name: social_auth_association social_auth_association_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association social_auth_association_server_url_handle_078befa2_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_server_url_handle_078befa2_uniq UNIQUE (server_url, handle);


--
-- Name: social_auth_code social_auth_code_email_code_801b2d02_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_email_code_801b2d02_uniq UNIQUE (email, code);


--
-- Name: social_auth_code social_auth_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_server_url_timestamp_salt_f6284463_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_server_url_timestamp_salt_f6284463_uniq UNIQUE (server_url, "timestamp", salt);


--
-- Name: social_auth_partial social_auth_partial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_partial
    ADD CONSTRAINT social_auth_partial_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_provider_uid_e6b5e668_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_provider_uid_e6b5e668_uniq UNIQUE (provider, uid);


--
-- Name: api_alert_user_id_5f900564; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_alert_user_id_5f900564 ON public.api_alert USING btree (user_id);


--
-- Name: api_article_author_id_200136e7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_article_author_id_200136e7 ON public.api_article USING btree (author_id);


--
-- Name: api_articlecomment_article_id_6d128e03; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_articlecomment_article_id_6d128e03 ON public.api_articlecomment USING btree (article_id);


--
-- Name: api_articlecomment_liked_by_articlecomment_id_861698a9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_articlecomment_liked_by_articlecomment_id_861698a9 ON public.api_articlecomment_liked_by USING btree (articlecomment_id);


--
-- Name: api_articlecomment_liked_by_user_id_c21696ce; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_articlecomment_liked_by_user_id_c21696ce ON public.api_articlecomment_liked_by USING btree (user_id);


--
-- Name: api_articlecomment_user_id_dd4cf008; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_articlecomment_user_id_dd4cf008 ON public.api_articlecomment USING btree (user_id);


--
-- Name: api_asset_equipment_id_9537a94e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_asset_equipment_id_9537a94e ON public.api_asset USING btree (equipment_id);


--
-- Name: api_asset_user_id_4a2fb19d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_asset_user_id_4a2fb19d ON public.api_asset USING btree (user_id);


--
-- Name: api_buyorder_base_equipment_id_9465e243; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_buyorder_base_equipment_id_9465e243 ON public.api_buyorder USING btree (base_equipment_id);


--
-- Name: api_buyorder_target_equipment_id_c15093ad; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_buyorder_target_equipment_id_c15093ad ON public.api_buyorder USING btree (target_equipment_id);


--
-- Name: api_buyorder_user_id_74a8ea8f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_buyorder_user_id_74a8ea8f ON public.api_buyorder USING btree (user_id);


--
-- Name: api_equipment_symbol_34495a9c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_equipment_symbol_34495a9c_like ON public.api_equipment USING btree (symbol varchar_pattern_ops);


--
-- Name: api_equipmentcomment_equipment_id_6bdf12c4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_equipmentcomment_equipment_id_6bdf12c4 ON public.api_equipmentcomment USING btree (equipment_id);


--
-- Name: api_equipmentcomment_liked_by_equipmentcomment_id_beb362c7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_equipmentcomment_liked_by_equipmentcomment_id_beb362c7 ON public.api_equipmentcomment_liked_by USING btree (equipmentcomment_id);


--
-- Name: api_equipmentcomment_liked_by_user_id_aa79c0b2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_equipmentcomment_liked_by_user_id_aa79c0b2 ON public.api_equipmentcomment_liked_by USING btree (user_id);


--
-- Name: api_equipmentcomment_user_id_93468504; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_equipmentcomment_user_id_93468504 ON public.api_equipmentcomment USING btree (user_id);


--
-- Name: api_event_calendarId_b3433728_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "api_event_calendarId_b3433728_like" ON public.api_event USING btree ("calendarId" varchar_pattern_ops);


--
-- Name: api_event_followed_by_event_id_dfe02b6d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_event_followed_by_event_id_dfe02b6d ON public.api_event_followed_by USING btree (event_id);


--
-- Name: api_event_followed_by_user_id_b33da771; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_event_followed_by_user_id_b33da771 ON public.api_event_followed_by USING btree (user_id);


--
-- Name: api_following_user_followed_id_61e1112f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_following_user_followed_id_61e1112f ON public.api_following USING btree (user_followed_id);


--
-- Name: api_following_user_following_id_bf70857b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_following_user_following_id_bf70857b ON public.api_following USING btree (user_following_id);


--
-- Name: api_like_article_id_09478734; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_like_article_id_09478734 ON public.api_like USING btree (article_id);


--
-- Name: api_like_user_id_cf2ea3c1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_like_user_id_cf2ea3c1 ON public.api_like USING btree (user_id);


--
-- Name: api_manualinvestment_base_equipment_id_5b877cb3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_manualinvestment_base_equipment_id_5b877cb3 ON public.api_manualinvestment USING btree (base_equipment_id);


--
-- Name: api_manualinvestment_made_by_id_bc536d7d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_manualinvestment_made_by_id_bc536d7d ON public.api_manualinvestment USING btree (user_id);


--
-- Name: api_manualinvestment_target_equipment_id_12cdeec1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_manualinvestment_target_equipment_id_12cdeec1 ON public.api_manualinvestment USING btree (target_equipment_id);


--
-- Name: api_notification_user_id_6cede59e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_notification_user_id_6cede59e ON public.api_notification USING btree (user_id);


--
-- Name: api_onlineinvestment_base_equipment_id_4172b2d1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_onlineinvestment_base_equipment_id_4172b2d1 ON public.api_onlineinvestment USING btree (base_equipment_id);


--
-- Name: api_onlineinvestment_target_equipment_id_efdba66a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_onlineinvestment_target_equipment_id_efdba66a ON public.api_onlineinvestment USING btree (target_equipment_id);


--
-- Name: api_onlineinvestment_user_id_f3b7737f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_onlineinvestment_user_id_f3b7737f ON public.api_onlineinvestment USING btree (user_id);


--
-- Name: api_parity_base_equipment_id_613500fb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_parity_base_equipment_id_613500fb ON public.api_parity USING btree (base_equipment_id);


--
-- Name: api_parity_target_equipment_id_4fe91f7f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_parity_target_equipment_id_4fe91f7f ON public.api_parity USING btree (target_equipment_id);


--
-- Name: api_paritysetting_base_equipment_id_b7b631e8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_paritysetting_base_equipment_id_b7b631e8 ON public.api_paritysetting USING btree (base_equipment_id);


--
-- Name: api_paritysetting_target_equipment_id_1fefb3b3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_paritysetting_target_equipment_id_1fefb3b3 ON public.api_paritysetting USING btree (target_equipment_id);


--
-- Name: api_portfolio_followed_by_portfolio_id_17acb60b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_portfolio_followed_by_portfolio_id_17acb60b ON public.api_portfolio_followed_by USING btree (portfolio_id);


--
-- Name: api_portfolio_followed_by_user_id_a5c28cc4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_portfolio_followed_by_user_id_a5c28cc4 ON public.api_portfolio_followed_by USING btree (user_id);


--
-- Name: api_portfolio_user_id_e6fae4d5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_portfolio_user_id_e6fae4d5 ON public.api_portfolio USING btree (user_id);


--
-- Name: api_portfolioitem_base_equipment_id_caea81bd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_portfolioitem_base_equipment_id_caea81bd ON public.api_portfolioitem USING btree (base_equipment_id);


--
-- Name: api_portfolioitem_portfolio_id_20128f35; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_portfolioitem_portfolio_id_20128f35 ON public.api_portfolioitem USING btree (portfolio_id);


--
-- Name: api_portfolioitem_target_equipment_id_5778658a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_portfolioitem_target_equipment_id_5778658a ON public.api_portfolioitem USING btree (target_equipment_id);


--
-- Name: api_prediction_base_equipment_id_d673018d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_prediction_base_equipment_id_d673018d ON public.api_prediction USING btree (base_equipment_id);


--
-- Name: api_prediction_target_equipment_id_836e3ffc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_prediction_target_equipment_id_836e3ffc ON public.api_prediction USING btree (target_equipment_id);


--
-- Name: api_prediction_user_id_c3908040; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_prediction_user_id_c3908040 ON public.api_prediction USING btree (user_id);


--
-- Name: api_stoplossorder_base_equipment_id_4525f079; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_stoplossorder_base_equipment_id_4525f079 ON public.api_stoplossorder USING btree (base_equipment_id);


--
-- Name: api_stoplossorder_target_equipment_id_7e51d415; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_stoplossorder_target_equipment_id_7e51d415 ON public.api_stoplossorder USING btree (target_equipment_id);


--
-- Name: api_stoplossorder_user_id_4fcc6ea4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_stoplossorder_user_id_4fcc6ea4 ON public.api_stoplossorder USING btree (user_id);


--
-- Name: api_user_groups_group_id_3af85785; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_user_groups_group_id_3af85785 ON public.api_user_groups USING btree (group_id);


--
-- Name: api_user_groups_user_id_a5ff39fa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_user_groups_user_id_a5ff39fa ON public.api_user_groups USING btree (user_id);


--
-- Name: api_user_user_permissions_permission_id_305b7fea; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_user_user_permissions_permission_id_305b7fea ON public.api_user_user_permissions USING btree (permission_id);


--
-- Name: api_user_user_permissions_user_id_f3945d65; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_user_user_permissions_user_id_f3945d65 ON public.api_user_user_permissions USING btree (user_id);


--
-- Name: api_user_username_cf4e88d2_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_user_username_cf4e88d2_like ON public.api_user USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: oauth2_provider_accesstoken_application_id_b22886e1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_accesstoken_application_id_b22886e1 ON public.oauth2_provider_accesstoken USING btree (application_id);


--
-- Name: oauth2_provider_accesstoken_token_8af090f8_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_accesstoken_token_8af090f8_like ON public.oauth2_provider_accesstoken USING btree (token varchar_pattern_ops);


--
-- Name: oauth2_provider_accesstoken_user_id_6e4c9a65; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_accesstoken_user_id_6e4c9a65 ON public.oauth2_provider_accesstoken USING btree (user_id);


--
-- Name: oauth2_provider_application_client_id_03f0cc84_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_application_client_id_03f0cc84_like ON public.oauth2_provider_application USING btree (client_id varchar_pattern_ops);


--
-- Name: oauth2_provider_application_client_secret_53133678; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_application_client_secret_53133678 ON public.oauth2_provider_application USING btree (client_secret);


--
-- Name: oauth2_provider_application_client_secret_53133678_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_application_client_secret_53133678_like ON public.oauth2_provider_application USING btree (client_secret varchar_pattern_ops);


--
-- Name: oauth2_provider_application_user_id_79829054; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_application_user_id_79829054 ON public.oauth2_provider_application USING btree (user_id);


--
-- Name: oauth2_provider_grant_application_id_81923564; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_grant_application_id_81923564 ON public.oauth2_provider_grant USING btree (application_id);


--
-- Name: oauth2_provider_grant_code_49ab4ddf_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_grant_code_49ab4ddf_like ON public.oauth2_provider_grant USING btree (code varchar_pattern_ops);


--
-- Name: oauth2_provider_grant_user_id_e8f62af8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_grant_user_id_e8f62af8 ON public.oauth2_provider_grant USING btree (user_id);


--
-- Name: oauth2_provider_refreshtoken_application_id_2d1c311b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_refreshtoken_application_id_2d1c311b ON public.oauth2_provider_refreshtoken USING btree (application_id);


--
-- Name: oauth2_provider_refreshtoken_user_id_da837fce; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_refreshtoken_user_id_da837fce ON public.oauth2_provider_refreshtoken USING btree (user_id);


--
-- Name: social_auth_code_code_a2393167; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_code_code_a2393167 ON public.social_auth_code USING btree (code);


--
-- Name: social_auth_code_code_a2393167_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_code_code_a2393167_like ON public.social_auth_code USING btree (code varchar_pattern_ops);


--
-- Name: social_auth_code_timestamp_176b341f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_code_timestamp_176b341f ON public.social_auth_code USING btree ("timestamp");


--
-- Name: social_auth_partial_timestamp_50f2119f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_partial_timestamp_50f2119f ON public.social_auth_partial USING btree ("timestamp");


--
-- Name: social_auth_partial_token_3017fea3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_partial_token_3017fea3 ON public.social_auth_partial USING btree (token);


--
-- Name: social_auth_partial_token_3017fea3_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_partial_token_3017fea3_like ON public.social_auth_partial USING btree (token varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_user_id_17d28448; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_usersocialauth_user_id_17d28448 ON public.social_auth_usersocialauth USING btree (user_id);


--
-- Name: annotation_annotation annotation_annotatio_body_id_b571cbe7_fk_annotatio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation_annotation
    ADD CONSTRAINT annotation_annotatio_body_id_b571cbe7_fk_annotatio FOREIGN KEY (body_id) REFERENCES public.annotation_annotationbody(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: annotation_annotationtarget annotation_annotatio_selector_id_5675d30b_fk_annotatio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation_annotationtarget
    ADD CONSTRAINT annotation_annotatio_selector_id_5675d30b_fk_annotatio FOREIGN KEY (selector_id) REFERENCES public.annotation_fragmentselector(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: annotation_annotation annotation_annotatio_target_id_e6185b3c_fk_annotatio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation_annotation
    ADD CONSTRAINT annotation_annotatio_target_id_e6185b3c_fk_annotatio FOREIGN KEY (target_id) REFERENCES public.annotation_annotationtarget(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_alert api_alert_user_id_5f900564_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_alert
    ADD CONSTRAINT api_alert_user_id_5f900564_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_article api_article_author_id_200136e7_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_article
    ADD CONSTRAINT api_article_author_id_200136e7_fk_api_user_id FOREIGN KEY (author_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_articlecomment api_articlecomment_article_id_6d128e03_fk_api_article_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_articlecomment
    ADD CONSTRAINT api_articlecomment_article_id_6d128e03_fk_api_article_id FOREIGN KEY (article_id) REFERENCES public.api_article(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_articlecomment_liked_by api_articlecomment_l_articlecomment_id_861698a9_fk_api_artic; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_articlecomment_liked_by
    ADD CONSTRAINT api_articlecomment_l_articlecomment_id_861698a9_fk_api_artic FOREIGN KEY (articlecomment_id) REFERENCES public.api_articlecomment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_articlecomment_liked_by api_articlecomment_liked_by_user_id_c21696ce_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_articlecomment_liked_by
    ADD CONSTRAINT api_articlecomment_liked_by_user_id_c21696ce_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_articlecomment api_articlecomment_user_id_dd4cf008_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_articlecomment
    ADD CONSTRAINT api_articlecomment_user_id_dd4cf008_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_asset api_asset_equipment_id_9537a94e_fk_api_equipment_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_asset
    ADD CONSTRAINT api_asset_equipment_id_9537a94e_fk_api_equipment_id FOREIGN KEY (equipment_id) REFERENCES public.api_equipment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_asset api_asset_user_id_4a2fb19d_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_asset
    ADD CONSTRAINT api_asset_user_id_4a2fb19d_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_buyorder api_buyorder_base_equipment_id_9465e243_fk_api_equipment_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_buyorder
    ADD CONSTRAINT api_buyorder_base_equipment_id_9465e243_fk_api_equipment_id FOREIGN KEY (base_equipment_id) REFERENCES public.api_equipment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_buyorder api_buyorder_target_equipment_id_c15093ad_fk_api_equipment_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_buyorder
    ADD CONSTRAINT api_buyorder_target_equipment_id_c15093ad_fk_api_equipment_id FOREIGN KEY (target_equipment_id) REFERENCES public.api_equipment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_buyorder api_buyorder_user_id_74a8ea8f_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_buyorder
    ADD CONSTRAINT api_buyorder_user_id_74a8ea8f_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_equipmentcomment api_equipmentcomment_equipment_id_6bdf12c4_fk_api_equipment_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_equipmentcomment
    ADD CONSTRAINT api_equipmentcomment_equipment_id_6bdf12c4_fk_api_equipment_id FOREIGN KEY (equipment_id) REFERENCES public.api_equipment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_equipmentcomment_liked_by api_equipmentcomment_equipmentcomment_id_beb362c7_fk_api_equip; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_equipmentcomment_liked_by
    ADD CONSTRAINT api_equipmentcomment_equipmentcomment_id_beb362c7_fk_api_equip FOREIGN KEY (equipmentcomment_id) REFERENCES public.api_equipmentcomment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_equipmentcomment_liked_by api_equipmentcomment_liked_by_user_id_aa79c0b2_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_equipmentcomment_liked_by
    ADD CONSTRAINT api_equipmentcomment_liked_by_user_id_aa79c0b2_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_equipmentcomment api_equipmentcomment_user_id_93468504_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_equipmentcomment
    ADD CONSTRAINT api_equipmentcomment_user_id_93468504_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_event_followed_by api_event_followed_by_event_id_dfe02b6d_fk_api_event_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_event_followed_by
    ADD CONSTRAINT api_event_followed_by_event_id_dfe02b6d_fk_api_event_id FOREIGN KEY (event_id) REFERENCES public.api_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_event_followed_by api_event_followed_by_user_id_b33da771_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_event_followed_by
    ADD CONSTRAINT api_event_followed_by_user_id_b33da771_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_following api_following_user_followed_id_61e1112f_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_following
    ADD CONSTRAINT api_following_user_followed_id_61e1112f_fk_api_user_id FOREIGN KEY (user_followed_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_following api_following_user_following_id_bf70857b_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_following
    ADD CONSTRAINT api_following_user_following_id_bf70857b_fk_api_user_id FOREIGN KEY (user_following_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_like api_like_article_id_09478734_fk_api_article_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_like
    ADD CONSTRAINT api_like_article_id_09478734_fk_api_article_id FOREIGN KEY (article_id) REFERENCES public.api_article(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_like api_like_user_id_cf2ea3c1_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_like
    ADD CONSTRAINT api_like_user_id_cf2ea3c1_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_manualinvestment api_manualinvestment_base_equipment_id_5b877cb3_fk_api_equip; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_manualinvestment
    ADD CONSTRAINT api_manualinvestment_base_equipment_id_5b877cb3_fk_api_equip FOREIGN KEY (base_equipment_id) REFERENCES public.api_equipment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_manualinvestment api_manualinvestment_target_equipment_id_12cdeec1_fk_api_equip; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_manualinvestment
    ADD CONSTRAINT api_manualinvestment_target_equipment_id_12cdeec1_fk_api_equip FOREIGN KEY (target_equipment_id) REFERENCES public.api_equipment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_manualinvestment api_manualinvestment_user_id_c31e8753_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_manualinvestment
    ADD CONSTRAINT api_manualinvestment_user_id_c31e8753_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_notification api_notification_user_id_6cede59e_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_notification
    ADD CONSTRAINT api_notification_user_id_6cede59e_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_onlineinvestment api_onlineinvestment_base_equipment_id_4172b2d1_fk_api_equip; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_onlineinvestment
    ADD CONSTRAINT api_onlineinvestment_base_equipment_id_4172b2d1_fk_api_equip FOREIGN KEY (base_equipment_id) REFERENCES public.api_equipment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_onlineinvestment api_onlineinvestment_target_equipment_id_efdba66a_fk_api_equip; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_onlineinvestment
    ADD CONSTRAINT api_onlineinvestment_target_equipment_id_efdba66a_fk_api_equip FOREIGN KEY (target_equipment_id) REFERENCES public.api_equipment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_onlineinvestment api_onlineinvestment_user_id_f3b7737f_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_onlineinvestment
    ADD CONSTRAINT api_onlineinvestment_user_id_f3b7737f_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_parity api_parity_base_equipment_id_613500fb_fk_api_equipment_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_parity
    ADD CONSTRAINT api_parity_base_equipment_id_613500fb_fk_api_equipment_id FOREIGN KEY (base_equipment_id) REFERENCES public.api_equipment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_parity api_parity_target_equipment_id_4fe91f7f_fk_api_equipment_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_parity
    ADD CONSTRAINT api_parity_target_equipment_id_4fe91f7f_fk_api_equipment_id FOREIGN KEY (target_equipment_id) REFERENCES public.api_equipment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_paritysetting api_paritysetting_base_equipment_id_b7b631e8_fk_api_equip; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_paritysetting
    ADD CONSTRAINT api_paritysetting_base_equipment_id_b7b631e8_fk_api_equip FOREIGN KEY (base_equipment_id) REFERENCES public.api_equipment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_paritysetting api_paritysetting_target_equipment_id_1fefb3b3_fk_api_equip; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_paritysetting
    ADD CONSTRAINT api_paritysetting_target_equipment_id_1fefb3b3_fk_api_equip FOREIGN KEY (target_equipment_id) REFERENCES public.api_equipment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_portfolio_followed_by api_portfolio_follow_portfolio_id_17acb60b_fk_api_portf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_portfolio_followed_by
    ADD CONSTRAINT api_portfolio_follow_portfolio_id_17acb60b_fk_api_portf FOREIGN KEY (portfolio_id) REFERENCES public.api_portfolio(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_portfolio_followed_by api_portfolio_followed_by_user_id_a5c28cc4_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_portfolio_followed_by
    ADD CONSTRAINT api_portfolio_followed_by_user_id_a5c28cc4_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_portfolio api_portfolio_user_id_e6fae4d5_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_portfolio
    ADD CONSTRAINT api_portfolio_user_id_e6fae4d5_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_portfolioitem api_portfolioitem_base_equipment_id_caea81bd_fk_api_equip; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_portfolioitem
    ADD CONSTRAINT api_portfolioitem_base_equipment_id_caea81bd_fk_api_equip FOREIGN KEY (base_equipment_id) REFERENCES public.api_equipment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_portfolioitem api_portfolioitem_portfolio_id_20128f35_fk_api_portfolio_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_portfolioitem
    ADD CONSTRAINT api_portfolioitem_portfolio_id_20128f35_fk_api_portfolio_id FOREIGN KEY (portfolio_id) REFERENCES public.api_portfolio(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_portfolioitem api_portfolioitem_target_equipment_id_5778658a_fk_api_equip; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_portfolioitem
    ADD CONSTRAINT api_portfolioitem_target_equipment_id_5778658a_fk_api_equip FOREIGN KEY (target_equipment_id) REFERENCES public.api_equipment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_prediction api_prediction_base_equipment_id_d673018d_fk_api_equipment_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_prediction
    ADD CONSTRAINT api_prediction_base_equipment_id_d673018d_fk_api_equipment_id FOREIGN KEY (base_equipment_id) REFERENCES public.api_equipment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_prediction api_prediction_target_equipment_id_836e3ffc_fk_api_equipment_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_prediction
    ADD CONSTRAINT api_prediction_target_equipment_id_836e3ffc_fk_api_equipment_id FOREIGN KEY (target_equipment_id) REFERENCES public.api_equipment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_prediction api_prediction_user_id_c3908040_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_prediction
    ADD CONSTRAINT api_prediction_user_id_c3908040_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_stoplossorder api_stoplossorder_base_equipment_id_4525f079_fk_api_equip; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_stoplossorder
    ADD CONSTRAINT api_stoplossorder_base_equipment_id_4525f079_fk_api_equip FOREIGN KEY (base_equipment_id) REFERENCES public.api_equipment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_stoplossorder api_stoplossorder_target_equipment_id_7e51d415_fk_api_equip; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_stoplossorder
    ADD CONSTRAINT api_stoplossorder_target_equipment_id_7e51d415_fk_api_equip FOREIGN KEY (target_equipment_id) REFERENCES public.api_equipment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_stoplossorder api_stoplossorder_user_id_4fcc6ea4_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_stoplossorder
    ADD CONSTRAINT api_stoplossorder_user_id_4fcc6ea4_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_user_groups api_user_groups_group_id_3af85785_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_user_groups
    ADD CONSTRAINT api_user_groups_group_id_3af85785_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_user_groups api_user_groups_user_id_a5ff39fa_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_user_groups
    ADD CONSTRAINT api_user_groups_user_id_a5ff39fa_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_user_user_permissions api_user_user_permis_permission_id_305b7fea_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_user_user_permissions
    ADD CONSTRAINT api_user_user_permis_permission_id_305b7fea_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_user_user_permissions api_user_user_permissions_user_id_f3945d65_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_user_user_permissions
    ADD CONSTRAINT api_user_user_permissions_user_id_f3945d65_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr FOREIGN KEY (source_refresh_token_id) REFERENCES public.oauth2_provider_refreshtoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_application_id_b22886e1_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_application_id_b22886e1_fk FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_user_id_6e4c9a65_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_user_id_6e4c9a65_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_application oauth2_provider_application_user_id_79829054_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_user_id_79829054_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_grant oauth2_provider_grant_application_id_81923564_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_application_id_81923564_fk FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_grant oauth2_provider_grant_user_id_e8f62af8_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_user_id_e8f62af8_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr FOREIGN KEY (access_token_id) REFERENCES public.oauth2_provider_accesstoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_application_id_2d1c311b_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_application_id_2d1c311b_fk FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_user_id_da837fce_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_user_id_da837fce_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_user_id_17d28448_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_user_id_17d28448_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

