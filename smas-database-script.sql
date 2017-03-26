--création du user smas_admin
CREATE ROLE "smas_admin" LOGIN
  ENCRYPTED PASSWORD 'md53d46e0ff9b8d9bd7043c3d4455af645b'
  NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;
COMMENT ON ROLE "smas_admin" IS 'Utilisateur admin de la base de donnée smas-education';

--crétion de la base de données smas-education
-- Database: smas_education

-- DROP DATABASE smas_education;
CREATE DATABASE smas_education
  WITH OWNER = smas_admin
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'French_France.1252'
       LC_CTYPE = 'French_France.1252'
       CONNECTION LIMIT = -1;

CREATE SCHEMA smas_education
       AUTHORIZATION smas_admin;

--table professeur	   
CREATE TABLE smas_education.professor
(
   prof_id uuid NOT NULL, 
   prof_firstname character varying(50) NOT NULL, 
   prof_cin character varying(50) NOT NULL, 
   prof_phone_number character varying(20), 
   ptof_gender character varying(10) NOT NULL, 
   prod_email character varying(60), 
   prof_birt_date date NOT NULL, 
   prof_creation_date date NOT NULL, 
   prof_modification_date date, 
   prof_entering_date date, 
   prof_profile_state character varying(10) NOT NULL
) 
WITH (
  OIDS = FALSE
)

TABLESPACE pg_default;
ALTER TABLE smas_education.professor
  OWNER TO smas_admin;
COMMENT ON COLUMN smas_education.professor.prof_id IS 'primary key';
COMMENT ON TABLE smas_education.professor
  IS 'table qui contient les informations des professeur';
  
--table eleve
CREATE TABLE smas_education.student
(
   student_id uuid NOT NULL, 
   student_firstname character varying(50) NOT NULL, 
   student_lastname character varying(50) NOT NULL, 
   student_birth_date date NOT NULL, 
   student_gender character varying(10) NOT NULL, 
   student_cin character varying(50), 
   student_phone_number character varying(20), 
   student_email character varying(60) NOT NULL, 
   student_creation_date date NOT NULL, 
   student_modification_date date, 
   student_entering_date date, 
   student_state character varying(10) NOT NULL
) 
WITH (
  OIDS = FALSE
)
;
ALTER TABLE smas_education.student
  OWNER TO smas_admin;
COMMENT ON TABLE smas_education.student
  IS 'table qui stocke les informations des élèves';

--table parent
CREATE TABLE smas_education.parent
(
   parent_id uuid NOT NULL, 
   parent_firstname character varying(50) NOT NULL, 
   parent_lastname character varying(50) NOT NULL, 
   parent_birth_date date NOT NULL, 
   parent_gender character varying(10) NOT NULL, 
   parent_cin character varying(50), 
   parent_phone_number character varying(20), 
   parent_email character varying(60) NOT NULL, 
   parent_creation_date date NOT NULL, 
   parent_modification_date date, 
   parent_state character varying(10) NOT NULL
) 
WITH (
  OIDS = FALSE
)
;
ALTER TABLE smas_education.parent
  OWNER TO smas_admin;
COMMENT ON TABLE smas_education.parent
  IS 'table qui stocke les informations des parents';

--table admin
CREATE TABLE smas_education.admin
(
   admin_id uuid NOT NULL, 
   admin_firstname character varying(50) NOT NULL, 
   admin_lastname character varying(50) NOT NULL, 
   admin_birth_date date NOT NULL, 
   admin_gender character varying(10) NOT NULL, 
   admin_cin character varying(50), 
   admin_role character varying(50), 
   admin_phone_number character varying(20), 
   admin_email character varying(60) NOT NULL, 
   admin_creation_date date NOT NULL, 
   admin_modification_date date
) 
WITH (
  OIDS = FALSE
)
;
ALTER TABLE smas_education.admin
  OWNER TO smas_admin;
COMMENT ON TABLE smas_education.admin
  IS 'table qui stocke les informations des admins';

--table examens
CREATE TABLE smas_education.exam
(
   exam_id uuid, 
   exam_name character varying(20) NOT NULL, 
   exam_type character varying(20) NOT NULL, 
   exam_start_date date NOT NULL, 
   exam_end_date date NOT NULL, 
   exam_level character varying(15) NOT NULL
) 
WITH (
  OIDS = FALSE
)
;
ALTER TABLE smas_education.exam
  OWNER TO smas_admin;

--table matière
CREATE TABLE smas_education.subject
(
   subject_id uuid, 
   subject_technical_name character varying(20) NOT NULL,  
   subject_creation_date date NOT NULL 
) 
WITH (
  OIDS = FALSE
)
;
ALTER TABLE smas_education.subject
  OWNER TO smas_admin;