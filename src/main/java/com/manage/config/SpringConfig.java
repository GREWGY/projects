package com.manage.config;

import com.alibaba.druid.pool.DruidDataSource;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

@Configuration
@ComponentScan("com.manage.service")
@MapperScan("com.manage.mapper")
@PropertySource("classpath:db.properties")
@EnableTransactionManagement
public class SpringConfig {

    private static final Properties PROPS = new Properties();

    static {
        try (InputStream is = SpringConfig.class.getClassLoader().getResourceAsStream("db.properties")) {
            if (is != null) {
                PROPS.load(is);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 读取配置项，支持 ${ENV_VAR:default} 语法：
     * 优先从系统环境变量取值，未设置时使用配置文件中的默认值。
     */
    private static String getProperty(String key) {
        String value = PROPS.getProperty(key);
        if (value == null) {
            return null;
        }
        java.util.regex.Matcher matcher = java.util.regex.Pattern
                .compile("\\$\\{([A-Za-z0-9_]+):(.*)\\}").matcher(value);
        if (matcher.matches()) {
            String env = System.getenv(matcher.group(1));
            return env != null ? env : matcher.group(2);
        }
        return value;
    }

    @Bean
    public DataSource dataSource() {
        DruidDataSource dataSource = new DruidDataSource();
        dataSource.setDriverClassName(getProperty("jdbc.driver"));
        dataSource.setUrl(getProperty("jdbc.url"));
        dataSource.setUsername(getProperty("jdbc.username"));
        dataSource.setPassword(getProperty("jdbc.password"));
        return dataSource;
    }

    @Bean
    public SqlSessionFactoryBean sqlSessionFactory(DataSource dataSource) throws Exception {
        SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
        factoryBean.setDataSource(dataSource);
        // 标准ClassPath资源读取，规避路径解析BUG
        factoryBean.setConfigLocation(new ClassPathResource("myBatis-config.xml"));
        PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
        Resource[] mapperResources = resolver.getResources("classpath:mapper/*.xml");
        factoryBean.setMapperLocations(mapperResources);
        return factoryBean;
    }

    @Bean
    public DataSourceTransactionManager transactionManager(DataSource dataSource) {
        return new DataSourceTransactionManager(dataSource);
    }
}