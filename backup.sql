--
-- PostgreSQL database dump
--

\restrict HjzhNwElmaOznRDUug1U26nqoPthbcWdDrfGE5cmMWTceBPfWbapnyKEzJGW2sU

-- Dumped from database version 15.15
-- Dumped by pg_dump version 15.15

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

SET default_table_access_method = heap;

--
-- Name: properties; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.properties (
    id character varying NOT NULL,
    site character varying,
    title character varying,
    url text,
    price character varying,
    found_at timestamp without time zone
);


ALTER TABLE public.properties OWNER TO "user";

--
-- Data for Name: properties; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.properties (id, site, title, url, price, found_at) FROM stdin;
p9331513155111315134_mobile	www.factorvalor.pt	Imóvel	https://www.factorvalor.pt/imoveis/venda/apartamentos/braga-dst/barcelos?lbed=2&mrp=240000&srt=1	Preço sob consulta	2026-01-11 15:30:39.806144
p9331513155111315134_horizontal	www.factorvalor.pt	Imóvel	https://www.factorvalor.pt/imoveis	Preço sob consulta	2026-01-11 15:30:40.064563
p10001514913110410	www.factorvalor.pt	APARTAMENTO T3 C/ L. DE GARAGEMApartamentoT3	javascript:void(0);	€	2026-01-11 15:30:40.242161
1301409261672971329	www.factorvalor.pt	APARTAMENTO T3 C/ L. DE GARAGEMApartamentoT3	javascript:void(0);	€	2026-01-11 15:30:40.433147
469692758323090967	www.factorvalor.pt	APARTAMENTO T3 C/ L. DE GARAGEMApartamentoT3	https://www.factorvalor.pt/imovel/apartamento-t3-c-l-de-garagem/21600163	225 000 €	2026-01-11 15:30:40.606897
-7520632156439229660	www.factorvalor.pt	APARTAMENTO T2ApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2/20737512	Preço sob consulta	2026-01-11 15:30:40.810237
7082681729075452833	www.factorvalor.pt	APARTAMENTO T2 C/ LUGAR DE GARAGEMApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2-c-lugar-de-garagem/22132427	225 000 €	2026-01-11 15:30:41.00232
-350553804248684951	www.factorvalor.pt	APARTAMENTO T3 COM GARAGEMApartamentoT3	https://www.factorvalor.pt/imovel/apartamento-t3-com-garagem/19674649	Preço sob consulta	2026-01-11 15:30:41.197341
-5944947887975661877	www.factorvalor.pt	APARTAMENTO T3 COM JARDIM - CONDOMÍNIO FECHADOApartamentoT3	https://www.factorvalor.pt/imovel/apartamento-t3-com-jardim-condominio-fechado/19566208	Preço sob consulta	2026-01-11 15:30:41.388008
-5189389552245004152	www.factorvalor.pt	APARTAMENTO T2+1ApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2-1/17982263	Preço sob consulta	2026-01-11 15:30:41.580102
-4933880118812269689	www.factorvalor.pt	APARTAMENTO T2ApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2/18170216	Preço sob consulta	2026-01-11 15:30:41.767898
5576108159005881984	www.factorvalor.pt	APARTAMENTO T2 - CENTRO DA CIDADEApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2-centro-da-cidade/14865224	Preço sob consulta	2026-01-11 15:30:41.996388
9078242155855185915	www.factorvalor.pt	APARTAMENTO T3 COM GARAGEMApartamentoT3	https://www.factorvalor.pt/imovel/apartamento-t3-com-garagem/21336275	Preço sob consulta	2026-01-11 15:30:42.202262
6292708994165990829	www.factorvalor.pt	APARTAMENTO T2ApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2/17649167	Preço sob consulta	2026-01-11 15:30:42.40607
-6848065731646372455	www.factorvalor.pt	APARTAMENTO T2 COM GARAGEMApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2-com-garagem/17982271	Preço sob consulta	2026-01-11 15:30:42.583031
7966612938165623139	www.factorvalor.pt	Imóvel	https://www.factorvalor.pt/termos-e-condicoes	Preço sob consulta	2026-01-11 15:30:42.780764
-7067692593943681412	www.factorvalor.pt	MORADIA INDIVIDUAL V3MoradiaT3 Duplex	https://www.factorvalor.pt/imovel/moradia-individual-v3/20172875	230 000 €	2026-01-11 15:30:46.292656
5629287931136592948	www.factorvalor.pt	MORADIA PARA RECUPERARMoradiaT3 Duplex	https://www.factorvalor.pt/imovel/moradia-para-recuperar/20286848	Preço sob consulta	2026-01-11 15:30:46.544527
-3179767201007870512	www.factorvalor.pt	MORADIA INDIVIDUAL COM QUINTALMoradiaT3 Duplex	https://www.factorvalor.pt/imovel/moradia-individual-com-quintal/20436651	Preço sob consulta	2026-01-11 15:30:46.770601
7248325817125831514	www.factorvalor.pt	CASA EM PEDRA COM 7.700M2 DE TERRENOMoradiaT4	https://www.factorvalor.pt/imovel/casa-em-pedra-com-7700m2-de-terreno/8832027	Preço sob consulta	2026-01-11 15:30:46.990181
6408110422308646475	www.factorvalor.pt	MORADIA INDIVIDUAL V4MoradiaT4 Duplex	https://www.factorvalor.pt/imovel/moradia-individual-v4/21537813	230 000 €	2026-01-11 15:30:47.313185
8743956711076458604	www.factorvalor.pt	MORADIA TÉRREA - Junto á CidadeMoradiaT2	https://www.factorvalor.pt/imovel/moradia-terrea-junto-a-cidade/10709612	Preço sob consulta	2026-01-11 15:30:47.607264
6966343182900351180	www.factorvalor.pt	MORADIA INDIVIDUAL V3MoradiaT3	https://www.factorvalor.pt/imovel/moradia-individual-v3/16708380	Preço sob consulta	2026-01-11 15:30:47.82733
-7838739750895488822	www.factorvalor.pt	MORADIA V3 EM BANDAMoradia em BandaT3	https://www.factorvalor.pt/imovel/moradia-v3-em-banda/11763842	Preço sob consulta	2026-01-11 15:30:48.079624
7522449409156794084	www.factorvalor.pt	MORADIA V3 BANDAMoradia em BandaT3 Triplex	https://www.factorvalor.pt/imovel/moradia-v3-banda/11549488	Preço sob consulta	2026-01-11 15:30:48.263974
8118153765179937428	www.factorvalor.pt	Moradia V3 em BandaMoradiaT3 Triplex	https://www.factorvalor.pt/imovel/moradia-v3-em-banda/8879950	Preço sob consulta	2026-01-11 15:30:48.445384
1552150035839742822	www.factorvalor.pt	MORADIA INDIVIDUALMoradiaT4 Triplex	https://www.factorvalor.pt/imovel/moradia-individual/17793642	Preço sob consulta	2026-01-11 15:30:48.657689
8130054611426405631	www.factorvalor.pt	MORADIA V4 NOVA - LOTE 1MoradiaT4 Duplex	https://www.factorvalor.pt/imovel/moradia-v4-nova-lote-1/18240040	Preço sob consulta	2026-01-11 15:30:48.864419
-8646131176964046721	www.barcelcasa.pt	Renovado	https://www.barcelcasa.pt/imoveis?mtype=1,2&bus=1&dst=3&mun=35&mrp=250000	€	2026-01-11 15:30:57.390687
-3121935951541124729	www.barcelcasa.pt	Renovado	https://www.barcelcasa.pt/imovel/t3-totalmente-renovado-equipado-e-com-varanda-a-entrada-da-cidade-de-barcelos/23192853	240 000 €	2026-01-11 15:30:57.619162
-5983382296760188804	www.barcelcasa.pt	Usado	https://www.barcelcasa.pt/imovel/andar-moradia-t3-remodelado-em-arcozelo-barcelos/24463452	185 000 €	2026-01-11 15:30:57.810862
-7726549973743399031	www.barcelcasa.pt	Usado	https://www.barcelcasa.pt/imovel/oportunidade-unica-moradia-para-restauro-com-vistas-panoramicas/24464238	140 000 €	2026-01-11 15:30:58.0012
-8839160108862170015	www.barcelcasa.pt	Em construção	https://www.barcelcasa.pt/imovel/apartamentos-t1-e-t2-em-construcao-com-um-lugar-de-garagem-em-manhente-barcelos/24651127	175 000 €	2026-01-11 15:30:58.201029
1204802635916914946	www.barcelcasa.pt	Por recuperar	https://www.barcelcasa.pt/imovel/o-seu-novo-projeto-de-sonho-espera-por-si-em-alheira-barcelos/24408643	165 000 €	2026-01-11 15:30:58.404003
-7929068130912713210	www.barcelcasa.pt	Em construção	https://www.barcelcasa.pt/imovel/apartamento-t1-c-garagem-fechada-em-gamil-barcelos/23708536	180 000 €	2026-01-11 15:30:58.589284
-7506996705000296389	www.barcelcasa.pt	Imóvel	https://www.barcelcasa.pt/termos-e-condicoes	Preço sob consulta	2026-01-11 15:30:58.797032
-7502088109751514309	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-manhente-barcelos_111/	175 000 €	2026-01-11 15:31:08.605528
-3552440668713480012	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/?pg=1&o=&g=&e=&pp=&dd=&cc=&ff=&ml=&z=&nq=&p=&a=&c=5&es=&ct=00000001&or=30	Preço sob consulta	2026-01-11 15:31:08.791808
720566741096502679	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-com-logradouro-em-manhente-barcelos_112/	180 000 €	2026-01-11 15:31:08.980334
-5220409242488924013	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-com-logradouro-em-manhente-barcelos_113/	185 000 €	2026-01-11 15:31:09.17859
-5595662652573364433	era	ERA Property	https://www.era.pt/imovel/apartamento-t3-barcelos-vila-seca-360250002	Comprar250.000 €	2026-01-11 16:23:04.071886
-8807734498452260091	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-tamel-sao-verissimo-barcelos_105/	170 000 €	2026-01-11 15:31:09.40235
7295064406011860492	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t2-em-rio-covo-santa-eugenia-barcelos_98/	240 000 €	2026-01-11 15:31:09.592659
7753692226524545316	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-tamel-sao-verissimo-barcelos_100/	174 000 €	2026-01-11 15:31:09.802642
6895777858648910118	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-tamel-sao-verissimo-barcelos_96/	Preço sob consulta	2026-01-11 15:31:10.006108
-777320293026620456	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-barcelos_91/	193 000 €	2026-01-11 15:31:10.206377
-812739237370129737	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/?pg=1&o=&g=&e=&pp=&dd=&cc=&ff=&ml=&z=&nq=&p=&a=&c=9&es=&ct=00000001&or=30	Preço sob consulta	2026-01-11 15:31:10.49267
1603991772526365883	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-barcelos_92/	197 000 €	2026-01-11 15:31:10.778236
-1207887700642915418	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t3-em-gamil-barcelos_66/	Preço sob consulta	2026-01-11 15:31:10.974932
583766574199595588	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t3-pronto-a-habitar-em-barcelinhos_56/	Preço sob consulta	2026-01-11 15:31:11.195454
-920527392446364678	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/?pg=1&o=&g=&e=&pp=&dd=&cc=&ff=&ml=&z=&nq=&p=&a=&c=7&es=&ct=00000001&or=30	Preço sob consulta	2026-01-11 15:31:11.414706
6353763040326935560	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-em-gamil-barcelos_48/	175 000 €	2026-01-11 15:31:11.617739
2090819760797660205	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/andar-moradia-t2-com-logradouro-em-arcozelo-barcelos_101/	Preço sob consulta	2026-01-11 15:31:16.786733
-2695009536647565462	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/?pg=1&o=&g=&e=&pp=&dd=&cc=&ff=&ml=&z=&nq=&p=&a=&c=8&es=&ct=00000001&or=30	Preço sob consulta	2026-01-11 15:31:16.979662
-9098845490225329418	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/moradia-t4-e-moradia-t3-em-adaes-barcelos_53/	Preço sob consulta	2026-01-11 15:31:17.156733
-226554445506943387	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/ruina-em-pedra-com-terreno-em-cossourado-barcelos_51/	47 000 €	2026-01-11 15:31:17.366862
-4664836888833565897	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/moradia-t3-para-restauro-em-vilar-de-figos-barcelos_10/	Preço sob consulta	2026-01-11 15:31:17.56656
-883668934325544274	franciscofaria.pt	Apartamento T-3 renovado	https://franciscofaria.pt/status/para-vender/	€240,000	2026-01-11 15:31:23.348027
1808772180552480058	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/apartamento-t-3-renovado/	Preço sob consulta	2026-01-11 15:31:23.526194
7752085642235495926	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/cobertura-t4-duplex-com-terracos-e-duas-garagens/	Preço sob consulta	2026-01-11 15:31:23.732479
-9152748648873947220	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/t3-com-garagem-edf-quinta-nova-2/	Preço sob consulta	2026-01-11 15:31:23.938739
-4404880203653194184	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/t2-centro-historico-de-barcelos-novo/	Preço sob consulta	2026-01-11 15:31:24.149176
-867602066961138325	franciscofaria.pt	Moradia nova- 5 minutos centro Barcelos	https://franciscofaria.pt/status/vendido/	Preço sob consulta	2026-01-11 15:31:24.349152
7912103795471572593	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/moradia-nova-5-minutos-centro-barcelos/	Preço sob consulta	2026-01-11 15:31:24.541206
2603400162861494134	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/t1-novo-centro-barcelos/	Preço sob consulta	2026-01-11 15:31:24.741006
1721214734626271851	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/t-1-novo-centro-de-barcelos-equipado-e-mobilado/	Preço sob consulta	2026-01-11 15:31:24.934493
8399016677039068137	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/moradia-com-terreno-em-cervaes/	Preço sob consulta	2026-01-11 15:31:25.134583
-6993691256965262088	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/apartamento-t3-em-arcozelo/	Preço sob consulta	2026-01-11 15:31:25.339368
817084c	franciscofaria.pt	Imóvel	https://www.google.pt/maps/place/PORTANOVA+-+IMOBILIARIA/@41.540561,-8.6110383,17.5z/data=!4m15!1m8!3m7!1s0xd2453b43bfaaf9d:0x704fa51766457eb6!2sRua+Dom+Jos%C3%A9+Domenech,+4750-100+Arcozelo!3b1!8m2!3d41.5408415!4d-8.6112348!16s%2Fg%2F11nxqzrwc1!3m5!1s0xd2453de141e3625:0x4880cd9daaf5b627!8m2!3d41.5407065!4d-8.6112874!16s%2Fg%2F11f6626dzh?hl=pt-PT&entry=ttu&g_ep=EgoyMDI1MDMzMS4wIKXMDSoASAFQAw%3D%3D	Preço sob consulta	2026-01-11 15:31:25.614232
compare-property-panel	franciscofaria.pt	Imóvel	https://franciscofaria.pt/imoveis/?ids=	Preço sob consulta	2026-01-11 15:31:25.818708
-8275814731148739117	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t3-com-garagem-arcozelo-barcelos_1716/	Preço sob consulta	2026-01-11 15:31:35.415844
-1065676203469441573	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/consultores/paulo-soutelo_34/	Preço sob consulta	2026-01-11 15:31:35.73122
-469902073058400939	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t3-abade-neiva-barcelos_1522/	Preço sob consulta	2026-01-11 15:31:35.950001
-5510078200969456481	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t1-novo-arcozelo-barcelos_1405/	Preço sob consulta	2026-01-11 15:31:36.136666
6912468015418347061	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t2-novo-arcozelo-barcelos_1406/	Preço sob consulta	2026-01-11 15:31:36.313376
3936517316561118694	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t1-novo-arcozelo-barcelos_1408/	Preço sob consulta	2026-01-11 15:31:36.497787
2608167299339882693	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t3-novo-arcozelo-barcelos_1409/	Preço sob consulta	2026-01-11 15:31:36.696751
7717026417786074619	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t2-novo-arcozelo-barcelos_1410/	Preço sob consulta	2026-01-11 15:31:36.942551
-5900436286631452396	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t2-novo-com-logradouro-arcozelo-barcelos_1402/	Preço sob consulta	2026-01-11 15:31:37.15301
697963432585211166	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamentos-t3-em-galegos-sao-martinho_1349/	Preço sob consulta	2026-01-11 15:31:37.35884
7589444340022251034	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/consultores/pedro-oliveira_36/	Preço sob consulta	2026-01-11 15:31:37.540098
2573876961560840743	era	ERA Property	https://www.era.pt/imovel/apartamento-t2-barcelos-varzea-360240455	Comprar225.000 €	2026-01-11 16:23:04.244417
-3333674685173405252	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamentos-t3-em-construcao-galegos-sao-martinho-barcelos_1350/	Preço sob consulta	2026-01-11 15:31:37.731201
-4304805301469092937	www.factorvalor.pt	APARTAMENTO T3 C/ L. DE GARAGEMApartamentoT3	javascript:void(0);	€	2026-01-11 15:35:54.951436
-5303921227160692329	www.factorvalor.pt	APARTAMENTO T3 C/ L. DE GARAGEMApartamentoT3	https://www.factorvalor.pt/imovel/apartamento-t3-c-l-de-garagem/21600163	225 000 €	2026-01-11 15:35:55.149101
6840825614626065941	www.factorvalor.pt	APARTAMENTO T2ApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2/20737512	Preço sob consulta	2026-01-11 15:35:55.338966
-7181341907072051604	www.factorvalor.pt	APARTAMENTO T2 C/ LUGAR DE GARAGEMApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2-c-lugar-de-garagem/22132427	225 000 €	2026-01-11 15:35:55.526149
1171121323479121528	www.factorvalor.pt	APARTAMENTO T3 COM GARAGEMApartamentoT3	https://www.factorvalor.pt/imovel/apartamento-t3-com-garagem/19674649	Preço sob consulta	2026-01-11 15:35:55.722264
-5562399049082093421	www.factorvalor.pt	APARTAMENTO T3 COM JARDIM - CONDOMÍNIO FECHADOApartamentoT3	https://www.factorvalor.pt/imovel/apartamento-t3-com-jardim-condominio-fechado/19566208	Preço sob consulta	2026-01-11 15:35:55.915405
-7120435939180365434	www.factorvalor.pt	APARTAMENTO T2+1ApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2-1/17982263	Preço sob consulta	2026-01-11 15:35:56.110888
7923392400365455529	www.factorvalor.pt	APARTAMENTO T2ApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2/18170216	Preço sob consulta	2026-01-11 15:35:56.299058
-2222018773725825541	www.factorvalor.pt	APARTAMENTO T2 - CENTRO DA CIDADEApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2-centro-da-cidade/14865224	Preço sob consulta	2026-01-11 15:35:56.536684
-8207257944325728824	www.factorvalor.pt	APARTAMENTO T3 COM GARAGEMApartamentoT3	https://www.factorvalor.pt/imovel/apartamento-t3-com-garagem/21336275	Preço sob consulta	2026-01-11 15:35:56.770063
-8366339921158934915	www.factorvalor.pt	APARTAMENTO T2ApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2/17649167	Preço sob consulta	2026-01-11 15:35:56.982886
-1314930622058386705	www.factorvalor.pt	APARTAMENTO T2 COM GARAGEMApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2-com-garagem/17982271	Preço sob consulta	2026-01-11 15:35:57.170282
-7170714681198078711	www.factorvalor.pt	Imóvel	https://www.factorvalor.pt/termos-e-condicoes	Preço sob consulta	2026-01-11 15:35:57.353656
2799870579470849381	www.factorvalor.pt	MORADIA INDIVIDUAL V3MoradiaT3 Duplex	https://www.factorvalor.pt/imovel/moradia-individual-v3/20172875	230 000 €	2026-01-11 15:36:05.602634
-8772931635297620421	www.factorvalor.pt	MORADIA PARA RECUPERARMoradiaT3 Duplex	https://www.factorvalor.pt/imovel/moradia-para-recuperar/20286848	Preço sob consulta	2026-01-11 15:36:05.795739
-7661164188221471830	www.factorvalor.pt	MORADIA INDIVIDUAL COM QUINTALMoradiaT3 Duplex	https://www.factorvalor.pt/imovel/moradia-individual-com-quintal/20436651	Preço sob consulta	2026-01-11 15:36:05.977075
-7129007740459455772	www.factorvalor.pt	CASA EM PEDRA COM 7.700M2 DE TERRENOMoradiaT4	https://www.factorvalor.pt/imovel/casa-em-pedra-com-7700m2-de-terreno/8832027	Preço sob consulta	2026-01-11 15:36:06.170193
463382794841517471	www.factorvalor.pt	MORADIA INDIVIDUAL V4MoradiaT4 Duplex	https://www.factorvalor.pt/imovel/moradia-individual-v4/21537813	230 000 €	2026-01-11 15:36:06.363087
-4752413236141217145	www.factorvalor.pt	MORADIA TÉRREA - Junto á CidadeMoradiaT2	https://www.factorvalor.pt/imovel/moradia-terrea-junto-a-cidade/10709612	Preço sob consulta	2026-01-11 15:36:06.555707
725149243565719850	www.factorvalor.pt	MORADIA INDIVIDUAL V3MoradiaT3	https://www.factorvalor.pt/imovel/moradia-individual-v3/16708380	Preço sob consulta	2026-01-11 15:36:06.74098
-5924252611323733666	www.factorvalor.pt	MORADIA V3 EM BANDAMoradia em BandaT3	https://www.factorvalor.pt/imovel/moradia-v3-em-banda/11763842	Preço sob consulta	2026-01-11 15:36:06.935398
5490142553000988132	www.factorvalor.pt	MORADIA V3 BANDAMoradia em BandaT3 Triplex	https://www.factorvalor.pt/imovel/moradia-v3-banda/11549488	Preço sob consulta	2026-01-11 15:36:07.135282
-3543958730285017062	www.factorvalor.pt	Moradia V3 em BandaMoradiaT3 Triplex	https://www.factorvalor.pt/imovel/moradia-v3-em-banda/8879950	Preço sob consulta	2026-01-11 15:36:07.316687
8466348219142138728	www.factorvalor.pt	MORADIA INDIVIDUALMoradiaT4 Triplex	https://www.factorvalor.pt/imovel/moradia-individual/17793642	Preço sob consulta	2026-01-11 15:36:07.50782
-7321139992041688915	www.factorvalor.pt	MORADIA V4 NOVA - LOTE 1MoradiaT4 Duplex	https://www.factorvalor.pt/imovel/moradia-v4-nova-lote-1/18240040	Preço sob consulta	2026-01-11 15:36:07.697087
-3619775228535443712	era	ERA Property	https://www.era.pt/imovel/andar-moradia-t2-barcelos-carreira-e-fonte-coberta-360250173	Arrendar700 €/mês	2026-01-11 15:36:16.472387
-731851645567694533	era	ERA Property	https://www.era.pt/imovel/apartamento-t3-barcelos-varzea-360250137	Comprar215.000 €	2026-01-11 15:36:16.67424
-747667706805234691	era	ERA Property	https://www.era.pt/imovel/apartamento-t3-barcelos-manhente-360250132	Comprar250.000 €	2026-01-11 15:36:16.858124
5447203062106235966	era	ERA Property	https://www.era.pt/imovel/apartamento-t2-barcelos-barcelos-vila-boa-e-vila-frescainha-sao-martinho-e-sao-pedro-360250122	ComprarSob Consulta	2026-01-11 15:36:17.057866
1253612446827443356	era	ERA Property	https://www.era.pt/imovel/apartamento-t2-barcelos-arcozelo-360250101	Arrendar800 €/mês11%900 €	2026-01-11 15:36:17.243522
1193543843321488915	era	ERA Property	https://www.era.pt/imovel/apartamento-t3-barcelos-vila-seca-360250003	Comprar245.000 €	2026-01-11 15:36:17.434549
-4131191297515743087	era	ERA Property	https://www.era.pt/imovel/apartamento-t3-barcelos-vila-seca-360250002	Comprar250.000 €	2026-01-11 15:36:17.629778
-3864177401320976943	era	ERA Property	https://www.era.pt/imovel/apartamento-t2-barcelos-varzea-360240455	Comprar225.000 €	2026-01-11 15:36:17.809555
2460677588736090839	era	ERA Property	https://www.era.pt/imovel/moradia-t2-barcelos-lijo-360240147	Comprar220.000 €	2026-01-11 15:36:18.020364
-878331044909203454	era	ERA Property	https://www.era.pt/imovel/moradia-t5-barcelos-alvelos-360230070	ComprarSob Consulta	2026-01-11 15:36:18.204291
741361418245352883	era	ERA Property	https://www.era.pt/imovel/moradia-em-banda-t3-barcelos-carapecos-360230034	Comprar235.000 €	2026-01-11 15:36:18.428776
-3770290569709522296	era	ERA Property	https://www.era.pt/imovel/moradia-t8-barcelos-arcozelo-360220227	Comprar170.000 €	2026-01-11 15:36:18.623761
1528465547792608845	era	ERA Property	https://www.era.pt/imovel/apartamento-t3-novo-barcelos-carvalhal-360220117	Comprar205.500 €	2026-01-11 15:36:18.800215
5511853823833592867	era	ERA Property	https://www.era.pt/imovel/apartamento-t2-novo-barcelos-carvalhal-360220115	Comprar184.000 €	2026-01-11 15:36:18.988657
-9217267928742219382	era	ERA Property	https://www.era.pt/imovel/apartamento-t3-barcelos-barcelos-vila-boa-e-vila-frescainha-sao-martinho-e-sao-pedro-360200232	ComprarSob Consulta	2026-01-11 15:36:19.216267
7519449276513299341	www.barcelcasa.pt	Renovado	https://www.barcelcasa.pt/imoveis?mtype=1,2&bus=1&dst=3&mun=35&mrp=250000	€	2026-01-11 15:36:27.260006
4009628981996264907	www.barcelcasa.pt	Renovado	https://www.barcelcasa.pt/imovel/t3-totalmente-renovado-equipado-e-com-varanda-a-entrada-da-cidade-de-barcelos/23192853	240 000 €	2026-01-11 15:36:27.438574
2412213175493161061	www.barcelcasa.pt	Usado	https://www.barcelcasa.pt/imovel/andar-moradia-t3-remodelado-em-arcozelo-barcelos/24463452	185 000 €	2026-01-11 15:36:27.623539
-631391001550581760	www.barcelcasa.pt	Usado	https://www.barcelcasa.pt/imovel/oportunidade-unica-moradia-para-restauro-com-vistas-panoramicas/24464238	140 000 €	2026-01-11 15:36:27.811776
3769884439259856448	www.barcelcasa.pt	Em construção	https://www.barcelcasa.pt/imovel/apartamentos-t1-e-t2-em-construcao-com-um-lugar-de-garagem-em-manhente-barcelos/24651127	175 000 €	2026-01-11 15:36:28.028027
-5112105911836107307	www.barcelcasa.pt	Por recuperar	https://www.barcelcasa.pt/imovel/o-seu-novo-projeto-de-sonho-espera-por-si-em-alheira-barcelos/24408643	165 000 €	2026-01-11 15:36:28.210281
8686329477691437416	www.barcelcasa.pt	Em construção	https://www.barcelcasa.pt/imovel/apartamento-t1-c-garagem-fechada-em-gamil-barcelos/23708536	180 000 €	2026-01-11 15:36:28.381683
7112483561682728434	www.barcelcasa.pt	Imóvel	https://www.barcelcasa.pt/termos-e-condicoes	Preço sob consulta	2026-01-11 15:36:28.576252
-3773361033788471112	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-manhente-barcelos_111/	175 000 €	2026-01-11 15:36:46.648956
2094131144998582	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/?pg=1&o=&g=&e=&pp=&dd=&cc=&ff=&ml=&z=&nq=&p=&a=&c=5&es=&ct=00000001&or=30	Preço sob consulta	2026-01-11 15:36:46.815573
4474226691229155773	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-com-logradouro-em-manhente-barcelos_112/	180 000 €	2026-01-11 15:36:47.015891
3631488288290811372	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-com-logradouro-em-manhente-barcelos_113/	185 000 €	2026-01-11 15:36:47.210408
5424745091115071289	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-tamel-sao-verissimo-barcelos_105/	170 000 €	2026-01-11 15:36:47.418962
-6315801092645644458	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t2-em-rio-covo-santa-eugenia-barcelos_98/	240 000 €	2026-01-11 15:36:47.646887
1281569120634900930	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-tamel-sao-verissimo-barcelos_100/	174 000 €	2026-01-11 15:36:47.830766
-2756699673668423271	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-tamel-sao-verissimo-barcelos_96/	Preço sob consulta	2026-01-11 15:36:48.045864
2003941511400604736	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-barcelos_91/	193 000 €	2026-01-11 15:36:48.252076
-8648054303474362341	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/?pg=1&o=&g=&e=&pp=&dd=&cc=&ff=&ml=&z=&nq=&p=&a=&c=9&es=&ct=00000001&or=30	Preço sob consulta	2026-01-11 15:36:48.467896
-1018149578492505240	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-barcelos_92/	197 000 €	2026-01-11 15:36:48.649085
-4520139267444521326	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t3-em-gamil-barcelos_66/	Preço sob consulta	2026-01-11 15:36:48.907625
-3631343586364130990	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t3-pronto-a-habitar-em-barcelinhos_56/	Preço sob consulta	2026-01-11 15:36:49.171268
5666798809631251037	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/?pg=1&o=&g=&e=&pp=&dd=&cc=&ff=&ml=&z=&nq=&p=&a=&c=7&es=&ct=00000001&or=30	Preço sob consulta	2026-01-11 15:36:49.483363
-7792877012129011596	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-em-gamil-barcelos_48/	175 000 €	2026-01-11 15:36:49.690675
-211257503297015591	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/andar-moradia-t2-com-logradouro-em-arcozelo-barcelos_101/	Preço sob consulta	2026-01-11 16:07:48.884591
3646818915423911133	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/?pg=1&o=&g=&e=&pp=&dd=&cc=&ff=&ml=&z=&nq=&p=&a=&c=8&es=&ct=00000001&or=30	Preço sob consulta	2026-01-11 16:07:49.113475
5542884804240248890	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/moradia-t4-e-moradia-t3-em-adaes-barcelos_53/	Preço sob consulta	2026-01-11 16:07:49.29404
-3741985586559186494	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/ruina-em-pedra-com-terreno-em-cossourado-barcelos_51/	47 000 €	2026-01-11 16:07:49.494132
-3478039061958890612	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/moradia-t3-para-restauro-em-vilar-de-figos-barcelos_10/	Preço sob consulta	2026-01-11 16:07:49.702905
7113965375657153575	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t3-com-garagem-arcozelo-barcelos_1716/	Preço sob consulta	2026-01-11 16:08:09.963612
-7891062427025006972	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/consultores/paulo-soutelo_34/	Preço sob consulta	2026-01-11 16:08:10.196964
-1879178325080449998	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t3-abade-neiva-barcelos_1522/	Preço sob consulta	2026-01-11 16:08:10.377772
1346764426053402596	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t1-novo-arcozelo-barcelos_1405/	Preço sob consulta	2026-01-11 16:08:10.571516
5320332465049886809	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t2-novo-arcozelo-barcelos_1406/	Preço sob consulta	2026-01-11 16:08:10.785686
3259395153777674793	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t1-novo-arcozelo-barcelos_1408/	Preço sob consulta	2026-01-11 16:08:10.991865
-4048237579871826460	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t3-novo-arcozelo-barcelos_1409/	Preço sob consulta	2026-01-11 16:08:11.193578
6422439883994992206	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t2-novo-arcozelo-barcelos_1410/	Preço sob consulta	2026-01-11 16:08:11.415907
6455662631200207248	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t2-novo-com-logradouro-arcozelo-barcelos_1402/	Preço sob consulta	2026-01-11 16:08:11.596361
-3292031656960252424	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamentos-t3-em-galegos-sao-martinho_1349/	Preço sob consulta	2026-01-11 16:08:11.806293
7768396665839485100	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/consultores/pedro-oliveira_36/	Preço sob consulta	2026-01-11 16:08:11.994319
-8004637618481296839	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamentos-t3-em-construcao-galegos-sao-martinho-barcelos_1350/	Preço sob consulta	2026-01-11 16:08:12.180391
2381468103344059924	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradia-em-alheira-barcelos_2010/	Preço sob consulta	2026-01-11 16:08:21.388069
-6614812616288299441	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradia-em-alheira-barcelos_1974/	Preço sob consulta	2026-01-11 16:08:21.555544
-5536079798151433457	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradia-em-banda-arcozelo-barcelos_1996/	235.000 €	2026-01-11 16:08:21.736503
-4402642123359599259	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/consultores/elizangela-lima_39/	Preço sob consulta	2026-01-11 16:08:21.926797
-8497348489296715857	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradias-em-alheira-barcelos_1870/	Preço sob consulta	2026-01-11 16:08:22.124256
-8686607452808201755	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradias-em-alheira-barcelos_1929/	Preço sob consulta	2026-01-11 16:08:22.346247
-3479806379844736116	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradias-em-alheira-barcelos_1951/	Preço sob consulta	2026-01-11 16:08:22.531727
-2923394330069005435	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradia t11-terrea em-areias-sao-vicente-barcelos_1922/	Preço sob consulta	2026-01-11 16:08:22.857967
-3398335043795224393	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradias-novas-em-areias-sao-vicente-barcelos_1621/	Preço sob consulta	2026-01-11 16:08:23.088991
-674957852817627208	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradias-novas-em-areias-sao-vicente-barcelos_1622/	Preço sob consulta	2026-01-11 16:08:23.281765
5813818274739214949	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradias-novas-em-areias-sao-vicente-barcelos_1623/	Preço sob consulta	2026-01-11 16:08:23.493294
508216760097393357	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradias-novas-em-areias-sao-vicente-barcelos_1624/	Preço sob consulta	2026-01-11 16:08:23.689577
6940414663729747423	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradias-novas-em-areias-sao-vicente-barcelos_1625/	Preço sob consulta	2026-01-11 16:08:23.872167
3723676141204945493	www.h-urb.com	Imóvel	javascript:void(0)	€	2026-01-11 16:08:51.225397
2327784059702186567	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/moradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos/22851932	397 000 €	2026-01-11 16:08:51.411548
-6248364056147711928	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851932&text=Moradia%20nova%2C%20com%203%20quartos%2C%20em%20novo%20empreendimento%20em%20Carvalhal%2C%20Bar...	Preço sob consulta	2026-01-11 16:08:51.592372
-873347558943354838	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851932	Preço sob consulta	2026-01-11 16:08:51.787081
-8314947537659857825	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851932	Preço sob consulta	2026-01-11 16:08:51.987629
-3877902640174236762	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851932&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP25597153%2FTphoto%2FIDe1948601-0000-0500-0000-00001557b1b6.jpg&description=Descubra%20o%20'Figurado%20Enjoy'%2C%20um%20empreendimento%20LuxSteel360%2C%20que%20redef...	Preço sob consulta	2026-01-11 16:08:52.181306
-314334285095755986	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/moradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos/22851927	387 000 €	2026-01-11 16:08:52.369034
-6768015406450655557	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851927&text=Moradia%20nova%2C%20com%203%20quartos%2C%20em%20novo%20empreendimento%20em%20Carvalhal%2C%20Bar...	Preço sob consulta	2026-01-11 16:08:52.580418
-568495686725248919	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851927	Preço sob consulta	2026-01-11 16:08:52.779646
1645442227729944035	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851927	Preço sob consulta	2026-01-11 16:08:53.022995
-4299681346654632991	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851927&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP25596975%2FTphoto%2FID2f948601-0000-0500-0000-00001557b15e.jpg&description=Descubra%20o%20'Figurado%20Enjoy'%2C%20um%20empreendimento%20LuxSteel360%2C%20que%20redef...	Preço sob consulta	2026-01-11 16:08:53.259544
2797451804612626398	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/terreno-com-projeto-aprovado-para-duas-moradias-perelhal-barcelos/20594426	108 500 €	2026-01-11 16:08:53.446596
8705247767300160941	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-com-projeto-aprovado-para-duas-moradias-perelhal-barcelos%2F20594426&text=Terreno%20com%20projeto%20aprovado%20para%20duas%20moradias%2C%20Perelhal%2C%20Barcelos	Preço sob consulta	2026-01-11 16:08:53.634174
-7769891926098736624	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-com-projeto-aprovado-para-duas-moradias-perelhal-barcelos%2F20594426	Preço sob consulta	2026-01-11 16:08:53.83548
3456287805188910078	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-com-projeto-aprovado-para-duas-moradias-perelhal-barcelos%2F20594426	Preço sob consulta	2026-01-11 16:08:54.073048
5413224475506885834	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-com-projeto-aprovado-para-duas-moradias-perelhal-barcelos%2F20594426&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP20628812%2FTphoto%2FID4cc53a01-0000-0500-0000-000011bba771.jpg&description=Explorando%20Terrenos%20em%20Perelhal%3A%20Uma%20Oportunidade%20de%20Constru%C3%A7%C3%A3o%20%C3%9Anica...	Preço sob consulta	2026-01-11 16:08:54.264709
1729436309884272621	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/propriedade-com-ruinas-bons-acessos-souto-guimaraes/18176525	380 000 €	2026-01-11 16:08:54.455459
9120128713532592619	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fpropriedade-com-ruinas-bons-acessos-souto-guimaraes%2F18176525&text=Propriedade%20com%20ru%C3%ADnas%20bons%20acessos%20Souto-%20Guimar%C3%A3es	Preço sob consulta	2026-01-11 16:08:54.644787
5315445922169777354	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fpropriedade-com-ruinas-bons-acessos-souto-guimaraes%2F18176525	Preço sob consulta	2026-01-11 16:08:54.859064
3263822026957705124	era	ERA Property	https://www.era.pt/imovel/moradia-t2-barcelos-lijo-360240147	Comprar220.000 €	2026-01-11 16:23:04.415521
-5746373692364289169	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fpropriedade-com-ruinas-bons-acessos-souto-guimaraes%2F18176525	Preço sob consulta	2026-01-11 16:08:55.054959
1447595782686808568	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fpropriedade-com-ruinas-bons-acessos-souto-guimaraes%2F18176525&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP20628933%2FTphoto%2FIDc5c53a01-0000-0500-0000-00000dcfc77b.jpg&description=Quinta%20com%2015%20mil%20metros%20de%20terreno%20de%20agricultura%20ou%20habitacional%20(c...	Preço sob consulta	2026-01-11 16:08:55.23879
-4606841017493411033	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/alojamento-local-5-estudios-t0-no-centro-do-porto/19028498	750 000 €	2026-01-11 16:08:55.432744
1429274187990782641	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Falojamento-local-5-estudios-t0-no-centro-do-porto%2F19028498&text=Alojamento%20Local%20(5%20est%C3%BAdios%20T0)%20no%20centro%20do%20Porto	Preço sob consulta	2026-01-11 16:08:55.619653
3752997841269670755	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Falojamento-local-5-estudios-t0-no-centro-do-porto%2F19028498	Preço sob consulta	2026-01-11 16:08:55.891077
-8973967436085839116	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Falojamento-local-5-estudios-t0-no-centro-do-porto%2F19028498	Preço sob consulta	2026-01-11 16:08:56.115507
3707951538250455913	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Falojamento-local-5-estudios-t0-no-centro-do-porto%2F19028498&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP20628785%2FTphoto%2FID31c53a01-0000-0500-0000-00000edfb08a.JPG&description=A%20propriedade%20comercial%20situada%20no%20cora%C3%A7%C3%A3o%20do%20Porto%20representa%20uma%20op...	Preço sob consulta	2026-01-11 16:08:56.303815
-3370449558454332395	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/t3-1-com-sotao-aproveitado-garagem-e-vistas-para-o-rio-cavado-barcelos/24709532	328 000 €	2026-01-11 16:08:56.490841
-5191567505302822712	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Ft3-1-com-sotao-aproveitado-garagem-e-vistas-para-o-rio-cavado-barcelos%2F24709532&text=T3%20%2B1%20com%20s%C3%B3t%C3%A3o%20aproveitado%2C%20garagem%20e%20vistas%20para%20o%20Rio%20C%C3%A1vado%20-%20Bar...	Preço sob consulta	2026-01-11 16:08:56.68175
7373037952015696680	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Ft3-1-com-sotao-aproveitado-garagem-e-vistas-para-o-rio-cavado-barcelos%2F24709532	Preço sob consulta	2026-01-11 16:08:56.879218
6121028865059640062	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Ft3-1-com-sotao-aproveitado-garagem-e-vistas-para-o-rio-cavado-barcelos%2F24709532	Preço sob consulta	2026-01-11 16:08:57.074837
-3921902961524708544	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Ft3-1-com-sotao-aproveitado-garagem-e-vistas-para-o-rio-cavado-barcelos%2F24709532&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP28749589%2FTphoto%2FID15afb601-0000-0500-0000-000017e3978d.jpg&description=Procurar%20um%20apartamento%20T3%20em%20Barcelos%20%C3%A9%20uma%20excelente%20op%C3%A7%C3%A3o%20para%20que...	Preço sob consulta	2026-01-11 16:08:57.268668
2351227618496001213	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/moradia-com-3-quarto-na-cidade-de-barcelos/21702243	490 000 €	2026-01-11 16:08:57.466881
1907819023295071121	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-com-3-quarto-na-cidade-de-barcelos%2F21702243&text=Moradia%20com%203%20quarto%20na%20cidade%20de%20Barcelos.	Preço sob consulta	2026-01-11 16:08:57.671221
-2932659837464701783	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-com-3-quarto-na-cidade-de-barcelos%2F21702243	Preço sob consulta	2026-01-11 16:08:57.865854
-2114421831747393626	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-com-3-quarto-na-cidade-de-barcelos%2F21702243	Preço sob consulta	2026-01-11 16:08:58.115917
-6950718142844612815	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-com-3-quarto-na-cidade-de-barcelos%2F21702243&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP22735584%2FTphoto%2FIDe0ea5a01-0000-0500-0000-000014b91354.jpg&description=Se%20est%C3%A1%20%C3%A0%20procura%20de%20uma%20habita%C3%A7%C3%A3o%20moderna%20e%20confort%C3%A1vel%2C%20esta%20moradi...	Preço sob consulta	2026-01-11 16:08:58.306021
957103057806735285	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/terreno-de-pinhal-em-carvalhal-barcelos/24760210	88 000 €	2026-01-11 16:08:58.502025
8069009323259614973	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-de-pinhal-em-carvalhal-barcelos%2F24760210&text=Terreno%20de%20pinhal%20em%20Carvalhal%20Barcelos	Preço sob consulta	2026-01-11 16:08:58.694317
4004734832649117252	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-de-pinhal-em-carvalhal-barcelos%2F24760210	Preço sob consulta	2026-01-11 16:08:58.879832
9154330034218497619	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-de-pinhal-em-carvalhal-barcelos%2F24760210	Preço sob consulta	2026-01-11 16:08:59.077243
5707339062288158566	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-de-pinhal-em-carvalhal-barcelos%2F24760210&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP25116629%2FTphoto%2FIDd53f7f01-0000-0500-0000-00001364546b.jpg&description=Terreno%20de%20pinhal%20de%209.600m2%20com%20aproximadamente%201500m2%20com%20viabilida...	Preço sob consulta	2026-01-11 16:08:59.287663
9170136383025279871	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/moradia-de-granito-totalmente-restaurada-em-creixomil-barcelos/18215436	550 000 €	2026-01-11 16:08:59.462101
5158649001928732046	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-de-granito-totalmente-restaurada-em-creixomil-barcelos%2F18215436&text=Moradia%20de%20granito%20totalmente%20restaurada%20em%20Creixomil%2C%20Barcelos	Preço sob consulta	2026-01-11 16:08:59.653088
-4555090282111944397	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-de-granito-totalmente-restaurada-em-creixomil-barcelos%2F18215436	Preço sob consulta	2026-01-11 16:08:59.853689
6517956510803875170	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-de-granito-totalmente-restaurada-em-creixomil-barcelos%2F18215436	Preço sob consulta	2026-01-11 16:09:00.056541
-2053319798916969150	www.factorvalor.pt	MORADIA INDIVIDUAL COM QUINTALMoradiaT3 Duplex	https://www.factorvalor.pt/imovel/moradia-individual-com-quintal/20436651	Preço sob consulta	2026-01-11 16:18:21.67821
-3533757120870983201	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-de-granito-totalmente-restaurada-em-creixomil-barcelos%2F18215436&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP20628634%2FTphoto%2FID9ac43a01-0000-0500-0000-00000fa7cf99.jpg&description=Esta%20magn%C3%ADfica%20moradia%20em%20granito%2C%20que%20foi%20meticulosamente%20recuperada...	Preço sob consulta	2026-01-11 16:09:00.242877
1135752432988755905	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/moradia-individual-v4-em-galegos-s-martinho-barcelos/21351408	500 000 €	2026-01-11 16:09:00.440131
-5109034211428610734	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-individual-v4-em-galegos-s-martinho-barcelos%2F21351408&text=Moradia%20individual%20V4%20em%20Galegos%20S.%20Martinho%2C%20Barcelos	Preço sob consulta	2026-01-11 16:09:00.627998
3911796409993342165	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-individual-v4-em-galegos-s-martinho-barcelos%2F21351408	Preço sob consulta	2026-01-11 16:09:00.816607
4818316199035787581	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-individual-v4-em-galegos-s-martinho-barcelos%2F21351408	Preço sob consulta	2026-01-11 16:09:01.037523
-4044616193970931242	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-individual-v4-em-galegos-s-martinho-barcelos%2F21351408&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP24997573%2FTphoto%2FIDc56e7d01-0000-0500-0000-0000135aeadd.jpg&description=Atualmente%20dispon%C3%ADvel%20para%20venda%2C%20distingue-se%20pelo%20equil%C3%ADbrio%20entre%20...	Preço sob consulta	2026-01-11 16:09:01.228113
1432823585672754015	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/moradia-isolada-em-airo-barcelos/21363361	265 000 €	2026-01-11 16:09:01.425397
-6295703221560580501	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-isolada-em-airo-barcelos%2F21363361&text=Moradia%20isolada%20em%20Air%C3%B3%2C%20Barcelos.	Preço sob consulta	2026-01-11 16:09:01.634438
6864146691822605418	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-isolada-em-airo-barcelos%2F21363361	Preço sob consulta	2026-01-11 16:09:01.852616
-3897571277297141102	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-isolada-em-airo-barcelos%2F21363361	Preço sob consulta	2026-01-11 16:09:02.067955
8386310960384164907	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-isolada-em-airo-barcelos%2F21363361&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FVV494%2FTphoto%2FIDc2cb2783-8dcd-48b3-87a8-a14878f0bc7a.jpg&description=Moradia%20isolada%20T3%20situada%20na%20freguesia%20de%20Air%C3%B3%2C%20em%20Barcelos.%20Compost...	Preço sob consulta	2026-01-11 16:09:02.253921
7442631444037783890	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/apartamento-novo-com-tres-quartos-no-empreendimento-strong-building-em-palmeira-de-faro/24552103	275 000 €	2026-01-11 16:09:02.441754
8808989388416223685	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fapartamento-novo-com-tres-quartos-no-empreendimento-strong-building-em-palmeira-de-faro%2F24552103&text=Apartamento%20novo%2C%20com%20tr%C3%AAs%20quartos%2C%20no%20empreendimento%20'STRONG%20BUILDIN...	Preço sob consulta	2026-01-11 16:09:02.648203
5075727335770295442	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fapartamento-novo-com-tres-quartos-no-empreendimento-strong-building-em-palmeira-de-faro%2F24552103	Preço sob consulta	2026-01-11 16:09:02.865859
4100449483316714821	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fapartamento-novo-com-tres-quartos-no-empreendimento-strong-building-em-palmeira-de-faro%2F24552103	Preço sob consulta	2026-01-11 16:09:03.071827
2780657401039355708	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fapartamento-novo-com-tres-quartos-no-empreendimento-strong-building-em-palmeira-de-faro%2F24552103&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP25544217%2FTphoto%2FID19c68501-0000-0500-0000-000017b51341.jpg&description=Apartamento%20novo%2C%20com%20tr%C3%AAs%20quartos%2C%20inserido%20no%20novo%20empreendimento%20'...	Preço sob consulta	2026-01-11 16:09:03.293435
-516583850973023301	www.factorvalor.pt	APARTAMENTO T3 C/ L. DE GARAGEMApartamentoT3	javascript:void(0);	€	2026-01-11 16:18:10.579629
-3742462513405936446	www.factorvalor.pt	APARTAMENTO T3 C/ L. DE GARAGEMApartamentoT3	https://www.factorvalor.pt/imovel/apartamento-t3-c-l-de-garagem/21600163	225 000 €	2026-01-11 16:18:10.782132
6652649280386256669	www.factorvalor.pt	APARTAMENTO T2ApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2/20737512	Preço sob consulta	2026-01-11 16:18:10.96081
-4084787145321793457	www.factorvalor.pt	APARTAMENTO T2 C/ LUGAR DE GARAGEMApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2-c-lugar-de-garagem/22132427	225 000 €	2026-01-11 16:18:11.170238
-4340325166003091702	www.factorvalor.pt	APARTAMENTO T3 COM GARAGEMApartamentoT3	https://www.factorvalor.pt/imovel/apartamento-t3-com-garagem/19674649	Preço sob consulta	2026-01-11 16:18:11.356567
1198037888285877166	www.factorvalor.pt	APARTAMENTO T3 COM JARDIM - CONDOMÍNIO FECHADOApartamentoT3	https://www.factorvalor.pt/imovel/apartamento-t3-com-jardim-condominio-fechado/19566208	Preço sob consulta	2026-01-11 16:18:11.538063
7663435118639521883	www.factorvalor.pt	APARTAMENTO T2+1ApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2-1/17982263	Preço sob consulta	2026-01-11 16:18:11.733843
7320265233720530926	www.factorvalor.pt	APARTAMENTO T2ApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2/18170216	Preço sob consulta	2026-01-11 16:18:11.931498
-5258209159030159964	www.factorvalor.pt	APARTAMENTO T2 - CENTRO DA CIDADEApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2-centro-da-cidade/14865224	Preço sob consulta	2026-01-11 16:18:12.12505
1876431780491249331	www.factorvalor.pt	APARTAMENTO T3 COM GARAGEMApartamentoT3	https://www.factorvalor.pt/imovel/apartamento-t3-com-garagem/21336275	Preço sob consulta	2026-01-11 16:18:12.310189
-521748984691334927	www.factorvalor.pt	APARTAMENTO T2ApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2/17649167	Preço sob consulta	2026-01-11 16:18:12.494404
-4459338914581339589	www.factorvalor.pt	APARTAMENTO T2 COM GARAGEMApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2-com-garagem/17982271	Preço sob consulta	2026-01-11 16:18:12.690908
8136924804255186549	www.factorvalor.pt	Imóvel	https://www.factorvalor.pt/termos-e-condicoes	Preço sob consulta	2026-01-11 16:18:12.87463
-42530448912541783	www.factorvalor.pt	MORADIA INDIVIDUAL V3MoradiaT3 Duplex	https://www.factorvalor.pt/imovel/moradia-individual-v3/20172875	230 000 €	2026-01-11 16:18:21.219725
8294324013465372949	www.factorvalor.pt	MORADIA PARA RECUPERARMoradiaT3 Duplex	https://www.factorvalor.pt/imovel/moradia-para-recuperar/20286848	Preço sob consulta	2026-01-11 16:18:21.41544
-4466218301819650350	www.factorvalor.pt	CASA EM PEDRA COM 7.700M2 DE TERRENOMoradiaT4	https://www.factorvalor.pt/imovel/casa-em-pedra-com-7700m2-de-terreno/8832027	Preço sob consulta	2026-01-11 16:18:22.043622
-9201667572423987778	www.factorvalor.pt	MORADIA INDIVIDUAL V4MoradiaT4 Duplex	https://www.factorvalor.pt/imovel/moradia-individual-v4/21537813	230 000 €	2026-01-11 16:18:22.279607
3103712952168122733	www.factorvalor.pt	MORADIA TÉRREA - Junto á CidadeMoradiaT2	https://www.factorvalor.pt/imovel/moradia-terrea-junto-a-cidade/10709612	Preço sob consulta	2026-01-11 16:18:22.541811
-6603330310142220413	www.factorvalor.pt	MORADIA INDIVIDUAL V3MoradiaT3	https://www.factorvalor.pt/imovel/moradia-individual-v3/16708380	Preço sob consulta	2026-01-11 16:18:22.725424
-7890583818847270865	www.factorvalor.pt	MORADIA V3 EM BANDAMoradia em BandaT3	https://www.factorvalor.pt/imovel/moradia-v3-em-banda/11763842	Preço sob consulta	2026-01-11 16:18:22.909994
-1670305511236247702	www.factorvalor.pt	MORADIA V3 BANDAMoradia em BandaT3 Triplex	https://www.factorvalor.pt/imovel/moradia-v3-banda/11549488	Preço sob consulta	2026-01-11 16:18:23.095364
-5160352813012991074	www.factorvalor.pt	Moradia V3 em BandaMoradiaT3 Triplex	https://www.factorvalor.pt/imovel/moradia-v3-em-banda/8879950	Preço sob consulta	2026-01-11 16:18:23.311441
-7676152683122300313	www.factorvalor.pt	MORADIA INDIVIDUALMoradiaT4 Triplex	https://www.factorvalor.pt/imovel/moradia-individual/17793642	Preço sob consulta	2026-01-11 16:18:23.531608
2165641578921932948	www.factorvalor.pt	MORADIA V4 NOVA - LOTE 1MoradiaT4 Duplex	https://www.factorvalor.pt/imovel/moradia-v4-nova-lote-1/18240040	Preço sob consulta	2026-01-11 16:18:23.734638
-1946434002221930082	era	ERA Property	https://www.era.pt/imovel/andar-moradia-t2-barcelos-carreira-e-fonte-coberta-360250173	Arrendar700 €/mês	2026-01-11 16:18:32.894323
5291458153037651150	era	ERA Property	https://www.era.pt/imovel/apartamento-t3-barcelos-varzea-360250137	Comprar215.000 €	2026-01-11 16:18:33.096873
1101398404489078019	era	ERA Property	https://www.era.pt/imovel/apartamento-t3-barcelos-manhente-360250132	Comprar250.000 €	2026-01-11 16:18:33.283198
-8982516918630519820	era	ERA Property	https://www.era.pt/imovel/apartamento-t2-barcelos-barcelos-vila-boa-e-vila-frescainha-sao-martinho-e-sao-pedro-360250122	ComprarSob Consulta	2026-01-11 16:18:33.460091
5163574804292794707	era	ERA Property	https://www.era.pt/imovel/apartamento-t2-barcelos-arcozelo-360250101	Arrendar800 €/mês11%900 €	2026-01-11 16:18:33.632882
-6833222272881351334	era	ERA Property	https://www.era.pt/imovel/apartamento-t3-barcelos-vila-seca-360250003	Comprar245.000 €	2026-01-11 16:18:33.809968
8664371231438746467	era	ERA Property	https://www.era.pt/imovel/apartamento-t3-barcelos-vila-seca-360250002	Comprar250.000 €	2026-01-11 16:18:33.994601
-8012774369101343944	era	ERA Property	https://www.era.pt/imovel/apartamento-t2-barcelos-varzea-360240455	Comprar225.000 €	2026-01-11 16:18:34.177183
499750611970861885	era	ERA Property	https://www.era.pt/imovel/moradia-t2-barcelos-lijo-360240147	Comprar220.000 €	2026-01-11 16:18:34.40433
8534710335856570251	era	ERA Property	https://www.era.pt/imovel/moradia-t5-barcelos-alvelos-360230070	ComprarSob Consulta	2026-01-11 16:18:34.597072
3740886862872161114	era	ERA Property	https://www.era.pt/imovel/moradia-em-banda-t3-barcelos-carapecos-360230034	Comprar235.000 €	2026-01-11 16:18:34.793302
-8899439262676386644	era	ERA Property	https://www.era.pt/imovel/moradia-t8-barcelos-arcozelo-360220227	Comprar170.000 €	2026-01-11 16:18:34.978367
1759066268834271489	era	ERA Property	https://www.era.pt/imovel/apartamento-t3-novo-barcelos-carvalhal-360220117	Comprar205.500 €	2026-01-11 16:18:35.201649
2283953808154901877	era	ERA Property	https://www.era.pt/imovel/apartamento-t2-novo-barcelos-carvalhal-360220115	Comprar184.000 €	2026-01-11 16:18:35.386134
6706500933758554986	era	ERA Property	https://www.era.pt/imovel/apartamento-t3-barcelos-barcelos-vila-boa-e-vila-frescainha-sao-martinho-e-sao-pedro-360200232	ComprarSob Consulta	2026-01-11 16:18:35.574323
20159177256229823	www.barcelcasa.pt	Renovado	https://www.barcelcasa.pt/imoveis?mtype=1,2&bus=1&dst=3&mun=35&mrp=250000	€	2026-01-11 16:18:43.597164
8892680992832136406	www.barcelcasa.pt	Renovado	https://www.barcelcasa.pt/imovel/t3-totalmente-renovado-equipado-e-com-varanda-a-entrada-da-cidade-de-barcelos/23192853	240 000 €	2026-01-11 16:18:43.764442
6412094782570247508	www.barcelcasa.pt	Usado	https://www.barcelcasa.pt/imovel/andar-moradia-t3-remodelado-em-arcozelo-barcelos/24463452	185 000 €	2026-01-11 16:18:43.94018
-2445589726583651133	www.barcelcasa.pt	Usado	https://www.barcelcasa.pt/imovel/oportunidade-unica-moradia-para-restauro-com-vistas-panoramicas/24464238	140 000 €	2026-01-11 16:18:44.117942
-1112850567178016937	www.barcelcasa.pt	Em construção	https://www.barcelcasa.pt/imovel/apartamentos-t1-e-t2-em-construcao-com-um-lugar-de-garagem-em-manhente-barcelos/24651127	175 000 €	2026-01-11 16:18:44.30663
6222581527795656096	www.barcelcasa.pt	Por recuperar	https://www.barcelcasa.pt/imovel/o-seu-novo-projeto-de-sonho-espera-por-si-em-alheira-barcelos/24408643	165 000 €	2026-01-11 16:18:44.489767
194482879031254933	www.barcelcasa.pt	Em construção	https://www.barcelcasa.pt/imovel/apartamento-t1-c-garagem-fechada-em-gamil-barcelos/23708536	180 000 €	2026-01-11 16:18:44.670822
-2412361159872680940	www.barcelcasa.pt	Imóvel	https://www.barcelcasa.pt/termos-e-condicoes	Preço sob consulta	2026-01-11 16:18:44.848207
-2658757236026582834	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-manhente-barcelos_111/	175 000 €	2026-01-11 16:19:03.68768
6440677288349900868	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/?pg=1&o=&g=&e=&pp=&dd=&cc=&ff=&ml=&z=&nq=&p=&a=&c=5&es=&ct=00000001&or=30	Preço sob consulta	2026-01-11 16:19:03.858372
-8266231425664370862	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-com-logradouro-em-manhente-barcelos_112/	180 000 €	2026-01-11 16:19:04.034805
4388527140128270544	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-com-logradouro-em-manhente-barcelos_113/	185 000 €	2026-01-11 16:19:04.21026
7717258004765672530	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-tamel-sao-verissimo-barcelos_105/	170 000 €	2026-01-11 16:19:04.428835
-6924484541114657947	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t2-em-rio-covo-santa-eugenia-barcelos_98/	240 000 €	2026-01-11 16:19:04.615346
6664966130587959822	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-tamel-sao-verissimo-barcelos_100/	174 000 €	2026-01-11 16:19:04.980762
8920381730009144697	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-tamel-sao-verissimo-barcelos_96/	Preço sob consulta	2026-01-11 16:19:05.17524
-1561622167231086981	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-barcelos_91/	193 000 €	2026-01-11 16:19:05.484245
9052792048562431106	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/?pg=1&o=&g=&e=&pp=&dd=&cc=&ff=&ml=&z=&nq=&p=&a=&c=9&es=&ct=00000001&or=30	Preço sob consulta	2026-01-11 16:19:05.677678
-8170503682360047489	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-barcelos_92/	197 000 €	2026-01-11 16:19:05.867938
5202511136313769761	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t3-em-gamil-barcelos_66/	Preço sob consulta	2026-01-11 16:19:06.08414
4613915560723047512	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t3-pronto-a-habitar-em-barcelinhos_56/	Preço sob consulta	2026-01-11 16:19:06.296323
9140845309839106533	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/?pg=1&o=&g=&e=&pp=&dd=&cc=&ff=&ml=&z=&nq=&p=&a=&c=7&es=&ct=00000001&or=30	Preço sob consulta	2026-01-11 16:19:06.802291
-3193963553751609487	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-em-gamil-barcelos_48/	175 000 €	2026-01-11 16:19:07.153302
-1673911807608583754	franciscofaria.pt	Apartamento T-3 renovado	https://franciscofaria.pt/status/para-vender/	€240,000	2026-01-11 16:19:20.114807
4761894828982580473	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/apartamento-t-3-renovado/	Preço sob consulta	2026-01-11 16:19:20.287631
-8870115506755282222	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/cobertura-t4-duplex-com-terracos-e-duas-garagens/	Preço sob consulta	2026-01-11 16:19:20.492025
-6279526496439913687	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/t3-com-garagem-edf-quinta-nova-2/	Preço sob consulta	2026-01-11 16:19:20.682546
8738297464091519753	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/t2-centro-historico-de-barcelos-novo/	Preço sob consulta	2026-01-11 16:19:20.886021
-3972162653655482195	franciscofaria.pt	Moradia nova- 5 minutos centro Barcelos	https://franciscofaria.pt/status/vendido/	Preço sob consulta	2026-01-11 16:19:21.078174
5694944351375617233	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/moradia-nova-5-minutos-centro-barcelos/	Preço sob consulta	2026-01-11 16:19:21.265186
8804110591188584004	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/t1-novo-centro-barcelos/	Preço sob consulta	2026-01-11 16:19:21.468792
-2445544482100574553	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/t-1-novo-centro-de-barcelos-equipado-e-mobilado/	Preço sob consulta	2026-01-11 16:19:21.659711
-4074044244549686401	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/moradia-com-terreno-em-cervaes/	Preço sob consulta	2026-01-11 16:19:21.856102
8222921021582115446	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/apartamento-t3-em-arcozelo/	Preço sob consulta	2026-01-11 16:19:22.065906
-1346845404643809425	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t3-com-garagem-arcozelo-barcelos_1716/	Preço sob consulta	2026-01-11 16:19:39.821194
12739006754854980	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/consultores/paulo-soutelo_34/	Preço sob consulta	2026-01-11 16:19:39.991905
-1633323193431184910	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t3-abade-neiva-barcelos_1522/	Preço sob consulta	2026-01-11 16:19:40.227304
-1320356314777389199	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t1-novo-arcozelo-barcelos_1405/	Preço sob consulta	2026-01-11 16:19:40.419796
6577111730340195921	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t2-novo-arcozelo-barcelos_1406/	Preço sob consulta	2026-01-11 16:19:40.62817
6704922926507991785	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t1-novo-arcozelo-barcelos_1408/	Preço sob consulta	2026-01-11 16:19:40.821359
-3546467878044272813	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t3-novo-arcozelo-barcelos_1409/	Preço sob consulta	2026-01-11 16:19:41.010999
6111132068563080696	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t2-novo-arcozelo-barcelos_1410/	Preço sob consulta	2026-01-11 16:19:41.194239
-4382132811913807803	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t2-novo-com-logradouro-arcozelo-barcelos_1402/	Preço sob consulta	2026-01-11 16:19:41.385748
562071967341841161	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamentos-t3-em-galegos-sao-martinho_1349/	Preço sob consulta	2026-01-11 16:19:41.61525
520064761713366688	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/consultores/pedro-oliveira_36/	Preço sob consulta	2026-01-11 16:19:41.804688
712128830732721265	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamentos-t3-em-construcao-galegos-sao-martinho-barcelos_1350/	Preço sob consulta	2026-01-11 16:19:41.998071
8040616261142510021	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradia-em-alheira-barcelos_2010/	Preço sob consulta	2026-01-11 16:19:50.789382
-3691490542899196810	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradia-em-alheira-barcelos_1974/	Preço sob consulta	2026-01-11 16:19:50.976319
-5361470760175745829	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradia-em-banda-arcozelo-barcelos_1996/	235.000 €	2026-01-11 16:19:51.171736
-7548232260613192548	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/consultores/elizangela-lima_39/	Preço sob consulta	2026-01-11 16:19:51.456404
9149996535772229399	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradias-em-alheira-barcelos_1870/	Preço sob consulta	2026-01-11 16:19:51.685632
5265906505320000070	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradias-em-alheira-barcelos_1929/	Preço sob consulta	2026-01-11 16:19:51.877754
4461025384889178604	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradias-em-alheira-barcelos_1951/	Preço sob consulta	2026-01-11 16:19:52.083755
-1928900662082422685	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradia t11-terrea em-areias-sao-vicente-barcelos_1922/	Preço sob consulta	2026-01-11 16:19:52.317394
-564755028997674742	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradias-novas-em-areias-sao-vicente-barcelos_1621/	Preço sob consulta	2026-01-11 16:19:52.751177
2894526246659987544	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradias-novas-em-areias-sao-vicente-barcelos_1622/	Preço sob consulta	2026-01-11 16:19:53.187954
-5020354781804712680	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradias-novas-em-areias-sao-vicente-barcelos_1623/	Preço sob consulta	2026-01-11 16:19:53.473049
6097728108505185333	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradias-novas-em-areias-sao-vicente-barcelos_1624/	Preço sob consulta	2026-01-11 16:19:53.652778
-5774773228273521926	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradias-novas-em-areias-sao-vicente-barcelos_1625/	Preço sob consulta	2026-01-11 16:19:53.839617
8081361979075087759	www.h-urb.com	Imóvel	javascript:void(0)	€	2026-01-11 16:20:18.564913
-5896797746696177468	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/moradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos/22851932	397 000 €	2026-01-11 16:20:18.735527
-1617985053373231398	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-isolada-em-airo-barcelos%2F21363361	Preço sob consulta	2026-01-11 16:20:29.485944
-5367731341638666234	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851932&text=Moradia%20nova%2C%20com%203%20quartos%2C%20em%20novo%20empreendimento%20em%20Carvalhal%2C%20Bar...	Preço sob consulta	2026-01-11 16:20:18.916999
5806269577777330134	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851932	Preço sob consulta	2026-01-11 16:20:19.114831
6471480074456581250	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851932	Preço sob consulta	2026-01-11 16:20:19.312995
-2670867530954900466	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851932&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP25597153%2FTphoto%2FIDe1948601-0000-0500-0000-00001557b1b6.jpg&description=Descubra%20o%20'Figurado%20Enjoy'%2C%20um%20empreendimento%20LuxSteel360%2C%20que%20redef...	Preço sob consulta	2026-01-11 16:20:19.493605
6306809394410566087	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/moradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos/22851927	387 000 €	2026-01-11 16:20:19.684053
1298935374656843910	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851927&text=Moradia%20nova%2C%20com%203%20quartos%2C%20em%20novo%20empreendimento%20em%20Carvalhal%2C%20Bar...	Preço sob consulta	2026-01-11 16:20:19.881464
-3288078389505129356	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851927	Preço sob consulta	2026-01-11 16:20:20.100935
-9049216295864822285	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851927	Preço sob consulta	2026-01-11 16:20:20.28467
1146832826743648767	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851927&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP25596975%2FTphoto%2FID2f948601-0000-0500-0000-00001557b15e.jpg&description=Descubra%20o%20'Figurado%20Enjoy'%2C%20um%20empreendimento%20LuxSteel360%2C%20que%20redef...	Preço sob consulta	2026-01-11 16:20:20.477805
-2553041336194164608	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/terreno-com-projeto-aprovado-para-duas-moradias-perelhal-barcelos/20594426	108 500 €	2026-01-11 16:20:20.655373
-3282875934582875599	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-com-projeto-aprovado-para-duas-moradias-perelhal-barcelos%2F20594426&text=Terreno%20com%20projeto%20aprovado%20para%20duas%20moradias%2C%20Perelhal%2C%20Barcelos	Preço sob consulta	2026-01-11 16:20:20.857854
7484225515599782312	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-com-projeto-aprovado-para-duas-moradias-perelhal-barcelos%2F20594426	Preço sob consulta	2026-01-11 16:20:21.047897
7014260532862667891	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-com-projeto-aprovado-para-duas-moradias-perelhal-barcelos%2F20594426	Preço sob consulta	2026-01-11 16:20:21.231946
3845389191663527143	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-com-projeto-aprovado-para-duas-moradias-perelhal-barcelos%2F20594426&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP20628812%2FTphoto%2FID4cc53a01-0000-0500-0000-000011bba771.jpg&description=Explorando%20Terrenos%20em%20Perelhal%3A%20Uma%20Oportunidade%20de%20Constru%C3%A7%C3%A3o%20%C3%9Anica...	Preço sob consulta	2026-01-11 16:20:21.417671
-1340804513122750636	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/propriedade-com-ruinas-bons-acessos-souto-guimaraes/18176525	380 000 €	2026-01-11 16:20:21.60782
-5538703176339102392	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fpropriedade-com-ruinas-bons-acessos-souto-guimaraes%2F18176525&text=Propriedade%20com%20ru%C3%ADnas%20bons%20acessos%20Souto-%20Guimar%C3%A3es	Preço sob consulta	2026-01-11 16:20:21.800351
8623391257215371159	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fpropriedade-com-ruinas-bons-acessos-souto-guimaraes%2F18176525	Preço sob consulta	2026-01-11 16:20:22.035592
-6233384942241314573	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fpropriedade-com-ruinas-bons-acessos-souto-guimaraes%2F18176525	Preço sob consulta	2026-01-11 16:20:22.216635
3354059138809750907	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fpropriedade-com-ruinas-bons-acessos-souto-guimaraes%2F18176525&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP20628933%2FTphoto%2FIDc5c53a01-0000-0500-0000-00000dcfc77b.jpg&description=Quinta%20com%2015%20mil%20metros%20de%20terreno%20de%20agricultura%20ou%20habitacional%20(c...	Preço sob consulta	2026-01-11 16:20:22.412115
3323522437857691980	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/alojamento-local-5-estudios-t0-no-centro-do-porto/19028498	750 000 €	2026-01-11 16:20:22.590049
5617888843160976893	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Falojamento-local-5-estudios-t0-no-centro-do-porto%2F19028498&text=Alojamento%20Local%20(5%20est%C3%BAdios%20T0)%20no%20centro%20do%20Porto	Preço sob consulta	2026-01-11 16:20:22.782051
3670923223709034451	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Falojamento-local-5-estudios-t0-no-centro-do-porto%2F19028498	Preço sob consulta	2026-01-11 16:20:22.960594
2972826680508207548	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Falojamento-local-5-estudios-t0-no-centro-do-porto%2F19028498	Preço sob consulta	2026-01-11 16:20:23.150264
-644659494119327495	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Falojamento-local-5-estudios-t0-no-centro-do-porto%2F19028498&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP20628785%2FTphoto%2FID31c53a01-0000-0500-0000-00000edfb08a.JPG&description=A%20propriedade%20comercial%20situada%20no%20cora%C3%A7%C3%A3o%20do%20Porto%20representa%20uma%20op...	Preço sob consulta	2026-01-11 16:20:23.332223
-8434845994093474172	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/t3-1-com-sotao-aproveitado-garagem-e-vistas-para-o-rio-cavado-barcelos/24709532	328 000 €	2026-01-11 16:20:23.5175
-3800047972542739066	era	ERA Property	https://www.era.pt/imovel/apartamento-t3-barcelos-vila-seca-360250003	Comprar245.000 €	2026-01-11 16:23:03.901036
8273846424362653758	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Ft3-1-com-sotao-aproveitado-garagem-e-vistas-para-o-rio-cavado-barcelos%2F24709532&text=T3%20%2B1%20com%20s%C3%B3t%C3%A3o%20aproveitado%2C%20garagem%20e%20vistas%20para%20o%20Rio%20C%C3%A1vado%20-%20Bar...	Preço sob consulta	2026-01-11 16:20:23.692751
1172108211393387282	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Ft3-1-com-sotao-aproveitado-garagem-e-vistas-para-o-rio-cavado-barcelos%2F24709532	Preço sob consulta	2026-01-11 16:20:23.881437
4245734797037405988	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Ft3-1-com-sotao-aproveitado-garagem-e-vistas-para-o-rio-cavado-barcelos%2F24709532	Preço sob consulta	2026-01-11 16:20:24.072236
7897831601252058087	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Ft3-1-com-sotao-aproveitado-garagem-e-vistas-para-o-rio-cavado-barcelos%2F24709532&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP28749589%2FTphoto%2FID15afb601-0000-0500-0000-000017e3978d.jpg&description=Procurar%20um%20apartamento%20T3%20em%20Barcelos%20%C3%A9%20uma%20excelente%20op%C3%A7%C3%A3o%20para%20que...	Preço sob consulta	2026-01-11 16:20:24.256709
2338606058308386127	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/moradia-com-3-quarto-na-cidade-de-barcelos/21702243	490 000 €	2026-01-11 16:20:24.438441
7388946012984378570	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-com-3-quarto-na-cidade-de-barcelos%2F21702243&text=Moradia%20com%203%20quarto%20na%20cidade%20de%20Barcelos.	Preço sob consulta	2026-01-11 16:20:24.625525
7501746918806224462	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-com-3-quarto-na-cidade-de-barcelos%2F21702243	Preço sob consulta	2026-01-11 16:20:24.814159
55940417036647423	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-com-3-quarto-na-cidade-de-barcelos%2F21702243	Preço sob consulta	2026-01-11 16:20:25.003708
7390360510059584783	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-com-3-quarto-na-cidade-de-barcelos%2F21702243&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP22735584%2FTphoto%2FIDe0ea5a01-0000-0500-0000-000014b91354.jpg&description=Se%20est%C3%A1%20%C3%A0%20procura%20de%20uma%20habita%C3%A7%C3%A3o%20moderna%20e%20confort%C3%A1vel%2C%20esta%20moradi...	Preço sob consulta	2026-01-11 16:20:25.215447
-7525877111692215047	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/terreno-de-pinhal-em-carvalhal-barcelos/24760210	88 000 €	2026-01-11 16:20:25.40416
-218950579716868728	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-de-pinhal-em-carvalhal-barcelos%2F24760210&text=Terreno%20de%20pinhal%20em%20Carvalhal%20Barcelos	Preço sob consulta	2026-01-11 16:20:25.633886
3724238763492463828	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-de-pinhal-em-carvalhal-barcelos%2F24760210	Preço sob consulta	2026-01-11 16:20:25.809335
-2222586542051294103	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-de-pinhal-em-carvalhal-barcelos%2F24760210	Preço sob consulta	2026-01-11 16:20:25.992487
-7046563295932383448	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-de-pinhal-em-carvalhal-barcelos%2F24760210&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP25116629%2FTphoto%2FIDd53f7f01-0000-0500-0000-00001364546b.jpg&description=Terreno%20de%20pinhal%20de%209.600m2%20com%20aproximadamente%201500m2%20com%20viabilida...	Preço sob consulta	2026-01-11 16:20:26.178326
6150874700838867976	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/moradia-de-granito-totalmente-restaurada-em-creixomil-barcelos/18215436	550 000 €	2026-01-11 16:20:26.368244
-4767755923483581439	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-de-granito-totalmente-restaurada-em-creixomil-barcelos%2F18215436&text=Moradia%20de%20granito%20totalmente%20restaurada%20em%20Creixomil%2C%20Barcelos	Preço sob consulta	2026-01-11 16:20:26.559955
7525529651423030391	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-de-granito-totalmente-restaurada-em-creixomil-barcelos%2F18215436	Preço sob consulta	2026-01-11 16:20:26.764584
2705951433615764820	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-de-granito-totalmente-restaurada-em-creixomil-barcelos%2F18215436	Preço sob consulta	2026-01-11 16:20:26.952398
-4102130058850485122	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-de-granito-totalmente-restaurada-em-creixomil-barcelos%2F18215436&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP20628634%2FTphoto%2FID9ac43a01-0000-0500-0000-00000fa7cf99.jpg&description=Esta%20magn%C3%ADfica%20moradia%20em%20granito%2C%20que%20foi%20meticulosamente%20recuperada...	Preço sob consulta	2026-01-11 16:20:27.12876
9209986794582281180	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/moradia-individual-v4-em-galegos-s-martinho-barcelos/21351408	500 000 €	2026-01-11 16:20:27.323702
-4036526053215012673	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-individual-v4-em-galegos-s-martinho-barcelos%2F21351408&text=Moradia%20individual%20V4%20em%20Galegos%20S.%20Martinho%2C%20Barcelos	Preço sob consulta	2026-01-11 16:20:27.516002
-5399839232955661330	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-individual-v4-em-galegos-s-martinho-barcelos%2F21351408	Preço sob consulta	2026-01-11 16:20:27.697774
-5359305699408864003	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-individual-v4-em-galegos-s-martinho-barcelos%2F21351408	Preço sob consulta	2026-01-11 16:20:27.885917
-1392491229164649120	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-individual-v4-em-galegos-s-martinho-barcelos%2F21351408&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP24997573%2FTphoto%2FIDc56e7d01-0000-0500-0000-0000135aeadd.jpg&description=Atualmente%20dispon%C3%ADvel%20para%20venda%2C%20distingue-se%20pelo%20equil%C3%ADbrio%20entre%20...	Preço sob consulta	2026-01-11 16:20:28.089113
-6200375625655388936	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/moradia-isolada-em-airo-barcelos/21363361	265 000 €	2026-01-11 16:20:28.269749
8577085289344599208	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-isolada-em-airo-barcelos%2F21363361&text=Moradia%20isolada%20em%20Air%C3%B3%2C%20Barcelos.	Preço sob consulta	2026-01-11 16:20:28.464198
1412253113506716306	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-isolada-em-airo-barcelos%2F21363361	Preço sob consulta	2026-01-11 16:20:29.12473
5612493333662053867	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-isolada-em-airo-barcelos%2F21363361&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FVV494%2FTphoto%2FIDc2cb2783-8dcd-48b3-87a8-a14878f0bc7a.jpg&description=Moradia%20isolada%20T3%20situada%20na%20freguesia%20de%20Air%C3%B3%2C%20em%20Barcelos.%20Compost...	Preço sob consulta	2026-01-11 16:20:29.67077
-8767146418831872798	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/apartamento-novo-com-tres-quartos-no-empreendimento-strong-building-em-palmeira-de-faro/24552103	275 000 €	2026-01-11 16:20:29.87244
-1734704042525140676	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fapartamento-novo-com-tres-quartos-no-empreendimento-strong-building-em-palmeira-de-faro%2F24552103&text=Apartamento%20novo%2C%20com%20tr%C3%AAs%20quartos%2C%20no%20empreendimento%20'STRONG%20BUILDIN...	Preço sob consulta	2026-01-11 16:20:30.07216
-6828624751014550387	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fapartamento-novo-com-tres-quartos-no-empreendimento-strong-building-em-palmeira-de-faro%2F24552103	Preço sob consulta	2026-01-11 16:20:30.27449
7332784613800592873	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fapartamento-novo-com-tres-quartos-no-empreendimento-strong-building-em-palmeira-de-faro%2F24552103	Preço sob consulta	2026-01-11 16:20:30.466407
4002137395357302781	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fapartamento-novo-com-tres-quartos-no-empreendimento-strong-building-em-palmeira-de-faro%2F24552103&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP25544217%2FTphoto%2FID19c68501-0000-0500-0000-000017b51341.jpg&description=Apartamento%20novo%2C%20com%20tr%C3%AAs%20quartos%2C%20inserido%20no%20novo%20empreendimento%20'...	Preço sob consulta	2026-01-11 16:20:30.654248
-119171781835371532	www.factorvalor.pt	APARTAMENTO T3 C/ L. DE GARAGEMApartamentoT3	javascript:void(0);	€	2026-01-11 16:22:21.67413
-4210304692138696764	www.factorvalor.pt	APARTAMENTO T3 C/ L. DE GARAGEMApartamentoT3	https://www.factorvalor.pt/imovel/apartamento-t3-c-l-de-garagem/21600163	225 000 €	2026-01-11 16:22:21.882956
8146294952712877266	www.factorvalor.pt	APARTAMENTO T2ApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2/20737512	Preço sob consulta	2026-01-11 16:22:22.06023
-678265282446617249	www.factorvalor.pt	APARTAMENTO T2 C/ LUGAR DE GARAGEMApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2-c-lugar-de-garagem/22132427	225 000 €	2026-01-11 16:22:22.235648
876911016105019509	www.factorvalor.pt	APARTAMENTO T3 COM GARAGEMApartamentoT3	https://www.factorvalor.pt/imovel/apartamento-t3-com-garagem/19674649	Preço sob consulta	2026-01-11 16:22:22.41305
4021892208481742170	www.factorvalor.pt	APARTAMENTO T3 COM JARDIM - CONDOMÍNIO FECHADOApartamentoT3	https://www.factorvalor.pt/imovel/apartamento-t3-com-jardim-condominio-fechado/19566208	Preço sob consulta	2026-01-11 16:22:22.627289
6501695473762561084	www.factorvalor.pt	APARTAMENTO T2+1ApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2-1/17982263	Preço sob consulta	2026-01-11 16:22:29.85208
4203542208342260175	www.factorvalor.pt	APARTAMENTO T2ApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2/18170216	Preço sob consulta	2026-01-11 16:22:30.04414
5699033864337700603	www.factorvalor.pt	APARTAMENTO T2 - CENTRO DA CIDADEApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2-centro-da-cidade/14865224	Preço sob consulta	2026-01-11 16:22:30.223864
-8370987711135799126	www.factorvalor.pt	APARTAMENTO T3 COM GARAGEMApartamentoT3	https://www.factorvalor.pt/imovel/apartamento-t3-com-garagem/21336275	Preço sob consulta	2026-01-11 16:22:30.440368
3512788980649736669	www.factorvalor.pt	APARTAMENTO T2ApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2/17649167	Preço sob consulta	2026-01-11 16:22:30.615865
-8514847949356885412	www.factorvalor.pt	APARTAMENTO T2 COM GARAGEMApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2-com-garagem/17982271	Preço sob consulta	2026-01-11 16:22:37.816036
-5059107232950811445	www.factorvalor.pt	Imóvel	https://www.factorvalor.pt/termos-e-condicoes	Preço sob consulta	2026-01-11 16:22:38.022031
-3634996587886344825	www.factorvalor.pt	MORADIA INDIVIDUAL V3MoradiaT3 Duplex	https://www.factorvalor.pt/imovel/moradia-individual-v3/20172875	230 000 €	2026-01-11 16:22:46.211844
-4781038633652485187	www.factorvalor.pt	MORADIA PARA RECUPERARMoradiaT3 Duplex	https://www.factorvalor.pt/imovel/moradia-para-recuperar/20286848	Preço sob consulta	2026-01-11 16:22:46.384868
-43523174646559246	www.factorvalor.pt	MORADIA INDIVIDUAL COM QUINTALMoradiaT3 Duplex	https://www.factorvalor.pt/imovel/moradia-individual-com-quintal/20436651	Preço sob consulta	2026-01-11 16:22:46.582646
-2216026032393136107	www.factorvalor.pt	CASA EM PEDRA COM 7.700M2 DE TERRENOMoradiaT4	https://www.factorvalor.pt/imovel/casa-em-pedra-com-7700m2-de-terreno/8832027	Preço sob consulta	2026-01-11 16:22:46.763498
8559954165848697743	www.factorvalor.pt	MORADIA INDIVIDUAL V4MoradiaT4 Duplex	https://www.factorvalor.pt/imovel/moradia-individual-v4/21537813	230 000 €	2026-01-11 16:22:46.933082
604706837944297604	www.factorvalor.pt	MORADIA TÉRREA - Junto á CidadeMoradiaT2	https://www.factorvalor.pt/imovel/moradia-terrea-junto-a-cidade/10709612	Preço sob consulta	2026-01-11 16:22:47.119863
7867387986286766285	www.factorvalor.pt	MORADIA INDIVIDUAL V3MoradiaT3	https://www.factorvalor.pt/imovel/moradia-individual-v3/16708380	Preço sob consulta	2026-01-11 16:22:51.471111
824200889902719563	www.factorvalor.pt	MORADIA V3 EM BANDAMoradia em BandaT3	https://www.factorvalor.pt/imovel/moradia-v3-em-banda/11763842	Preço sob consulta	2026-01-11 16:22:51.650793
1126138595926101650	www.factorvalor.pt	MORADIA V3 BANDAMoradia em BandaT3 Triplex	https://www.factorvalor.pt/imovel/moradia-v3-banda/11549488	Preço sob consulta	2026-01-11 16:22:51.827441
5636493571175539686	www.factorvalor.pt	Moradia V3 em BandaMoradiaT3 Triplex	https://www.factorvalor.pt/imovel/moradia-v3-em-banda/8879950	Preço sob consulta	2026-01-11 16:22:51.992768
-9042750735248019898	www.factorvalor.pt	MORADIA INDIVIDUALMoradiaT4 Triplex	https://www.factorvalor.pt/imovel/moradia-individual/17793642	Preço sob consulta	2026-01-11 16:22:52.203887
-7518119863814782090	www.factorvalor.pt	MORADIA V4 NOVA - LOTE 1MoradiaT4 Duplex	https://www.factorvalor.pt/imovel/moradia-v4-nova-lote-1/18240040	Preço sob consulta	2026-01-11 16:22:52.39501
7384236493007636383	era	ERA Property	https://www.era.pt/imovel/andar-moradia-t2-barcelos-carreira-e-fonte-coberta-360250173	Arrendar700 €/mês	2026-01-11 16:23:02.984048
-5173986540513344379	era	ERA Property	https://www.era.pt/imovel/apartamento-t3-barcelos-varzea-360250137	Comprar215.000 €	2026-01-11 16:23:03.167307
-949049205912914879	era	ERA Property	https://www.era.pt/imovel/apartamento-t3-barcelos-manhente-360250132	Comprar250.000 €	2026-01-11 16:23:03.331781
9138704239265061777	era	ERA Property	https://www.era.pt/imovel/apartamento-t2-barcelos-barcelos-vila-boa-e-vila-frescainha-sao-martinho-e-sao-pedro-360250122	ComprarSob Consulta	2026-01-11 16:23:03.501233
8298594487921181819	era	ERA Property	https://www.era.pt/imovel/apartamento-t2-barcelos-arcozelo-360250101	Arrendar800 €/mês11%900 €	2026-01-11 16:23:03.693805
-5207055557117290388	era	ERA Property	https://www.era.pt/imovel/moradia-t5-barcelos-alvelos-360230070	ComprarSob Consulta	2026-01-11 16:23:04.584425
-5284121238612053408	era	ERA Property	https://www.era.pt/imovel/moradia-em-banda-t3-barcelos-carapecos-360230034	Comprar235.000 €	2026-01-11 16:23:04.753953
-6958128001590944938	era	ERA Property	https://www.era.pt/imovel/moradia-t8-barcelos-arcozelo-360220227	Comprar170.000 €	2026-01-11 16:23:04.914153
1932095130911293438	era	ERA Property	https://www.era.pt/imovel/apartamento-t3-novo-barcelos-carvalhal-360220117	Comprar205.500 €	2026-01-11 16:23:05.0856
-954797039555615832	era	ERA Property	https://www.era.pt/imovel/apartamento-t2-novo-barcelos-carvalhal-360220115	Comprar184.000 €	2026-01-11 16:23:05.258079
7549905365064856070	era	ERA Property	https://www.era.pt/imovel/apartamento-t3-barcelos-barcelos-vila-boa-e-vila-frescainha-sao-martinho-e-sao-pedro-360200232	ComprarSob Consulta	2026-01-11 16:23:05.427228
6429407267760758255	www.barcelcasa.pt	Renovado	https://www.barcelcasa.pt/imoveis?mtype=1,2&bus=1&dst=3&mun=35&mrp=250000	€	2026-01-11 16:23:13.511782
-7227203073307112245	www.barcelcasa.pt	Renovado	https://www.barcelcasa.pt/imovel/t3-totalmente-renovado-equipado-e-com-varanda-a-entrada-da-cidade-de-barcelos/23192853	240 000 €	2026-01-11 16:23:21.85624
4472954399709996361	www.barcelcasa.pt	Usado	https://www.barcelcasa.pt/imovel/andar-moradia-t3-remodelado-em-arcozelo-barcelos/24463452	185 000 €	2026-01-11 16:23:22.048187
2066246898872380748	www.barcelcasa.pt	Usado	https://www.barcelcasa.pt/imovel/oportunidade-unica-moradia-para-restauro-com-vistas-panoramicas/24464238	140 000 €	2026-01-11 16:23:22.224919
-798945626257409393	www.barcelcasa.pt	Em construção	https://www.barcelcasa.pt/imovel/apartamentos-t1-e-t2-em-construcao-com-um-lugar-de-garagem-em-manhente-barcelos/24651127	175 000 €	2026-01-11 16:23:22.399953
7714486093261285942	www.barcelcasa.pt	Por recuperar	https://www.barcelcasa.pt/imovel/o-seu-novo-projeto-de-sonho-espera-por-si-em-alheira-barcelos/24408643	165 000 €	2026-01-11 16:23:22.625709
1437449548580938778	www.barcelcasa.pt	Em construção	https://www.barcelcasa.pt/imovel/apartamento-t1-c-garagem-fechada-em-gamil-barcelos/23708536	180 000 €	2026-01-11 16:23:29.862268
-2876471739686831816	www.barcelcasa.pt	Imóvel	https://www.barcelcasa.pt/termos-e-condicoes	Preço sob consulta	2026-01-11 16:23:30.083795
-8345951884444453100	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-manhente-barcelos_111/	175 000 €	2026-01-11 16:23:42.839708
-7103672440535949188	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/?pg=1&o=&g=&e=&pp=&dd=&cc=&ff=&ml=&z=&nq=&p=&a=&c=5&es=&ct=00000001&or=30	Preço sob consulta	2026-01-11 16:23:43.004057
-5933778059151307598	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-com-logradouro-em-manhente-barcelos_112/	180 000 €	2026-01-11 16:23:43.193945
-130654104873281167	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-com-logradouro-em-manhente-barcelos_113/	185 000 €	2026-01-11 16:23:43.38571
1524483886366718422	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-tamel-sao-verissimo-barcelos_105/	170 000 €	2026-01-11 16:23:43.573801
8565211363257561169	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t2-em-rio-covo-santa-eugenia-barcelos_98/	240 000 €	2026-01-11 16:23:43.756328
-6381681463469472652	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-tamel-sao-verissimo-barcelos_100/	174 000 €	2026-01-11 16:23:51.000541
-7624582957804526585	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-tamel-sao-verissimo-barcelos_96/	Preço sob consulta	2026-01-11 16:23:51.229464
5251765850580755399	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-barcelos_91/	193 000 €	2026-01-11 16:23:51.406246
7378738259200962837	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/?pg=1&o=&g=&e=&pp=&dd=&cc=&ff=&ml=&z=&nq=&p=&a=&c=9&es=&ct=00000001&or=30	Preço sob consulta	2026-01-11 16:23:51.632807
7033241187617440044	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-barcelos_92/	197 000 €	2026-01-11 16:23:51.823381
772245599349037072	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t3-em-gamil-barcelos_66/	Preço sob consulta	2026-01-11 16:23:56.07605
6914013662354006142	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t3-pronto-a-habitar-em-barcelinhos_56/	Preço sob consulta	2026-01-11 16:23:56.275162
-4430002545026923875	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/?pg=1&o=&g=&e=&pp=&dd=&cc=&ff=&ml=&z=&nq=&p=&a=&c=7&es=&ct=00000001&or=30	Preço sob consulta	2026-01-11 16:23:56.455037
-353201947409945137	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-em-gamil-barcelos_48/	175 000 €	2026-01-11 16:23:56.623592
-7752244498462249657	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/andar-moradia-t2-com-logradouro-em-arcozelo-barcelos_101/	Preço sob consulta	2026-01-11 16:24:06.10987
2923243722216452176	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/?pg=1&o=&g=&e=&pp=&dd=&cc=&ff=&ml=&z=&nq=&p=&a=&c=8&es=&ct=00000001&or=30	Preço sob consulta	2026-01-11 16:24:06.270648
-7268403479142655178	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/moradia-t4-e-moradia-t3-em-adaes-barcelos_53/	Preço sob consulta	2026-01-11 16:24:06.440707
-7061378855409423656	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/ruina-em-pedra-com-terreno-em-cossourado-barcelos_51/	47 000 €	2026-01-11 16:24:06.611984
-5680322879456428208	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/moradia-t3-para-restauro-em-vilar-de-figos-barcelos_10/	Preço sob consulta	2026-01-11 16:24:06.785094
-8299956059639586557	franciscofaria.pt	Apartamento T-3 renovado	https://franciscofaria.pt/status/para-vender/	€240,000	2026-01-11 16:24:17.134496
-722825960370477997	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/apartamento-t-3-renovado/	Preço sob consulta	2026-01-11 16:24:22.316515
-7046286682297984488	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/cobertura-t4-duplex-com-terracos-e-duas-garagens/	Preço sob consulta	2026-01-11 16:24:22.524068
-6400604219540121295	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/t3-com-garagem-edf-quinta-nova-2/	Preço sob consulta	2026-01-11 16:24:22.722436
3718556378342146826	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/t2-centro-historico-de-barcelos-novo/	Preço sob consulta	2026-01-11 16:24:22.913365
-1637343763112051133	franciscofaria.pt	Moradia nova- 5 minutos centro Barcelos	https://franciscofaria.pt/status/vendido/	Preço sob consulta	2026-01-11 16:24:23.133536
-8366169020226427118	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/moradia-nova-5-minutos-centro-barcelos/	Preço sob consulta	2026-01-11 16:24:27.339791
-6188637221709042236	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/t1-novo-centro-barcelos/	Preço sob consulta	2026-01-11 16:24:27.550039
-9049761348304382799	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/t-1-novo-centro-de-barcelos-equipado-e-mobilado/	Preço sob consulta	2026-01-11 16:24:27.740942
2157407878088740664	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/moradia-com-terreno-em-cervaes/	Preço sob consulta	2026-01-11 16:24:27.934856
-8708939727924965296	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/apartamento-t3-em-arcozelo/	Preço sob consulta	2026-01-11 16:24:28.127893
8376660304575013019	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t3-com-garagem-arcozelo-barcelos_1716/	Preço sob consulta	2026-01-11 16:24:43.560044
-1787943774228830902	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/consultores/paulo-soutelo_34/	Preço sob consulta	2026-01-11 16:24:43.722662
-7942020832535640867	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t3-abade-neiva-barcelos_1522/	Preço sob consulta	2026-01-11 16:24:43.902447
-8040531544408151562	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t1-novo-arcozelo-barcelos_1405/	Preço sob consulta	2026-01-11 16:24:44.095064
-7568024667113156771	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t2-novo-arcozelo-barcelos_1406/	Preço sob consulta	2026-01-11 16:24:44.305032
6605468804772977963	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t1-novo-arcozelo-barcelos_1408/	Preço sob consulta	2026-01-11 16:24:44.499872
-3744730203437848037	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t3-novo-arcozelo-barcelos_1409/	Preço sob consulta	2026-01-11 16:24:51.711459
-1817439919317670743	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t2-novo-arcozelo-barcelos_1410/	Preço sob consulta	2026-01-11 16:24:51.928289
4262481912979032925	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t2-novo-com-logradouro-arcozelo-barcelos_1402/	Preço sob consulta	2026-01-11 16:24:52.117899
-488356950027028528	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamentos-t3-em-galegos-sao-martinho_1349/	Preço sob consulta	2026-01-11 16:24:52.308566
9104362376204002733	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/consultores/pedro-oliveira_36/	Preço sob consulta	2026-01-11 16:24:52.472798
5648988924144550530	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamentos-t3-em-construcao-galegos-sao-martinho-barcelos_1350/	Preço sob consulta	2026-01-11 16:24:52.695001
4722272636652698632	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradia-em-alheira-barcelos_2010/	Preço sob consulta	2026-01-11 16:25:01.978527
-6606682869380935169	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradia-em-alheira-barcelos_1974/	Preço sob consulta	2026-01-11 16:25:02.130975
7561551257063383516	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradia-em-banda-arcozelo-barcelos_1996/	235.000 €	2026-01-11 16:25:02.300761
-3112747751347193823	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/consultores/elizangela-lima_39/	Preço sob consulta	2026-01-11 16:25:02.467902
-8954601277500039440	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradias-em-alheira-barcelos_1870/	Preço sob consulta	2026-01-11 16:25:02.642184
-8318433548842188817	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradias-em-alheira-barcelos_1929/	Preço sob consulta	2026-01-11 16:25:02.82839
1763271295827080145	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradias-em-alheira-barcelos_1951/	Preço sob consulta	2026-01-11 16:25:02.997911
8605186277212555015	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradia t11-terrea em-areias-sao-vicente-barcelos_1922/	Preço sob consulta	2026-01-11 16:25:03.171211
8617301288557970283	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradias-novas-em-areias-sao-vicente-barcelos_1621/	Preço sob consulta	2026-01-11 16:25:03.369751
5739906458120110226	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradias-novas-em-areias-sao-vicente-barcelos_1622/	Preço sob consulta	2026-01-11 16:25:03.550698
2666686150557806775	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradias-novas-em-areias-sao-vicente-barcelos_1623/	Preço sob consulta	2026-01-11 16:25:03.728202
-1562244927643334339	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradias-novas-em-areias-sao-vicente-barcelos_1624/	Preço sob consulta	2026-01-11 16:25:03.899281
8133357202367777488	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradias-novas-em-areias-sao-vicente-barcelos_1625/	Preço sob consulta	2026-01-11 16:25:04.07032
2181070428062662344	www.h-urb.com	Imóvel	javascript:void(0)	€	2026-01-11 16:25:31.502241
4065997889865623879	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/moradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos/22851932	397 000 €	2026-01-11 16:25:31.657715
-5692209617286553890	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851932&text=Moradia%20nova%2C%20com%203%20quartos%2C%20em%20novo%20empreendimento%20em%20Carvalhal%2C%20Bar...	Preço sob consulta	2026-01-11 16:25:31.841868
-7890749958102264042	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851932	Preço sob consulta	2026-01-11 16:25:32.03989
-3134669007515403960	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851932	Preço sob consulta	2026-01-11 16:25:32.23126
44506626567424463	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851932&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP25597153%2FTphoto%2FIDe1948601-0000-0500-0000-00001557b1b6.jpg&description=Descubra%20o%20'Figurado%20Enjoy'%2C%20um%20empreendimento%20LuxSteel360%2C%20que%20redef...	Preço sob consulta	2026-01-11 16:25:32.427844
-3684712546278926933	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/moradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos/22851927	387 000 €	2026-01-11 16:25:32.591166
-2372316443118684377	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851927&text=Moradia%20nova%2C%20com%203%20quartos%2C%20em%20novo%20empreendimento%20em%20Carvalhal%2C%20Bar...	Preço sob consulta	2026-01-11 16:25:36.805566
-254330533741761998	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851927	Preço sob consulta	2026-01-11 16:25:37.004537
-5510002036747069565	www.factorvalor.pt	APARTAMENTO T3 C/ L. DE GARAGEMApartamentoT3	javascript:void(0);	€	2026-01-11 16:39:18.793474
8731841753565034783	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851927	Preço sob consulta	2026-01-11 16:25:37.183441
-7590196087252279462	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851927&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP25596975%2FTphoto%2FID2f948601-0000-0500-0000-00001557b15e.jpg&description=Descubra%20o%20'Figurado%20Enjoy'%2C%20um%20empreendimento%20LuxSteel360%2C%20que%20redef...	Preço sob consulta	2026-01-11 16:25:37.370341
2977977219479913969	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/terreno-com-projeto-aprovado-para-duas-moradias-perelhal-barcelos/20594426	108 500 €	2026-01-11 16:25:37.522169
3673372364330903937	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-com-projeto-aprovado-para-duas-moradias-perelhal-barcelos%2F20594426&text=Terreno%20com%20projeto%20aprovado%20para%20duas%20moradias%2C%20Perelhal%2C%20Barcelos	Preço sob consulta	2026-01-11 16:25:37.714175
-2389575991006544231	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-com-projeto-aprovado-para-duas-moradias-perelhal-barcelos%2F20594426	Preço sob consulta	2026-01-11 16:25:41.934012
1530310953098769012	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-com-projeto-aprovado-para-duas-moradias-perelhal-barcelos%2F20594426	Preço sob consulta	2026-01-11 16:25:42.150877
-3778359135178979271	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-com-projeto-aprovado-para-duas-moradias-perelhal-barcelos%2F20594426&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP20628812%2FTphoto%2FID4cc53a01-0000-0500-0000-000011bba771.jpg&description=Explorando%20Terrenos%20em%20Perelhal%3A%20Uma%20Oportunidade%20de%20Constru%C3%A7%C3%A3o%20%C3%9Anica...	Preço sob consulta	2026-01-11 16:25:42.333471
7185426310716091248	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/propriedade-com-ruinas-bons-acessos-souto-guimaraes/18176525	380 000 €	2026-01-11 16:25:42.517828
5637924825111678680	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fpropriedade-com-ruinas-bons-acessos-souto-guimaraes%2F18176525&text=Propriedade%20com%20ru%C3%ADnas%20bons%20acessos%20Souto-%20Guimar%C3%A3es	Preço sob consulta	2026-01-11 16:25:42.707964
-2926639264840341064	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fpropriedade-com-ruinas-bons-acessos-souto-guimaraes%2F18176525	Preço sob consulta	2026-01-11 16:25:49.923414
8473113489118375083	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fpropriedade-com-ruinas-bons-acessos-souto-guimaraes%2F18176525	Preço sob consulta	2026-01-11 16:25:50.126763
-8459416964063239391	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fpropriedade-com-ruinas-bons-acessos-souto-guimaraes%2F18176525&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP20628933%2FTphoto%2FIDc5c53a01-0000-0500-0000-00000dcfc77b.jpg&description=Quinta%20com%2015%20mil%20metros%20de%20terreno%20de%20agricultura%20ou%20habitacional%20(c...	Preço sob consulta	2026-01-11 16:25:50.301977
-8167024854264730113	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/alojamento-local-5-estudios-t0-no-centro-do-porto/19028498	750 000 €	2026-01-11 16:25:50.478844
8407428697585245498	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Falojamento-local-5-estudios-t0-no-centro-do-porto%2F19028498&text=Alojamento%20Local%20(5%20est%C3%BAdios%20T0)%20no%20centro%20do%20Porto	Preço sob consulta	2026-01-11 16:25:50.705057
-2361632219995569075	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Falojamento-local-5-estudios-t0-no-centro-do-porto%2F19028498	Preço sob consulta	2026-01-11 16:25:50.948407
-1661132639696085695	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Falojamento-local-5-estudios-t0-no-centro-do-porto%2F19028498	Preço sob consulta	2026-01-11 16:25:51.12999
1313575447918169892	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Falojamento-local-5-estudios-t0-no-centro-do-porto%2F19028498&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP20628785%2FTphoto%2FID31c53a01-0000-0500-0000-00000edfb08a.JPG&description=A%20propriedade%20comercial%20situada%20no%20cora%C3%A7%C3%A3o%20do%20Porto%20representa%20uma%20op...	Preço sob consulta	2026-01-11 16:25:51.311553
7116764965436192352	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/t3-1-com-sotao-aproveitado-garagem-e-vistas-para-o-rio-cavado-barcelos/24709532	328 000 €	2026-01-11 16:25:51.475676
7702006016919310948	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Ft3-1-com-sotao-aproveitado-garagem-e-vistas-para-o-rio-cavado-barcelos%2F24709532&text=T3%20%2B1%20com%20s%C3%B3t%C3%A3o%20aproveitado%2C%20garagem%20e%20vistas%20para%20o%20Rio%20C%C3%A1vado%20-%20Bar...	Preço sob consulta	2026-01-11 16:25:51.698201
-1603637108759637629	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Ft3-1-com-sotao-aproveitado-garagem-e-vistas-para-o-rio-cavado-barcelos%2F24709532	Preço sob consulta	2026-01-11 16:25:51.873238
6580124001696034382	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Ft3-1-com-sotao-aproveitado-garagem-e-vistas-para-o-rio-cavado-barcelos%2F24709532	Preço sob consulta	2026-01-11 16:25:52.041906
6459393517526206745	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Ft3-1-com-sotao-aproveitado-garagem-e-vistas-para-o-rio-cavado-barcelos%2F24709532&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP28749589%2FTphoto%2FID15afb601-0000-0500-0000-000017e3978d.jpg&description=Procurar%20um%20apartamento%20T3%20em%20Barcelos%20%C3%A9%20uma%20excelente%20op%C3%A7%C3%A3o%20para%20que...	Preço sob consulta	2026-01-11 16:25:52.241572
2923205294038190994	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/moradia-com-3-quarto-na-cidade-de-barcelos/21702243	490 000 €	2026-01-11 16:25:52.411342
6367043543837476389	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-com-3-quarto-na-cidade-de-barcelos%2F21702243&text=Moradia%20com%203%20quarto%20na%20cidade%20de%20Barcelos.	Preço sob consulta	2026-01-11 16:25:52.579609
8233342623270939793	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-com-3-quarto-na-cidade-de-barcelos%2F21702243	Preço sob consulta	2026-01-11 16:25:52.741881
4113236239184413364	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-com-3-quarto-na-cidade-de-barcelos%2F21702243	Preço sob consulta	2026-01-11 16:25:52.910036
8427614245974681248	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-com-3-quarto-na-cidade-de-barcelos%2F21702243&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP22735584%2FTphoto%2FIDe0ea5a01-0000-0500-0000-000014b91354.jpg&description=Se%20est%C3%A1%20%C3%A0%20procura%20de%20uma%20habita%C3%A7%C3%A3o%20moderna%20e%20confort%C3%A1vel%2C%20esta%20moradi...	Preço sob consulta	2026-01-11 16:25:53.141927
-7859206082596490319	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/terreno-de-pinhal-em-carvalhal-barcelos/24760210	88 000 €	2026-01-11 16:25:53.308094
8440036681684273079	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-de-pinhal-em-carvalhal-barcelos%2F24760210&text=Terreno%20de%20pinhal%20em%20Carvalhal%20Barcelos	Preço sob consulta	2026-01-11 16:25:53.483242
-5516682674201427720	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-de-pinhal-em-carvalhal-barcelos%2F24760210	Preço sob consulta	2026-01-11 16:25:53.647527
3056907912509433498	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-de-pinhal-em-carvalhal-barcelos%2F24760210	Preço sob consulta	2026-01-11 16:25:53.816798
-7515029866867319087	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-de-pinhal-em-carvalhal-barcelos%2F24760210&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP25116629%2FTphoto%2FIDd53f7f01-0000-0500-0000-00001364546b.jpg&description=Terreno%20de%20pinhal%20de%209.600m2%20com%20aproximadamente%201500m2%20com%20viabilida...	Preço sob consulta	2026-01-11 16:25:53.980218
-5968732978523955607	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/moradia-de-granito-totalmente-restaurada-em-creixomil-barcelos/18215436	550 000 €	2026-01-11 16:25:54.158684
3321473271043503414	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-de-granito-totalmente-restaurada-em-creixomil-barcelos%2F18215436&text=Moradia%20de%20granito%20totalmente%20restaurada%20em%20Creixomil%2C%20Barcelos	Preço sob consulta	2026-01-11 16:25:54.377052
-3355468574003434068	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-de-granito-totalmente-restaurada-em-creixomil-barcelos%2F18215436	Preço sob consulta	2026-01-11 16:25:54.615998
618844765321920087	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-de-granito-totalmente-restaurada-em-creixomil-barcelos%2F18215436	Preço sob consulta	2026-01-11 16:25:54.78003
7129602748153420107	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-de-granito-totalmente-restaurada-em-creixomil-barcelos%2F18215436&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP20628634%2FTphoto%2FID9ac43a01-0000-0500-0000-00000fa7cf99.jpg&description=Esta%20magn%C3%ADfica%20moradia%20em%20granito%2C%20que%20foi%20meticulosamente%20recuperada...	Preço sob consulta	2026-01-11 16:25:54.941308
893243108623491960	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/moradia-individual-v4-em-galegos-s-martinho-barcelos/21351408	500 000 €	2026-01-11 16:25:55.099002
-8150252470178063910	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-individual-v4-em-galegos-s-martinho-barcelos%2F21351408&text=Moradia%20individual%20V4%20em%20Galegos%20S.%20Martinho%2C%20Barcelos	Preço sob consulta	2026-01-11 16:25:55.286393
2231058059802888320	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-individual-v4-em-galegos-s-martinho-barcelos%2F21351408	Preço sob consulta	2026-01-11 16:25:55.472818
3309587220937468904	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-individual-v4-em-galegos-s-martinho-barcelos%2F21351408	Preço sob consulta	2026-01-11 16:25:55.636178
4580086158194794609	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-individual-v4-em-galegos-s-martinho-barcelos%2F21351408&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP24997573%2FTphoto%2FIDc56e7d01-0000-0500-0000-0000135aeadd.jpg&description=Atualmente%20dispon%C3%ADvel%20para%20venda%2C%20distingue-se%20pelo%20equil%C3%ADbrio%20entre%20...	Preço sob consulta	2026-01-11 16:25:55.798653
-5158991677388627478	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/moradia-isolada-em-airo-barcelos/21363361	265 000 €	2026-01-11 16:25:55.960546
6487232838695304626	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-isolada-em-airo-barcelos%2F21363361&text=Moradia%20isolada%20em%20Air%C3%B3%2C%20Barcelos.	Preço sob consulta	2026-01-11 16:25:56.191313
1643552814897496766	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-isolada-em-airo-barcelos%2F21363361	Preço sob consulta	2026-01-11 16:25:56.359251
5860700214026337683	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-isolada-em-airo-barcelos%2F21363361	Preço sob consulta	2026-01-11 16:25:56.522882
-7179376245267027227	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-isolada-em-airo-barcelos%2F21363361&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FVV494%2FTphoto%2FIDc2cb2783-8dcd-48b3-87a8-a14878f0bc7a.jpg&description=Moradia%20isolada%20T3%20situada%20na%20freguesia%20de%20Air%C3%B3%2C%20em%20Barcelos.%20Compost...	Preço sob consulta	2026-01-11 16:25:56.688691
8797856686951386600	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/apartamento-novo-com-tres-quartos-no-empreendimento-strong-building-em-palmeira-de-faro/24552103	275 000 €	2026-01-11 16:25:56.86041
574879061727533536	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fapartamento-novo-com-tres-quartos-no-empreendimento-strong-building-em-palmeira-de-faro%2F24552103&text=Apartamento%20novo%2C%20com%20tr%C3%AAs%20quartos%2C%20no%20empreendimento%20'STRONG%20BUILDIN...	Preço sob consulta	2026-01-11 16:25:57.025424
-7984556877792407240	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fapartamento-novo-com-tres-quartos-no-empreendimento-strong-building-em-palmeira-de-faro%2F24552103	Preço sob consulta	2026-01-11 16:25:57.173224
9102111393380720019	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fapartamento-novo-com-tres-quartos-no-empreendimento-strong-building-em-palmeira-de-faro%2F24552103	Preço sob consulta	2026-01-11 16:25:57.329079
3656479827806258717	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fapartamento-novo-com-tres-quartos-no-empreendimento-strong-building-em-palmeira-de-faro%2F24552103&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP25544217%2FTphoto%2FID19c68501-0000-0500-0000-000017b51341.jpg&description=Apartamento%20novo%2C%20com%20tr%C3%AAs%20quartos%2C%20inserido%20no%20novo%20empreendimento%20'...	Preço sob consulta	2026-01-11 16:25:57.495889
5450385451689296450	www.factorvalor.pt	APARTAMENTO T3 C/ L. DE GARAGEMApartamentoT3	https://www.factorvalor.pt/imovel/apartamento-t3-c-l-de-garagem/21600163	225 000 €	2026-01-11 16:39:19.979355
-8088135730637950136	www.factorvalor.pt	APARTAMENTO T2ApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2/20737512	Preço sob consulta	2026-01-11 16:39:21.164303
-9024839804123277219	www.factorvalor.pt	APARTAMENTO T2 C/ LUGAR DE GARAGEMApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2-c-lugar-de-garagem/22132427	225 000 €	2026-01-11 16:39:22.340991
-2855041946097662663	www.factorvalor.pt	APARTAMENTO T3 COM GARAGEMApartamentoT3	https://www.factorvalor.pt/imovel/apartamento-t3-com-garagem/19674649	Preço sob consulta	2026-01-11 16:39:23.541346
4051996196994862118	www.factorvalor.pt	APARTAMENTO T3 COM JARDIM - CONDOMÍNIO FECHADOApartamentoT3	https://www.factorvalor.pt/imovel/apartamento-t3-com-jardim-condominio-fechado/19566208	Preço sob consulta	2026-01-11 16:39:24.725018
5396401802089506015	www.factorvalor.pt	APARTAMENTO T2+1ApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2-1/17982263	Preço sob consulta	2026-01-11 16:39:25.909696
-5657231765476669317	www.factorvalor.pt	APARTAMENTO T2ApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2/18170216	Preço sob consulta	2026-01-11 16:39:27.091448
-7364073175745853916	www.factorvalor.pt	APARTAMENTO T2 - CENTRO DA CIDADEApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2-centro-da-cidade/14865224	Preço sob consulta	2026-01-11 16:39:28.267886
1707740839698596345	www.factorvalor.pt	APARTAMENTO T3 COM GARAGEMApartamentoT3	https://www.factorvalor.pt/imovel/apartamento-t3-com-garagem/21336275	Preço sob consulta	2026-01-11 16:39:29.477704
-15823671020613024	www.factorvalor.pt	APARTAMENTO T2ApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2/17649167	Preço sob consulta	2026-01-11 16:39:30.655053
-3737207843773644124	www.factorvalor.pt	APARTAMENTO T2 COM GARAGEMApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2-com-garagem/17982271	Preço sob consulta	2026-01-11 16:39:31.856036
-5481449218254311171	www.factorvalor.pt	Imóvel	https://www.factorvalor.pt/termos-e-condicoes	Preço sob consulta	2026-01-11 16:39:33.045847
8266291399177881352	www.factorvalor.pt	MORADIA INDIVIDUAL V3MoradiaT3 Duplex	https://www.factorvalor.pt/imovel/moradia-individual-v3/20172875	230 000 €	2026-01-11 16:39:42.464307
1355263025435082719	www.factorvalor.pt	MORADIA PARA RECUPERARMoradiaT3 Duplex	https://www.factorvalor.pt/imovel/moradia-para-recuperar/20286848	Preço sob consulta	2026-01-11 16:39:43.78808
-3665929997564311201	www.factorvalor.pt	MORADIA INDIVIDUAL COM QUINTALMoradiaT3 Duplex	https://www.factorvalor.pt/imovel/moradia-individual-com-quintal/20436651	Preço sob consulta	2026-01-11 16:39:44.987497
2761025625774524850	www.factorvalor.pt	CASA EM PEDRA COM 7.700M2 DE TERRENOMoradiaT4	https://www.factorvalor.pt/imovel/casa-em-pedra-com-7700m2-de-terreno/8832027	Preço sob consulta	2026-01-11 16:39:46.172383
-5272393804374337389	www.factorvalor.pt	MORADIA INDIVIDUAL V4MoradiaT4 Duplex	https://www.factorvalor.pt/imovel/moradia-individual-v4/21537813	230 000 €	2026-01-11 16:39:47.369253
2939664558016179230	www.factorvalor.pt	MORADIA TÉRREA - Junto á CidadeMoradiaT2	https://www.factorvalor.pt/imovel/moradia-terrea-junto-a-cidade/10709612	Preço sob consulta	2026-01-11 16:39:48.614866
1586247410807497881	www.factorvalor.pt	MORADIA INDIVIDUAL V3MoradiaT3	https://www.factorvalor.pt/imovel/moradia-individual-v3/16708380	Preço sob consulta	2026-01-11 16:39:49.791599
-9183464343914280873	www.factorvalor.pt	MORADIA V3 EM BANDAMoradia em BandaT3	https://www.factorvalor.pt/imovel/moradia-v3-em-banda/11763842	Preço sob consulta	2026-01-11 16:39:50.999308
8234362175972499791	www.factorvalor.pt	MORADIA V3 BANDAMoradia em BandaT3 Triplex	https://www.factorvalor.pt/imovel/moradia-v3-banda/11549488	Preço sob consulta	2026-01-11 16:40:19.375496
-6623650840595391939	www.factorvalor.pt	Moradia V3 em BandaMoradiaT3 Triplex	https://www.factorvalor.pt/imovel/moradia-v3-em-banda/8879950	Preço sob consulta	2026-01-11 16:40:20.57296
-3405658004465208254	www.factorvalor.pt	MORADIA INDIVIDUALMoradiaT4 Triplex	https://www.factorvalor.pt/imovel/moradia-individual/17793642	Preço sob consulta	2026-01-11 16:40:21.764268
-7018043200454783426	www.factorvalor.pt	MORADIA V4 NOVA - LOTE 1MoradiaT4 Duplex	https://www.factorvalor.pt/imovel/moradia-v4-nova-lote-1/18240040	Preço sob consulta	2026-01-11 16:40:22.967972
9023038309004691412	www.barcelcasa.pt	Renovado	https://www.barcelcasa.pt/imoveis?mtype=1,2&bus=1&dst=3&mun=35&mrp=250000	€	2026-01-11 16:40:34.108433
1185860249577586830	www.barcelcasa.pt	Renovado	https://www.barcelcasa.pt/imovel/t3-totalmente-renovado-equipado-e-com-varanda-a-entrada-da-cidade-de-barcelos/23192853	240 000 €	2026-01-11 16:40:35.281255
-8595064951177314173	www.barcelcasa.pt	Usado	https://www.barcelcasa.pt/imovel/andar-moradia-t3-remodelado-em-arcozelo-barcelos/24463452	185 000 €	2026-01-11 16:40:36.49045
5878576279885142181	www.barcelcasa.pt	Usado	https://www.barcelcasa.pt/imovel/oportunidade-unica-moradia-para-restauro-com-vistas-panoramicas/24464238	140 000 €	2026-01-11 16:40:37.671794
-6224847476257785253	www.barcelcasa.pt	Em construção	https://www.barcelcasa.pt/imovel/apartamentos-t1-e-t2-em-construcao-com-um-lugar-de-garagem-em-manhente-barcelos/24651127	175 000 €	2026-01-11 16:40:38.849502
-4055132364524245349	www.barcelcasa.pt	Por recuperar	https://www.barcelcasa.pt/imovel/o-seu-novo-projeto-de-sonho-espera-por-si-em-alheira-barcelos/24408643	165 000 €	2026-01-11 16:40:40.042884
-2472958405717954320	www.barcelcasa.pt	Em construção	https://www.barcelcasa.pt/imovel/apartamento-t1-c-garagem-fechada-em-gamil-barcelos/23708536	180 000 €	2026-01-11 16:40:41.228522
-858311423409244433	www.barcelcasa.pt	Imóvel	https://www.barcelcasa.pt/termos-e-condicoes	Preço sob consulta	2026-01-11 16:40:42.410547
-1658559534802979269	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-manhente-barcelos_111/	175 000 €	2026-01-11 16:41:01.69836
-6036767792450430081	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/?pg=1&o=&g=&e=&pp=&dd=&cc=&ff=&ml=&z=&nq=&p=&a=&c=5&es=&ct=00000001&or=30	Preço sob consulta	2026-01-11 16:41:02.889787
-9067959972026452419	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-com-logradouro-em-manhente-barcelos_112/	180 000 €	2026-01-11 16:41:04.08286
-1415399607143016267	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-com-logradouro-em-manhente-barcelos_113/	185 000 €	2026-01-11 16:41:05.275961
-6505457875320183377	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-tamel-sao-verissimo-barcelos_105/	170 000 €	2026-01-11 16:41:06.46287
246386837664576245	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t2-em-rio-covo-santa-eugenia-barcelos_98/	240 000 €	2026-01-11 16:41:07.64551
-4273936421503753934	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-tamel-sao-verissimo-barcelos_100/	174 000 €	2026-01-11 16:41:08.863471
-3903348149518998646	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-tamel-sao-verissimo-barcelos_96/	Preço sob consulta	2026-01-11 16:41:10.057177
-5972070310380177179	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-barcelos_91/	193 000 €	2026-01-11 16:41:11.245261
5972662134699369311	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/?pg=1&o=&g=&e=&pp=&dd=&cc=&ff=&ml=&z=&nq=&p=&a=&c=9&es=&ct=00000001&or=30	Preço sob consulta	2026-01-11 16:41:23.755755
-1736184118724720066	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-barcelos_92/	197 000 €	2026-01-11 16:41:24.93694
7515201888176866120	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t3-em-gamil-barcelos_66/	Preço sob consulta	2026-01-11 16:41:26.121229
3460387833588285993	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t3-pronto-a-habitar-em-barcelinhos_56/	Preço sob consulta	2026-01-11 16:41:27.31846
-995288959120259984	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/?pg=1&o=&g=&e=&pp=&dd=&cc=&ff=&ml=&z=&nq=&p=&a=&c=7&es=&ct=00000001&or=30	Preço sob consulta	2026-01-11 16:41:28.554101
922277805630428263	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-em-gamil-barcelos_48/	175 000 €	2026-01-11 16:41:29.739252
-1266073635976142620	franciscofaria.pt	Apartamento T-3 renovado	https://franciscofaria.pt/status/para-vender/	€240,000	2026-01-11 16:41:43.333956
-5868070992057062163	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/apartamento-t-3-renovado/	Preço sob consulta	2026-01-11 16:41:44.516928
-2419031740435736708	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/cobertura-t4-duplex-com-terracos-e-duas-garagens/	Preço sob consulta	2026-01-11 16:41:45.704398
6044382570279287016	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/t3-com-garagem-edf-quinta-nova-2/	Preço sob consulta	2026-01-11 16:41:46.908257
-4051545914659863039	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/t2-centro-historico-de-barcelos-novo/	Preço sob consulta	2026-01-11 16:41:48.115378
-4045436370935743781	franciscofaria.pt	Moradia nova- 5 minutos centro Barcelos	https://franciscofaria.pt/status/vendido/	Preço sob consulta	2026-01-11 16:41:49.325435
-5157508784267281725	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/moradia-nova-5-minutos-centro-barcelos/	Preço sob consulta	2026-01-11 16:41:50.517046
409786124403256667	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/t1-novo-centro-barcelos/	Preço sob consulta	2026-01-11 16:41:51.718347
-4423835740190053331	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/t-1-novo-centro-de-barcelos-equipado-e-mobilado/	Preço sob consulta	2026-01-11 16:41:52.920926
-5650762337926895840	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/moradia-com-terreno-em-cervaes/	Preço sob consulta	2026-01-11 16:41:54.108158
-5014371102707116481	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/apartamento-t3-em-arcozelo/	Preço sob consulta	2026-01-11 16:41:55.302869
-8674563103507289990	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t3-com-garagem-arcozelo-barcelos_1716/	Preço sob consulta	2026-01-11 16:42:16.822152
-4795472534254187472	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/consultores/paulo-soutelo_34/	Preço sob consulta	2026-01-11 16:42:17.986889
-6350795034861828916	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t3-abade-neiva-barcelos_1522/	Preço sob consulta	2026-01-11 16:42:19.176527
7647873085429283046	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t1-novo-arcozelo-barcelos_1405/	Preço sob consulta	2026-01-11 16:42:26.492029
-542351713182460579	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t2-novo-arcozelo-barcelos_1406/	Preço sob consulta	2026-01-11 16:42:27.703933
1722305488770594104	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t1-novo-arcozelo-barcelos_1408/	Preço sob consulta	2026-01-11 16:42:28.903931
-5706409324324132296	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t3-novo-arcozelo-barcelos_1409/	Preço sob consulta	2026-01-11 16:42:30.212793
2257310430712527838	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t2-novo-arcozelo-barcelos_1410/	Preço sob consulta	2026-01-11 16:42:31.398685
-3820939352987684565	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t2-novo-com-logradouro-arcozelo-barcelos_1402/	Preço sob consulta	2026-01-11 16:42:32.610652
7226106196447004308	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamentos-t3-em-galegos-sao-martinho_1349/	Preço sob consulta	2026-01-11 16:42:33.790242
37683693383412344	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/consultores/pedro-oliveira_36/	Preço sob consulta	2026-01-11 16:42:34.973207
-5366604221332965040	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamentos-t3-em-construcao-galegos-sao-martinho-barcelos_1350/	Preço sob consulta	2026-01-11 16:42:36.157395
-2759138768910618256	www.h-urb.com	Imóvel	javascript:void(0)	€	2026-01-11 16:43:06.516857
7625196669019873249	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/moradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos/22851932	397 000 €	2026-01-11 16:43:07.697696
8345425572851195871	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851932&text=Moradia%20nova%2C%20com%203%20quartos%2C%20em%20novo%20empreendimento%20em%20Carvalhal%2C%20Bar...	Preço sob consulta	2026-01-11 16:43:08.906149
725412194601225894	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851932	Preço sob consulta	2026-01-11 16:43:10.089148
7721131016890344350	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851932	Preço sob consulta	2026-01-11 16:43:11.274608
528224329512989609	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851932&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP25597153%2FTphoto%2FIDe1948601-0000-0500-0000-00001557b1b6.jpg&description=Descubra%20o%20'Figurado%20Enjoy'%2C%20um%20empreendimento%20LuxSteel360%2C%20que%20redef...	Preço sob consulta	2026-01-11 16:43:12.450992
1361759210831057809	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/moradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos/22851927	387 000 €	2026-01-11 16:43:13.64407
2436824435351569616	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851927&text=Moradia%20nova%2C%20com%203%20quartos%2C%20em%20novo%20empreendimento%20em%20Carvalhal%2C%20Bar...	Preço sob consulta	2026-01-11 16:43:14.8328
-9026775807603735653	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-tamel-sao-verissimo-barcelos_105/	170 000 €	2026-01-12 12:49:32.504871
4563107441771438054	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851927	Preço sob consulta	2026-01-11 16:43:16.012164
-8003393811886538064	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851927	Preço sob consulta	2026-01-11 16:43:17.189214
-3762607428239055531	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851927&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP25596975%2FTphoto%2FID2f948601-0000-0500-0000-00001557b15e.jpg&description=Descubra%20o%20'Figurado%20Enjoy'%2C%20um%20empreendimento%20LuxSteel360%2C%20que%20redef...	Preço sob consulta	2026-01-11 16:43:18.375522
9048858338822213661	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/terreno-com-projeto-aprovado-para-duas-moradias-perelhal-barcelos/20594426	108 500 €	2026-01-11 16:43:26.605328
3327603106871466320	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-com-projeto-aprovado-para-duas-moradias-perelhal-barcelos%2F20594426&text=Terreno%20com%20projeto%20aprovado%20para%20duas%20moradias%2C%20Perelhal%2C%20Barcelos	Preço sob consulta	2026-01-11 16:43:27.805991
-7136938630745241006	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-com-projeto-aprovado-para-duas-moradias-perelhal-barcelos%2F20594426	Preço sob consulta	2026-01-11 16:43:28.989166
2992743351538261316	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-com-projeto-aprovado-para-duas-moradias-perelhal-barcelos%2F20594426	Preço sob consulta	2026-01-11 16:43:30.191265
4721025758096108708	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-com-projeto-aprovado-para-duas-moradias-perelhal-barcelos%2F20594426&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP20628812%2FTphoto%2FID4cc53a01-0000-0500-0000-000011bba771.jpg&description=Explorando%20Terrenos%20em%20Perelhal%3A%20Uma%20Oportunidade%20de%20Constru%C3%A7%C3%A3o%20%C3%9Anica...	Preço sob consulta	2026-01-11 16:43:31.373816
6109524628363318316	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/propriedade-com-ruinas-bons-acessos-souto-guimaraes/18176525	380 000 €	2026-01-11 16:43:32.562973
-303606692187945611	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fpropriedade-com-ruinas-bons-acessos-souto-guimaraes%2F18176525&text=Propriedade%20com%20ru%C3%ADnas%20bons%20acessos%20Souto-%20Guimar%C3%A3es	Preço sob consulta	2026-01-11 16:43:33.762089
-6168953025558235509	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fpropriedade-com-ruinas-bons-acessos-souto-guimaraes%2F18176525	Preço sob consulta	2026-01-11 16:43:35.004254
7923053595103265499	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fpropriedade-com-ruinas-bons-acessos-souto-guimaraes%2F18176525	Preço sob consulta	2026-01-11 16:43:36.187308
-6661341578845599764	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fpropriedade-com-ruinas-bons-acessos-souto-guimaraes%2F18176525&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP20628933%2FTphoto%2FIDc5c53a01-0000-0500-0000-00000dcfc77b.jpg&description=Quinta%20com%2015%20mil%20metros%20de%20terreno%20de%20agricultura%20ou%20habitacional%20(c...	Preço sob consulta	2026-01-11 16:43:37.364993
497801749168304078	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/alojamento-local-5-estudios-t0-no-centro-do-porto/19028498	750 000 €	2026-01-11 16:43:38.557351
7810923877911659904	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Falojamento-local-5-estudios-t0-no-centro-do-porto%2F19028498&text=Alojamento%20Local%20(5%20est%C3%BAdios%20T0)%20no%20centro%20do%20Porto	Preço sob consulta	2026-01-11 16:43:39.736995
-552216799861556918	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Falojamento-local-5-estudios-t0-no-centro-do-porto%2F19028498	Preço sob consulta	2026-01-11 16:43:40.90537
8416798089862364628	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Falojamento-local-5-estudios-t0-no-centro-do-porto%2F19028498	Preço sob consulta	2026-01-11 16:43:42.080213
-4455456028677763844	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Falojamento-local-5-estudios-t0-no-centro-do-porto%2F19028498&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP20628785%2FTphoto%2FID31c53a01-0000-0500-0000-00000edfb08a.JPG&description=A%20propriedade%20comercial%20situada%20no%20cora%C3%A7%C3%A3o%20do%20Porto%20representa%20uma%20op...	Preço sob consulta	2026-01-11 16:43:43.257104
-6370652246604841591	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/t3-1-com-sotao-aproveitado-garagem-e-vistas-para-o-rio-cavado-barcelos/24709532	328 000 €	2026-01-11 16:43:44.441664
-8334883780765689337	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Ft3-1-com-sotao-aproveitado-garagem-e-vistas-para-o-rio-cavado-barcelos%2F24709532&text=T3%20%2B1%20com%20s%C3%B3t%C3%A3o%20aproveitado%2C%20garagem%20e%20vistas%20para%20o%20Rio%20C%C3%A1vado%20-%20Bar...	Preço sob consulta	2026-01-11 16:43:45.635595
3805698903049757020	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Ft3-1-com-sotao-aproveitado-garagem-e-vistas-para-o-rio-cavado-barcelos%2F24709532	Preço sob consulta	2026-01-11 16:43:46.835003
-2365454841723581232	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Ft3-1-com-sotao-aproveitado-garagem-e-vistas-para-o-rio-cavado-barcelos%2F24709532	Preço sob consulta	2026-01-11 16:43:48.027537
-1299224564637401842	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Ft3-1-com-sotao-aproveitado-garagem-e-vistas-para-o-rio-cavado-barcelos%2F24709532&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP28749589%2FTphoto%2FID15afb601-0000-0500-0000-000017e3978d.jpg&description=Procurar%20um%20apartamento%20T3%20em%20Barcelos%20%C3%A9%20uma%20excelente%20op%C3%A7%C3%A3o%20para%20que...	Preço sob consulta	2026-01-11 16:43:49.240018
-4543681432564540437	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/moradia-com-3-quarto-na-cidade-de-barcelos/21702243	490 000 €	2026-01-11 16:44:26.580236
-5984609504888238204	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-com-3-quarto-na-cidade-de-barcelos%2F21702243&text=Moradia%20com%203%20quarto%20na%20cidade%20de%20Barcelos.	Preço sob consulta	2026-01-11 16:44:27.752646
-7467843889149211272	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-com-3-quarto-na-cidade-de-barcelos%2F21702243	Preço sob consulta	2026-01-11 16:44:28.93741
-7116974234969979785	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-com-3-quarto-na-cidade-de-barcelos%2F21702243	Preço sob consulta	2026-01-11 16:44:30.123267
2318490129613903453	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-com-3-quarto-na-cidade-de-barcelos%2F21702243&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP22735584%2FTphoto%2FIDe0ea5a01-0000-0500-0000-000014b91354.jpg&description=Se%20est%C3%A1%20%C3%A0%20procura%20de%20uma%20habita%C3%A7%C3%A3o%20moderna%20e%20confort%C3%A1vel%2C%20esta%20moradi...	Preço sob consulta	2026-01-11 16:44:31.306656
5900521256281298592	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/terreno-de-pinhal-em-carvalhal-barcelos/24760210	88 000 €	2026-01-11 16:44:32.48962
1229151738718684300	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-de-pinhal-em-carvalhal-barcelos%2F24760210&text=Terreno%20de%20pinhal%20em%20Carvalhal%20Barcelos	Preço sob consulta	2026-01-11 16:44:33.753826
-7921534979950812987	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-de-pinhal-em-carvalhal-barcelos%2F24760210	Preço sob consulta	2026-01-11 16:44:34.929843
8210690439241181302	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-de-pinhal-em-carvalhal-barcelos%2F24760210	Preço sob consulta	2026-01-11 16:44:36.168166
-6248000606994742310	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-de-pinhal-em-carvalhal-barcelos%2F24760210&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP25116629%2FTphoto%2FIDd53f7f01-0000-0500-0000-00001364546b.jpg&description=Terreno%20de%20pinhal%20de%209.600m2%20com%20aproximadamente%201500m2%20com%20viabilida...	Preço sob consulta	2026-01-11 16:44:37.363505
8398259453580935269	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/moradia-de-granito-totalmente-restaurada-em-creixomil-barcelos/18215436	550 000 €	2026-01-11 16:44:38.571638
2082672311371527240	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-de-granito-totalmente-restaurada-em-creixomil-barcelos%2F18215436&text=Moradia%20de%20granito%20totalmente%20restaurada%20em%20Creixomil%2C%20Barcelos	Preço sob consulta	2026-01-11 16:44:39.793009
1203412132379677378	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-de-granito-totalmente-restaurada-em-creixomil-barcelos%2F18215436	Preço sob consulta	2026-01-11 16:44:40.959926
8740140236173024367	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-de-granito-totalmente-restaurada-em-creixomil-barcelos%2F18215436	Preço sob consulta	2026-01-11 16:44:42.156278
-8570690511009560908	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-de-granito-totalmente-restaurada-em-creixomil-barcelos%2F18215436&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP20628634%2FTphoto%2FID9ac43a01-0000-0500-0000-00000fa7cf99.jpg&description=Esta%20magn%C3%ADfica%20moradia%20em%20granito%2C%20que%20foi%20meticulosamente%20recuperada...	Preço sob consulta	2026-01-11 16:44:43.367269
1945615005994783367	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/moradia-individual-v4-em-galegos-s-martinho-barcelos/21351408	500 000 €	2026-01-11 16:44:44.685114
-6052818208444063581	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-individual-v4-em-galegos-s-martinho-barcelos%2F21351408&text=Moradia%20individual%20V4%20em%20Galegos%20S.%20Martinho%2C%20Barcelos	Preço sob consulta	2026-01-11 16:44:45.876316
1814729298407575751	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-individual-v4-em-galegos-s-martinho-barcelos%2F21351408	Preço sob consulta	2026-01-11 16:44:47.090513
219878843251445508	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-individual-v4-em-galegos-s-martinho-barcelos%2F21351408	Preço sob consulta	2026-01-11 16:44:48.270279
8582746340320541002	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-individual-v4-em-galegos-s-martinho-barcelos%2F21351408&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP24997573%2FTphoto%2FIDc56e7d01-0000-0500-0000-0000135aeadd.jpg&description=Atualmente%20dispon%C3%ADvel%20para%20venda%2C%20distingue-se%20pelo%20equil%C3%ADbrio%20entre%20...	Preço sob consulta	2026-01-11 16:44:49.451752
2610478332337800436	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/moradia-isolada-em-airo-barcelos/21363361	265 000 €	2026-01-11 16:45:26.925439
-259225741009590959	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-isolada-em-airo-barcelos%2F21363361&text=Moradia%20isolada%20em%20Air%C3%B3%2C%20Barcelos.	Preço sob consulta	2026-01-11 16:45:28.111957
-7965592585288260883	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-isolada-em-airo-barcelos%2F21363361	Preço sob consulta	2026-01-11 16:45:29.315503
-5483851533446515053	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-isolada-em-airo-barcelos%2F21363361	Preço sob consulta	2026-01-11 16:45:30.55044
-8472766580762378449	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-isolada-em-airo-barcelos%2F21363361&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FVV494%2FTphoto%2FIDc2cb2783-8dcd-48b3-87a8-a14878f0bc7a.jpg&description=Moradia%20isolada%20T3%20situada%20na%20freguesia%20de%20Air%C3%B3%2C%20em%20Barcelos.%20Compost...	Preço sob consulta	2026-01-11 16:45:31.73476
-6449149096746410459	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/apartamento-novo-com-tres-quartos-no-empreendimento-strong-building-em-palmeira-de-faro/24552103	275 000 €	2026-01-11 16:45:32.937612
8804289802539996948	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fapartamento-novo-com-tres-quartos-no-empreendimento-strong-building-em-palmeira-de-faro%2F24552103&text=Apartamento%20novo%2C%20com%20tr%C3%AAs%20quartos%2C%20no%20empreendimento%20'STRONG%20BUILDIN...	Preço sob consulta	2026-01-11 16:45:34.157854
-3258002870648586197	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fapartamento-novo-com-tres-quartos-no-empreendimento-strong-building-em-palmeira-de-faro%2F24552103	Preço sob consulta	2026-01-11 16:45:35.364516
-5660193933174508911	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fapartamento-novo-com-tres-quartos-no-empreendimento-strong-building-em-palmeira-de-faro%2F24552103	Preço sob consulta	2026-01-11 16:45:36.541328
3306594007298714247	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t2-em-rio-covo-santa-eugenia-barcelos_98/	240 000 €	2026-01-12 12:49:33.74519
2567918398455076235	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fapartamento-novo-com-tres-quartos-no-empreendimento-strong-building-em-palmeira-de-faro%2F24552103&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP25544217%2FTphoto%2FID19c68501-0000-0500-0000-000017b51341.jpg&description=Apartamento%20novo%2C%20com%20tr%C3%AAs%20quartos%2C%20inserido%20no%20novo%20empreendimento%20'...	Preço sob consulta	2026-01-11 16:45:37.757273
-2474995845844460765	www.factorvalor.pt	APARTAMENTO T3 C/ L. DE GARAGEMApartamentoT3	javascript:void(0);	€	2026-01-12 12:47:36.209962
1614577929413899879	www.factorvalor.pt	APARTAMENTO T3 C/ L. DE GARAGEMApartamentoT3	https://www.factorvalor.pt/imovel/apartamento-t3-c-l-de-garagem/21600163	225 000 €	2026-01-12 12:47:37.538018
2306626982585754178	www.factorvalor.pt	APARTAMENTO T2ApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2/20737512	Preço sob consulta	2026-01-12 12:47:38.752231
-5985092648177665752	www.factorvalor.pt	APARTAMENTO T2 C/ LUGAR DE GARAGEMApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2-c-lugar-de-garagem/22132427	225 000 €	2026-01-12 12:47:40.033735
-1801962623345930832	www.factorvalor.pt	APARTAMENTO T3 COM GARAGEMApartamentoT3	https://www.factorvalor.pt/imovel/apartamento-t3-com-garagem/19674649	Preço sob consulta	2026-01-12 12:47:41.225268
1584337876452173068	www.factorvalor.pt	APARTAMENTO T3 COM JARDIM - CONDOMÍNIO FECHADOApartamentoT3	https://www.factorvalor.pt/imovel/apartamento-t3-com-jardim-condominio-fechado/19566208	Preço sob consulta	2026-01-12 12:47:42.420754
72010942787056928	www.factorvalor.pt	APARTAMENTO T2+1ApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2-1/17982263	Preço sob consulta	2026-01-12 12:47:43.725634
-7308814584213106553	www.factorvalor.pt	APARTAMENTO T2ApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2/18170216	Preço sob consulta	2026-01-12 12:47:44.925943
-2335980950726987356	www.factorvalor.pt	APARTAMENTO T2 - CENTRO DA CIDADEApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2-centro-da-cidade/14865224	Preço sob consulta	2026-01-12 12:47:46.121889
-9096909707379876902	www.factorvalor.pt	APARTAMENTO T3 COM GARAGEMApartamentoT3	https://www.factorvalor.pt/imovel/apartamento-t3-com-garagem/21336275	Preço sob consulta	2026-01-12 12:47:47.378913
250396680176705770	www.factorvalor.pt	APARTAMENTO T2ApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2/17649167	Preço sob consulta	2026-01-12 12:47:48.567468
6183029614703638301	www.factorvalor.pt	APARTAMENTO T2 COM GARAGEMApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2-com-garagem/17982271	Preço sob consulta	2026-01-12 12:47:49.772127
2613868861039912883	www.factorvalor.pt	Imóvel	https://www.factorvalor.pt/termos-e-condicoes	Preço sob consulta	2026-01-12 12:47:51.052406
3498702628288457446	www.factorvalor.pt	MORADIA INDIVIDUAL V3MoradiaT3 Duplex	https://www.factorvalor.pt/imovel/moradia-individual-v3/20172875	230 000 €	2026-01-12 12:48:01.376484
-4434798133732670119	www.factorvalor.pt	MORADIA PARA RECUPERARMoradiaT3 Duplex	https://www.factorvalor.pt/imovel/moradia-para-recuperar/20286848	Preço sob consulta	2026-01-12 12:48:02.634754
-2625052559247255443	www.factorvalor.pt	MORADIA INDIVIDUAL COM QUINTALMoradiaT3 Duplex	https://www.factorvalor.pt/imovel/moradia-individual-com-quintal/20436651	Preço sob consulta	2026-01-12 12:48:03.831536
7794281080628786200	www.factorvalor.pt	CASA EM PEDRA COM 7.700M2 DE TERRENOMoradiaT4	https://www.factorvalor.pt/imovel/casa-em-pedra-com-7700m2-de-terreno/8832027	Preço sob consulta	2026-01-12 12:48:05.127082
-3713421260695869574	www.factorvalor.pt	MORADIA INDIVIDUAL V4MoradiaT4 Duplex	https://www.factorvalor.pt/imovel/moradia-individual-v4/21537813	230 000 €	2026-01-12 12:48:06.407345
3991120958840509665	www.factorvalor.pt	MORADIA TÉRREA - Junto á CidadeMoradiaT2	https://www.factorvalor.pt/imovel/moradia-terrea-junto-a-cidade/10709612	Preço sob consulta	2026-01-12 12:48:07.846738
-4747589686970945614	www.factorvalor.pt	MORADIA INDIVIDUAL V3MoradiaT3	https://www.factorvalor.pt/imovel/moradia-individual-v3/16708380	Preço sob consulta	2026-01-12 12:48:09.051779
-1966390925981245923	www.factorvalor.pt	MORADIA V3 EM BANDAMoradia em BandaT3	https://www.factorvalor.pt/imovel/moradia-v3-em-banda/11763842	Preço sob consulta	2026-01-12 12:48:10.260359
723784350348680308	www.factorvalor.pt	MORADIA V3 BANDAMoradia em BandaT3 Triplex	https://www.factorvalor.pt/imovel/moradia-v3-banda/11549488	Preço sob consulta	2026-01-12 12:48:37.799596
7311828693951169882	www.factorvalor.pt	Moradia V3 em BandaMoradiaT3 Triplex	https://www.factorvalor.pt/imovel/moradia-v3-em-banda/8879950	Preço sob consulta	2026-01-12 12:48:38.990079
5879648857458182432	www.factorvalor.pt	MORADIA INDIVIDUALMoradiaT4 Triplex	https://www.factorvalor.pt/imovel/moradia-individual/17793642	Preço sob consulta	2026-01-12 12:48:40.258093
7836017122029245066	www.factorvalor.pt	MORADIA V4 NOVA - LOTE 1MoradiaT4 Duplex	https://www.factorvalor.pt/imovel/moradia-v4-nova-lote-1/18240040	Preço sob consulta	2026-01-12 12:48:41.489803
3623181490223572687	www.barcelcasa.pt	Renovado	https://www.barcelcasa.pt/imoveis?mtype=1,2&bus=1&dst=3&mun=35&mrp=250000	€	2026-01-12 12:48:53.518477
-6639682755193126075	www.barcelcasa.pt	Renovado	https://www.barcelcasa.pt/imovel/t3-totalmente-renovado-equipado-e-com-varanda-a-entrada-da-cidade-de-barcelos/23192853	240 000 €	2026-01-12 12:48:54.691406
4647810509358403484	www.barcelcasa.pt	Usado	https://www.barcelcasa.pt/imovel/andar-moradia-t3-remodelado-em-arcozelo-barcelos/24463452	185 000 €	2026-01-12 12:48:55.879399
7411754959915580525	www.barcelcasa.pt	Usado	https://www.barcelcasa.pt/imovel/oportunidade-unica-moradia-para-restauro-com-vistas-panoramicas/24464238	140 000 €	2026-01-12 12:48:57.151969
-7695647714464279252	www.barcelcasa.pt	Em construção	https://www.barcelcasa.pt/imovel/apartamentos-t1-e-t2-em-construcao-com-um-lugar-de-garagem-em-manhente-barcelos/24651127	175 000 €	2026-01-12 12:48:58.416679
1181223251125255520	www.barcelcasa.pt	Por recuperar	https://www.barcelcasa.pt/imovel/o-seu-novo-projeto-de-sonho-espera-por-si-em-alheira-barcelos/24408643	165 000 €	2026-01-12 12:48:59.657371
7438715718040046053	www.barcelcasa.pt	Em construção	https://www.barcelcasa.pt/imovel/apartamento-t1-c-garagem-fechada-em-gamil-barcelos/23708536	180 000 €	2026-01-12 12:49:00.894622
-2648735388227115172	www.barcelcasa.pt	Imóvel	https://www.barcelcasa.pt/termos-e-condicoes	Preço sob consulta	2026-01-12 12:49:02.152122
-6102743753707508856	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-manhente-barcelos_111/	175 000 €	2026-01-12 12:49:27.470716
6682675768312325920	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/?pg=1&o=&g=&e=&pp=&dd=&cc=&ff=&ml=&z=&nq=&p=&a=&c=5&es=&ct=00000001&or=30	Preço sob consulta	2026-01-12 12:49:28.746221
-699249068111360203	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-com-logradouro-em-manhente-barcelos_112/	180 000 €	2026-01-12 12:49:29.950452
-3620536845567908228	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-com-logradouro-em-manhente-barcelos_113/	185 000 €	2026-01-12 12:49:31.259925
5502838334324703478	era	ERA Property	https://www.era.pt/imovel/moradia-t2-barcelos-lijo-360240147	Comprar220.000 €	2026-01-12 13:24:19.568124
5506638632129465628	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-tamel-sao-verissimo-barcelos_100/	174 000 €	2026-01-12 12:49:35.083416
-2688144745369895513	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-tamel-sao-verissimo-barcelos_96/	Preço sob consulta	2026-01-12 12:49:36.360112
7165694108106143581	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-barcelos_91/	193 000 €	2026-01-12 12:49:40.633213
-4844932061109885553	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/?pg=1&o=&g=&e=&pp=&dd=&cc=&ff=&ml=&z=&nq=&p=&a=&c=9&es=&ct=00000001&or=30	Preço sob consulta	2026-01-12 12:49:41.820281
7369065854411278334	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-barcelos_92/	197 000 €	2026-01-12 12:49:43.029596
-1652737194373416568	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t2-em-gamil-barcelos_69/	Preço sob consulta	2026-01-12 12:49:44.306397
-71112000639340148	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/?pg=1&o=&g=&e=&pp=&dd=&cc=&ff=&ml=&z=&nq=&p=&a=&c=7&es=&ct=00000001&or=30	Preço sob consulta	2026-01-12 12:49:45.514094
-6412297631909559532	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t3-em-gamil-barcelos_66/	Preço sob consulta	2026-01-12 12:49:46.721452
-2882474418731861622	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t3-pronto-a-habitar-em-barcelinhos_56/	Preço sob consulta	2026-01-12 12:49:47.97985
5465796303427077109	franciscofaria.pt	Apartamento T-3 renovado	https://franciscofaria.pt/status/para-vender/	€240,000	2026-01-12 12:50:03.499876
3672204355289747783	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/apartamento-t-3-renovado/	Preço sob consulta	2026-01-12 12:50:04.747647
-6686515131668282586	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/cobertura-t4-duplex-com-terracos-e-duas-garagens/	Preço sob consulta	2026-01-12 12:50:05.954433
-5424120326833083201	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/t3-com-garagem-edf-quinta-nova-2/	Preço sob consulta	2026-01-12 12:50:07.156164
8130706458273216534	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/t2-centro-historico-de-barcelos-novo/	Preço sob consulta	2026-01-12 12:50:08.436348
-7608305053633497929	franciscofaria.pt	Moradia nova- 5 minutos centro Barcelos	https://franciscofaria.pt/status/vendido/	Preço sob consulta	2026-01-12 12:50:09.636858
8602770675581385655	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/moradia-nova-5-minutos-centro-barcelos/	Preço sob consulta	2026-01-12 12:50:10.824543
-9213490113261493625	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/t1-novo-centro-barcelos/	Preço sob consulta	2026-01-12 12:50:12.09482
-4992131870358777304	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/t-1-novo-centro-de-barcelos-equipado-e-mobilado/	Preço sob consulta	2026-01-12 12:50:13.300216
382943562728210664	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/moradia-com-terreno-em-cervaes/	Preço sob consulta	2026-01-12 12:50:14.504921
-5441872863589620120	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/apartamento-t3-em-arcozelo/	Preço sob consulta	2026-01-12 12:50:15.779933
-4373190693977703535	remax	Remax Property	https://www.remax.pt#	N/A	2026-01-12 12:50:49.390998
-6685934154479843457	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradia-em-alheira-barcelos_2010/	Preço sob consulta	2026-01-12 12:51:02.599753
4913743585550456678	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/consultores/paulo-soutelo_34/	Preço sob consulta	2026-01-12 12:51:03.91657
1619109599099167848	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradia-em-alheira-barcelos_1974/	Preço sob consulta	2026-01-12 12:51:05.138153
6628538928246757054	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradia-em-banda-arcozelo-barcelos_1996/	235.000 €	2026-01-12 12:51:06.350976
-472361829881394025	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/consultores/elizangela-lima_39/	Preço sob consulta	2026-01-12 12:51:07.587858
-5619760390546757550	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradias-em-alheira-barcelos_1870/	Preço sob consulta	2026-01-12 12:51:08.808775
2494560043604042251	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradias-em-alheira-barcelos_1929/	Preço sob consulta	2026-01-12 12:51:10.063675
9018752409977943001	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradias-em-alheira-barcelos_1951/	Preço sob consulta	2026-01-12 12:51:11.342285
-6165351934247423485	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradia t11-terrea em-areias-sao-vicente-barcelos_1922/	Preço sob consulta	2026-01-12 12:51:12.533776
-6285122624070705958	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradias-novas-em-areias-sao-vicente-barcelos_1621/	Preço sob consulta	2026-01-12 12:51:13.728299
6537869764575375274	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradias-novas-em-areias-sao-vicente-barcelos_1622/	Preço sob consulta	2026-01-12 12:51:15.024816
-6879860102920253319	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradias-novas-em-areias-sao-vicente-barcelos_1623/	Preço sob consulta	2026-01-12 12:51:16.218903
8309731133517119485	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradias-novas-em-areias-sao-vicente-barcelos_1624/	Preço sob consulta	2026-01-12 12:51:17.424075
-5377956334216657828	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradias-novas-em-areias-sao-vicente-barcelos_1625/	Preço sob consulta	2026-01-12 12:51:18.672312
8446922268685259183	www.h-urb.com	Imóvel	javascript:void(0)	€	2026-01-12 12:51:48.93352
-6613730899231809726	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/moradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos/22851932	397 000 €	2026-01-12 12:51:50.176195
3460368867794145999	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851932&text=Moradia%20nova%2C%20com%203%20quartos%2C%20em%20novo%20empreendimento%20em%20Carvalhal%2C%20Bar...	Preço sob consulta	2026-01-12 12:51:51.395495
-681695104562859919	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851932	Preço sob consulta	2026-01-12 12:51:52.574529
1918064093390649859	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851932	Preço sob consulta	2026-01-12 12:51:53.856727
-1362182173266826473	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fapartamento-novo-com-tres-quartos-no-empreendimento-strong-building-em-palmeira-de-faro%2F24552103&text=Apartamento%20novo%2C%20com%20tr%C3%AAs%20quartos%2C%20no%20empreendimento%20'STRONG%20BUILDIN...	Preço sob consulta	2026-01-12 12:54:11.407053
-6967644719874794256	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851932&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP25597153%2FTphoto%2FIDe1948601-0000-0500-0000-00001557b1b6.jpg&description=Descubra%20o%20'Figurado%20Enjoy'%2C%20um%20empreendimento%20LuxSteel360%2C%20que%20redef...	Preço sob consulta	2026-01-12 12:51:55.057916
-858036032069742353	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/moradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos/22851927	387 000 €	2026-01-12 12:51:56.252646
-5432950091287821542	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851927&text=Moradia%20nova%2C%20com%203%20quartos%2C%20em%20novo%20empreendimento%20em%20Carvalhal%2C%20Bar...	Preço sob consulta	2026-01-12 12:51:57.532401
4462823603106760232	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851927	Preço sob consulta	2026-01-12 12:51:58.716651
7605508552591060796	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851927	Preço sob consulta	2026-01-12 12:51:59.901625
-3190027307629535483	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-nova-com-3-quartos-em-novo-empreendimento-em-carvalhal-barcelos%2F22851927&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP25596975%2FTphoto%2FID2f948601-0000-0500-0000-00001557b15e.jpg&description=Descubra%20o%20'Figurado%20Enjoy'%2C%20um%20empreendimento%20LuxSteel360%2C%20que%20redef...	Preço sob consulta	2026-01-12 12:52:01.211345
-3072917886656634496	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/terreno-com-projeto-aprovado-para-duas-moradias-perelhal-barcelos/20594426	108 500 €	2026-01-12 12:52:02.40781
-856613960686575925	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-com-projeto-aprovado-para-duas-moradias-perelhal-barcelos%2F20594426&text=Terreno%20com%20projeto%20aprovado%20para%20duas%20moradias%2C%20Perelhal%2C%20Barcelos	Preço sob consulta	2026-01-12 12:52:03.684724
-1049034424542709835	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-com-projeto-aprovado-para-duas-moradias-perelhal-barcelos%2F20594426	Preço sob consulta	2026-01-12 12:52:04.919948
-3914819459908452839	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-com-projeto-aprovado-para-duas-moradias-perelhal-barcelos%2F20594426	Preço sob consulta	2026-01-12 12:52:06.113692
-7830740735808170557	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-com-projeto-aprovado-para-duas-moradias-perelhal-barcelos%2F20594426&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP20628812%2FTphoto%2FID4cc53a01-0000-0500-0000-000011bba771.jpg&description=Explorando%20Terrenos%20em%20Perelhal%3A%20Uma%20Oportunidade%20de%20Constru%C3%A7%C3%A3o%20%C3%9Anica...	Preço sob consulta	2026-01-12 12:52:07.35401
2495248386247547690	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/propriedade-com-ruinas-bons-acessos-souto-guimaraes/18176525	380 000 €	2026-01-12 12:52:08.565223
-5544164824168101958	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fpropriedade-com-ruinas-bons-acessos-souto-guimaraes%2F18176525&text=Propriedade%20com%20ru%C3%ADnas%20bons%20acessos%20Souto-%20Guimar%C3%A3es	Preço sob consulta	2026-01-12 12:52:09.773211
-2673683340675772811	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fpropriedade-com-ruinas-bons-acessos-souto-guimaraes%2F18176525	Preço sob consulta	2026-01-12 12:52:11.036985
-3348248478605706390	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fpropriedade-com-ruinas-bons-acessos-souto-guimaraes%2F18176525	Preço sob consulta	2026-01-12 12:52:12.250664
4320287299576946235	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fpropriedade-com-ruinas-bons-acessos-souto-guimaraes%2F18176525&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP20628933%2FTphoto%2FIDc5c53a01-0000-0500-0000-00000dcfc77b.jpg&description=Quinta%20com%2015%20mil%20metros%20de%20terreno%20de%20agricultura%20ou%20habitacional%20(c...	Preço sob consulta	2026-01-12 12:52:13.442602
-9170913783426562662	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/alojamento-local-5-estudios-t0-no-centro-do-porto/19028498	750 000 €	2026-01-12 12:52:14.698688
-7337820337914976562	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Falojamento-local-5-estudios-t0-no-centro-do-porto%2F19028498&text=Alojamento%20Local%20(5%20est%C3%BAdios%20T0)%20no%20centro%20do%20Porto	Preço sob consulta	2026-01-12 12:52:52.171922
-2400922731104264235	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Falojamento-local-5-estudios-t0-no-centro-do-porto%2F19028498	Preço sob consulta	2026-01-12 12:52:53.360482
-3604342564574395150	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Falojamento-local-5-estudios-t0-no-centro-do-porto%2F19028498	Preço sob consulta	2026-01-12 12:52:54.611514
-600798683671775062	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Falojamento-local-5-estudios-t0-no-centro-do-porto%2F19028498&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP20628785%2FTphoto%2FID31c53a01-0000-0500-0000-00000edfb08a.JPG&description=A%20propriedade%20comercial%20situada%20no%20cora%C3%A7%C3%A3o%20do%20Porto%20representa%20uma%20op...	Preço sob consulta	2026-01-12 12:52:55.813903
2009878386247418193	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/t3-1-com-sotao-aproveitado-garagem-e-vistas-para-o-rio-cavado-barcelos/24709532	328 000 €	2026-01-12 12:52:57.028517
-5925048196663163957	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Ft3-1-com-sotao-aproveitado-garagem-e-vistas-para-o-rio-cavado-barcelos%2F24709532&text=T3%20%2B1%20com%20s%C3%B3t%C3%A3o%20aproveitado%2C%20garagem%20e%20vistas%20para%20o%20Rio%20C%C3%A1vado%20-%20Bar...	Preço sob consulta	2026-01-12 12:52:58.291493
-6724431204044058491	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Ft3-1-com-sotao-aproveitado-garagem-e-vistas-para-o-rio-cavado-barcelos%2F24709532	Preço sob consulta	2026-01-12 12:52:59.482324
-4451605082553918483	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Ft3-1-com-sotao-aproveitado-garagem-e-vistas-para-o-rio-cavado-barcelos%2F24709532	Preço sob consulta	2026-01-12 12:53:00.67304
gen_-9091036226216594689	www.factorvalor.pt	MORADIA INDIVIDUALMoradiaT4 Triplex	https://www.factorvalor.pt/imovel/moradia-individual/17793642	Preço sob consulta	2026-01-12 13:24:19.565622
-7623713855128281504	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Ft3-1-com-sotao-aproveitado-garagem-e-vistas-para-o-rio-cavado-barcelos%2F24709532&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP28749589%2FTphoto%2FID15afb601-0000-0500-0000-000017e3978d.jpg&description=Procurar%20um%20apartamento%20T3%20em%20Barcelos%20%C3%A9%20uma%20excelente%20op%C3%A7%C3%A3o%20para%20que...	Preço sob consulta	2026-01-12 12:53:01.936425
4075490995188010868	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/moradia-com-3-quarto-na-cidade-de-barcelos/21702243	490 000 €	2026-01-12 12:53:03.160082
-496566442328271129	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-com-3-quarto-na-cidade-de-barcelos%2F21702243&text=Moradia%20com%203%20quarto%20na%20cidade%20de%20Barcelos.	Preço sob consulta	2026-01-12 12:53:04.368105
3341097711133056885	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-com-3-quarto-na-cidade-de-barcelos%2F21702243	Preço sob consulta	2026-01-12 12:53:05.634485
2342823228445208227	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-com-3-quarto-na-cidade-de-barcelos%2F21702243	Preço sob consulta	2026-01-12 12:53:06.836695
5653741672077420306	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-com-3-quarto-na-cidade-de-barcelos%2F21702243&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP22735584%2FTphoto%2FIDe0ea5a01-0000-0500-0000-000014b91354.jpg&description=Se%20est%C3%A1%20%C3%A0%20procura%20de%20uma%20habita%C3%A7%C3%A3o%20moderna%20e%20confort%C3%A1vel%2C%20esta%20moradi...	Preço sob consulta	2026-01-12 12:53:08.040681
-4665332537082128328	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/terreno-de-pinhal-em-carvalhal-barcelos/24760210	88 000 €	2026-01-12 12:53:09.298905
1452444712621589820	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-de-pinhal-em-carvalhal-barcelos%2F24760210&text=Terreno%20de%20pinhal%20em%20Carvalhal%20Barcelos	Preço sob consulta	2026-01-12 12:53:10.504024
-1570066710542523792	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-de-pinhal-em-carvalhal-barcelos%2F24760210	Preço sob consulta	2026-01-12 12:53:11.719342
-4206109352171923	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-de-pinhal-em-carvalhal-barcelos%2F24760210	Preço sob consulta	2026-01-12 12:53:13.027843
-7707452130604172787	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fterreno-de-pinhal-em-carvalhal-barcelos%2F24760210&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP25116629%2FTphoto%2FIDd53f7f01-0000-0500-0000-00001364546b.jpg&description=Terreno%20de%20pinhal%20de%209.600m2%20com%20aproximadamente%201500m2%20com%20viabilida...	Preço sob consulta	2026-01-12 12:53:14.229082
6198465623248473555	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/moradia-de-granito-totalmente-restaurada-em-creixomil-barcelos/18215436	550 000 €	2026-01-12 12:53:15.510462
6444200059771816926	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-de-granito-totalmente-restaurada-em-creixomil-barcelos%2F18215436&text=Moradia%20de%20granito%20totalmente%20restaurada%20em%20Creixomil%2C%20Barcelos	Preço sob consulta	2026-01-12 12:53:52.913158
-8950421193096638388	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-de-granito-totalmente-restaurada-em-creixomil-barcelos%2F18215436	Preço sob consulta	2026-01-12 12:53:54.180792
-7711508935242826386	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-de-granito-totalmente-restaurada-em-creixomil-barcelos%2F18215436	Preço sob consulta	2026-01-12 12:53:55.425889
2272787739587604463	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-de-granito-totalmente-restaurada-em-creixomil-barcelos%2F18215436&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP20628634%2FTphoto%2FID9ac43a01-0000-0500-0000-00000fa7cf99.jpg&description=Esta%20magn%C3%ADfica%20moradia%20em%20granito%2C%20que%20foi%20meticulosamente%20recuperada...	Preço sob consulta	2026-01-12 12:53:56.618538
-753734072989942496	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/moradia-individual-v4-em-galegos-s-martinho-barcelos/21351408	500 000 €	2026-01-12 12:53:57.815487
-7490294055435920529	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-individual-v4-em-galegos-s-martinho-barcelos%2F21351408&text=Moradia%20individual%20V4%20em%20Galegos%20S.%20Martinho%2C%20Barcelos	Preço sob consulta	2026-01-12 12:53:59.096224
-91299577083107188	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-individual-v4-em-galegos-s-martinho-barcelos%2F21351408	Preço sob consulta	2026-01-12 12:54:00.282529
9215502590502426619	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-individual-v4-em-galegos-s-martinho-barcelos%2F21351408	Preço sob consulta	2026-01-12 12:54:01.477275
-425730111964314246	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-individual-v4-em-galegos-s-martinho-barcelos%2F21351408&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP24997573%2FTphoto%2FIDc56e7d01-0000-0500-0000-0000135aeadd.jpg&description=Atualmente%20dispon%C3%ADvel%20para%20venda%2C%20distingue-se%20pelo%20equil%C3%ADbrio%20entre%20...	Preço sob consulta	2026-01-12 12:54:02.697363
-3423520518334290252	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/moradia-isolada-em-airo-barcelos/21363361	265 000 €	2026-01-12 12:54:03.922609
-6182888256583590899	www.h-urb.com	Imóvel	https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-isolada-em-airo-barcelos%2F21363361&text=Moradia%20isolada%20em%20Air%C3%B3%2C%20Barcelos.	Preço sob consulta	2026-01-12 12:54:05.136665
-1645262356497932429	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-isolada-em-airo-barcelos%2F21363361	Preço sob consulta	2026-01-12 12:54:06.369527
7941420842294644618	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-isolada-em-airo-barcelos%2F21363361	Preço sob consulta	2026-01-12 12:54:07.677374
-8600910421354550789	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fmoradia-isolada-em-airo-barcelos%2F21363361&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FVV494%2FTphoto%2FIDc2cb2783-8dcd-48b3-87a8-a14878f0bc7a.jpg&description=Moradia%20isolada%20T3%20situada%20na%20freguesia%20de%20Air%C3%B3%2C%20em%20Barcelos.%20Compost...	Preço sob consulta	2026-01-12 12:54:08.983368
4762635958193397313	www.h-urb.com	Imóvel	https://www.h-urb.com/imovel/apartamento-novo-com-tres-quartos-no-empreendimento-strong-building-em-palmeira-de-faro/24552103	275 000 €	2026-01-12 12:54:10.216085
4079895281431797370	www.h-urb.com	Imóvel	http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fapartamento-novo-com-tres-quartos-no-empreendimento-strong-building-em-palmeira-de-faro%2F24552103	Preço sob consulta	2026-01-12 12:54:12.656012
9223337821595527937	www.h-urb.com	Imóvel	https://web.whatsapp.com/send?text=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fapartamento-novo-com-tres-quartos-no-empreendimento-strong-building-em-palmeira-de-faro%2F24552103	Preço sob consulta	2026-01-12 12:54:13.895587
6516040535841174301	www.h-urb.com	Imóvel	https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.h-urb.com%2Fimovel%2Fapartamento-novo-com-tres-quartos-no-empreendimento-strong-building-em-palmeira-de-faro%2F24552103&media=https%3A%2F%2Fimages.egorealestate.com%2FZ512x384%2FS5%2FC9217%2FP25544217%2FTphoto%2FID19c68501-0000-0500-0000-000017b51341.jpg&description=Apartamento%20novo%2C%20com%20tr%C3%AAs%20quartos%2C%20inserido%20no%20novo%20empreendimento%20'...	Preço sob consulta	2026-01-12 12:54:15.106186
gen_8859290363572577141	www.factorvalor.pt		javascript:void(0);	€	2026-01-12 13:15:40.854571
gen_-7035273211653121151	www.factorvalor.pt	Imóveis encontrados	https://www.factorvalor.pt/imovel/apartamento-t3-c-l-de-garagem/21600163	225 000 €	2026-01-12 13:15:42.087094
gen_2625683757783915293	www.factorvalor.pt	APARTAMENTO T2ApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2/20737512	Preço sob consulta	2026-01-12 13:15:43.295468
gen_8730911313834051468	www.factorvalor.pt	APARTAMENTO T2 C/ LUGAR DE GARAGEMApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2-c-lugar-de-garagem/22132427	225 000 €	2026-01-12 13:15:44.641047
gen_-8164344162226962958	www.factorvalor.pt	APARTAMENTO T3 COM GARAGEMApartamentoT3	https://www.factorvalor.pt/imovel/apartamento-t3-com-garagem/19674649	Preço sob consulta	2026-01-12 13:15:45.833098
gen_5255054269832618015	www.factorvalor.pt	APARTAMENTO T3 COM JARDIM - CONDOMÍNIO FECHADOApartamentoT3	https://www.factorvalor.pt/imovel/apartamento-t3-com-jardim-condominio-fechado/19566208	Preço sob consulta	2026-01-12 13:15:47.127228
gen_7619844485037870186	www.factorvalor.pt	APARTAMENTO T2+1ApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2-1/17982263	Preço sob consulta	2026-01-12 13:15:48.3673
gen_-1079718530221551066	www.factorvalor.pt	APARTAMENTO T2ApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2/18170216	Preço sob consulta	2026-01-12 13:15:49.55842
gen_2150653692525220111	www.factorvalor.pt	APARTAMENTO T2 - CENTRO DA CIDADEApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2-centro-da-cidade/14865224	Preço sob consulta	2026-01-12 13:15:50.811061
gen_-531154570356101346	www.factorvalor.pt	APARTAMENTO T3 COM GARAGEMApartamentoT3	https://www.factorvalor.pt/imovel/apartamento-t3-com-garagem/21336275	Preço sob consulta	2026-01-12 13:15:52.026089
gen_-50301234031969169	www.factorvalor.pt	APARTAMENTO T2ApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2/17649167	Preço sob consulta	2026-01-12 13:15:53.315828
gen_1674182490333328012	www.factorvalor.pt	APARTAMENTO T2 COM GARAGEMApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2-com-garagem/17982271	Preço sob consulta	2026-01-12 13:15:54.59883
gen_8338195696173392678	www.factorvalor.pt	Imóvel	https://www.factorvalor.pt/termos-e-condicoes	Preço sob consulta	2026-01-12 13:15:55.796771
gen_3663732374953073538	www.factorvalor.pt	Imóveis encontrados	https://www.factorvalor.pt/imovel/moradia-individual-v3/20172875	230 000 €	2026-01-12 13:16:05.477218
gen_7689828020227773426	www.factorvalor.pt	MORADIA PARA RECUPERARMoradiaT3 Duplex	https://www.factorvalor.pt/imovel/moradia-para-recuperar/20286848	Preço sob consulta	2026-01-12 13:16:06.717065
gen_7218848994070329357	www.factorvalor.pt	MORADIA INDIVIDUAL COM QUINTALMoradiaT3 Duplex	https://www.factorvalor.pt/imovel/moradia-individual-com-quintal/20436651	Preço sob consulta	2026-01-12 13:16:08.108992
gen_4424283889205579539	www.factorvalor.pt	CASA EM PEDRA COM 7.700M2 DE TERRENOMoradiaT4	https://www.factorvalor.pt/imovel/casa-em-pedra-com-7700m2-de-terreno/8832027	Preço sob consulta	2026-01-12 13:16:09.3302
gen_-5128712293427814375	www.factorvalor.pt	MORADIA INDIVIDUAL V4MoradiaT4 Duplex	https://www.factorvalor.pt/imovel/moradia-individual-v4/21537813	230 000 €	2026-01-12 13:16:10.523816
gen_-5803898672100906008	www.factorvalor.pt	MORADIA TÉRREA - Junto á CidadeMoradiaT2	https://www.factorvalor.pt/imovel/moradia-terrea-junto-a-cidade/10709612	Preço sob consulta	2026-01-12 13:16:11.781716
gen_4092704128751340338	www.factorvalor.pt	MORADIA INDIVIDUAL V3MoradiaT3	https://www.factorvalor.pt/imovel/moradia-individual-v3/16708380	Preço sob consulta	2026-01-12 13:16:13.037502
gen_-4051089557718239399	www.factorvalor.pt	MORADIA V3 EM BANDAMoradia em BandaT3	https://www.factorvalor.pt/imovel/moradia-v3-em-banda/11763842	Preço sob consulta	2026-01-12 13:16:14.230132
gen_1365444080828393354	www.factorvalor.pt	MORADIA V3 BANDAMoradia em BandaT3 Triplex	https://www.factorvalor.pt/imovel/moradia-v3-banda/11549488	Preço sob consulta	2026-01-12 13:16:42.710141
gen_-595583356546239864	www.factorvalor.pt	Moradia V3 em BandaMoradiaT3 Triplex	https://www.factorvalor.pt/imovel/moradia-v3-em-banda/8879950	Preço sob consulta	2026-01-12 13:16:43.937202
gen_-5282771279094954536	www.factorvalor.pt	MORADIA INDIVIDUALMoradiaT4 Triplex	https://www.factorvalor.pt/imovel/moradia-individual/17793642	Preço sob consulta	2026-01-12 13:16:45.130315
gen_2592277442642609233	www.factorvalor.pt	MORADIA V4 NOVA - LOTE 1MoradiaT4 Duplex	https://www.factorvalor.pt/imovel/moradia-v4-nova-lote-1/18240040	Preço sob consulta	2026-01-12 13:16:46.380967
gen_-5307312646740210333	www.barcelcasa.pt		https://www.barcelcasa.pt/imoveis?mtype=1,2&bus=1&dst=3&mun=35&mrp=250000	€	2026-01-12 13:16:58.19445
gen_-4678245522930513209	www.barcelcasa.pt	T3 Totalmente Renovado, Equipado e com Varanda, à Entrada da Cidade de Barcelos.	https://www.barcelcasa.pt/imovel/t3-totalmente-renovado-equipado-e-com-varanda-a-entrada-da-cidade-de-barcelos/23192853	240 000 €	2026-01-12 13:16:59.373417
gen_9064323040395653838	www.barcelcasa.pt	Andar moradia T3, remodelado, em Arcozelo - Barcelos	https://www.barcelcasa.pt/imovel/andar-moradia-t3-remodelado-em-arcozelo-barcelos/24463452	185 000 €	2026-01-12 13:17:00.780753
gen_2637115207071440578	www.barcelcasa.pt	Oportunidade Única - Moradia para Restauro com Vistas Panorâmicas!	https://www.barcelcasa.pt/imovel/oportunidade-unica-moradia-para-restauro-com-vistas-panoramicas/24464238	140 000 €	2026-01-12 13:17:01.969582
gen_1365486829175769830	www.barcelcasa.pt	Apartamentos T1 e T2 em construção, com um lugar de garagem em Manhente - Barcelos	https://www.barcelcasa.pt/imovel/apartamentos-t1-e-t2-em-construcao-com-um-lugar-de-garagem-em-manhente-barcelos/24651127	175 000 €	2026-01-12 13:17:03.233847
gen_-7978443289952125024	www.barcelcasa.pt	O Seu Novo Projeto de Sonho Espera por Si em Alheira - Barcelos!	https://www.barcelcasa.pt/imovel/o-seu-novo-projeto-de-sonho-espera-por-si-em-alheira-barcelos/24408643	165 000 €	2026-01-12 13:17:04.444063
gen_3978632598716815617	www.barcelcasa.pt	Apartamento T1 c/ garagem fechada em Gamil - Barcelos	https://www.barcelcasa.pt/imovel/apartamento-t1-c-garagem-fechada-em-gamil-barcelos/23708536	180 000 €	2026-01-12 13:17:05.625806
gen_1999832461734013140	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-manhente-barcelos_111/	175 000 €	2026-01-12 13:17:26.923647
gen_-4948238064366403431	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/?pg=1&o=&g=&e=&pp=&dd=&cc=&ff=&ml=&z=&nq=&p=&a=&c=5&es=&ct=00000001&or=30	Preço sob consulta	2026-01-12 13:17:28.113778
gen_1344917988921023012	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-com-logradouro-em-manhente-barcelos_112/	180 000 €	2026-01-12 13:17:29.376815
gen_6324700472542358245	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-com-logradouro-em-manhente-barcelos_113/	185 000 €	2026-01-12 13:17:30.610406
gen_4915880958493350693	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-tamel-sao-verissimo-barcelos_105/	170 000 €	2026-01-12 13:17:31.82274
gen_4272441080927614596	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t2-em-rio-covo-santa-eugenia-barcelos_98/	240 000 €	2026-01-12 13:17:33.051049
gen_-3982986294627500676	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-tamel-sao-verissimo-barcelos_100/	174 000 €	2026-01-12 13:17:34.271704
gen_-7937832319258744858	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-tamel-sao-verissimo-barcelos_96/	Preço sob consulta	2026-01-12 13:17:35.47192
gen_478405804613028967	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-barcelos_91/	193 000 €	2026-01-12 13:17:36.721822
gen_6270393727475972309	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-barcelos_92/	197 000 €	2026-01-12 13:17:43.076865
gen_9139459074650832402	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t2-em-gamil-barcelos_69/	Preço sob consulta	2026-01-12 13:17:44.274736
gen_3345019472453457978	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t3-em-gamil-barcelos_66/	Preço sob consulta	2026-01-12 13:17:45.510424
gen_-4970204171622303308	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t3-pronto-a-habitar-em-barcelinhos_56/	Preço sob consulta	2026-01-12 13:17:46.752195
gen_5149460482375916140	www.factorvalor.pt		javascript:void(0);	€	2026-01-12 13:23:09.9132
gen_-5595409491345468893	www.factorvalor.pt	Imóveis encontrados	https://www.factorvalor.pt/imovel/moradia-individual-v3/20172875	230 000 €	2026-01-12 13:23:10.087751
gen_-7923146855793073470	www.factorvalor.pt	Imóveis encontrados	https://www.factorvalor.pt/imovel/apartamento-t3-c-l-de-garagem/21600163	225 000 €	2026-01-12 13:23:11.219197
gen_-8912593806369821697	www.factorvalor.pt	MORADIA PARA RECUPERARMoradiaT3 Duplex	https://www.factorvalor.pt/imovel/moradia-para-recuperar/20286848	Preço sob consulta	2026-01-12 13:23:11.342244
1614716102592355441	era	ERA Property	https://www.era.pt/imovel/andar-moradia-t2-barcelos-carreira-e-fonte-coberta-360250173	Arrendar700 €/mês	2026-01-12 13:23:11.768255
gen_-5902480303151164456	www.factorvalor.pt	APARTAMENTO T2ApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2/20737512	Preço sob consulta	2026-01-12 13:23:12.431294
gen_-460699366570024354	www.factorvalor.pt	MORADIA INDIVIDUAL COM QUINTALMoradiaT3 Duplex	https://www.factorvalor.pt/imovel/moradia-individual-com-quintal/20436651	Preço sob consulta	2026-01-12 13:23:12.546068
-1307039874916959867	era	ERA Property	https://www.era.pt/imovel/apartamento-t3-barcelos-varzea-360250137	Comprar215.000 €	2026-01-12 13:23:12.948717
gen_1188496104300024798	www.factorvalor.pt	CASA EM PEDRA COM 7.700M2 DE TERRENOMoradiaT4	https://www.factorvalor.pt/imovel/casa-em-pedra-com-7700m2-de-terreno/8832027	Preço sob consulta	2026-01-12 13:23:16.79929
gen_250645414190610988	www.factorvalor.pt	APARTAMENTO T2 C/ LUGAR DE GARAGEMApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2-c-lugar-de-garagem/22132427	225 000 €	2026-01-12 13:23:16.812154
-8488431124029509790	era	ERA Property	https://www.era.pt/imovel/apartamento-t3-barcelos-manhente-360250132	Comprar250.000 €	2026-01-12 13:23:16.812873
gen_-4924636361784075961	www.factorvalor.pt	MORADIA INDIVIDUAL V4MoradiaT4 Duplex	https://www.factorvalor.pt/imovel/moradia-individual-v4/21537813	230 000 €	2026-01-12 13:23:18.037186
gen_489285602154591737	www.factorvalor.pt	APARTAMENTO T3 COM GARAGEMApartamentoT3	https://www.factorvalor.pt/imovel/apartamento-t3-com-garagem/19674649	Preço sob consulta	2026-01-12 13:23:18.03783
-9044237505949421060	era	ERA Property	https://www.era.pt/imovel/apartamento-t2-barcelos-barcelos-vila-boa-e-vila-frescainha-sao-martinho-e-sao-pedro-360250122	ComprarSob Consulta	2026-01-12 13:23:22.054238
gen_-2396353751294377216	www.factorvalor.pt	MORADIA TÉRREA - Junto á CidadeMoradiaT2	https://www.factorvalor.pt/imovel/moradia-terrea-junto-a-cidade/10709612	Preço sob consulta	2026-01-12 13:23:22.075716
gen_354419562759960110	www.factorvalor.pt	APARTAMENTO T3 COM JARDIM - CONDOMÍNIO FECHADOApartamentoT3	https://www.factorvalor.pt/imovel/apartamento-t3-com-jardim-condominio-fechado/19566208	Preço sob consulta	2026-01-12 13:23:22.091226
6048750454174141281	era	ERA Property	https://www.era.pt/imovel/apartamento-t2-barcelos-arcozelo-360250101	Arrendar800 €/mês11%900 €	2026-01-12 13:23:23.281093
gen_-805455796921146175	www.factorvalor.pt	MORADIA INDIVIDUAL V3MoradiaT3	https://www.factorvalor.pt/imovel/moradia-individual-v3/16708380	Preço sob consulta	2026-01-12 13:23:23.345793
gen_3930554876903836169	www.factorvalor.pt	MORADIA V3 EM BANDAMoradia em BandaT3	https://www.factorvalor.pt/imovel/moradia-v3-em-banda/11763842	Preço sob consulta	2026-01-12 13:23:27.468572
gen_-1690112937936482941	www.factorvalor.pt	APARTAMENTO T2+1ApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2-1/17982263	Preço sob consulta	2026-01-12 13:23:27.470436
8544635053356039098	era	ERA Property	https://www.era.pt/imovel/apartamento-t3-barcelos-vila-seca-360250003	Comprar245.000 €	2026-01-12 13:23:27.470909
gen_6788582382776917451	www.factorvalor.pt	APARTAMENTO T2ApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2/18170216	Preço sob consulta	2026-01-12 13:23:28.679078
gen_5346653499906138857	www.factorvalor.pt	MORADIA V3 BANDAMoradia em BandaT3 Triplex	https://www.factorvalor.pt/imovel/moradia-v3-banda/11549488	Preço sob consulta	2026-01-12 13:23:28.719638
7568077641223857501	era	ERA Property	https://www.era.pt/imovel/apartamento-t3-barcelos-vila-seca-360250002	Comprar250.000 €	2026-01-12 13:24:12.041326
gen_7964511321394312084	www.factorvalor.pt	APARTAMENTO T2 - CENTRO DA CIDADEApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2-centro-da-cidade/14865224	Preço sob consulta	2026-01-12 13:24:12.104978
gen_7932338047901945950	www.factorvalor.pt	Moradia V3 em BandaMoradiaT3 Triplex	https://www.factorvalor.pt/imovel/moradia-v3-em-banda/8879950	Preço sob consulta	2026-01-12 13:24:12.173476
5424070354772389588	era	ERA Property	https://www.era.pt/imovel/apartamento-t2-barcelos-varzea-360240455	Comprar225.000 €	2026-01-12 13:24:13.344744
gen_5694315636447555452	www.factorvalor.pt	APARTAMENTO T3 COM GARAGEMApartamentoT3	https://www.factorvalor.pt/imovel/apartamento-t3-com-garagem/21336275	Preço sob consulta	2026-01-12 13:24:13.365604
gen_-4326194430870500931	www.factorvalor.pt	APARTAMENTO T2ApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2/17649167	Preço sob consulta	2026-01-12 13:24:19.59275
gen_-7810955401583557562	www.factorvalor.pt	Imóvel	https://www.factorvalor.pt/termos-e-condicoes	Preço sob consulta	2026-01-12 13:24:24.835416
4930510254194097147	era	ERA Property	https://www.era.pt/imovel/moradia-em-banda-t3-barcelos-carapecos-360230034	Comprar235.000 €	2026-01-12 13:24:24.859043
gen_360014191171635009	www.factorvalor.pt	MORADIA V4 NOVA - LOTE 1MoradiaT4 Duplex	https://www.factorvalor.pt/imovel/moradia-v4-nova-lote-1/18240040	Preço sob consulta	2026-01-12 13:24:20.761396
-4468109094011059158	era	ERA Property	https://www.era.pt/imovel/moradia-t5-barcelos-alvelos-360230070	ComprarSob Consulta	2026-01-12 13:24:20.784986
gen_-3614989933040937611	www.factorvalor.pt	APARTAMENTO T2 COM GARAGEMApartamentoT2	https://www.factorvalor.pt/imovel/apartamento-t2-com-garagem/17982271	Preço sob consulta	2026-01-12 13:24:24.825308
-4862037808048337618	era	ERA Property	https://www.era.pt/imovel/moradia-t8-barcelos-arcozelo-360220227	Comprar170.000 €	2026-01-12 13:24:32.12235
-8059324131729687327	era	ERA Property	https://www.era.pt/imovel/apartamento-t3-novo-barcelos-carvalhal-360220117	Comprar205.500 €	2026-01-12 13:24:33.315358
4765312928394750592	era	ERA Property	https://www.era.pt/imovel/apartamento-t2-novo-barcelos-carvalhal-360220115	Comprar184.000 €	2026-01-12 13:24:34.575808
8914803046227155812	era	ERA Property	https://www.era.pt/imovel/apartamento-t3-barcelos-barcelos-vila-boa-e-vila-frescainha-sao-martinho-e-sao-pedro-360200232	ComprarSob Consulta	2026-01-12 13:24:35.791567
gen_-5439995769202198191	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-manhente-barcelos_111/	175 000 €	2026-01-12 13:36:54.012774
gen_-2238620704383825171	www.lardesonho.pt	Imóvel	https://www.lardesonho.pt/politica-de-privacidade/	Preço sob consulta	2026-01-12 13:36:54.634809
gen_510203795395572692	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/?pg=1&o=&g=&e=&pp=&dd=&cc=&ff=&ml=&z=&nq=&p=&a=&c=5&es=&ct=00000001&or=30	Preço sob consulta	2026-01-12 13:36:55.241442
gen_-7852536547426091054	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-com-logradouro-em-manhente-barcelos_112/	180 000 €	2026-01-12 13:36:56.455077
gen_4356891173926544777	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-com-logradouro-em-manhente-barcelos_113/	185 000 €	2026-01-12 13:36:57.674136
gen_2981280214522777093	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-tamel-sao-verissimo-barcelos_105/	170 000 €	2026-01-12 13:36:58.861866
gen_-6201815817671961917	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t2-em-rio-covo-santa-eugenia-barcelos_98/	240 000 €	2026-01-12 13:37:03.112774
gen_-945586052835108161	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-tamel-sao-verissimo-barcelos_100/	174 000 €	2026-01-12 13:37:04.574804
gen_-6343291639601492237	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-tamel-sao-verissimo-barcelos_96/	Preço sob consulta	2026-01-12 13:37:05.763838
gen_-7184234768606349538	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-barcelos_91/	193 000 €	2026-01-12 13:37:07.024963
gen_-8977848249699591170	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-barcelos_92/	197 000 €	2026-01-12 13:37:08.215427
gen_-8023967401650043830	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t2-em-gamil-barcelos_69/	Preço sob consulta	2026-01-12 13:37:09.415066
34073148	idealista	Moradia independente em Alvito e Couto, Barcelos	https://www.idealista.pt/imovel/34073148/	159.500€	2026-01-12 13:37:10.106859
gen_7058319461313601362	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t3-em-gamil-barcelos_66/	Preço sob consulta	2026-01-12 13:37:10.69078
34484960	idealista	Apartamento T1 em Manhente, Barcelos	https://www.idealista.pt/imovel/34484960/	185.000€	2026-01-12 13:37:11.297266
gen_-7634795839150448113	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t3-pronto-a-habitar-em-barcelinhos_56/	Preço sob consulta	2026-01-12 13:37:11.903946
34285880	idealista	Apartamento T3 na Rua da Formiga, Arcozelo, Barcelos	https://www.idealista.pt/imovel/34285880/	240.000€	2026-01-12 13:37:15.525696
34665649	idealista	Apartamento T2 na Rua Luís de Camões, Barcelos - Vila Boa - Vila Frescainha, Barcelos	https://www.idealista.pt/imovel/34665649/	219.900€	2026-01-12 13:37:16.716617
34657150	idealista	Apartamento T1 em Manhente, Barcelos	https://www.idealista.pt/imovel/34657150/	175.000€	2026-01-12 13:37:17.964305
34614990	idealista	Apartamento T2 em Galegos (Santa Maria), Barcelos	https://www.idealista.pt/imovel/34614990/	225.000€	2026-01-12 13:37:19.164333
33833516	idealista	Apartamento T1 em Barcelos - Vila Boa - Vila Frescainha, Barcelos	https://www.idealista.pt/imovel/33833516/	160.000€	2026-01-12 13:37:23.364172
666149175	olx	Sem título	https://www.olx.pt/d/anuncio/t2-com-garagem-e-varanda-corrida-em-arcozelo-particular-vende-IDJ55Px.html	240.000 €Negociável	2026-01-12 13:37:25.309723
666806453	olx	Sem título	https://www.imovirtual.com/pt/anuncio/morada-t2-restaurada-barroselas-ID1hvHt.html	165.000 €	2026-01-12 13:37:26.376648
34693471	idealista	Apartamento T2 em Tamel (São Veríssimo), Barcelos	https://www.idealista.pt/imovel/34693471/	235.000€	2026-01-12 13:37:55.782665
667296355	olx	Sem título	https://www.imovirtual.com/pt/anuncio/t2-para-venda-em-arcozelo-barcelos-ID1hDho.html	200.000 €	2026-01-12 13:37:55.806618
663944115	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-em-barcelos-para-recuperar-ID1gWL1.html	82.500 €	2026-01-12 13:37:55.831521
34572129	idealista	Moradia independente em Negreiros e Chavão, Barcelos	https://www.idealista.pt/imovel/34572129/	240.000€	2026-01-12 13:37:56.96369
667351967	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamento-t3-renovado-arcozelo-barcelos-ID1hDXa.html	240.000 €	2026-01-12 13:37:57.010899
665322370	olx	Sem título	https://www.imovirtual.com/pt/anuncio/oportunidade-moradia-t3-anexo-t2-e-terreno-rustico-em-carreira-e-fon-ID1hdDf.html	190.000 €	2026-01-12 13:38:01.096743
34432842	idealista	Apartamento T2 na Rua do Galo, Galegos (Santa Maria), Barcelos	https://www.idealista.pt/imovel/34432842/	235.000€	2026-01-12 13:38:01.118089
667006498	olx	Sem título	https://www.imovirtual.com/pt/anuncio/t3-ao-preco-de-um-t2-num-local-calmo-ID1hz5X.html	238.000 €	2026-01-12 13:38:01.13808
665847234	olx	Sem título	https://www.imovirtual.com/pt/anuncio/venda-de-moradia-v2-moreira-geraz-do-lima-viana-do-castelo-ID1hjAD.html	160.000 €	2026-01-12 13:38:02.291533
33863643	idealista	Moradia independente em Viatodos - Grimancelos - Minhotães - Monte de Fralães, Barcelos	https://www.idealista.pt/imovel/33863643/	215.000€	2026-01-12 13:38:02.312792
34337971	idealista	Apartamento T2 em Arcozelo, Barcelos	https://www.idealista.pt/imovel/34337971/	195.000€	2026-01-12 13:38:06.429484
665512147	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamento-t3-para-venda-ID1hglW.html	250.000 €	2026-01-12 13:38:06.439792
664262615	olx	Sem título	https://www.imovirtual.com/pt/anuncio/casa-villa-t2-em-arcozelo-de-72-00-m2-ID1h1hn.html	190.000 €	2026-01-12 13:38:06.440612
34352574	idealista	Apartamento T0 na Rua do Areal, 285, Barcelos - Vila Boa - Vila Frescainha, Barcelos	https://www.idealista.pt/imovel/34352574/	125.000€	2026-01-12 13:38:07.621326
666261525	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-em-mujaes-ID1hoQQ.html	240.000 €	2026-01-12 13:38:07.630609
665626108	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamento-t2-loja-convertida-em-habitacao-entre-braga-e-barcelos-ID1hhvY.html	169.900 €	2026-01-12 13:38:11.680914
34156202	idealista	Apartamento T0 em Barcelos - Vila Boa - Vila Frescainha, Barcelos	https://www.idealista.pt/imovel/34156202/	142.500€	2026-01-12 13:38:11.697851
34661797	idealista	Apartamento T1 em Airó, Barcelos	https://www.idealista.pt/imovel/34661797/	179.000€	2026-01-12 13:38:12.90153
662744886	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-individual-em-arentim-braga-ID1gBfd.html	239.000 €	2026-01-12 13:38:58.387328
665943972	olx	Sem título	https://www.imovirtual.com/pt/anuncio/quinta-com-1700-m2-em-midoes-barcelos-ID1hkrm.html	199.900 €	2026-01-12 13:39:02.564879
655097004	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-rustica-t2-em-cossourado-ID1eN9L.html	95.000 €	2026-01-12 13:39:03.773509
656451803	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-para-restauro-vila-de-punhe-ID1fayJ.html	110.000 €	2026-01-12 13:39:07.832062
34097995	idealista	Apartamento T3 em Arcozelo, Barcelos	https://www.idealista.pt/imovel/34097995/	210.000€	2026-01-12 13:39:13.185834
666335817	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-t3-para-venda-ID1hpUH.html	184.000 €	2026-01-12 13:39:14.452467
660309892	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-t3-terrea-por-acabar-em-quintiaes-barcelos-ID1g26X.html	79.900 €	2026-01-12 13:38:11.725501
666331752	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamento-t3-para-venda-ID1hpKS.html	239.000 €	2026-01-12 13:38:58.321038
666813419	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamento-t2-para-venda-ID1hvKx.html	215.000 €	2026-01-12 13:38:59.508952
666381579	olx	Sem título	https://www.imovirtual.com/pt/anuncio/andar-moradia-t3-remodelado-em-arcozelo-barcelos-ID1hr1J.html	195.000 €	2026-01-12 13:39:02.590701
34462644	idealista	Apartamento T1 em Gamil e Midões, Barcelos	https://www.idealista.pt/imovel/34462644/	180.000€	2026-01-12 13:39:03.772302
664602136	olx	Sem título	https://www.olx.pt/d/anuncio/vendo-t3-renovado-arcozelo-barcelos-IDIYBni.html	240.000 €Negociável	2026-01-12 13:39:07.796015
666798106	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamento-novo-com-dois-quartos-no-empreendimento-strong-build-ID1hvx7.html	230.000 €	2026-01-12 13:39:08.980655
661981707	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamento-t3-a-5-minutos-do-centro-de-barcelos-ID1gqRC.html	210.000 €	2026-01-12 13:39:13.185475
33970611	idealista	Apartamento T3 em Silveiros e Rio Covo (Santa Eulália), Barcelos	https://www.idealista.pt/imovel/33970611/	215.000€	2026-01-12 13:39:14.43529
667623592	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamento-t3-c-varanda-renovado-ID1hGEd.html	240.000 €	2026-01-12 13:38:12.872415
34398467	idealista	Moradia independente em Cossourado, Barcelos	https://www.idealista.pt/imovel/34398467/	190.000€	2026-01-12 13:38:58.34743
34528171	idealista	Apartamento T1 na Avenida João Duarte, 80, Arcozelo, Barcelos	https://www.idealista.pt/imovel/34528171/	197.000€	2026-01-12 13:39:02.547995
34164307	idealista	Moradia independente em Barcelos - Vila Boa - Vila Frescainha, Barcelos	https://www.idealista.pt/imovel/34164307/	190.000€	2026-01-12 13:39:07.812843
34352146	idealista	Apartamento T2 em Arcozelo, Barcelos	https://www.idealista.pt/imovel/34352146/	220.000€	2026-01-12 13:39:09.017119
666194573	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-para-restaurar-t4-venda-em-associacao-de-freguesias-do-vale-do-ID1hnH0.html	125.000 €	2026-01-12 13:39:13.186727
663279815	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamento-t2-em-barroselas-e-carvoeiro-de-47-00-m2-ID1gKcz.html	175.000 €	2026-01-12 13:39:18.539968
33798886	idealista	Moradia geminada na Rua Dom Dinis, 18, Arcozelo, Barcelos	https://www.idealista.pt/imovel/33798886/	217.000€	2026-01-12 13:39:58.779409
665141092	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-t2-para-restauro-em-cossourado-oportunidade-de-investimento-ID1haXw.html	85.000 €	2026-01-12 13:39:58.812256
666209248	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-para-restaurar-t3-em-cambeses-ID1eTGo.html	149.000 €	2026-01-12 13:39:58.893488
34706951	idealista	Apartamento T1 na Rua São Martinho, 696, Manhente, Barcelos	https://www.idealista.pt/imovel/34706951/	185.000€	2026-01-12 13:39:59.998798
661372259	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-vila-fria-ID1gixy.html	220.000 €	2026-01-12 13:40:00.040307
666209775	olx	Sem título	https://www.olx.pt/d/anuncio/t2-praia-amorosa-IDJ5lAX.html	235.000 €Negociável	2026-01-12 13:40:06.150892
34737130	idealista	Apartamento T1 na Rua São Martinho, 695, Manhente, Barcelos	https://www.idealista.pt/imovel/34737130/	175.000€	2026-01-12 13:40:06.16509
653844263	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-para-venda-nas-neves-viana-do-castelo-ID1edES.html	160.000 €	2026-01-12 13:40:06.184205
667093513	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamento-t2-no-centro-de-arcozelo-ID1hAlb.html	219.900 €	2026-01-12 13:40:07.342926
34737120	idealista	Apartamento T1 na Rua São Martinho, 695, Manhente, Barcelos	https://www.idealista.pt/imovel/34737120/	180.000€	2026-01-12 13:40:07.361497
666331356	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-t3-para-venda-ID1hpFE.html	170.000 €	2026-01-12 13:40:11.437998
662175693	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamento-t3-em-barcelos-vila-boa-e-vila-frescainha-sao-martinho-e-ID1gtDF.html	213.000 €	2026-01-12 13:40:11.464536
34737101	idealista	Apartamento T1 na Rua São Martinho, 695, Manhente, Barcelos	https://www.idealista.pt/imovel/34737101/	185.000€	2026-01-12 13:40:11.480182
666352463	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-para-recuperar-ID1hqos.html	127.500 €	2026-01-12 13:40:12.74246
666711015	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamento-t3-para-venda-ID1hwLo.html	220.000 €	2026-01-12 13:40:12.753261
34394067	idealista	Apartamento T1 na Rua Luís de Camões, Barcelos - Vila Boa - Vila Frescainha, Barcelos	https://www.idealista.pt/imovel/34394067/	209.900€	2026-01-12 13:40:16.81073
664040026	olx	Sem título	https://www.imovirtual.com/pt/anuncio/venda-de-andar-moradia-t3-barroselas-viana-do-castelo-ID1gXks.html	198.000 €	2026-01-12 13:40:16.834598
660885856	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamento-t1-1-novo-res-do-chao-com-logradouro-neves-barrose-ID1g9NO.html	175.000 €	2026-01-12 13:40:16.850718
34706778	idealista	Apartamento T1 na Rua São Martinho, 696, Manhente, Barcelos	https://www.idealista.pt/imovel/34706778/	175.000€	2026-01-12 13:40:18.035631
665721981	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-t2-para-venda-ID1hiBq.html	135.000 €	2026-01-12 13:40:18.050008
667787499	olx	Sem título	https://www.imovirtual.com/pt/anuncio/t3-barcelos-remodelado-varanda-ID1hIlU.html	240.000 €	2026-01-12 13:41:01.358322
667198238	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-de-pedra-para-venda-em-barroselas-viana-do-castelo-ID1hC4x.html	200.000 €	2026-01-12 13:41:01.364628
34704999	idealista	Apartamento T1 na Rua São Martinho, 696, Manhente, Barcelos	https://www.idealista.pt/imovel/34704999/	185.000€	2026-01-12 13:41:01.375202
666798049	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamento-novo-com-dois-quartos-no-empreendimento-strong-build-ID1hvx2.html	230.000 €	2026-01-12 13:41:02.551026
667467637	olx	Sem título	https://www.imovirtual.com/pt/anuncio/venda-de-moradia-v2-p-restauro-barroselas-viana-do-castelo-ID1hEQ1.html	130.000 €	2026-01-12 13:41:05.657415
663395328	olx	Sem título	https://www.imovirtual.com/pt/anuncio/t3-totalmente-renovado-equipado-e-com-varanda-a-entrada-da-cidade-ID1gMcQ.html	240.000 €	2026-01-12 13:41:05.661211
656508189	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-em-pedra-neves-ID1fbyd.html	160.000 €	2026-01-12 13:41:06.874462
659884035	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamento-t1-1-c-suite-completamente-renovado-ID1fVRt.html	190.000 €	2026-01-12 13:41:06.891491
666999082	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-t3-1-suite-venda-sem-acabamentos-feitos-arcozelo-barcelos-ID1hyVq.html	217.000 €	2026-01-12 13:41:11.143323
662175690	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamento-t3-em-barcelos-vila-boa-e-vila-frescainha-sao-martinho-e-ID1gtDD.html	213.000 €	2026-01-12 13:41:11.178267
666596626	olx	Sem título	https://www.imovirtual.com/pt/anuncio/oportunidade-unica-moradia-para-restauro-com-vistas-panoramicas-ID1hwkw.html	140.000 €	2026-01-12 13:41:12.344727
667469124	olx	Sem título	https://www.imovirtual.com/pt/anuncio/fantastico-apartamento-t3-em-barroselas-ID1hESj.html	239.000 €	2026-01-12 13:41:12.365948
656574634	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-t3-com-terreno-perto-de-barroselas-neves-ID1fcFh.html	178.000 €	2026-01-12 13:41:13.551196
663803929	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamento-t2-com-lugar-garagem-em-arcozelo-barcelos-ID1gSVh.html	195.000 €	2026-01-12 13:41:16.610785
667840192	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-t2-para-venda-ID1hJdQ.html	110.000 €	2026-01-12 13:41:16.61999
657502059	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-t6-para-venda-ID1frMh.html	250.000 €	2026-01-12 13:41:17.827913
667540724	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamento-t2-novo-em-tamel-sao-verissimo-barcelos-ID1hG3W.html	235.000 €	2026-01-12 13:41:17.838057
660155548	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-para-venda-vilar-de-figos-ID1fU0G.html	125.000 €	2026-01-12 13:41:19.032065
607666409	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamento-t2-renovado-IDTr6F.html	207.000 €	2026-01-12 13:41:22.07
662045488	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-t3-venda-em-ribeira-do-neiva-vila-verde-ID1gs0P.html	129.900 €	2026-01-12 13:42:04.343102
667775887	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamento-t2-no-domus-castle-tradicao-e-conforto-no-coracao-do-ID1hIaI.html	235.000 €	2026-01-12 13:42:04.344086
662201870	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-t5-venda-viana-do-castelo-ID1gucH.html	160.000 €	2026-01-12 13:42:06.804879
659884037	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamento-t1-1-c-suite-completamente-renovado-ID1fVRw.html	190.000 €	2026-01-12 13:42:08.042377
667482055	olx	Sem título	https://www.imovirtual.com/pt/anuncio/casa-com-terreno-em-barcelos-ID1hF9z.html	240.000 €	2026-01-12 13:42:12.412031
666798102	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamento-novo-com-dois-quartos-no-empreendimento-trade-concep-ID1hvx6.html	250.000 €	2026-01-12 13:42:14.860858
657932025	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-t3-vilar-das-almas-ponte-de-lima-ID1fvWW.html	80.000 €	2026-01-12 13:42:18.063172
663920868	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-t3-para-venda-ID1gWh2.html	215.000 €	2026-01-12 13:42:19.266631
663785773	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamento-t3-para-venda-ID1gSyx.html	229.000 €	2026-01-12 13:42:23.590245
gen_8683589463543261305	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/cobertura-t4-duplex-com-terracos-e-duas-garagens/	Preço sob consulta	2026-01-12 14:13:43.58314
gen_-8546235303990259581	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/andar-moradia-t2-com-logradouro-em-arcozelo-barcelos_101/	Preço sob consulta	2026-01-12 14:13:45.112323
gen_-1293596238861270100	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/apartamento-t3-em-arcozelo/	Preço sob consulta	2026-01-12 14:13:55.74766
666790784	olx	Sem título	https://www.imovirtual.com/pt/anuncio/andar-moradia-t2-1-barroselas-ID1hvow.html	198.000 €	2026-01-12 13:42:05.545488
667323732	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamento-t3-renovado-ID1hDxG.html	240.000 €	2026-01-12 13:42:06.814098
665569258	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-terrea-em-pedra-para-restauro-com-amplo-terreno-ID1hgPD.html	117.000 €	2026-01-12 13:42:09.211643
607666429	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamento-t2-cond-fechado-esposende-IDNqu9.html	229.900 €	2026-01-12 13:42:13.654783
663782450	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamento-t2-em-gamil-barcelos-ID1gStj.html	245.000 €	2026-01-12 13:42:19.292545
665358700	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-para-recuperacao-em-goios-barcelos-ID1heki.html	158.000 €	2026-01-12 13:43:04.789526
gen_-2898306215411676408	franciscofaria.pt	Moradia nova- 5 minutos centro Barcelos	https://franciscofaria.pt/status/vendido/	Preço sob consulta	2026-01-12 14:13:47.31814
gen_1933932799699026322	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/ruina-em-pedra-com-terreno-em-cossourado-barcelos_51/	47 000 €	2026-01-12 14:13:47.574399
gen_6536874570939614462	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/t1-novo-centro-barcelos/	Preço sob consulta	2026-01-12 14:13:49.910399
gen_9071466554348286699	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/moradia-com-terreno-em-cervaes/	Preço sob consulta	2026-01-12 14:13:54.500783
{{pageSchema}}	www.h-urb.com	Imóvel	https://www.h-urb.com/imoveis?dst=3&mun=36&mtype=1,2&stpl=7&bus=1&mrp=250000	Preço sob consulta	2026-01-12 14:14:00.159826
gen_1464980087465371438	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/consultores/paulo-soutelo_34/	Preço sob consulta	2026-01-12 14:14:05.0982
gen_-451072669825596754	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t3-abade-neiva-barcelos_1522/	Preço sob consulta	2026-01-12 14:14:06.457699
gen_-931352333471249014	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/consultores/pedro-oliveira_36/	Preço sob consulta	2026-01-12 14:14:48.793228
gen_-7604973799519780598	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamentos-t3-em-construcao-galegos-sao-martinho-barcelos_1350/	Preço sob consulta	2026-01-12 14:14:50.087364
664451531	olx	Sem título	https://www.imovirtual.com/pt/anuncio/novo-empreendimento-em-abade-neiva-barcelos-cachadinha-residence-ID1h3B3.html	240.000 €	2026-01-12 13:42:05.56202
665588626	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-t3-venda-em-escariz-sao-mamede-e-escariz-sao-martinho-vila-ID1hh3Z.html	219.900 €	2026-01-12 13:42:08.014752
655498413	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-para-restaurar-t2-em-cristelo-ID1eWrQ.html	76.200 €	2026-01-12 13:42:12.324939
664909331	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-t3-em-durraes-ID1h8Zj.html	215.000 €	2026-01-12 13:42:13.755325
666797964	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamento-novo-com-dois-quartos-no-empreendimento-strong-build-ID1hvvO.html	250.000 €	2026-01-12 13:42:18.063908
666087231	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-t3-carvoeiro-ID1hm9K.html	152.500 €	2026-01-12 13:42:20.510524
663902223	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamento-t2-barcelos-ID1gUSq.html	220.000 €	2026-01-12 13:43:05.028597
gen_-4158301909359983903	franciscofaria.pt	Apartamento T-3 renovado	https://franciscofaria.pt/status/para-vender/	€240,000	2026-01-12 14:13:41.008735
gen_-5132443705664523478	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/apartamento-t-3-renovado/	Preço sob consulta	2026-01-12 14:13:42.321534
gen_7640382718464741415	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/t3-com-garagem-edf-quinta-nova-2/	Preço sob consulta	2026-01-12 14:13:44.829228
gen_-2985862030011842564	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/t2-centro-historico-de-barcelos-novo/	Preço sob consulta	2026-01-12 14:13:46.118536
gen_-8719710470267501937	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/moradia-t4-e-moradia-t3-em-adaes-barcelos_53/	Preço sob consulta	2026-01-12 14:13:46.304224
gen_-6457677594650590350	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/moradia-nova-5-minutos-centro-barcelos/	Preço sob consulta	2026-01-12 14:13:48.620484
gen_-4681750998866728766	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/moradia-t3-para-restauro-em-vilar-de-figos-barcelos_10/	Preço sob consulta	2026-01-12 14:13:48.895128
gen_8340804227791118934	franciscofaria.pt	Imóvel	https://franciscofaria.pt/property/t-1-novo-centro-de-barcelos-equipado-e-mobilado/	Preço sob consulta	2026-01-12 14:13:53.158855
gen_6864710783649064130	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t3-com-garagem-arcozelo-barcelos_1716/	Preço sob consulta	2026-01-12 14:14:03.885
gen_-1819324121227768859	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t1-novo-arcozelo-barcelos_1405/	Preço sob consulta	2026-01-12 14:14:07.685422
gen_-5382391207231635057	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t2-novo-arcozelo-barcelos_1406/	Preço sob consulta	2026-01-12 14:14:08.911281
gen_-9192248850161383568	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t1-novo-arcozelo-barcelos_1408/	Preço sob consulta	2026-01-12 14:14:42.439982
gen_-541957327491320546	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t3-novo-arcozelo-barcelos_1409/	Preço sob consulta	2026-01-12 14:14:43.753773
gen_-699952821226247958	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t2-novo-arcozelo-barcelos_1410/	Preço sob consulta	2026-01-12 14:14:44.972466
gen_-8032239352677369966	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamento-t2-novo-com-logradouro-arcozelo-barcelos_1402/	Preço sob consulta	2026-01-12 14:14:46.300216
gen_5597236195635716640	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/apartamentos-t3-em-galegos-sao-martinho_1349/	Preço sob consulta	2026-01-12 14:14:47.592372
-8647269284701642597	remax	Remax Property	https://www.remax.pt#	N/A	2026-01-12 14:17:57.948889
gen_7986153147473541135	www.lardesonho.pt	Imóvel	https://www.lardesonho.pt/politica-de-privacidade/	Preço sob consulta	2026-01-12 14:17:58.732832
gen_4726722762639425936	franciscofaria.pt	Apartamento T-3 renovado	https://franciscofaria.pt/status/para-vender/	€240,000	2026-01-12 14:18:00.543499
gen_3841278750488951396	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-manhente-barcelos_111/	175 000 €	2026-01-12 14:18:22.291357
gen_2008872264212745814	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-com-logradouro-em-manhente-barcelos_112/	180 000 €	2026-01-12 14:18:23.579235
gen_-3971322551844507655	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-com-logradouro-em-manhente-barcelos_113/	185 000 €	2026-01-12 14:18:25.025737
gen_8617983968730027252	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-tamel-sao-verissimo-barcelos_105/	170 000 €	2026-01-12 14:18:26.293236
gen_66063650264250548	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t2-em-rio-covo-santa-eugenia-barcelos_98/	240 000 €	2026-01-12 14:18:27.627957
gen_-2916624480689013981	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradia-em-banda-arcozelo-barcelos_1996/	235.000 €	2026-01-12 14:18:28.279805
gen_-911271687875311280	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-tamel-sao-verissimo-barcelos_100/	174 000 €	2026-01-12 14:18:28.896875
gen_-304267790903301663	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-barcelos_91/	193 000 €	2026-01-12 14:18:30.169088
gen_3249168506436836127	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-barcelos_92/	197 000 €	2026-01-12 14:18:31.375085
gen_-4764654783168788156	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/ruina-em-pedra-com-terreno-em-cossourado-barcelos_51/	47 000 €	2026-01-12 14:18:37.853736
gen_3918832316221111924	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-manhente-barcelos_111/	175 000 €	2026-01-12 14:22:59.853085
gen_-4924398578382000763	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-com-logradouro-em-manhente-barcelos_112/	180 000 €	2026-01-12 14:23:01.087198
gen_51664703582810869	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-com-logradouro-em-manhente-barcelos_113/	185 000 €	2026-01-12 14:23:02.339922
gen_3153990936532816689	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-tamel-sao-verissimo-barcelos_105/	170 000 €	2026-01-12 14:23:03.533094
gen_-881240344310821926	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t2-em-rio-covo-santa-eugenia-barcelos_98/	240 000 €	2026-01-12 14:23:04.744229
gen_-7772507444513562790	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-tamel-sao-verissimo-barcelos_100/	174 000 €	2026-01-12 14:23:06.018425
gen_-5898290723754099945	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-barcelos_91/	193 000 €	2026-01-12 14:23:07.202401
gen_-8749058980388459252	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-barcelos_92/	197 000 €	2026-01-12 14:23:08.386327
gen_227119811144990023	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradia-em-banda-arcozelo-barcelos_1996/	235.000 €	2026-01-12 14:23:22.493297
gen_6028022202890315487	franciscofaria.pt	Apartamento T-3 renovado	https://franciscofaria.pt/status/para-vender/	€240,000	2026-01-12 14:23:36.624324
665651153	olx	Sem título	https://www.imovirtual.com/pt/anuncio/t3-galegos-sta-maria-barcelos-ID1hhPZ.html	199.500 €	2026-01-12 14:53:59.775307
gen_-7380000344938504339	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradia-em-banda-arcozelo-barcelos_1996/	235.000 €	2026-01-12 15:28:08.486907
gen_-4100689224318131530	franciscofaria.pt	Apartamento T-3 renovado	https://franciscofaria.pt/status/para-vender/	€240,000	2026-01-12 15:28:18.700641
gen_2637586575208604359	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-manhente-barcelos_111/	175 000 €	2026-01-12 15:28:23.311464
gen_-140206256965790231	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-com-logradouro-em-manhente-barcelos_112/	180 000 €	2026-01-12 15:28:24.609913
gen_-6732002967461520386	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-com-logradouro-em-manhente-barcelos_113/	185 000 €	2026-01-12 15:28:25.838886
gen_-1735063336685257638	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-tamel-sao-verissimo-barcelos_105/	170 000 €	2026-01-12 15:28:27.121424
gen_-8411817559874451280	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t2-em-rio-covo-santa-eugenia-barcelos_98/	240 000 €	2026-01-12 15:28:28.392734
gen_8470519333992989821	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-tamel-sao-verissimo-barcelos_100/	174 000 €	2026-01-12 15:28:29.586665
gen_-2513550807900435789	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-barcelos_91/	193 000 €	2026-01-12 15:28:30.914608
gen_-308297849232265339	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-barcelos_92/	197 000 €	2026-01-12 15:28:32.121033
gen_-7408514311031367133	franciscofaria.pt	Apartamento T-3 renovado	https://franciscofaria.pt/status/para-vender/	€240,000	2026-01-12 15:33:54.925422
gen_-8026292697824089259	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradia-em-banda-arcozelo-barcelos_1996/	235.000 €	2026-01-12 15:34:02.629645
gen_-5441326708306444929	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-manhente-barcelos_111/	175 000 €	2026-01-12 15:34:04.456341
gen_6635772828952614532	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-com-logradouro-em-manhente-barcelos_112/	180 000 €	2026-01-12 15:34:05.631511
gen_-1397265278216112233	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-com-logradouro-em-manhente-barcelos_113/	185 000 €	2026-01-12 15:34:06.874976
gen_5066220575442662001	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-tamel-sao-verissimo-barcelos_105/	170 000 €	2026-01-12 15:34:08.104553
gen_5644346890501905360	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t2-em-rio-covo-santa-eugenia-barcelos_98/	240 000 €	2026-01-12 15:34:09.332291
gen_-7068646120449688317	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-tamel-sao-verissimo-barcelos_100/	174 000 €	2026-01-12 15:34:10.658654
gen_-8383923958552518001	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-barcelos_91/	193 000 €	2026-01-12 15:34:11.853608
gen_-2196300877569180305	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-barcelos_92/	197 000 €	2026-01-12 15:34:13.160289
661795481	olx	Sem título	https://www.olx.pt/d/anuncio/apartamento-t2-centro-IDIMPeF.html	190.000 €Negociável	2026-01-14 15:25:43.257282
656026692	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-para-restaurar-t2-em-vila-de-punhe-ID1f3bB.html	120.000 €	2026-01-14 15:25:44.51645
664930632	olx	Sem título	https://www.imovirtual.com/pt/anuncio/t2-com-lugar-de-garagem-em-palmeira-de-faro-esposende-ID1h9kA.html	230.000 €	2026-01-14 15:25:45.731374
665854664	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamento-t2-em-barcelos-ID1hjIK.html	225.000 €	2026-01-14 15:25:46.99772
667107804	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamento-t1-1-70m-f-r-s-vila-nova-residence-vila-boa-barcelos-ID1hAF7.html	225.000 €	2026-01-14 15:25:48.178371
667349590	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamento-t2-em-barcelos-ID1hDWN.html	235.000 €	2026-01-14 15:25:49.559518
637335593	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamento-t2-forjaes-esposende-ID18NvP.html	245.000 €	2026-01-14 15:25:50.791277
667730007	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamento-t3-em-esposende-ID1hHEX.html	230.000 €	2026-01-14 15:25:51.987748
gen_52dcc430d097669ff94f205dae5f9aff	www.haconchego.pt	Imóvel	https://www.haconchego.pt/pt/imoveis/moradia-em-banda-arcozelo-barcelos_1996/	235.000 €	2026-01-14 15:26:00.136321
665906915	olx	Sem título	https://www.olx.pt/d/anuncio/casa-em-arnoso-santa-maria-IDJ44O7.html	240.000 €	2026-01-14 15:26:03.198076
666031730	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-renovada-na-zona-historica-de-fao-ID1hlq8.html	235.000 €	2026-01-14 15:26:04.475717
655355409	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-tradicional-na-portela-de-cabras-em-vila-verde-ID1eT8h.html	225.000 €	2026-01-14 15:26:05.806876
660886036	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-t3-em-renovacao-neves-barroselas-ID1g9Oc.html	240.000 €	2026-01-14 15:26:07.116426
gen_450eeaa412fb4bcd5c00c1c399966f4f	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-barcelos_116/	189 000 €	2026-01-14 15:26:20.324305
gen_2e71b4daf39f89c3fc71c360c62ce277	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-manhente-barcelos_111/	175 000 €	2026-01-14 15:26:21.535357
gen_5456d34f18060fac502b219257cb7294	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-com-logradouro-em-manhente-barcelos_112/	180 000 €	2026-01-14 15:26:22.749152
gen_7536638513385c897e935bb0d9ffc5aa	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-com-logradouro-em-manhente-barcelos_113/	185 000 €	2026-01-14 15:26:23.947091
gen_3d7d042734d20d259427456a7af61d65	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-tamel-sao-verissimo-barcelos_105/	170 000 €	2026-01-14 15:26:25.206237
gen_4deb0e98c92fcbae7c464e6588b14ece	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t2-em-rio-covo-santa-eugenia-barcelos_98/	240 000 €	2026-01-14 15:26:26.431053
gen_2db666b22c0dae3dafbff34b4aef4a3c	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-novo-em-tamel-sao-verissimo-barcelos_100/	174 000 €	2026-01-14 15:26:27.625471
gen_0797b61c20760bd20206fd88ceb8a45d	www.concretaimobiliaria.pt	Imóvel	https://www.concretaimobiliaria.pt/pt/imoveis/apartamento-t1-em-gamil-barcelos_48/	175 000 €	2026-01-14 15:26:28.881318
hz-24202	franciscofaria	Apartamento T-3 renovado	https://franciscofaria.pt/property/apartamento-t-3-renovado/	€240,000	2026-01-14 15:45:23.160896
hz-24139	franciscofaria	Cobertura T4 Duplex com terraços e duas garagens	https://franciscofaria.pt/property/cobertura-t4-duplex-com-terracos-e-duas-garagens/	€350,000	2026-01-14 15:45:24.523296
hz-24115	franciscofaria	T3 com garagem – Edf. Quinta Nova	https://franciscofaria.pt/property/t3-com-garagem-edf-quinta-nova-2/	€295,000	2026-01-14 15:45:25.729763
hz-24102	franciscofaria	T2 Centro Histórico de Barcelos (Novo)	https://franciscofaria.pt/property/t2-centro-historico-de-barcelos-novo/	€275,000	2026-01-14 15:45:26.94897
hz-23553	franciscofaria	T1 novo Centro Barcelos	https://franciscofaria.pt/property/t1-novo-centro-barcelos/	€175,000	2026-01-14 15:45:28.193987
hz-1425	franciscofaria	T-1 novo centro de Barcelos- equipado e mobilado	https://franciscofaria.pt/property/t-1-novo-centro-de-barcelos-equipado-e-mobilado/	€167,500	2026-01-14 15:45:29.417975
34744876	idealista	Apartamento T2 na Rua do Galo, Galegos (Santa Maria), Barcelos	https://www.idealista.pt/imovel/34744876/	235.000€	2026-01-14 16:15:44.364646
34745483	idealista	Apartamento T3 na Rua Filipa Borges, s/n, Barcelos - Vila Boa - Vila Frescainha, Barcelos	https://www.idealista.pt/imovel/34745483/	239.000€	2026-01-14 16:15:45.60007
34742804	idealista	Apartamento T3 em Arcozelo, Barcelos	https://www.idealista.pt/imovel/34742804/	215.000€	2026-01-14 16:15:46.79124
34716941	idealista	Apartamento T3 em Arcozelo, Barcelos	https://www.idealista.pt/imovel/34716941/	240.000€	2026-01-14 16:15:48.016554
34607252	idealista	Moradia independente em Alvito e Couto, Barcelos	https://www.idealista.pt/imovel/34607252/	140.000€	2026-01-14 16:15:49.263506
34730727	idealista	Apartamento T3 na Rua da Formiga, Arcozelo, Barcelos	https://www.idealista.pt/imovel/34730727/	240.000€	2026-01-14 16:15:50.460621
33854594	idealista	Apartamento T2 em Tamel (São Veríssimo), Barcelos	https://www.idealista.pt/imovel/33854594/	190.000€	2026-01-14 16:15:51.709783
665225692	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamento-t2-novo-com-jardim-ID1hc0i.html	245.000 €	2026-01-14 16:15:51.718698
34703980	idealista	Moradia independente em Gamil e Midões, Barcelos	https://www.idealista.pt/imovel/34703980/	240.000€	2026-01-14 16:15:52.877844
34599453	idealista	Moradia independente em Durrães e Tregosa, Barcelos	https://www.idealista.pt/imovel/34599453/	150.000€	2026-01-14 16:15:54.06644
34441265	idealista	Apartamento T2 na Rua da Estrada Nacional, 1953, Ucha, Barcelos	https://www.idealista.pt/imovel/34441265/	169.900€	2026-01-14 16:15:55.260572
34559139	idealista	Quinta na Rua Central, Gamil e Midões, Barcelos	https://www.idealista.pt/imovel/34559139/	199.900€	2026-01-14 16:15:59.691962
34553733	idealista	Moradia em banda na Rua do Ribeiro, 4, Arcozelo, Barcelos	https://www.idealista.pt/imovel/34553733/	235.000€	2026-01-14 16:16:00.897418
32786856	idealista	Moradia independente na Rua do rio, Durrães e Tregosa, Barcelos	https://www.idealista.pt/imovel/32786856/	215.000€	2026-01-14 16:16:02.163993
34693558	idealista	Apartamento T3 na Rua da Formiga, 25, Arcozelo, Barcelos	https://www.idealista.pt/imovel/34693558/	240.000€	2026-01-14 16:16:03.427983
31169109	idealista	Moradia independente em Gamil e Midões, Barcelos	https://www.idealista.pt/imovel/31169109/	185.000€	2026-01-14 16:16:04.626687
34591564	idealista	Apartamento T3 em Várzea, Barcelos	https://www.idealista.pt/imovel/34591564/	235.000€	2026-01-14 16:16:05.90436
34592897	idealista	Apartamento T2 em Arcozelo, Barcelos	https://www.idealista.pt/imovel/34592897/	215.000€	2026-01-14 16:16:07.083622
1hDdP	imovirtual	T1 EM CONSTRUÇÃO COM VARANDA - MANHENTE	https://www.imovirtual.com/pt/anuncio/t1-em-construcao-com-varanda-manhente-ID1hDdP	175 000 €	2026-01-14 16:42:26.417753
1hm0V	imovirtual	Moradia Térrea T3 NOVA em Chavão, Barcelos	https://www.imovirtual.com/pt/anuncio/moradia-terrea-t3-nova-em-chavao-barcelos-ID1hm0V	240 000 €	2026-01-14 16:42:26.422044
1hsjD	imovirtual	Apartamento  em Barcelos	https://www.imovirtual.com/pt/anuncio/apartamento-em-barcelos-ID1hsjD	155 000 €	2026-01-14 16:42:27.818149
1gW97	imovirtual	Casa em pedra para restauro em Vila Cova, Barcelos.	https://www.imovirtual.com/pt/anuncio/casa-em-pedra-para-restauro-em-vila-cova-barcelos-ID1gW97	200 000 €	2026-01-14 16:42:27.838096
1hF1I	imovirtual	Prédio no centro histórico de Barcelinhos	https://www.imovirtual.com/pt/anuncio/predio-no-centro-historico-de-barcelinhos-ID1hF1I	155 000 €	2026-01-14 16:42:29.034563
1goqN	imovirtual	Moradia em Pedra com terreno	https://www.imovirtual.com/pt/anuncio/moradia-em-pedra-com-terreno-ID1goqN	159 500 €	2026-01-14 16:42:29.055132
1hK9i	imovirtual	Apartamento T1 novo em Barcelos	https://www.imovirtual.com/pt/anuncio/apartamento-t1-novo-em-barcelos-ID1hK9i	189 000 €	2026-01-14 16:42:30.264052
1hyVq	imovirtual	Moradia T3, 1 suite, venda sem acabamentos feitos, Arcozelo, Barcelos	https://www.imovirtual.com/pt/anuncio/moradia-t3-1-suite-venda-sem-acabamentos-feitos-arcozelo-barcelos-ID1hyVq	217 000 €	2026-01-14 16:42:33.413825
1hJUd	imovirtual	Apartamento T1 Novo – Manhente, Barcelos.	https://www.imovirtual.com/pt/anuncio/apartamento-t1-novo-manhente-barcelos-ID1hJUd	175 000 €	2026-01-14 16:42:33.423452
1hJTU	imovirtual	Apartamento T1 Novo – Manhente, Barcelos	https://www.imovirtual.com/pt/anuncio/apartamento-t1-novo-manhente-barcelos-ID1hJTU	175 000 €	2026-01-14 16:42:34.628251
1h8Zj	imovirtual	Moradia T3 em Durrães	https://www.imovirtual.com/pt/anuncio/moradia-t3-em-durraes-ID1h8Zj	215 000 €	2026-01-14 16:42:34.647153
1hzYt	imovirtual	Apartamentos T1 e T2 em construção, com um lugar de garagem em Manh...	https://www.imovirtual.com/pt/anuncio/apartamentos-t1-e-t2-em-construcao-com-um-lugar-de-garagem-em-manh-ID1hzYt	175 000 €	2026-01-14 16:42:35.821348
1hFuk	imovirtual	Moradia térrea para restaurar em zona privilegiada de Barroselas	https://www.imovirtual.com/pt/anuncio/moradia-terrea-para-restaurar-em-zona-privilegiada-de-barroselas-ID1hFuk	130 000 €	2026-01-14 16:42:38.863142
1gIva	imovirtual	Apartamento T1+1	https://www.imovirtual.com/pt/anuncio/apartamento-t1-1-ID1gIva	235 000 €	2026-01-14 16:42:38.887875
1hF9z	imovirtual	Casa com terreno em Barcelos	https://www.imovirtual.com/pt/anuncio/casa-com-terreno-em-barcelos-ID1hF9z	240 000 €	2026-01-14 16:42:40.070675
1hIXn	imovirtual	Apartamento T3 com localização central e vistas desafogadas	https://www.imovirtual.com/pt/anuncio/apartamento-t3-com-localizacao-central-e-vistas-desafogadas-ID1hIXn	220 000 €	2026-01-14 16:42:44.426478
1gMcQ	imovirtual	T3 Totalmente Renovado, Equipado e com Varanda, à Entrada da Cidade...	https://www.imovirtual.com/pt/anuncio/t3-totalmente-renovado-equipado-e-com-varanda-a-entrada-da-cidade-ID1gMcQ	240 000 €	2026-01-14 16:42:40.113431
1hwkw	imovirtual	Oportunidade Única - Moradia para Restauro com Vistas Panorâmicas!	https://www.imovirtual.com/pt/anuncio/oportunidade-unica-moradia-para-restauro-com-vistas-panoramicas-ID1hwkw	140 000 €	2026-01-14 16:42:41.349427
1h1hn	imovirtual	Casa / Villa T2 em Arcozelo de 72,00 m2	https://www.imovirtual.com/pt/anuncio/casa-villa-t2-em-arcozelo-de-72-00-m2-ID1h1hn	190 000 €	2026-01-14 16:42:44.432092
1hjMB	imovirtual	Moradia em banda Arcozelo Barcelos	https://www.imovirtual.com/pt/anuncio/moradia-em-banda-arcozelo-barcelos-ID1hjMB	235 000 €	2026-01-14 16:42:45.637988
1hIGW	imovirtual	Apartamento T1 novo com logradouro em Manhente, Barcelos	https://www.imovirtual.com/pt/anuncio/apartamento-t1-novo-com-logradouro-em-manhente-barcelos-ID1hIGW	180 000 €	2026-01-14 16:42:45.668032
1hvow	imovirtual	Andar Moradia T2+1 Barroselas	https://www.imovirtual.com/pt/anuncio/andar-moradia-t2-1-barroselas-ID1hvow	198 000 €	2026-01-14 16:42:46.831791
1hIGU	imovirtual	Apartamento T1 novo em Manhente, Barcelos	https://www.imovirtual.com/pt/anuncio/apartamento-t1-novo-em-manhente-barcelos-ID1hIGU	175 000 €	2026-01-14 16:43:28.249874
1hpFE	imovirtual	Moradia T3 para venda	https://www.imovirtual.com/pt/anuncio/moradia-t3-para-venda-ID1hpFE	170 000 €	2026-01-14 16:43:28.344731
1hIGT	imovirtual	Apartamento T1 novo com logradouro em Manhente, Barcelos	https://www.imovirtual.com/pt/anuncio/apartamento-t1-novo-com-logradouro-em-manhente-barcelos-ID1hIGT	185 000 €	2026-01-14 16:43:29.512596
1hpaI	imovirtual	Moradia T3 para recuperar!	https://www.imovirtual.com/pt/anuncio/moradia-t3-para-recuperar-ID1hpaI	170 000 €	2026-01-14 16:43:29.639349
1hIlU	imovirtual	T3 Barcelos | Remodelado | Varanda	https://www.imovirtual.com/pt/anuncio/t3-barcelos-remodelado-varanda-ID1hIlU	240 000 €	2026-01-14 16:43:30.734261
1hIbR	imovirtual	Apartamento T1 Novo  – Manhente, Barcelos	https://www.imovirtual.com/pt/anuncio/apartamento-t1-novo-manhente-barcelos-ID1hIbR	175 000 €	2026-01-14 16:43:33.937007
1hI79	imovirtual	Apartamento T1 para venda	https://www.imovirtual.com/pt/anuncio/apartamento-t1-para-venda-ID1hI79	185 000 €	2026-01-14 16:43:35.140543
1horZ	imovirtual	O Seu Novo Projeto de Sonho Espera por Si em Alheira - Barcelos!	https://www.imovirtual.com/pt/anuncio/o-seu-novo-projeto-de-sonho-espera-por-si-em-alheira-barcelos-ID1horZ	165 000 €	2026-01-14 16:43:35.156489
1hkrm	imovirtual	Quinta com 1700 m2 em Midões, Barcelos	https://www.imovirtual.com/pt/anuncio/quinta-com-1700-m2-em-midoes-barcelos-ID1hkrm	199 900 €	2026-01-14 16:43:36.410267
1bbmQ	imovirtual	Venda de quintinha c/ moradia em pedra p/ recuperar, Fragoso, Barcelos	https://www.imovirtual.com/pt/anuncio/venda-de-quintinha-c-moradia-em-pedra-p-recuperar-fragoso-barcelos-ID1bbmQ	235 000 €	2026-01-14 16:43:39.493082
1hHpF	imovirtual	Apartamento T1 novo em Tamel São Veríssimo, Barcelos	https://www.imovirtual.com/pt/anuncio/apartamento-t1-novo-em-tamel-sao-verissimo-barcelos-ID1hHpF	170 000 €	2026-01-14 16:43:40.705656
1heki	imovirtual	Moradia para Recuperação em Góios, Barcelos	https://www.imovirtual.com/pt/anuncio/moradia-para-recuperacao-em-goios-barcelos-ID1heki	158 000 €	2026-01-14 16:43:40.716025
1hc0i	imovirtual	Apartamento T2 novo com jardim	https://www.imovirtual.com/pt/anuncio/apartamento-t2-novo-com-jardim-ID1hc0i	245 000 €	2026-01-14 16:43:41.900809
1hdXB	imovirtual	Moradia T4 c/ 376 m², jardim e riacho	https://www.imovirtual.com/pt/anuncio/moradia-t4-c-376-m-jardim-e-riacho-ID1hdXB	190 000 €	2026-01-14 16:43:44.945614
1hGEd	imovirtual	Apartamento T3 c/ varanda, renovado	https://www.imovirtual.com/pt/anuncio/apartamento-t3-c-varanda-renovado-ID1hGEd	240 000 €	2026-01-14 16:43:44.967553
1hdDf	imovirtual	Oportunidade- Moradia T3, Anexo T2 e Terreno Rústico em Carreira e Fon	https://www.imovirtual.com/pt/anuncio/oportunidade-moradia-t3-anexo-t2-e-terreno-rustico-em-carreira-e-fon-ID1hdDf	190 000 €	2026-01-14 16:43:46.179386
1hGy8	imovirtual	Vendo apartamento T1 Barcelos	https://www.imovirtual.com/pt/anuncio/vendo-apartamento-t1-barcelos-ID1hGy8	160 000 €	2026-01-14 16:43:46.28937
1fYmK	imovirtual	Excelente Moradia M3 em Viatodos	https://www.imovirtual.com/pt/anuncio/excelente-moradia-m3-em-viatodos-ID1fYmK	215 000 €	2026-01-14 16:43:47.459367
1h2uP	imovirtual	Apartamento T1 em Barcelos	https://www.imovirtual.com/pt/anuncio/apartamento-t1-em-barcelos-ID1h2uP	159 000 €	2026-01-14 16:44:28.764381
1f32r	imovirtual	Terreno construção e cultivo – 6000m2 c/moradia devoluta	https://www.imovirtual.com/pt/anuncio/terreno-construcao-e-cultivo-6000m2-c-moradia-devoluta-ID1f32r	139 500 €	2026-01-14 16:44:28.89607
1hc0m	imovirtual	Apartamento T1  novo em Barcelos	https://www.imovirtual.com/pt/anuncio/apartamento-t1-novo-em-barcelos-ID1hc0m	185 000 €	2026-01-14 16:44:29.976271
1h4ga	imovirtual	Moradia em NEGREIROS, com terreno	https://www.imovirtual.com/pt/anuncio/moradia-em-negreiros-com-terreno-ID1h4ga	120 000 €	2026-01-14 16:44:30.095433
1hbZ0	imovirtual	Apartamento T2 novo com jardim	https://www.imovirtual.com/pt/anuncio/apartamento-t2-novo-com-jardim-ID1hbZ0	250 000 €	2026-01-14 16:44:31.189332
1h4fO	imovirtual	Moradia T1 para venda	https://www.imovirtual.com/pt/anuncio/moradia-t1-para-venda-ID1h4fO	130 000 €	2026-01-14 16:44:34.335257
1fUfz	imovirtual	Apartamento T1  em Barcelos	https://www.imovirtual.com/pt/anuncio/apartamento-t1-em-barcelos-ID1fUfz	160 000 €	2026-01-14 16:44:34.360946
1h1tI	imovirtual	Casa para Recuperação em Cossourado com Vista Campestre	https://www.imovirtual.com/pt/anuncio/casa-para-recuperacao-em-cossourado-com-vista-campestre-ID1h1tI	190 000 €	2026-01-14 16:44:35.568523
1hc1P	imovirtual	Apartamento T3 em frente ao Rio	https://www.imovirtual.com/pt/anuncio/apartamento-t3-em-frente-ao-rio-ID1hc1P	247 000 €	2026-01-14 16:44:35.655188
1gYba	imovirtual	Casa para Recuperação em Braga com Terreno de 5000m²	https://www.imovirtual.com/pt/anuncio/casa-para-recuperacao-em-braga-com-terreno-de-5000m-ID1gYba	225 000 €	2026-01-14 16:44:36.780005
1hG3W	imovirtual	Apartamento T2 Novo em Tamel São Veríssimo  – Barcelos	https://www.imovirtual.com/pt/anuncio/apartamento-t2-novo-em-tamel-sao-verissimo-barcelos-ID1hG3W	235 000 €	2026-01-14 16:44:39.975401
15LUZ	imovirtual	Moradia bifamiliar em Gamil	https://www.imovirtual.com/pt/anuncio/moradia-bifamiliar-em-gamil-ID15LUZ	185 000 €	2026-01-14 16:44:40.077699
1hDcK	imovirtual	T1 R/C EM CONSTRUÇÃO COM JARDIM PRIVATIVO - MANHENTE	https://www.imovirtual.com/pt/anuncio/t1-r-c-em-construcao-com-jardim-privativo-manhente-ID1hDcK	185 000 €	2026-01-14 16:44:41.177561
1gxNg	imovirtual	Moradia no Centro Histórico de Barcelos!	https://www.imovirtual.com/pt/anuncio/moradia-no-centro-historico-de-barcelos-ID1gxNg	190 000 €	2026-01-14 16:44:41.333762
1hFN0	imovirtual	Apartamento T1 para venda	https://www.imovirtual.com/pt/anuncio/apartamento-t1-para-venda-ID1hFN0	175 000 €	2026-01-14 16:44:42.458818
1hFMP	imovirtual	Apartamento T1 para venda	https://www.imovirtual.com/pt/anuncio/apartamento-t1-para-venda-ID1hFMP	175 000 €	2026-01-14 16:44:45.675249
1hFMH	imovirtual	Apartamento T1 para venda	https://www.imovirtual.com/pt/anuncio/apartamento-t1-para-venda-ID1hFMH	180 000 €	2026-01-14 16:44:46.897343
1gXks	imovirtual	Venda de andar moradia T3, Barroselas, Viana do Castelo	https://www.imovirtual.com/pt/anuncio/venda-de-andar-moradia-t3-barroselas-viana-do-castelo-ID1gXks	198 000 €	2026-01-14 16:43:33.935606
1hAlb	imovirtual	Apartamento T2 no Centro de Arcozelo	https://www.imovirtual.com/pt/anuncio/apartamento-t2-no-centro-de-arcozelo-ID1hAlb	219 900 €	2026-01-14 16:43:39.492271
1hFL7	imovirtual	Apartamento T1 para venda	https://www.imovirtual.com/pt/anuncio/apartamento-t1-para-venda-ID1hFL7	185 000 €	2026-01-14 16:44:48.152966
1hFze	imovirtual	Apartamento T1 NOVO - Manhente - Barcelos	https://www.imovirtual.com/pt/anuncio/apartamento-t1-novo-manhente-barcelos-ID1hFze	180 000 €	2026-01-14 16:44:49.365791
1hFx7	imovirtual	APARTAMENTO T1 NOVO	https://www.imovirtual.com/pt/anuncio/apartamento-t1-novo-ID1hFx7	204 900 €	2026-01-14 16:45:28.791985
1gtDF	imovirtual	Apartamento T3 em Barcelos, Vila Boa e Vila Frescainha (São Martinho e	https://www.imovirtual.com/pt/anuncio/apartamento-t3-em-barcelos-vila-boa-e-vila-frescainha-sao-martinho-e-ID1gtDF	213 000 €	2026-01-14 16:45:29.989735
1hl78	imovirtual	Apartamento T1 Novo!	https://www.imovirtual.com/pt/anuncio/apartamento-t1-novo-ID1hl78	220 000 €	2026-01-14 16:45:31.263065
1hKSK	imovirtual	Apartamento com 1 quarto em novo empreendimento em Manhente, Barcelos.	https://www.imovirtual.com/pt/anuncio/apartamento-com-1-quarto-em-novo-empreendimento-em-manhente-barcelos-ID1hKSK	185 000 €	2026-01-14 16:52:01.864747
1hKSL	imovirtual	Apartamento com 1 quarto em novo empreendimento em Manhente, Barcelos.	https://www.imovirtual.com/pt/anuncio/apartamento-com-1-quarto-em-novo-empreendimento-em-manhente-barcelos-ID1hKSL	180 000 €	2026-01-14 16:52:03.104611
1hKSU	imovirtual	Apartamento com 1 quarto em novo empreendimento em Manhente, Barcelos.	https://www.imovirtual.com/pt/anuncio/apartamento-com-1-quarto-em-novo-empreendimento-em-manhente-barcelos-ID1hKSU	185 000 €	2026-01-14 16:54:55.525977
1hKSR	imovirtual	Apartamento com 1 quarto em novo empreendimento em Manhente, Barcelos.	https://www.imovirtual.com/pt/anuncio/apartamento-com-1-quarto-em-novo-empreendimento-em-manhente-barcelos-ID1hKSR	175 000 €	2026-01-14 16:54:56.759767
665571818	olx	Sem título	https://www.imovirtual.com/pt/anuncio/charme-e-historia-t2-andar-moradia-barroselas-ID1hgSR.html	235.000 €	2026-01-14 17:00:23.833411
ZMPT583253	zome	Apartamento T1+12111ZMPT583253Barcelos, Vila Boa e Vila Frescainha (São Martinho e São Pedro), Barcelos, Braga230.000 €	https://www.zome.pt/pt/apartamento-t1_1-braga-barcelos-barcelos_vila_boa_e_vila_frescainha_sao_martinho_e_sao_pedro-ZMPT583253	230.000 €	2026-01-14 17:00:35.297742
ZMPT583255	zome	Apartamento T1+12111ZMPT583255Barcelos, Vila Boa e Vila Frescainha (São Martinho e São Pedro), Barcelos, Braga230.000 €	https://www.zome.pt/pt/apartamento-t1_1-braga-barcelos-barcelos_vila_boa_e_vila_frescainha_sao_martinho_e_sao_pedro-ZMPT583255	230.000 €	2026-01-14 17:00:36.523244
ZMPT583252	zome	Apartamento T1+12111ZMPT583252Barcelos, Vila Boa e Vila Frescainha (São Martinho e São Pedro), Barcelos, Braga225.000 €	https://www.zome.pt/pt/apartamento-t1_1-braga-barcelos-barcelos_vila_boa_e_vila_frescainha_sao_martinho_e_sao_pedro-ZMPT583252	225.000 €	2026-01-14 17:00:37.814672
ZMPT571713	zome	Moradia T33327ZMPT571713Arcozelo, Barcelos, Braga217.000 €	https://www.zome.pt/pt/moradia-t3-braga-barcelos-arcozelo-ZMPT571713	217.000 €	2026-01-14 17:00:39.035745
607670752	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-t3-para-construcao-distrito-braga-IDi6Mk.html	147.500 €	2026-01-14 18:31:56.487167
667214918	olx	Sem título	https://www.imovirtual.com/pt/anuncio/excelente-oportunidade-de-investimento-ID1hCtu.html	250.000 €	2026-01-14 18:31:57.871
34747886	idealista	Apartamento T2 na Rua de Santa Clara, Arcozelo, Barcelos	https://www.idealista.pt/imovel/34747886/	219.900€	2026-01-14 18:31:58.794323
1hCtu	imovirtual	Excelente oportunidade de investimento!	https://www.imovirtual.com/pt/anuncio/excelente-oportunidade-de-investimento-ID1hCtu	230 000 €	2026-01-14 18:32:17.729479
663553518	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamento-t2-aldeia-42-ID1gOZu.html	225.000 €	2026-01-14 19:54:31.578859
34666810	idealista	Apartamento T2 em Barcelos - Vila Boa - Vila Frescainha, Barcelos	https://www.idealista.pt/imovel/34666810/	230.000€	2026-01-15 11:36:12.355533
665664714	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamento-t2-em-palmeira-de-faro-e-curvos-de-78-00-m2-ID1hi3W.html	230.000 €	2026-01-15 12:07:30.721437
667499266	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-terrea-para-restaurar-em-zona-privilegiada-de-barroselas-ID1hFuk.html	130.000 €	2026-01-15 12:38:38.56507
1492026	era	Apartamento	https://www.era.pt/imovel/apartamento-t3-barcelos-varzea-360250137	215.000 €	2026-01-15 12:49:27.947618
1489136	era	Apartamento	https://www.era.pt/imovel/apartamento-t3-barcelos-manhente-360250132	250.000 €	2026-01-15 12:49:29.248411
1455040	era	Apartamento	https://www.era.pt/imovel/apartamento-t3-barcelos-vila-seca-360250003	245.000 €	2026-01-15 12:49:30.451133
1452531	era	Apartamento	https://www.era.pt/imovel/apartamento-t3-barcelos-vila-seca-360250002	250.000 €	2026-01-15 12:49:31.68963
1444486	era	Apartamento	https://www.era.pt/imovel/apartamento-t2-barcelos-varzea-360240455	225.000 €	2026-01-15 12:49:32.966308
1411993	era	Moradia	https://www.era.pt/imovel/moradia-t2-barcelos-lijo-360240147	220.000 €	2026-01-15 12:49:34.149831
1305593	era	Moradia em Banda	https://www.era.pt/imovel/moradia-em-banda-t3-barcelos-carapecos-360230034	235.000 €	2026-01-15 12:49:35.342547
1276898	era	Moradia	https://www.era.pt/imovel/moradia-t8-barcelos-arcozelo-360220227	170.000 €	2026-01-15 12:49:36.603324
1248128	era	Apartamento	https://www.era.pt/imovel/apartamento-t3-novo-barcelos-carvalhal-360220117	205.500 €	2026-01-15 12:49:37.792438
1248121	era	Apartamento	https://www.era.pt/imovel/apartamento-t2-novo-barcelos-carvalhal-360220115	184.000 €	2026-01-15 12:49:38.975993
34749515	idealista	Apartamento T2 em Barcelos - Vila Boa - Vila Frescainha, Barcelos	https://www.idealista.pt/imovel/34749515/	223.900€	2026-01-15 12:59:16.823958
665337858	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-t4-c-376-m-jardim-e-riacho-ID1hdXB.html	190.000 €	2026-01-15 13:36:57.837277
1hc0j	imovirtual	Apartamento T2 novo com jardim	https://www.imovirtual.com/pt/anuncio/apartamento-t2-novo-com-jardim-ID1hc0j	245 000 €	2026-01-15 15:44:29.414986
656785514	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamentos-t2-com-jardim-e-dois-lugares-de-estacionamento-privados-ID1fh4o.html	245.000 €	2026-01-15 17:19:58.760345
661297937	olx	Sem título	https://www.imovirtual.com/pt/anuncio/moradia-t3-totalmente-remodelada-em-barroselas-ID1ghiq.html	250.000 €	2026-01-16 07:17:00.429272
34666807	idealista	Apartamento T2 em Barcelos - Vila Boa - Vila Frescainha, Barcelos	https://www.idealista.pt/imovel/34666807/	230.000€	2026-01-16 07:17:13.184595
34545692	idealista	Quinta em Durrães e Tregosa, Barcelos	https://www.idealista.pt/imovel/34545692/	220.000€	2026-01-16 10:42:07.306638
668010006	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamento-t2-renovado-em-galegos-santa-maria-ID1biUS.html	157.000 €	2026-01-16 12:06:25.083766
1biUS	imovirtual	Apartamento T2, RENOVADO, em Galegos Santa Maria	https://www.imovirtual.com/pt/anuncio/apartamento-t2-renovado-em-galegos-santa-maria-ID1biUS	157 000 €	2026-01-16 12:06:33.301779
668014697	olx	Sem título	https://www.imovirtual.com/pt/anuncio/duplex-t2-em-barroselas-e-carvoeiro-de-63-2-m2-ID1hLvu.html	210.000 €	2026-01-16 16:06:18.095749
661992491	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamento-t4-em-barcelos-ID1gr2Q.html	245.000 €	2026-01-16 20:24:46.768214
1hkVR	imovirtual	Apartamento T1| Empreendimento Novo Living Gardens | centro Barcelos	https://www.imovirtual.com/pt/anuncio/apartamento-t1-empreendimento-novo-living-gardens-centro-barcelos-ID1hkVR	200 000 €	2026-01-16 20:24:56.355113
667198906	olx	Sem título	https://www.imovirtual.com/pt/anuncio/apartamento-t2-em-rio-covo-santa-eugenia-barcelos-ID1hC6l.html	230.000 €	2026-01-17 15:49:50.712733
34729446	idealista	Moradia independente na Rua de Souto Côvo, 125, Cambeses, Barcelos	https://www.idealista.pt/imovel/34729446/	129.900€	2026-01-17 15:50:05.251197
34754712	idealista	Duplex em Barcelos - Vila Boa - Vila Frescainha, Barcelos	https://www.idealista.pt/imovel/34754712/	185.000€	2026-01-17 15:50:06.537746
\.


--
-- Name: properties properties_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict HjzhNwElmaOznRDUug1U26nqoPthbcWdDrfGE5cmMWTceBPfWbapnyKEzJGW2sU

