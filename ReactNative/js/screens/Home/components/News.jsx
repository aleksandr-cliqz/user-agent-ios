/* eslint-disable react/prop-types */
import React, { useState, useMemo, useContext } from 'react';
import {
  NativeModules,
  View,
  StyleSheet,
  Image,
  TouchableWithoutFeedback,
} from 'react-native';
import ListItem from '../../../components/ListItem';
import ThemeContext from '../../../contexts/theme';

const getStyles = theme =>
  StyleSheet.create({
    container: {
      borderTopWidth: 1,
      borderTopColor: theme.separatorColor,
      paddingTop: 30,
    },
    image: {
      height: 200,
      marginBottom: 10,
    },
    item: {
      marginLeft: 20,
      marginRight: 20,
      marginTop: 0,
      marginBottom: 20,
    },
    separator: {
      marginTop: 20,
      backgroundColor: theme.separatorColor,
      height: 1,
    },
  });

const openLink = url => NativeModules.BrowserActions.openLink(url, '', false);

const deepEqualNews = (oldNews, news) => {
  return oldNews.every((_, index) => {
    try {
      return oldNews[index].url === news[index].url;
    } catch (e) {
      return false;
    }
  });
};

const useNews = newsModule => {
  const [data, setData] = useState([]);
  newsModule.action('getNews').then(({ news }) => {
    if (data.length === 0 || !deepEqualNews(data, news)) {
      setData(news);
    }
  });

  return data;
};

export default function News({ newsModule }) {
  const theme = useContext(ThemeContext);
  const news = useNews(newsModule);

  const styles = useMemo(() => getStyles(theme), [theme]);

  if (news.length === 0) {
    return null;
  }

  /* eslint-disable prettier/prettier */
  return (
    <View style={styles.container}>
      {news.map(item => (

        <View
          style={styles.item}
          key={item.url}
        >
          {item.imageUrl &&
            <TouchableWithoutFeedback
              onPress={() => openLink(item.url)}
            >

              <Image
                style={styles.image}
                source={{uri: item.imageUrl}}
              />
            </TouchableWithoutFeedback>
          }
          <ListItem
            url={item.url}
            title={item.title}
            label={item.breaking_label ? NativeModules.LocaleConstants['ActivityStream.News.BreakingLabel'] : null}
            onPress={() => openLink(item.url)}
          />
          <View style={styles.separator} />
        </View>
      ))}
    </View>
  );
  /* eslint-enable prettier/prettier */
}
