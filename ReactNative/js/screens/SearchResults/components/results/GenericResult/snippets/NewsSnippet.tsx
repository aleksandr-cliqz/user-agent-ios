/* eslint-disable react/prop-types */
/*!
 * Copyright (c) 2014-present Cliqz GmbH. All rights reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */
import React, { useCallback } from 'react';
import { View, StyleSheet } from 'react-native';
import moment from '../../../../../../services/moment';
import { NewsSnippet } from '@cliqz/component-ui-snippet-news';
import { withTheme } from '../../../../../../contexts/theme';

const styles = StyleSheet.create({
  container: {
  },
});

const date2text = (date: Date) => moment(date).fromNow();

const Snippet = ({ theme, news, openLink }: { theme: any, news: any, openLink: (url: string, type: string) => void }) => {
  const onPressCall = useCallback((url: string) => openLink(url, 'news'), [openLink]);
  return (
    <View style={styles.container}>
      <NewsSnippet data={news} date2text={date2text} onPress={onPressCall} styles={{
        itemTitle: {
          color: theme.textColor,
        },
        itemImageCaptionText: {
          color: theme.descriptionColor,
        },
      }}/>
    </View>
  );
};

export default withTheme(Snippet);